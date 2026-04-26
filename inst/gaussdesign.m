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
## @deftypefn {Function File} {@var{h} =} gaussdesign (@var{bt}, @var{span}, @var{sps})
## 
## Design a Gaussian FIR pulse-shaping filter.
##
## The function returns the coefficients @var{h} of a Gaussian finite impulse
## response (FIR) filter. The filter is designed to have a normalized bandwidth-symbol 
## time product @var{bt}, a specified duration @var{span} in symbol intervals, and
## a given number of samples per symbol @var{sps}.
##
## @strong{Inputs}
##
## @table @var
## @item bt
## Bandwidth-symbol time product. A smaller @var{bt} yields a narrower
## frequency response but longer impulse response.
##
## @item span
## Filter duration in symbol intervals. Default is 3.
##
## @item sps
## Number of samples per symbol. It defines the oversampling factor.
## Default is 2.
## @end table
##
## @strong{Outputs}
##
## @table @var
## @item h
## Normalized FIR filter coefficients.
## @end table
##
## @seealso{gaussian}
## @end deftypefn

function h = gaussdesign (bt, span = 3, sps = 2)

  if (nargin < 1 || nargin > 3)
    print_usage ();
  endif

  if (!(isscalar (bt) && isreal (bt) && bt > 0))
    error ("gaussdesign: BT must be positive.");
  endif

  if (!(isscalar (span) && span > 0 && fix (span) == span))
    error ("gaussdesign: SPAN must be a positive integer.");
  endif

  if (!(isscalar (sps) && sps > 0 && fix (sps) == sps))
    error ("gaussdesign: SPS must be a positive integer.");
  endif

  order = sps * span;
  if (mod (order, 2) != 0)
    error ("gaussdesign: filter order(sps*span) must be even.");
  endif

  t = linspace (-span/2, span/2, order + 1);
  delta = sqrt (log (2)) / (2 * pi * bt);
  h = exp (-t.^2 / (2 * delta^2)) / (sqrt (2 * pi) * delta);
  h = h / sum (h);

endfunction

%!test
%! h = gaussdesign (0.5);
%! assert (length (h), 3 * 2 + 1);
%! assert (abs (sum (h) - 1) < 1e-10);

%!error <BT must be positive> gaussdesign (0)
%!error <BT must be positive> gaussdesign (-1)
%!error <BT must be positive> gaussdesign (1i)
%!error <SPAN must be a positive integer> gaussdesign (0.5, 0)
%!error <SPAN must be a positive integer> gaussdesign (0.5, 3.5)
%!error <SPS must be a positive integer> gaussdesign (0.5, 3, 0)
%!error <SPS must be a positive integer> gaussdesign (0.5, 3, 2.5)
%!error <must be even> gaussdesign (0.3, 3, 5)
