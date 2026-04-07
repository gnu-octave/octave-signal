## Copyright (C) 2026 Tang Chonghao <chadholton@qq.com>
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
## @deftypefn  {Function File} {@var{is} =} rc2is (@var{k})
##
## Convert reflection coefficients to inverse sine parameters.
##
## The reflection coefficients @var{k} (real numeric vector or matrix)
## are converted to inverse sine parameters @var{is} using the formula:
##
## @example
## is(i) = (2 / pi) * asin(k(i))
## @end example
##
## @seealso{is2rc}
## @end deftypefn

function is = rc2is (k)

  if (nargin != 1)
    print_usage ();
  endif

  if (! isnumeric (k) || ! isreal (k))
    error ("rc2is: K must be a real numeric array.");
  endif

  is = (2 / pi) * asin(k);

endfunction

%!test
%! ## Vector test
%! k = [0.2 0.4 1.6 -3 -0.5];
%! assert (rc2is (k), (2 / pi) * asin(k), eps);
%!
%! ## Matrix test
%! k = [0.5, 1.0; -0.5, 0.0];
%! assert (rc2is (k), (2 / pi) * asin(k), eps);

%!error rc2is ()
%!error rc2is (1, 2)
%!error rc2is (1 + 1i)
