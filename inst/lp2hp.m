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
## @deftypefn  {Function File} {[@var{bt}, @var{at}] =} lp2hp (@var{b}, @var{a}, @var{Wo})
## @deftypefnx {Function File} {[@var{At}, @var{Bt}, @var{Ct}, @var{Dt}] =} lp2hp (@var{A}, @var{B}, @var{C}, @var{D}, @var{Wo})
##
## [bt, at] = lp2hp(b, a, Wo) transforms an analog lowpass filter in transfer
## function form to an analog highpass filter with a different cutoff frequency (Wo).
##
## [At,Bt,Ct,Dt] = lp2hp(A, B, C, D, Wo) transforms an analog lowpass filter in state
## space form to an analog highpass filter with a different cutoff frequency (Wo).
## @seealso{lp2lp, lp2bp, lp2bs}
## @end deftypefn

function [At Bt Ct Dt] = lp2hp(A, B, C, D, Wo)

  if (nargin == 3)
    ## Transfer function form: [bt, at] = lp2hp(b, a, Wo)
    b = A;
    a = B;
    Wo = C;

    if (!isvector (b) || !isvector (a))
      error ("lp2hp: b and a must be vectors.");
    endif
    if (!isscalar (Wo))
      error ("lp2hp: Wo must be a scalar.");
    endif

    [A, B, C, D] = tf2ss (b, a);
    [At, Bt, Ct, Dt] = lp2hp (A, B, C, D, Wo);
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
    ## State-space form: [At, Bt, Ct, Dt] = lp2hp(A, B, C, D, Wo)
    if (!ismatrix (A) || !ismatrix (B) || !ismatrix (C) || !ismatrix (D))
      error ("lp2hp: A, B, C, D must be matrices.");
    endif
    if (!isscalar (Wo))
      error ("lp2hp: Wo must be a scalar.");
    endif

    ## Dimension checks
    [ma, na] = size (A);
    if (ma != na)
      error ("lp2hp: A must be square.");
    endif
    [mb, nb] = size (B);
    if (mb != ma)
      error ("lp2hp: B must have same number of rows as A.");
    endif
    [mc, nc] = size (C);
    if (nc != ma)
      error ("lp2hp: C must have same number of columns as A.");
    endif
    [md, nd] = size (D);
    if (md != mc || nd != nb)
      error ("lp2hp: D dimensions inconsistent with B and C.");
    endif

    At = Wo*inv(A);
    Bt = -Wo*(A\B);
    Ct = C/A;
    Dt = D-C/A*B;
  else
    print_usage ();
  endif

endfunction

%!test
%! b = [1];
%! a = [1, 1];
%! [bt, at] = lp2hp(b, a, 2);
%! assert (bt, [1, 0], 1e-10);
%! assert (at, [1, 2], 1e-10);

%!test
%! A = [0, 1; 3, 2];
%! B = [0; 1];
%! C = [1, 0];
%! D = [1];
%! [At, Bt, Ct, Dt] = lp2hp(A, B, C, D, 10);
%! assert (At, [-6.6667, 3.3333; 10, 0],1e-4);
%! assert (Bt, [-3.3333; 0],1e-4);
%! assert (Ct, [-0.6667, 0.3333],1e-4);
%! assert (Dt, 0.6667,1e-4);

%!error lp2hp()
%!error lp2hp(1)
%!error lp2hp(1, 2)
%!error lp2hp([1, 2; 3, 4], [1, 1], 100, 10)

%!demo
%! f = 100;
%! [ze pe ke] = ellipap(5, 3, 30);
%! [be ae] = zp2tf(ze, pe, ke);
%! 
%! w = logspace(-2, 1, 501);
%! H = freqs(be, ae, w);
%! figure(1)
%! clf
%! semilogx(w, 20*log10(abs(H)))
%! title("Lowpass Elliptic")
%! grid
%! 
%! [bh ah] = lp2hp(be, ae, 2*pi*f);
%! 
%! f = logspace(1, 3, 501);
%! H = freqs(bh, ah, 2*pi*f);
%! figure(2)
%! clf
%! semilogx(f, 20*log10(abs(H)))
%! title("Highpass filter response")
%! grid
