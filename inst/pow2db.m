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
## @deftypefn {Function File} {} pow2db (@var{x})
## Convert power to decibels (dB).
##
## The decibel value of @var{x} is defined as
## @tex
## $d = 10 * \log_{10} (x)$.
## @end tex
## @ifnottex
## @var{d} = @code{10 * log10 (x)}.
## @end ifnottex
##
## If @var{x} is a vector, matrix, or N-dimensional array, the decibel value
## is computed over the elements of @var{x}.
##
## Examples:
##
## @example
## @group
## pow2db ([0, 10, 100])
## @result{} -Inf 10 20
## @end group
## @end example
## @seealso{db2pow}
## @end deftypefn

function y = pow2db (x)

  if (nargin != 1)
    print_usage ();
  endif

  if (any (x < 0))
    error ("pow2db: X must be non-negative");
  endif

  y = 10 .* log10 (x);

endfunction

%!shared pow
%! pow = [0, 10, 20, 60, 100];

%!assert (pow2db (pow), [-Inf, 10.000, 13.010, 17.782, 20.000], 0.01)
%!assert (pow2db (pow'), [-Inf; 10.000; 13.010; 17.782; 20.000], 0.01)

## Test input validation
%!error pow2db ()
%!error pow2db (1, 2)
%!error <pow2db: X must be non-negative> pow2db (-5)
%!error <pow2db: X must be non-negative> pow2db ([-5 7])
