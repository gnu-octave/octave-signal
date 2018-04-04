## Copyright (C) 2013 Juan Pablo Carbajal
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
## @deftypefn {Function File} {@var{F} =} primitive (@var{f}, @var{t}, @var{F0})
## Calculate the primitive of a function.
##
## The function approximates the primitive (indefinite integral) of the
## univariate function handle @var{f} with constant of integration @var{F0}.
## The output is the primitive evaluated at the points @var{t}.  The vector
## @var{t} must be ordered and ascending.
##
## This function is a fancy way of calculating the cumulative sum,
##
## @command{F = cumsum (f(t).*diff (t)([1 1:end]))}.
##
## Example:
## @example
## @group
## f = @@(t) sin (2 * pi * 3 * t);
## t = [0; sort(rand (100, 1))];
## F = primitive (f, t, 0);
## t_true = linspace (0, 1, 1e3).';
## F_true = (1 - cos (2 * pi * 3 * t_true)) / (2 * pi * 3);
## plot (t, F, 'o', t_true, F_true);
## @end group
## @end example
##
## @seealso{quadgk, cumsum}
## @end deftypefn

function F = primitive (f, t, C = 0)

  if (nargin < 2 || nargin > 3)
    print_usage ();
  endif

  i_chunk (0, 0, []);
  F = arrayfun (@(x) i_chunk (f, x, C), t);

endfunction

function F = i_chunk (f, t, init)

  persistent F_prev t0

  if isempty (init)
    F_prev = [];
    t0     = 0;
  elseif isempty (F_prev)
    F_prev = init;
  else
    F_prev += quadgk (f, t0, t);
    t0      = t;
  endif

  F = F_prev;

endfunction

%!demo
%! f = @(t) sin (2*pi*3*t);
%! t = [0; sort(rand (100, 1))];
%! F = primitive (f, t, 0);
%! t_true = linspace (0, 1, 1e3).';
%! F_true = (1 - cos (2 * pi * 3 * t_true)) / (2 * pi * 3);
%! h = plot (t, F, "o;Numerical primitive;", t_true, F_true, "-;True primitive;");
%! set (h, "linewidth", 2);
%! title ("Numerical primitive evaluated at random time points");

## Test input validation
%!error primitive ()
%!error primitive (1)
%!error primitive (1, 2, 3, 4)
