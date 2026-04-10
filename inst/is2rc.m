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
## @deftypefn  {Function File} {@var{k} =} is2rc (@var{is})
##
## Convert inverse sine parameters to reflection coefficients.
##
## The inverse sine parameters @var{k} (real numeric vector or matrix)
## are converted to reflection coefficients @var{is} using the formula:
##
## @example
## k(i) = sin((pi / 2) * is(i))
## @end example
##
## @seealso{rc2is}
## @end deftypefn

function k = is2rc (is)

  if (nargin != 1)
    print_usage ();
  endif

  if (! isnumeric (is) || ! isreal (is))
    error ("is2rc: IS must be a real numeric array.");
  endif

  k = sin((pi / 2) * is);

endfunction

%!test
%! ## Vector test
%! is = [0.2 0.4 1.6 -3 -0.5];
%! assert (is2rc (is), sin((pi / 2) * is), eps);
%!
%! ## Matrix test
%! k = [0.5, 1.0; -0.5, 0.0];
%! assert (is2rc (k), sin((pi / 2) * k), eps);

%!error is2rc ()
%!error is2rc (1, 2)
%!error is2rc (1 + 1i)
