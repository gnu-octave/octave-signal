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
## @deftypefn  {Function File} {@var{y} =} rms (@var{x})
## @deftypefnx {Function File} {@var{y} =} rms (@var{x}, @var{dim})
##
## Return the root-mean-square (RMS) of @var{x}.
## @tex
## $$
## {\rm rms} (x) = {\sqrt{\sum_{i=1}^N {x_i}^2 \over N}}
## $$
## @end tex
## @ifnottex
##
## @example
## @group
## rms (x) = SQRT (1/N SUM_i x(i)^2)
## @end group
## @end example
##
## @end ifnottex
## For matrix arguments, return a row vector containing the root mean square
## of each column.
##
## If the optional argument @var{dim} is given, operate along this dimension.
## @seealso{peak2rms}
## @end deftypefn

function y = rms (varargin)

  if (nargin < 1 || nargin > 2)
    print_usage ();
  endif

  y = sqrt (meansq (varargin{:}));

endfunction

%!assert (rms ([1 2 -1]), sqrt (2))
%!assert (rms ([1 2 -1]'), sqrt (2))

## Test input validation
%!error rms ()
%!error rms (1, 2, 3)
