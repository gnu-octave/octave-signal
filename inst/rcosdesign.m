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
## @deftypefn  {Function File} {@var{b} =} rcosdesign (@var{beta}, @var{span}, @var{sps})
## @deftypefnx {Function File} {@var{b} =} rcosdesign (@var{beta}, @var{span}, @var{sps}, @var{shape})
##
## Design a raised cosine FIR filter.
##
## The filter coefficients @var{b} are returned as a row vector of length
## @code{@var{sps} * @var{span} + 1}. The roll-off factor @var{beta}
## controls the excess bandwidth and must be in the range [0, 1]. The
## filter is truncated to @var{span} symbol periods, with @var{sps}
## samples per symbol.
##
## The optional argument @var{shape} selects the raised cosine variant:
##
## @table @asis
## @item @qcode{"sqrt"} (default)
## Square-root raised cosine filter. When two such filters are used in
## cascade (e.g., one at the transmitter and one at the receiver), the
## combined response matches a normal raised cosine filter.
##
## @item @qcode{"normal"}
## Normal (full) raised cosine filter. This filter satisfies the Nyquist
## criterion for zero intersymbol interference, with zero crossings at
## multiples of the symbol period.
## @end table
##
## @seealso{gaussdesign}
## @end deftypefn

function b = rcosdesign (beta, span, sps, shape = "sqrt")

  if (nargin < 3 || nargin > 4)
    print_usage ();
  endif

  if (!isscalar (beta) || !isreal (beta) || beta < 0 || beta > 1)
    error ("rcosdesign: BETA must be a real scalar in the range [0, 1].");
  endif

  if (!isscalar (span) || !isreal (span) || span <= 0 || span != fix (span))
    error ("rcosdesign: SPAN must be a positive integer.");
  endif

  if (!isscalar (sps) || !isreal (sps) || sps <= 0 || sps != fix (sps))
    error ("rcosdesign: SPS must be a positive integer.");
  endif

  N = sps * span;
  if mod (N, 2) != 0
    error ("rcosdesign: SPS * SPAN must be even.");
  endif
  n = -N/2:N/2;
  tol = sqrt (eps);
  t = n / sps;

  if (strcmp (shape, "normal"))
    ## Normal raised cosine impulse response:
    ##   h(t) = sinc(t/T) * cos(pi*beta*t/T) / (1 - (2*beta*t/T)^2)
    ## where t/T = n / sps.

    ## special case: t = 0
    idx0 = (abs (t) < tol);
    ## special case: |t| = 1/(2*beta)
    idx_inf = (abs (abs (t) - 1 / (2 * max (beta, tol))) < tol);

    if (beta > 0)
      b = zeros (size (t));
      ## For t = 0, the limit is 1
      b(idx0) = 1;

      ## For |t|->1/(2*beta), the limit is:
      ## = b/2 * sin(pi/(2b))
      b(idx_inf) = (beta / 2) * sin (pi / (2 * beta));

      others = !(idx0 | idx_inf);
      denom = 1 - (2 * beta * t(others)).^2;
      b(others) = sinc (t(others)) .* cos (pi * beta * t(others)) ./ denom;

    else
      ## beta = 0: ideal sinc
      b = sinc (t);
    endif

  elseif (strcmp (shape, "sqrt"))
    ## Square-root raised cosine impulse response:
    ##   h(t) = (sin(pi*t/T*(1-beta)) + 4*beta*t/T*cos(pi*t/T*(1+beta)))
    ##          / (pi*t/T * (1 - (4*beta*t/T)^2))
    ## where t/T = n / sps.

    idx0 = (abs (t) < tol);
    idx_inf = (abs (abs (t) - 1 / (4 * max (beta, tol))) < tol);

    if (beta > 0)
      b = zeros (size (t));
      ## t = 0 special case: limit = 1 - beta + 4*beta/pi
      b(idx0) = (1 - beta + 4 * beta / pi);

      ## |t| = 1/(4*beta) special case
      ## The limit formula works for all beta in (0, 1]:
      ##   (beta/sqrt(2)) * ((1+2/pi)*sin(pi/(4b)) + (1-2/pi)*cos(pi/(4b)))
      b(idx_inf) = (beta / sqrt (2)) * ...
                    ((1 + 2 / pi) * sin (pi / (4 * beta)) ...
                    + (1 - 2 / pi) * cos (pi / (4 * beta)));

      others = !(idx0 | idx_inf);
      a1 = pi * t(others) * (1 - beta);
      a2 = pi * t(others) * (1 + beta);
      denom = pi * t(others) .* (1 - (4 * beta * t(others)).^2);
      b(others) = (sin (a1) + 4 * beta * t(others) .* cos (a2)) ./ denom;

    else
      b = sinc (t);
    endif
  else
    error ("rcosdesign: SHAPE must be 'sqrt' or 'normal'.");
  endif

  b = b / norm (b);

endfunction

%!test
%! h = rcosdesign (0.25, 2, 2);
%! assert (h, [-0.0463, 0.4484, 0.7704, 0.4484, -0.0463], 1e-4);

%!test
%! h1 = rcosdesign (1, 2, 2, "sqrt");
%! h2 = rcosdesign (1, 2, 2, "normal");
%! assert (h1, [-0.0601, 0.3004, 0.9013, 0.3004, -0.0601], 1e-4);
%! assert (h2, [0.0, 0.4082, 0.8165, 0.4082, 0.0], 1e-4);

%!test
%! ## Trivial case: beta = 0 (ideal sinc filter)
%! h = rcosdesign (0, 4, 4);
%! N = 16;
%! n = (-N/2:N/2) / 4;
%! expected = sinc (n);
%! expected = expected / norm (expected);
%! assert (h, expected, 1e-14);

%!error rcosdesign ()
%!error rcosdesign (0.25)
%!error rcosdesign (0.25, 6)
%!error <real scalar> rcosdesign (-0.1, 6, 4)
%!error <real scalar> rcosdesign (1.5, 6, 4)
%!error <positive integer> rcosdesign (0.25, 0, 4)
%!error <positive integer> rcosdesign (0.25, 3.5, 4)
%!error <positive integer> rcosdesign (0.25, 6, 0)
%!error <positive integer> rcosdesign (0.25, 6, 2.5)
%!error <must be even> rcosdesign (0.25, 3, 5)
%!error rcosdesign (0.25, 6, 4, "invalid")
%!error rcosdesign (0.25, 6, 4, 1)

%!demo
%! beta = 0.25;
%! span = 6;
%! sps = 4;
%! h_sqrt = rcosdesign (beta, span, sps, "sqrt");
%! h_norm = rcosdesign (beta, span, sps, "normal");
%! subplot (2, 1, 1);
%! stem (h_norm);
%! title ("Normal raised cosine impulse response");
%! xlabel ("Samples");
%! ylabel ("Amplitude");
%! subplot (2, 1, 2);
%! stem (h_sqrt);
%! title ("Square-root raised cosine impulse response");
%! xlabel ("Samples");
%! ylabel ("Amplitude");
