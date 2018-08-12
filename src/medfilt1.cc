/*

Copyright (C) 2015-2016 Lachlan Andrew, Monash University

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; see the file COPYING.  If not, see
<https://www.gnu.org/licenses/>.

*/

/*
Author: Lachlan Andrew <lachlanbis@gmail.com>
Created: 2015-12-13
*/

/** @file libinterp/corefcn/medfilt1.cc
 One dimensional median filter, for real double variables.
 */

#include <algorithm>
#include <memory>

#include "oct.h"
#include "defun-dld.h"
#include "error.h"
#include "ov.h"

enum nan_opt_type
{
  NAN_OPT_INCLUDE,
  NAN_OPT_OMIT
};

enum pad_opt_type
{
  PAD_OPT_ZERO,
  PAD_OPT_TRUNCATE
};

// Keep a sorted sliding window of values.
// There is no error checking, to keep things fast.
// Keeps NaNs at the "top" (after Inf)
class sorted_window
{
  std::unique_ptr<double[]> buf;
  octave_idx_type  numel;
  octave_idx_type  numNaN;
  bool nan_if_any_is;

  // Return the index of  target  in the window, from element start to the end
  // FIXME: for large n, use binary search, but be careful to keep NaN at end
  octave_idx_type find (double target, octave_idx_type start = 0)
    {
      octave_idx_type i;
      for (i = start; i < numel; i++)
        if (!(buf[i] < target))
          {
            if (target == target) // We've found the target.
              return i;
            else
              return numel;       // target is NaN; add it to the end.
          }
      return numel;
    }

public:
  // Create sorted window with maximum size  width.
  // If  skip_nan  then the median will consider only valid numbers within
  // the window.  
  sorted_window (octave_idx_type width, bool skip_nan = true)
    : buf (new double [width]), numel (0), numNaN (0),
      nan_if_any_is (! skip_nan) { }

  // Initialize to contain  seed,  and  zeros  additional zeros.
  void init (const double *seed, octave_idx_type num, octave_idx_type stride,
             octave_idx_type zeros = 0)
    {
      numel = zeros;
      numNaN = 0;

      std::fill_n (&buf[0], zeros, 0.0);

      // Insert from seed.  Could sort if it is large
      num *= stride;
      for (octave_idx_type i = 0; i < num; i += stride)
        add (seed[i]);
    }

  // Take item  prev  from the window and replace it by  next.
  // Assumes  prev  is in the window.
  void replace (double next, double prev)
    {
      octave_idx_type n_pos, p_pos;
      if (next < prev)
        {
          n_pos = find (next);
          p_pos = find (prev, n_pos);
          if (n_pos != p_pos)
            std::copy_backward (&buf[n_pos], &buf[p_pos], &buf[p_pos + 1]);
        }
      else if (next > prev)
        {
          p_pos = find (prev);
          n_pos = find (next, p_pos);
          if (n_pos != p_pos)
            {
              std::copy (&buf[p_pos + 1], &buf[n_pos], &buf[p_pos]);
              n_pos--;            // position shifts due to deletion of p_pos
            }
        }
      else if (next != prev)      // one is NaN.
        {
          if (next == next)
            {
              n_pos = find (next);
              std::copy_backward (&buf[n_pos], &buf[numel - 1], &buf[numel]);
              numNaN--;
            }
          else if (prev == prev)
            {
              p_pos = find (prev);
              std::copy (&buf[p_pos + 1], &buf[numel], &buf[p_pos]);
              n_pos = numel - 1;
              numNaN++;
            }
          else
            return;     // fallthrough case (next, prev both NaN)
        }
      else              // fallthrough case (next == prev) requires no action.
        return;

      buf [n_pos] = next;
    }

  // Expand the window by one element, inserting next.
  // This will crash if this exceeds the allocation of buf.
  void add (double next)
    {
      octave_idx_type n_pos;
      if (next == next) // not NaN
        {
          n_pos = find (next);
          if (n_pos < numel)
            std::copy_backward (&buf[n_pos], &buf[numel], &buf[numel + 1]);
        }
      else              // NaN stored at end, so nothing to move.
        {
          n_pos = numel;
          numNaN++;
        }
      buf[n_pos] = next;
      numel++;
    }

  // Reduce the window by one element, deleting prev.
  // This will crash if the window is already empty
  void remove (double prev)
    {
      octave_idx_type p_pos;
      if (prev == prev)
        {
          p_pos = find (prev);
          std::copy (&buf[p_pos + 1], &buf[numel], &buf[p_pos]);
        }
      else                  // NaN stored at end, so nothing to move.
        numNaN--;
      numel--;
    }

