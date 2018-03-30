## Copyright (C) 2001 Paul Kienzle
## Copyright (C) 2018 Mike Miller
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; see the file COPYING. If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} {@var{y} =} tripuls (@var{t})
## @deftypefnx {Function File} {@var{y} =} tripuls (@var{t}, @var{w})
## @deftypefnx {Function File} {@var{y} =} tripuls (@var{t}, @var{w}, @var{skew})
## Generate a triangular pulse over the interval [-@var{w}/2,@var{w}/2),
## sampled at times @var{t}.  This is useful with the function @code{pulstran}
## for generating a series of pulses.
##
## @var{skew} is a value between -1 and 1, indicating the relative placement
## of the peak within the width.  -1 indicates that the peak should be
## at -@var{w}/2, and 1 indicates that the peak should be at @var{w}/2.  The
## default value is 0.
##
## Example:
## @example
## @group
## fs = 11025;  # arbitrary sample rate
## f0 = 100;    # pulse train sample rate
## w = 0.3/f0;  # pulse width 3/10th the distance between pulses
## plot (pulstran (0:1/fs:4/f0, 0:1/f0:4/f0, "tripuls", w));
## @end group
## @end example
##
## @seealso{gauspuls, pulstran, rectpuls}
## @end deftypefn

function y = tripuls (t, w = 1, skew = 0)

  if (nargin < 1 || nargin > 3)
    print_usage ();
  endif

  if (! isreal (w) || ! isscalar (w))
    error ("tripuls: W must be a real scalar");
  endif

  if (! isreal (skew) || ! isscalar (skew) || skew < -1 || skew > 1)
    error ("tripuls: SKEW must be a real scalar in the range [-1, 1]");
  endif

  y = zeros (size (t));
  peak = skew * w/2;

  idx = find ((t >= -w/2) & (t <= peak));
  if (idx)
    y(idx) = (t(idx) + w/2) / (peak + w/2);
  endif

  idx = find ((t > peak) & (t < w/2));
  if (idx)
    y(idx) = (t(idx) - w/2) / (peak - w/2);
  endif

endfunction

%!demo
%! fs = 11025;  # arbitrary sample rate
%! f0 = 100;    # pulse train sample rate
%! w = 0.5/f0;  # pulse width 1/10th the distance between pulses
%! x = pulstran (0:1/fs:4/f0, 0:1/f0:4/f0, "tripuls", w);
%! plot ([0:length(x)-1]*1000/fs, x);
%! xlabel ("Time (ms)");
%! ylabel ("Amplitude");
%! title ("Triangular pulse train of 5 ms pulses at 10 ms intervals");

%!demo
%! fs = 11025;  # arbitrary sample rate
%! f0 = 100;    # pulse train sample rate
%! w = 0.5/f0;  # pulse width 1/10th the distance between pulses
%! x = pulstran (0:1/fs:4/f0, 0:1/f0:4/f0, "tripuls", w, -0.5);
%! plot ([0:length(x)-1]*1000/fs, x);
%! xlabel ("Time (ms)");
%! ylabel ("Amplitude");
%! title ("Triangular pulse train of 5 ms pulses at 10 ms intervals, skew = -0.5");

%!assert (tripuls ([]), [])
%!assert (tripuls ([], 0.1), [])
%!assert (tripuls (zeros (10, 1)), ones (10, 1))
%!assert (tripuls (-1:1), [0, 1, 0])
%!assert (tripuls (-5:5, 9), [0, 1, 3, 5, 7, 9, 7, 5, 3, 1, 0] / 9)
%!assert (tripuls (0:1/100:0.3, 0.1), tripuls ([0:1/100:0.3]', 0.1)')

## Test input validation
%!error tripuls ()
%!error tripuls (1, 2, 3, 4)
%!error tripuls (1, 2j)
%!error tripuls (1, 2, 2)
%!error tripuls (1, 2, -2)
