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
## @deftypefn  {Function File} {[@var{k}, @var{r0}] =} ac2rc (@var{r})
## Convert autocorrelation sequence to reflection coefficients.
##
## Compute the reflection coefficients @var{k} from the autocorrelation
## sequence @var{r} using the Levinson-Durbin recursion. The second optional
## output @var{r0} returns the zero-lag autocorrelation @math{r(0)}.
##
## This function directly calls @code{levinson}.
##
## @seealso{levinson}
## @end deftypefn

function [k, r0] = ac2rc (r)

  if (nargin != 1)
    print_usage ();
  endif

  if (!isnumeric (r) || !(isvector (r) || ismatrix (r)))
    error ("ac2rc: R must be a numeric vector or matrix.");
  endif

  [~, ~, k] = levinson (r);
  r0 = r(1,:).';

endfunction


%!error ac2rc()
%!error ac2rc(1,2)
%!error <numeric vector or matrix> ac2rc("abc")
%!error <numeric vector or matrix> ac2rc({1,2,3})

%!test
%! r = [3, -1, -4, 3, 1, -2];
%! [k, r0] = ac2rc(r);
%! assert (k, [0.3333;1.6250;-0.4857;-0.9145;3.6719], 1e-4);
%! assert (r0, r');

%!test
%! r = [3, -1, -4, 3, 1, -2];
%! [k, r0] = ac2rc([r', r']);
%! assert (k(:,1), [0.3333;1.6250;-0.4857;-0.9145;3.6719], 1e-4);
%! assert (k(:,2), [0.3333;1.6250;-0.4857;-0.9145;3.6719], 1e-4);
%! assert (r0, [3;3], 1e-4);
