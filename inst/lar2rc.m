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
## @deftypefn  {Function File} {@var{k} =} lar2rc (@var{g})
##
## Convert log area ratio to reflection coefficients.
##
## The log area ratio parameters @var{g} (real numeric vector or matrix)
## are converted to reflection coefficients @var{k} using the formula:
##
## @example
## k(i) = -tanh(-g(i) / 2)
## @end example
##
## @seealso{rc2lar}
## @end deftypefn

function k = lar2rc (g)

  if (nargin != 1)
    print_usage ();
  endif

  if (! isnumeric (g) || ! isreal (g))
    error ("lar2rc: G must be a real numeric array.");
  endif

  k = -tanh (-g / 2);

endfunction

%!test
%! ## Vector test
%! g = [0.2 0.4 1.6 -3 -0.5];
%! assert (lar2rc (g), -tanh (-g / 2), eps);
%!
%! ## Matrix test
%! g = [0.5, 1.0; -0.5, 0.0];
%! assert (lar2rc (g), -tanh (-g / 2), eps);

%!error rc2lar ()
%!error rc2lar (1, 2)
%!error rc2lar (1 + 1i)