  // The middle value if numel-numNaN is odd,
  // or the mean of the two middle values if numel-numNaN is even.
  // This will crash if the window is empty.
  double median (void)
    {
      double retval = 0;
      octave_idx_type non_nan_window = numel;
      double last = buf [numel-1];
      if (last != last)     // if NaN
        {
          if (nan_if_any_is)
            retval = last;
          else
            {
              non_nan_window = numel - numNaN;
              if (non_nan_window == 0)
                retval = last;
            }
        }
      if (retval == 0)      // if result is not NaN
        {
          if (non_nan_window & 1)
            retval = buf[non_nan_window >> 1];
          else
            {
              octave_idx_type mid = non_nan_window >> 1;
              retval = (buf[mid - 1] + buf[mid]) / 2;
            }
        }
      return retval;
    }
};

// Median filter on a single vector,
// starting at x with values spaced by stride.
// The output is placed into y, with the same stride.
static inline void
medfilt1_vector (double *x, double *y, octave_idx_type n,
                    octave_idx_type len,
                    octave_idx_type offset, octave_idx_type stride,
                    octave_idx_type leading, octave_idx_type trailing,
                    octave_idx_type start_middle, octave_idx_type end_middle,
                    octave_idx_type last, octave_idx_type initial_fill,
                    pad_opt_type pad_opt, sorted_window& sw)
{
  sw.init (x, initial_fill, stride,
           (pad_opt == PAD_OPT_ZERO) ? (n - initial_fill) : 0);

  // Partial window at the start
  if (pad_opt == PAD_OPT_ZERO)
    for (octave_idx_type i = 0; i < start_middle; i += stride)
      {
        sw.replace (x[i + leading], 0);
        y[i] = sw.median ();
      }
  else
    for (octave_idx_type i = 0; i < start_middle; i += stride)
      {
        sw.add (x[i + leading]);
        y[i] = sw.median ();
      }

  if (n < len)
    // Full sized window
    for (octave_idx_type i = start_middle; i < end_middle; i += stride)
      {
        sw.replace (x[i + leading], x[i - trailing]);
        y[i] = sw.median ();
      }
  else
    {
      // All of  x  is in the window
      double m = sw.median ();
      for (octave_idx_type i = start_middle; i < end_middle; i += stride)
        y[i] = m;
    }

  // Partial window at the end
  if (pad_opt == PAD_OPT_ZERO)
    for (octave_idx_type i = end_middle; i < last; i += stride)
      {
        sw.replace (0, x[i - trailing]);
        y[i] = sw.median ();
      }
  else
    for (octave_idx_type i = end_middle; i < last; i += stride)
      {
        sw.remove (x[i - trailing]);
        y[i] = sw.median ();
      }
}

