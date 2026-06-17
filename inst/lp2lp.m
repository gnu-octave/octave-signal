## Copyright (C) 2021 Tony Richardson <richardson.tony@gmail.com>
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
## @deftypefn  {Function File} {[@var{bt}, @var{at}] =} lp2lp (@var{b}, @var{a}, @var{Wo})
## @deftypefnx {Function File} {[@var{At}, @var{Bt}, @var{Ct}, @var{Dt}] =} lp2lp (@var{A}, @var{B}, @var{C}, @var{D}, @var{Wo})
##
## Transform an analog lowpass filter prototype to a lowpass filter with a
## different cutoff frequency.
##
## Two calling forms are available:
##
## @table @asis
## @item Transfer function form
## [bt, at] = lp2lp (b, a, Wo)
##
## Given a lowpass filter with numerator coefficients @var{b} and denominator
## coefficients @var{a}, returns the transformed filter coefficients @var{bt}
## and @var{at} with cutoff frequency @var{Wo} (in rad/s).
##
## @item State-space form
## [At, Bt, Ct, Dt] = lp2lp (A, B, C, D, Wo)
##
## Given a lowpass filter in state-space form (@var{A}, @var{B}, @var{C},
## @var{D}), returns the transformed state-space matrices (@var{At}, @var{Bt},
## @var{Ct}, @var{Dt}) with cutoff frequency @var{Wo} (in rad/s).
## @end table
##
## @seealso{lp2hp, lp2bp, lp2bs}
## @end deftypefn

function [At Bt Ct Dt] = lp2lp(A, B, C, D, Wo)

  if (nargin == 3)
    ## Transfer function form: [bt, at] = lp2lp(b, a, Wo)
    b = A;
    a = B;
    Wo = C;

    if (!isvector (b) || !isvector (a))
      error ("lp2lp: b and a must be vectors.");
    endif
    if (!isscalar (Wo))
      error ("lp2lp: Wo must be a scalar.");
    endif

    [A, B, C, D] = tf2ss (b, a);
    [At, Bt, Ct, Dt] = lp2lp (A, B, C, D, Wo);
    [bt, at] = ss2tf (At, Bt, Ct, Dt);

    bt = bt/at(1);
    at = at/at(1);

    ## Remove leading zeros from bt
    first_nonzero = find(bt != 0, 1);
    if !isempty (first_nonzero)
      bt = bt(first_nonzero:end);
    else
      bt = 0;
    endif

    At = bt;
    Bt = at;

  elseif (nargin == 5)
    ## State-space form: [At, Bt, Ct, Dt] = lp2lp(A, B, C, D, Wo)
    if (!ismatrix (A) || !ismatrix (B) || !ismatrix (C) || !ismatrix (D))
      error ("lp2lp: A, B, C, D must be matrices.");
    endif
    if (!isscalar (Wo))
      error ("lp2lp: Wo must be a scalar.");
    endif

    ## Dimension checks
    [ma, na] = size (A);
    if (ma != na)
      error ("lp2lp: A must be square.");
    endif
    [mb, nb] = size (B);
    if (mb != ma)
      error ("lp2lp: B must have same number of rows as A.");
    endif
    [mc, nc] = size (C);
    if (nc != ma)
      error ("lp2lp: C must have same number of columns as A.");
    endif
    [md, nd] = size (D);
    if (md != mc || nd != nb)
      error ("lp2lp: D dimensions inconsistent with B and C.");
    endif

    At = Wo*A;
    Bt = Wo*B;
    Ct = C;
    Dt = D;
  else
    print_usage ();
  endif

endfunction

%!test
%! b = [1];
%! a = [1, 1];
%! [bt, at] = lp2lp(b, a, 2);
%! assert (bt, 2, 1e-10);
%! assert (at, [1, 2], 1e-10);

%!test
%! A = [0, 1; 3, 2];
%! B = [0; 1];
%! C = [1, 0];
%! D = [1];
%! [At, Bt, Ct, Dt] = lp2lp(A, B, C, D, 10);
%! assert (At, [0, 10; 30, 20]);
%! assert (Bt, [0; 10]);
%! assert (Ct, [1, 0]);
%! assert (Dt, 1);

%!error lp2lp()
%!error lp2lp(1)
%!error lp2lp(1, 2)
%!error lp2lp([1, 2; 3, 4], [1, 1], 100, 10)

%!demo
%! [z p k] = cheb1ap(8, 3);
%! [b a] = zp2tf(z, p, real(k));
%!
%! Wo = 2*pi*30;
%! [bt at] = lp2lp(b, a, Wo);
%!
%! w = logspace(-2, 1, 501);
%! H = freqs(b, a, w);
%! figure(1)
%! clf
%! subplot(2, 1, 1)
%! loglog(w, abs(H))
%! title("Lowpass Chebyshev Type I")
%! grid on
%! subplot(2, 1, 2)
%! semilogx(w, rad2deg(angle(H)))
%! grid on
%!
%! w = logspace(0, 3, 501);
%! H = freqs(bt, at, w);
%!
%! figure(2)
%! clf
%! subplot(2, 1, 1)
%! loglog(w, abs(H))
%! title("Lowpass filter response")
%! grid on
%! subplot(2, 1, 2)
%! semilogx(w, rad2deg(angle(H)))
%! grid on
