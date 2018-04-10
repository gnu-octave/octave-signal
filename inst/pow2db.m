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
## @deftypefn {Function File} {@var{db} =} pow2db (@var{pow})
## Convert power value to its corresponding dB value
##
## @var{pow} is the power value and @var{db} is the corosponding decibel value
##
## Examples:
##
## @example
## @group
## pow2db([0, 10, 100])
## @result{} -Inf 10 20
## @end group
## @end example
## @seealso{db2pow}
## @end deftypefn

function db = pow2db (pow)

  if (nargin != 1)
    print_usage ();
  endif

  if (sum (pow < 0) != 0)
    error("pow2db: power values must be non-negative real values");
  endif

  db = 10 .* log10 (pow);

endfunction

%!shared pow
%! pow = [0, 10, 20, 60, 100];

%!assert (pow2db(pow), [-Inf, 10.000, 13.010, 17.782, 20.000], 0.01)
%!assert (pow2db(pow'), [-Inf; 10.000; 13.010; 17.782; 20.000], 0.01)

## Test input validation
%!error pow2db ()
%!error <pow2db: power values must be non-negative real values> pow2db(-5)
%!error <pow2db: power values must be non-negative real values> pow2db([-5 7])
