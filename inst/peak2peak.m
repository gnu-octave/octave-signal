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
## @deftypefn  {Function File} {@var{out} =} peak2peak (@var{in})
## @deftypefnx {Function File} {@var{out} =} peak2peak (@var{in}, @var{dim})
## Return the difference between the maximum and the minimum value in @var{in}.
## @end deftypefn

function out = peak2peak (in, dim)

  if (nargin < 1 || nargin > 2)
    print_usage ();
  elseif (nargin == 1)
    idx = find (size (in) - 1);
    dim = idx(1);
  endif

  if (dim != fix (dim))
    error ("peak2peak: DIM must be an integer");
  endif

  out = max (in, [], dim) - min (in, [], dim);

endfunction

%!test
%! X = [23 42 85; 62 46 65; 18 40 28];
%! Y = peak2peak (X);
%! assert (Y, [44 6 57]);
%! Y = peak2peak (X, 1);
%! assert (Y, [44 6 57]);
%! Y = peak2peak (X, 2);
%! assert (Y, [62; 19; 22]);

%!test
%! X = [71 62 33];
%! X(:, :, 2) = [88 36 21];
%! X(:, :, 3) = [83 46 85];
%! Y = peak2peak (X);
%! T = [38];
%! T(:, :, 2) = [67];
%! T(:, :, 3) = [39];
%! assert (Y, T);

%!test
%! X = [71 72 22; 16 22 50; 29 44 14];
%! X(:, :, 2) = [10 15 62; 1 94 30; 72 43 53];
%! X(:, :, 3) = [57 98 32; 84 95 51; 25 24 0];
%! Y = peak2peak (X);
%! T = [55 50 36];
%! T(:, :, 2) = [71 79 32];
%! T(:, :, 3) = [59 74 51];
%! assert (Y, T);
%! Y = peak2peak (X, 2);
%! T = [50; 34; 30];
%! T(:, :, 2) = [52; 93; 29];
%! T(:, :, 3) = [66; 44; 25];
%! assert (Y, T);
%! Y = peak2peak (X, 3);
%! T = [61 83 40; 83 73 21; 47 20 53];
%! assert (Y, T);

%!test
%! X = [60 61; 77 77];
%! X(:, :, 2) = [24 24; 22 74];
%! temp = [81 87; 88 62];
%! temp(:, :, 2) = [20 83; 81 18];
%! X(:, :, :, 2) = temp;
%! Y = peak2peak (X);
%! T = [17 16];
%! T(:, :, 2) = [2 50];
%! T2 = [7 25];
%! T2(:, :, 2) = [61 65];
%! T(:, :, :, 2) = T2;
%! assert (Y, T);

## Test input validation
%!error peak2peak ()
%!error peak2peak (1, 2, 3)
%!error peak2peak (1, 1.5)
