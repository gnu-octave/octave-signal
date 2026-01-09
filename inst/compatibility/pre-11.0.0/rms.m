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
## Compute the root-mean-square (RMS) of the vector @var{x}.
##
## The root-mean-square is defined as
##
## @tex
## $$ {\rm rms}(x) = {\sqrt{\sum_{i=1}^N {x_i}^2 \over N}} $$
## @end tex
## @ifnottex
##
## @example
## rms (@var{x}) = SQRT (1/N SUM_i @var{x}(i)^2)
## @end example
##
## @end ifnottex
## If @var{x} is a matrix, compute the root-mean-square for each column and
## return them in a row vector.
##
## If the optional argument @var{dim} is given, operate along this dimension.
## @seealso{mean, meansq, peak2rms, rssq, sumsq}
## @end deftypefn

function y = rms (varargin)

  if (nargin < 1 || nargin > 2)
    print_usage ();
  endif

  y = sqrt (meansq (varargin{:}));

endfunction

%!assert (rms (0), 0)
%!assert (rms (1), 1)
%!assert (rms ([1 2 -1]), sqrt (2))
%!assert (rms ([1 2 -1]'), sqrt (2))
%!assert (rms ([1 2], 3), [1 2])

## Test input validation
%!error rms ()
%!error rms (1, 2, 3)
%!error rms (1, 1.5)
%!error rms (1, -1)
