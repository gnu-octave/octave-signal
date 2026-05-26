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
## @deftypefn  {Function File} {@var{a} =} ac2poly (@var{r})
## @deftypefnx {Function File} {[@var{a}, @var{e}] =} ac2poly (@var{r})
## Convert autocorrelation sequence to prediction polynomial.
##
## Compute the prediction filter coefficients @var{a} from the autocorrelation
## sequence @var{r} using the Levinson-Durbin recursion. The second optional
## output @var{e} returns the final prediction error power.
##
## This function directly calls @code{levinson}.
##
## @seealso{levinson}
## @end deftypefn

function [a, e] = ac2poly (r)

  if (nargin != 1)
    print_usage ();
  endif

  if (!isnumeric (r) || !(isvector (r) || ismatrix (r)))
    error ("ac2poly: R must be a numeric vector or matrix.");
  endif

  [a, e] = levinson (r);

endfunction

%!error ac2poly()
%!error ac2poly(1,2)
%!error <numeric vector or matrix> ac2poly("abc")
%!error <numeric vector or matrix> ac2poly({1,2,3})

%!test
%! r = [3, -1, -4, 3, 1, -2];
%! [a, e] = ac2poly(r);
%! assert (a, [1,-2.8281,-1.9687,-0.1875,1.0312,3.6719], 1e-4);
%! assert (e, 6.8281, 1e-4);

%!test
%! r = [3, -1, -4, 3, 1, -2];
%! [a, e] = ac2poly([r', r']);
%! assert (a(1, :), [1,-2.8281,-1.9687,-0.1875,1.0312,3.6719], 1e-4);
%! assert (a(2, :), [1,-2.8281,-1.9687,-0.1875,1.0312,3.6719], 1e-4);
%! assert (e, [6.8281;6.8281], 1e-4);
