## Copyright (C) 1999-2001 Paul Kienzle <pkienzle@cs.indiana.edu>
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

## Generate a chebyshev filter with Rp dB of stop band ripple (type II).
## 
## [b,a] = cheby2(n, Rs, Wc)
##    low pass filter with stop band cut-off of -Rs dB at pi*Wc radians
##
## [b,a] = cheby2(n, Rs, Wc, 'high')
##    high pass filter with stop band cutoff of -Rs dB at pi*Wc radians
##
## [b,a] = cheby2(n, Rs, [Wl, Wh])
##    band pass filter with stop band edges at pi*Wl and pi*Wh radians
##
## [b,a] = cheby2(n, Rs, [Wl, Wh], 'stop')
##    band reject filter with pass band edges at pi*Wl and pi*Wh radians
##
## [z,p,g] = cheby2(...)
##    return filter as zero-pole-gain rather than coefficients of the
##    numerator and denominator polynomials.

## Author: Paul Kienzle <pkienzle@cs.indiana.edu>
## 2001-03-09 pkienzle@kienzle.powernet.co.uk
##     * for odd n, skip zero at infinity for theta==pi/2

function [Zz, Zp, Zg] = cheby2(n, Rs, W, stype)

  if (nargin>4 || nargin<3) || (nargout>3 || nargout<2)
    usage ("[b, a] or [z, p, g] = cheby2 (n, Rs, W, [, 'ftype'])");
  end

  stop = nargin==4;
  if stop && !(strcmp(stype, 'high') || strcmp(stype, 'stop'))
    error ("cheby2: ftype must be 'high' or 'stop'");
  end
  
  [r, c]=size(W);
  if (!(length(W)<=2 && (r==1 || c==1)))
    error ("cheby2: frequency must be given as w0 or [w0, w1]");
  elseif (!all(W >= 0 & W <= 1))
    error ("cheby2: critical frequencies must be in (0, 1)");
  elseif (!(length(W)==1 || length(W) == 2))
    error ("cheby2: only one filter band allowed");
  elseif (length(W)==2 && !(W(1) < W(2)))
    error ("cheby2: first band edge must be smaller than second");
  endif
  if (Rs < 0)
    error("cheby2: passband ripple must be positive decibels");
  end

  ## Prewarp to the band edges to s plane
  T = 2;       # sampling frequency of 2 Hz
  Ws = 2/T*tan(pi*W/T);

  ## Generate splane poles and zeros for the chebyshev type 2 filter
  ## From: Stearns, SD; David, RA; (1988). Signal Processing Algorithms. 
  ##       New Jersey: Prentice-Hall.
  C = 1;			# default cutoff frequency
  lambda = 10^(Rs/20);
  phi = log(lambda + sqrt(lambda^2-1))/n;
  theta = pi*([1:n]-0.5)/n;
  alpha = -sinh(phi)*sin(theta);
  beta = cosh(phi)*cos(theta);
  if (rem(n,2))
    ## drop theta==pi/2 since it results in a zero at infinity
    Sz = 1i*C./cos(theta([1:(n-1)/2, (n+3)/2:n]));
  else
    Sz = 1i*C./cos(theta);
  endif
  Sp = C./(alpha.^2+beta.^2).*(alpha-1i*beta);

  ## compensate for amplitude at s=0
  Sg = real(prod(Sp)/prod(Sz));

  ## splane frequency transform
  [Sz, Sp, Sg] = sftrans(Sz, Sp, Sg, Ws, stop);

  ## Use bilinear transform to convert poles to the z plane
  [Zz, Zp, Zg] = bilinear(Sz, Sp, Sg, T);

  if nargout==2, [Zz, Zp] = zp2tf(Zz, Zp, Zg); endif

endfunction
