## Copyright (C) 2000 Paul Kienzle
## Copyright (C) 2018-2019 Mike Miller
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
## @deftypefn  {Function File} {@var{y} =} rectpuls (@var{t})
## @deftypefnx {Function File} {@var{y} =} rectpuls (@var{t}, @var{w})
## Generate a rectangular pulse over the interval [-@var{w}/2,@var{w}/2),
## sampled at times @var{t}.  This is useful with the function @code{pulstran}
## for generating a series of pulses.
##
## Example:
## @example
## @group
## fs = 11025;  # arbitrary sample rate
## f0 = 100;    # pulse train sample rate
## w = 0.3/f0;  # pulse width 3/10th the distance between pulses
## plot (pulstran (0:1/fs:4/f0, 0:1/f0:4/f0, "rectpuls", w));
## @end group
## @end example
##
## @seealso{gauspuls, pulstran, tripuls}
## @end deftypefn

function y = rectpuls (t, w = 1)

  if (nargin < 1 || nargin > 2)
    print_usage ();
  endif

  if (! isreal (w) || ! isscalar (w))
    error ("rectpuls: W must be a real scalar");
  endif

  y = zeros (size (t));

  idx = find ((t >= -w/2) & (t < w/2));

  y(idx) = 1;

endfunction

%!demo
%! fs = 11025;  # arbitrary sample rate
%! f0 = 100;    # pulse train sample rate
%! w = 0.3/f0;  # pulse width 1/10th the distance between pulses
%! x = pulstran (0:1/fs:4/f0, 0:1/f0:4/f0, "rectpuls", w);
%! plot ([0:length(x)-1]*1000/fs, x);
%! xlabel ("Time (ms)");
%! ylabel ("Amplitude");
%! title ("Rectangular pulse train of 3 ms pulses at 10 ms intervals");

%!assert (rectpuls ([]), [])
%!assert (rectpuls ([], 0.1), [])
%!assert (rectpuls (zeros (10, 1)), ones (10, 1))
%!assert (rectpuls (-1:1), [0, 1, 0])
%!assert (rectpuls (-5:5, 9), [0, ones(1,9), 0])
%!assert (rectpuls (0:1/100:0.3, 0.1), rectpuls ([0:1/100:0.3]', 0.1)')

## Test input validation
%!error rectpuls ()
%!error rectpuls (1, 2, 3)
%!error rectpuls (1, 2j)
