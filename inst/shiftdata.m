## Copyright (C) 2014 Georgios Ouzounis <ouzounis_georgios@hotmail.com>
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
## @deftypefn  {Function File} {[@var{out perm shifts}] =} shiftdata (@var{in})
## @deftypefnx {Function File} {[@var{out perm shifts}] =} shiftdata (@var{in}, @var{dim})
## Shift data @var{in} to permute the dimension @var{dim} to the first column.
## @seealso{unshiftdata}
## @end deftypefn

function [out, perm, shifts] = shiftdata (in, dim)

  if (nargin < 1 || nargin > 2)
    print_usage ();
  elseif (nargin == 1 || (nargin == 2 && isempty (dim)))
    idx = find (size (in) - 1);
    dim = idx(1);
    shiftsflag = true;
  else
    shiftsflag = false;
  endif

  if (dim != fix (dim))
    error ("shiftdata: DIM must be an integer");
  endif

  perm = [dim 1: (dim - 1) (dim + 1): (length (size (in)))];
  out = permute (in, perm);

  if (shiftsflag == true)
    perm = [];
    shifts = dim - 1;
  else
    shifts = [];
  endif

endfunction

%!test
%! X = [1 2 3; 4 5 6; 7 8 9];
%! [Y, perm, shifts] = shiftdata (X, 2);
%! assert (Y, [1 4 7; 2 5 8; 3 6 9]);
%! assert (perm, [2 1]);

%!test
%! X = [27 42 11; 63 48 5; 67 74 93];
%! X(:, :, 2) = [15 23 81; 34 60 28; 70 54 38];
%! [Y, perm, shifts] = shiftdata(X, 2);
%! T = [27 63 67; 42 48 74; 11 5 93];
%! T(:, :, 2) = [15 34 70; 23 60 54; 81 28 38];
%! assert(Y, T);
%! assert(perm, [2 1 3]);

%!test
%! X = fix (rand (4, 4, 4, 4) * 100);
%! [Y, perm, shifts] = shiftdata (X, 3);
%! T = 0;
%! for i = 1:3
%!   for j = 1:3
%!     for k = 1:2
%!       for l = 1:2
%!         T = [T Y(k, i, j, l) - X(i, j, k ,l)];
%!       endfor
%!     endfor
%!   endfor
%! endfor
%! assert (T, zeros (size (T)));

## Test input validation
%!error shiftdata ()
%!error shiftdata (1, 2, 3)
%!error shiftdata (1, 2.5)
