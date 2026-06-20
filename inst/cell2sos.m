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
## @deftypefn  {Function File} {@var{sos} =} cell2sos (@var{cll})
## @deftypefnx {Function File} {[@var{sos}, @var{g}] =} cell2sos (@var{cll})
## Convert a second-order-section cell array to matrix form.
##
## Given a cell array @var{cll} representing second-order sections,
## return the equivalent matrix @var{sos} and an optional overall
## gain @var{g}.
##
## @seealso{sos2cell}
## @end deftypefn

function [sos, g] = cell2sos (cll)

  if (nargin != 1)
    print_usage ();
  endif

  if (!iscell (cll) || isempty (cll))
    error ("cell2sos: CLL must be a non-empty cell array");
  endif

  ## Check the first element to determine if it contains gain
  first = cll{1};
  if (!iscell (first) || numel (first) != 2)
    error ("cell2sos: each element of CLL must be a 2-element cell array");
  endif

  ## A gain element contains two scalars {gn, gd}
  ## A section element contains two vectors {[b0 b1 b2], [1 a1 a2]}
  if (isscalar (first{1}) && isscalar (first{2}))
    has_gain = true;
    gn = first{1};
    gd = first{2};
    g = gn / gd;
    start_idx = 2;
  else
    has_gain = false;
    g = 1;
    start_idx = 1;
  endif

  L = numel (cll) - has_gain;
  sos = zeros (L, 6);

  for k = 1:L
    idx = start_idx + k - 1;
    sec = cll{idx};
    if (!iscell (sec) || numel (sec) != 2)
      error ("cell2sos: each element of CLL must be a 2-element cell array");
    endif
    if (numel (sec{1}) != 3 || numel (sec{2}) != 3)
      error ("cell2sos: each section must contain 3-element numerator and denominator vectors");
    endif
    sos(k, 1:6) = [sec{1}, sec{2}];
  endfor

  ## When called with a single output and gain is present, embed the
  ## gain as the first row [gn, 0, 0, gd, 0, 0].
  if (nargout < 2 && has_gain)
    sos = [gn, 0, 0, gd, 0, 0; sos];
  endif

endfunction

%!test
%! ## Unity gain, two sections
%! cll = {{[2 4 2] [6 0 2]}, {[3 3 0] [6 0 0]}};
%! sos = cell2sos (cll);
%! expected = [2 4 2 6 0 2; 3 3 0 6 0 0];
%! assert (sos, expected);

%!test
%! ## Unity gain, two sections, two outputs
%! cll = {{[2 4 2] [6 0 2]}, {[3 3 0] [6 0 0]}};
%! [sos, g] = cell2sos (cll);
%! expected_sos = [2 4 2 6 0 2; 3 3 0 6 0 0];
%! assert (sos, expected_sos);
%! assert (g, 1);

%!test
%! ## Single output with gain in first element
%! cll = {{7 5}, {[2 4 2] [6 0 2]}, {[3 3 0] [6 0 0]}};
%! sos = cell2sos (cll);
%! expected = [7 0 0 5 0 0; 2 4 2 6 0 2; 3 3 0 6 0 0];
%! assert (sos, expected, eps);

%!test
%! ## Two output with gain in first element
%! cll = {{7 5}, {[2 4 2] [6 0 2]}, {[3 3 0] [6 0 0]}};
%! [sos, g] = cell2sos (cll);
%! expected_sos = [2 4 2 6 0 2; 3 3 0 6 0 0];
%! assert (sos, expected_sos);
%! assert (g, 7/5);

%!test
%! ## sos2cell then cell2sos
%! sos = [1 2 3 1 0.5 0.25; 4 5 6 1 3 1];
%! cll = sos2cell (sos);
%! sos2 = cell2sos (cll);
%! assert (sos, sos2, eps);

%!test
%! ## with gain
%! sos = [1 2 3 1 0.5 0.25; 4 5 6 1 3 1];
%! g = 0.75;
%! cll = sos2cell (sos, g);
%! [sos2, g2] = cell2sos (cll);
%! assert (sos, sos2, eps);
%! assert (g, g2, eps);

%!error <non-empty cell array> cell2sos ([1 2 3]);
%!error <non-empty cell array> cell2sos ({});
%!error <2-element cell array> cell2sos ({{[1 2 3]}});
%!error <3-element numerator> cell2sos ({{[1 2] [1 0 0]}});
