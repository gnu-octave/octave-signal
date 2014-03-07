## Copyright (C) 2014 Georgios Ouzounis <ouzounis_georgios@hotmail.com>
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or (at
## your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} {@var{out} =} uencode (@var{in}, @var{n})
## @deftypefnx {Function File} {@var{out} =} uencode (@var{in}, @var{n}, @var{v})
## @deftypefnx {Function File} {@var{out} =} uencode (@var{in}, @var{n}, @var{v}, @var{signed})
## Quantize the entries of the array @var{in} using 2^@var{n} quantization levels.
## @seealso{udecode}
## @end deftypefn

function out = uencode (in, n, v = 1, signed = "unsigned")

  if (nargin < 2 || nargin > 4)
    print_usage ();
  endif

  if (n < 2 || n > 32 || n != fix (n))
    error ("uencode: N must be an integer in [2 32].");
  endif

  if (v <= 0)
    error ("uencode: V must be a possitive integer.");
  endif

  if (! (strcmp (signed, "signed") || strcmp (signed, "unsigned")))
    error ("uencode: SIGNED must be either \"signed\" or \"unsigned\".");
  endif

  out = zeros (size (in));

  width = 2 * v / 2 ^ n;

  out(in >= v) = (2 ^ n) - 1;
  idx = (in > -v) & (in < v);
  out(idx) = floor ((in(idx) + v) ./ width);
  if (strcmp (signed, "signed"))
    out = out - 2 ^ (n - 1);
  endif

endfunction

%!test
%! u = [-3:0.5:3];
%! y = uencode (u, 2);
%! assert (y, [0 0 0 0 0 1 2 3 3 3 3 3 3]);

%!test
%! u = [-4:0.5:4];
%! y = uencode (u, 3, 4);
%! assert (y, [0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 7]);

%!test
%! u = [-8:0.5:8];
%! y = uencode(u, 4, 8, "unsigned");
%! assert (y, [0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 11 11 12 12 13 13 14 14 15 15 15];

%!test
%! u = [-8:0.5:8];
%! y = uencode(u, 4, 8, "signed");
%! assert (y, [-8 -8 -7 -7 -6 -6 -5 -5 -4 -4 -3 -3 -2 -2 -1 -1 0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 7];