DEFUN_DLD(medfilt1, args, ,
" -*- texinfo -*- \n\
@deftypefn  {} {@var{y} =} medfilt1 (@var{x}, @var{n})\n\
@deftypefnx {} {@var{y} =} medfilt1 (@var{x}, @var{n}, [], @var{dim})\n\
@deftypefnx {} {@var{y} =} medfilt1 (..., @var{NaN_flag}, @var{padding})\n\
\n\
Apply a one dimensional median filter with a window size of @var{n} to\n\
the data @var{x}, which must be real, double and full.\n\
For @var{n} = 2m+1, @var{y}(i) is the median of @var{x}(i-m:i+m).\n\
For @var{n} = 2m,   @var{y}(i) is the median of @var{x}(i-m:i+m-1).\n\
\n\
The calculation is performed over the first non-singleton dimension, or over\n\
dimension @var{dim} if that is specified as the fourth argument.  (The third\n\
argument is ignored; Matlab used to use it to tune its algorithm.)\n\
\n\
@var{NaN_flag} may be @qcode{omitnan} or @qcode{includenan} (the default).\n\
If it is @qcode{omitnan} then any NaN values are removed from the window\n\
before the median is taken.\n\
Otherwise, any window containing an NaN returns a median of NaN.\n\
\n\
@var{padding} determines how the partial windows at the start and end of\n\
@var{x} are treated.\n\
It may be @qcode{truncate} or @qcode{zeropad} (the default).\n\
If it is @qcode{truncate} then the window for @var{y}(i) is\n\
the intersection of the window stated above with 1:length(@var{x}).\n\
If it is @qcode{zeropad}, then partial windows have additional zeros\n\
to bring them up to size @var{n}.\n\
\n\
@seealso{filter, medfilt2}\n\
@end deftypefn")
{
  if (args.length () < 1)
    print_usage ();

  octave_idx_type n = 3, dim = 0;
  nan_opt_type nan_opt = NAN_OPT_INCLUDE;
  pad_opt_type pad_opt = PAD_OPT_ZERO;

  int nargin = args.length ();

  Array<double> signal = args(0).array_value ();

  // parse arguments.
  // FIXME: This allows repeated arguments like
  //        medfilt1(..., "truncate", "zeropad")
  while (args(nargin - 1).is_string ())
    {
      if (nargin < 2)
        print_usage ();

      std::string s = args(nargin - 1).string_value ();
      if (! strcasecmp (s.c_str (), "omitnan"))
        nan_opt = NAN_OPT_OMIT;
      else if (! strcasecmp (s.c_str (), "truncate"))
        pad_opt = PAD_OPT_TRUNCATE;
      else if (strcasecmp (s.c_str (), "includenan")
               && strcasecmp (s.c_str (), "zeropad"))  // the defaults
        error ("medfilt1: Invalid NAN_FLAG or PADDING value '%s'", s.c_str ());

      nargin--;    // skip this for parsing the numeric args
    }

  if (nargin >= 2)
    {
      if (args(1).is_numeric_type ())
        {
          if (args(1).numel () != 1 || args(1).is_complex_type ())
            error ("medfilt1: N must be a real scalar");
          else
            n = args(1).idx_type_value ();
        }
      else
        error ("medfilt1: Invalid type for N: %s",
               args(1).type_name ().c_str ());
    if (nargin >= 4)
      {
        if (args(3).is_numeric_type ())
          {
            if (args(3).numel () != 1)
              error ("medfilt1: DIM must be a scalar");
            else if (args(3).is_complex_type ())
              error ("medfilt1: DIM must be real");

            dim = round (args(3).double_value ());

            if (dim != args(3).double_value ())
              error ("medfilt1: DIM must be an integer, not %g",
                     args(3).double_value ());
            //if (dim < 1 || dim > signal.dims ().length ())
            if (dim < 1)
              error ("medfilt1: DIM must be positive, not %d", dim);
          }
        else
          error ("medfilt1: Invalid type for DIM: %s",
                 args(1).type_name ().c_str ());
        if (nargin > 4)
          error ("medfilt1: Too many input arguments");
      }
    }

    // Guard again divide-by-zero later.
    // This is the last "early return".
    if (args(0).numel () == 0)
      return ovl (args(0));


    // The following code is based on filter.cc
    dim_vector x_dims = args(0).dims ();
    if (dim < 1)
      dim = x_dims.first_non_singleton ();
    else
      dim--;      // make 0-based, not 1-based
  
    octave_idx_type x_len = x_dims (dim);

    octave_idx_type x_stride = 1;
    for (octave_idx_type i = 0; i < dim; i++)
      x_stride *= x_dims(i);

    MArray<double> x = args(0).array_value ();
    MArray<double> retval;
    retval.resize (x_dims, 0.0);

    double *p_in = x.fortran_vec ();
    double *p_out = retval.fortran_vec ();

    sorted_window sw (n, nan_opt == NAN_OPT_OMIT);

    // how far ahead should data be put in window
    octave_idx_type leading = ((n - 1) / 2) * x_stride;

    // how far back should data be removed from wdw
    octave_idx_type trailing = n * x_stride - leading;

    // last position in this slice
    octave_idx_type last = x_len * x_stride;

    // start of the "middle" phase with fixed window size
    octave_idx_type start_middle;

    // end   of the "middle" phase with fixed window size
    octave_idx_type end_middle;
    
    // start window with x(1:initial_fill)
    octave_idx_type initial_fill = (n - 1) / 2;

    if (n < x_len)   // small window:
      {              // The middle phase is when replacing window elements.
        start_middle = trailing;
        end_middle = last - leading;
      }
    else             // big window:
      {              // The middle phase has whole input in the window.
        if (n < 2 * x_len)
          {
            start_middle = last - leading;
            end_middle = trailing;
          }
        else         // huge window: all answers are just the median of x.
          {
            start_middle = 0;
            end_middle = last;
            initial_fill = x_len;
          }
      }

    octave_idx_type x_num = x_dims.numel () / x_len;
    octave_idx_type x_offset = 0, inner_offset = 0;

    for (octave_idx_type num = 0; num < x_num; num++)
      {
        medfilt1_vector (p_in + x_offset, p_out + x_offset, n, x_len,
                            x_offset, x_stride, leading, trailing,
                            start_middle, end_middle, last, initial_fill,
                            pad_opt, sw);
        if (x_stride == 1)
          x_offset += x_len;
        else
          {
            x_offset++;
            if (++inner_offset == x_stride)
              {
                inner_offset = 0;
                x_offset += x_stride * (x_len - 1);
              }
          }
      }

  return ovl (retval);
}

