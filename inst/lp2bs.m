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
## @deftypefn  {Function File} {[@var{bt}, @var{at}] =} lp2bs (@var{b}, @var{a}, @var{Wo}, @var{Bw})
## @deftypefnx {Function File} {[@var{At}, @var{Bt}, @var{Ct}, @var{Dt}] =} lp2bs (@var{A}, @var{B}, @var{C}, @var{D}, @var{Wo}, @var{Bw})
##
## Transform an analog lowpass filter prototype to a bandstop filter with a
## given center frequency and bandwidth.
##
## Two calling forms are available:
##
## @table @asis
## @item Transfer function form
## [bt, at] = lp2bs (b, a, Wo, Bw)
##
## Given a lowpass filter with numerator coefficients @var{b} and denominator
## coefficients @var{a}, returns the bandstop filter coefficients @var{bt}
## and @var{at} with center frequency @var{Wo} and bandwidth @var{Bw}
## (both in rad/s).
##
## @item State-space form
## [At, Bt, Ct, Dt] = lp2bs (A, B, C, D, Wo, Bw)
##
## Given a lowpass filter in state-space form (@var{A}, @var{B}, @var{C},
## @var{D}), returns the transformed state-space matrices (@var{At}, @var{Bt},
## @var{Ct}, @var{Dt}) for the bandstop filter with center frequency @var{Wo}
## and bandwidth @var{Bw} (both in rad/s).
## @end table
##
## @seealso{lp2bp, lp2hp, lp2lp}
## @end deftypefn

function [At Bt Ct Dt] = lp2bs(A, B, C, D, Wo, Bw)

  if (nargin == 4)
    ## Transfer function form: [bt, at] = lp2bs(b, a, Wo, Bw)
    b = A;
    a = B;
    Wo = C;
    Bw = D;

    if (!isvector (b) || !isvector (a))
      error ("lp2bs: b and a must be vectors.");
    endif
    if (!isscalar (Wo) || !isscalar (Bw))
      error ("lp2bs: Wo and Bw must be scalars.");
    endif

    [A, B, C, D] = tf2ss (b, a);
    [At, Bt, Ct, Dt] = lp2bs (A, B, C, D, Wo, Bw);
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

  elseif (nargin == 6)
    ## State-space form: [At, Bt, Ct, Dt] = lp2bs(A, B, C, D, Wo, Bw)
    if (!ismatrix (A) || !ismatrix (B) || !ismatrix (C) || !ismatrix (D))
      error ("lp2bs: A, B, C, D must be matrices.");
    endif
    if (!isscalar (Wo) || !isscalar (Bw))
      error ("lp2bs: Wo and Bw must be scalars.");
    endif

    ## Dimension checks
    [ma, na] = size (A);
    if (ma != na)
      error ("lp2bs: A must be square.");
    endif
    [mb, nb] = size (B);
    if (mb != ma)
      error ("lp2bs: B must have same number of rows as A.");
    endif
    [mc, nc] = size (C);
    if (nc != ma)
      error ("lp2bs: C must have same number of columns as A.");
    endif
    [md, nd] = size (D);
    if (md != mc || nd != nb)
      error ("lp2bs: D dimensions inconsistent with B and C.");
    endif

    Q = Wo / Bw;
    At = [Wo/Q*inv(A) Wo*eye(ma); -Wo*eye(ma) zeros(ma)];
    Bt = -[Wo/Q*(A\B); zeros(ma,nb)];
    Ct = [C/A zeros(mc,ma)];
    Dt = D - C/A*B;
  else
    print_usage ();
  endif

endfunction

%!test
%! b = [1];
%! a = [1, 1];
%! [bt, at] = lp2bs(b, a, 2, 3);
%! assert (bt, [1, 0, 4], 1e-10);
%! assert (at, [1, 3, 4], 1e-10);

%!test
%! A = [0, 1; 3, 2];
%! B = [0; 1];
%! C = [1, 0];
%! D = [1];
%! [At, Bt, Ct, Dt] = lp2bs(A, B, C, D, 10, 5);
%! assert (At, [-3.3333, 1.6667, 10, 0; 5, 0, 0, 10; -10, 0, 0, 0; 0, -10.0000, 0, 0],1e-4);
%! assert (Bt, [-1.6667; 0; 0; 0],1e-4);
%! assert (Ct, [-0.6667, 0.3333, 0, 0],1e-4);
%! assert (Dt, 0.6667,1e-4);

%!error lp2bs()
%!error lp2bs(1)
%!error lp2bs(1, 2)
%!error lp2bs(1, 2, 3)
%!error lp2bs([1, 2; 3, 4], [1, 1], 100, 10)

%!demo
%! n = 15;
%! [z p k] = buttap(n);
%! [b a] = zp2tf(z, p, k);
%! w = logspace(-1, 1, 501);
%! H = freqs(b, a, w);
%! figure(1)
%! subplot(2, 1, 1)
%! loglog(w, abs(H))
%! ylim([1e-15 1]);
%! yticks(logspace(-15, 0, 4))
%! title("Lowpass Butterworth")
%! grid on
%! subplot(2, 1, 2)
%! semilogx(w, rad2deg(angle(H)))
%! grid on
%!
%! [bt, at] = lp2bs(b, a, 200, 250);
%! w = logspace(1, 3, 501);
%! H = freqs(bt, at, w);
%! figure(2)
%! subplot(2, 1, 1)
%! loglog(w, abs(H))
%! ylim([1e-20 1]);
%! yticks(logspace(-20, 0, 3))
%! title("Bandstop filter response")
%! grid on
%! subplot(2, 1, 2)
%! semilogx(w, rad2deg(angle(H)))
%! grid on
