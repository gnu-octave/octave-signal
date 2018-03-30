## Copyright (C) 2015 Andreas Weber <octave@tech-chat.de>
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
## @deftypefn  {Function File} {@var{y} =} peak2rms (@var{x})
## @deftypefnx {Function File} {@var{y} =} peak2rms (@var{x}, @var{dim})
##
## Return the ratio of the largest absolute value to the root-mean-square
## (RMS) value of @var{x}.
##
## For matrix arguments, return a row vector containing the ratio of each column.
##
## If the optional argument @var{dim} is given, operate along this dimension.
## @seealso{rms}
## @end deftypefn

function y = peak2rms (x, dim)

  if (nargin < 1 || nargin > 2)
    print_usage ();
  endif

  if (nargin == 1)
    y = max (abs (x)) ./ sqrt (meansq (x));
  else
    y = max (abs (x), [], dim) ./ sqrt (meansq (x, dim));
  endif

endfunction

%!assert (peak2rms ([-2 3; 4 -2]), [4/sqrt(10), 3/sqrt((9+4)/2)])
%!assert (peak2rms ([-2 3; 4 -2], 2), [3/sqrt((9+4)/2); 4/sqrt(10)])

## Test input validation
%!error peak2rms ()
%!error peak2rms (1, 2, 3)