/*
%!assert (medfilt1 ([1 2 3 4 3 2 1]), [1 2 3 3 3 2 1]);
%!assert (medfilt1 ([1 2 3 4 3 2 1]'), [1 2 3 3 3 2 1]');
%!assert (medfilt1 ([1 2 3 4 3 2 1], "truncate"), [1.5 2 3 3 3 2 1.5]);
%!assert (medfilt1 ([-1 2 3 4 3 -2 1], "truncate"), [0.5 2 3 3 3 1 -0.5]);
%!assert (medfilt1 ([-1 2 3 4 3 -2 1], "zeropad"), [0 2 3 3 3 1 0]);

%!assert (medfilt1 ([]), []);

%!test
%! A = [1 2 3  ; 6 5 4  ; 6 5 2 ];
%! assert (medfilt1 (A,4,[],2), [0.5 1.5 1.5; 2.5 4.5 4.5; 2.5 3.5 3.5]);
%! assert (medfilt1 (A,4,[],1), [0.5 3.5 3.5; 1 3.5 3.5; 1.5 2.5 2.5]');
%! assert (medfilt1 (A,3,[],1), [1 2 3; 6 5 3; 6 5 2]);

%!test
%! A = [ Inf 4 -4 NaN -1 -1 -3 -2 1 -Inf];
%! B = medfilt1 (A, 7, [], 1, 'includenan', 'zeropad');
%! assert (B, [0, 0, 0, NaN, 0, 0, 0, 0, 0, 0]);
%! B = medfilt1 (A, 7, [], 2, 'includenan', 'zeropad');
%! assert (B, [NaN, NaN, NaN, NaN, NaN, NaN, NaN, -1, -1, 0]);
%! B = medfilt1 (A, 7, [], 2, 'includenan', 'truncate');
%! assert (B, [NaN, NaN, NaN, NaN, NaN, NaN, NaN, -1.5, -2, -2.5]);
%! B = medfilt1 (A, 7, [], 2, 'omitnan', 'zeropad');
%! assert (B, [0, 0, -0.5, -1, -1.5, -1.5, -1.5, -1, -1, 0]);
%! B = medfilt1 (A, 7, [], 2, 'omitnan', 'truncate');
%! assert (B, [4, 1.5, -1, -1, -1.5, -1.5, -1.5, -1.5, -2, -2.5]);

%!test
%! A = medfilt1 ([ NaN NaN -Inf], 4, [], 2, 'omitnan', 'truncate');
%! assert (A, [NaN, -Inf, -Inf]);

%!test
%! A = medfilt1 ([-2 Inf -2; 1 3 -Inf; 1 0 -Inf], 1, [], 2);
%! assert (A, [-2 Inf -2; 1 3 -Inf; 1 0 -Inf]);

%!test
%! A = medfilt1 ([-Inf 0 -3; Inf 1 NaN], 9, [], 1);
%! assert (A, [0, 0, NaN; 0, 0, NaN]);
%! A = medfilt1 ([-Inf 0 -3; Inf 1 NaN], 9, [], 1, 'omitnan', 'truncate');
%! assert (A, [NaN, 0.5, -3; NaN, 0.5, -3]);

%!test
%! A = medfilt1 ([Inf -3 Inf Inf 0 -2; Inf 1 NaN 5 5 -3], 3, [], 1);
%! assert (A, [Inf, 0, NaN, 5, 0, -2; Inf, 0, NaN, 5, 0, -2]);

%!test
%! A = medfilt1 ([3 3 7 5 6]', 5, [], 1, 'omitnan', 'truncate');
%! assert (A, [3, 4, 5, 5.5, 6]');
%! A = medfilt1 ([3 3 7 5 6]', 5, [], 2, 'omitnan', 'truncate');
%! assert (A, [3, 3, 7, 5, 6]');

%!test
%! A = medfilt1 ([3 1 4 1 3], 3, 'omitnan', 'truncate');
%! assert (A, [2, 3, 1, 3, 2]);

%!test
%! A = medfilt1 ([3 1 4 1 3], 6, 'omitnan', 'truncate');
%! assert (A, [3, 2, 3, 3, 2]);

%!test
%! A = medfilt1 ([1 2 3 4 4 3 2 1; 6 5 4 3 3 4 5 6; 6 5 4 3 2 1 0 -1; 6 5 4 3 2 1 0 -1]);
%! assert (A, [1 2 3 3 3 3 2 1; 6 5 4 3 3 3 2 1; 6 5 4 3 2 1 0 -1; 6 5 4 3 2 1 0 -1]);

# Input checking
%!error (medfilt1 ([1 2 3], -1));
%!error (medfilt1 ([1 2 3], 1, [], "hello"));
%!error (medfilt1 ([1 2 3], 1, [], "omitnan", false));
%!error (medfilt1 ({1 2 3}));
*/
