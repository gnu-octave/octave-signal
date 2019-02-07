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
## @deftypefn  {Function File} {@var{y} =} rssq (@var{x})
## @deftypefnx {Function File} {@var{y} =} rssq (@var{x}, @var{dim})
## Compute the root-sum-of-squares (RSS) of the vector @var{x}.
##
## The root-sum-of-squares is defined as
##
## @tex
## $$ {\rm rssq}(x) = {\sqrt{\sum_{i=1}^N {x_i}^2}} $$
## @end tex
## @ifnottex
##
## @example
## rssq (@var{x}) = SQRT (SUM_i @var{x}(i)^2)
## @end example
##
## @end ifnottex
## If @var{x} is a matrix, compute the root-sum-of-squares for each column and
## return them in a row vector.
##
## If the optional argument @var{dim} is given, operate along this dimension.
## @seealso{mean, meansq, sumsq, rms}
## @end deftypefn

function y = rssq (varargin)

  if (nargin < 1 || nargin > 2)
    print_usage ();
  endif

  y = sqrt (sumsq (varargin{:}));

endfunction

%!assert (rssq ([]), 0)
%!assert (rssq ([1 2 -1]), sqrt (6))
%!assert (rssq ([1 2 -1]'), sqrt (6))
%!assert (rssq ([1 2], 3), [1 2])

## Test input validation
%!error rssq ()
%!error rssq (1, 2, 3)
%!error rssq (1, 1.5)
%!error rssq (1, -1)
