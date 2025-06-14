/*

Copyright (C) 2008-2009 Evgeni A. Nurminski <nurmi@dvo.ru>
Copyright (C) 2008-2009 Pete Gonzalez <pgonzalez@bluel.com>

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

#include <octave/oct.h>

#include "cl2bp_lib.h"
#include "octave-compat.h"

static void cancel_handler(void *) {
  OCTAVE_QUIT;
}

// When CL2BP_LOGGING is defined, this will direct messages to the Octave pager
void cl2bp_log(const char *message) {
  octave_stdout << message;
}


DEFUN_DLD (cl2bp, args, ,
  "-*- texinfo -*-\n\
@deftypefn  {Loadable Function} {@var{h} =} cl2bp (@var{m}, @var{w1}, @var{w2}, @var{up}, @var{lo})\n\
@deftypefnx {Loadable Function} {@var{h} =} cl2bp (@var{m}, @var{w1}, @var{w2}, @var{up}, @var{lo}, @var{gridsize})\n\
\n\
Constrained L2 bandpass FIR filter design.  This is a fast implementation of\n\
the algorithm cited below.  Compared to @dfn{remez}, it offers implicit\n\
specification of transition bands, a higher likelihood of convergence, and an\n\
error criterion combining features of both L2 and Chebyshev approaches.\n\
\n\
Inputs:\n\
\n\
@table @var\n\
@item m\n\
degree of cosine polynomial, i.e. the number of output coefficients will be\n\
@var{m}*2+1\n\
@item  w1\n\
@itemx w2\n\
bandpass filter cutoffs in the range 0 <= @var{w1} < @var{w2} <= pi,\n\
where pi is the Nyquist frequency\n\
@item up\n\
vector of 3 upper bounds for [stopband1, passband, stopband2]\n\
@item lo\n\
vector of 3 lower bounds for [stopband1, passband, stopband2]\n\
@item gridsize\n\
search grid size; larger values may improve accuracy,\n\
but greatly increase calculation time. Default value is 2048, max value is 1e6.\n\
@end table\n\
\n\
Output:\n\
\n\
A vector of @var{m}*2+1 FIR coefficients, or an empty value if the solver\n\
failed to converge.\n\
\n\
Example:\n\
@example\n\
@code{h = cl2bp(30, 0.3*pi, 0.6*pi, [0.02, 1.02, 0.02], [-0.02, 0.98, -0.02], 2^11);}\n\
@end example\n\
\n\
Original Paper:  I. W. Selesnick, M. Lang, and C. S. Burrus.  A modified\n\
algorithm for constrained least square design of multiband FIR filters without\n\
specified transition bands.\n\
IEEE Trans. on Signal Processing, 46(2):497-501, February 1998.\n\
@end deftypefn\n\
@seealso{remez}\n")
{
  octave_value_list retval;

  const int nargin = args.length();
  if (nargin < 5 || nargin > 6) {
    print_usage ();
    return retval;
  }

  const int m = args(0).int_value(true);
  const double w1 = args(1).double_value();
  const double w2 = args(2).double_value();
  const ColumnVector up_vector(args(3).vector_value());
  const ColumnVector lo_vector(args(4).vector_value());
  if (up_vector.numel() != 3 || lo_vector.numel() != 3) {
    error("cl2bp: The up and lo vectors must contain 3 values");
    return retval;
  }

  double up[3];
  double lo[3];
  for (int i=0; i<3; ++i) {
    up[i] = up_vector(i);
    lo[i] = lo_vector(i);
  }

  const int L = (nargin == 5) ? 2048 : args(5).int_value(true);
  if (L > 1000000) {
    error("cl2bp: The \"gridsize\" parameter cannot exceed 1000000");
    return retval;
  }

  MallocArray<double> h;
  try {
    cl2bp(h, m, w1, w2, up, lo, L, 1.e-5, 20, cancel_handler);
  }
  catch (std::exception &ex) {
    error("%s", ex.what());
    return retval;
  }

  ColumnVector h_vector(h.get_length());

  for (int i=0; i<h.get_length(); ++i)
    h_vector(i) = h[i];

  return octave_value(h_vector);
}

/*
%!test
%! b = [
%!    0.0000000000000000
%!    0.0563980420304213
%!   -0.0000000000000000
%!   -0.0119990278695041
%!   -0.0000000000000001
%!   -0.3016146759510104
%!    0.0000000000000001
%!    0.5244313235801866
%!    0.0000000000000001
%!   -0.3016146759510104
%!   -0.0000000000000001
%!   -0.0119990278695041
%!   -0.0000000000000000
%!    0.0563980420304213
%!    0.0000000000000000];
%! assert(cl2bp(7, 0.25*pi, 0.75*pi, [0.01, 1.04, 0.01], [-0.01, 0.96, -0.01], 2^11), b, 1e-14);
%! assert(cl2bp(7, 0.25*pi, 0.75*pi, [0.01, 1.04, 0.01], [-0.01, 0.96, -0.01]), b, 1e-14);
*/
