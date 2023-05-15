## Copyright (C) 2023 Leonardo Araujo <leolca@gmail.com>
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
## @deftypefn  {Function File} {@var{L} = } filternorm (@var{b}, @var{a})
## @deftypefnx {Function File} {@var{L} = } filternorm (@var{b}, @var{a}, @var{pnorm})
## @deftypefnx {Function File} {@var{L} = } filternorm (@var{b}, @var{a}, 2, @var{tol})
##
## Compute the 2-norm of a digital filter defined by the numerator coefficients,
## @var{b}, and the denominator coefficients, @var{a}. It is also possible to
## compute the infinity-norm by passing inf in the @var{pnorm} parameter.
## @var{pnorm} only accepts 2 or inf.
##
## Example:
## @example
## [b, a] = butter (8, 0.5);
## filternorm (b, a)
## @end example
## @end deftypefn

function L = filternorm (b, a, pnorm, tol)
  if (nargin < 2 || nargin > 4 || ! isrow (b) || ! isrow (a))
    print_usage;
  endif

  if nargin < 3
    pnorm = 2;
  endif
  if pnorm != 2 && pnorm != Inf
    error ("pnorm should be either 2 or Inf")
  endif

  if nargin == 2 || pnorm == 2
    # Parseval's theorem states that the L2-norm of a filter with frequency
    # response H(e^{j\omega}) is the square-root of the sum of the squares
    # of its filter impulse response (the energy of the impulse response).
    [h, _] = impz (b,a);
    L = sqrt (sum (h.^2)); % L = normp (h, pnorm);
  elseif pnorm == Inf
    # the norm in L-infinity is simply the maximum of the frequency response:
    # ||H||_{\infty} = \max_{0 \leq \omega \leq \pi} { |H(e^{j\omega})|}
    [H, W] = freqz (b, a, 1024);
    L = max (abs (H));
  else
    error( "filternorm: pnorm must be either 2 or Inf" );
  endif

endfunction

%!demo
%! b = [1 0];
%! a = [1 1];
%! L = filternorm (b, a)

%!demo
%! [b, a] = butter(5, .5);
%! L = filternorm (b, a)

%! ## test input validation
%!error n = filternorm ()
%!error n = filternorm (1)
%!error n = filternorm (1, 1, 1)
%!error n = filternorm (1, 1, 1, 1)
%!error n = filternorm (1, 1, 1, 1, 1)
%!error n = filternorm ([1:10]', 1)
%!error n = filternorm (1, [1:10]')
%!error n = filternorm ([1:10]', [1:10]')
%!error n = filternorm (1:10, 1:10, 1:10)
%!error n = filternorm (ones(3), ones(3))

%!test
%! [b, a] = butter (5, .5);
%! L = filternorm (b, a);
%! assert (L, sqrt(2)/2, 1e-8)

%!test
%! [b, a] = butter (5, .5);
%! Linf = filternorm (b, a, Inf);
%! assert (Linf, 1, 1e-8);
