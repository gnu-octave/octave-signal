## Copyright (C) 2018 P Sudeepam
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
## @deftypefn {Function File} {} db2pow (@var{x})
## Convert decibels (dB) to power.
##
## The power of @var{x} is defined as
## @tex
## $p = 10^{x/10}$.
## @end tex
## @ifnottex
## @var{p} = @code{10 ^ (x/10)}.
## @end ifnottex
##
## If @var{x} is a vector, matrix, or N-dimensional array, the power is
## computed over the elements of @var{x}.
##
## Example:
##
## @example
## @group
## db2pow ([-10, 0, 10])
## @result{} 0.10000 1.00000 10.00000
## @end group
## @end example
## @seealso{pow2db}
## @end deftypefn

function y = db2pow (x)

  if (nargin != 1)
    print_usage ();
  endif

  y = 10 .^ (x ./ 10);

endfunction


%!shared db
%! db = [-10, 0, 10, 20, 25];

%!assert (db2pow (db), [0.10000, 1.00000, 10.00000, 100.00000, 316.22777], 0.00001)
%!assert (db2pow (db'), [0.10000; 1.00000; 10.00000; 100.00000; 316.22777], 0.00001)

## Test input validation
%!error db2pow ()
%!error db2pow (1, 2)
