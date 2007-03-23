## Copyright (C) 2002 André Carezia
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or (at
## your option) any later version.
##
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301
## USA

## Usage:  chebwin (n, at)
##
## Returns the filter coefficients of the n-point Dolph-Chebyshev window
## with at dB of attenuation in the stop-band of the corresponding
## Fourier transform.
##
## For the definition of the Chebyshev window, see
##
## * Peter Lynch, "The Dolph-Chebyshev Window: A Simple Optimal Filter",
##   Monthly Weather Review, Vol. 125, pp. 655-660, April 1997.
##   (http://www.maths.tcd.ie/~plynch/Publications/Dolph.pdf)
##
## * C. Dolph, "A current distribution for broadside arrays which
##   optimizes the relationship between beam width and side-lobe level",
##   Proc. IEEE, 34, pp. 335-348.
##
## The window is described in frequency domain by the expression:
##
##          Cheb(n-1, beta * cos(pi * k/n))
##   W(k) = -------------------------------
##                 Cheb(n-1, beta)
##
## with
##
##   beta = cosh(1/(n-1) * acosh(10^(at/20))
##
## and Cheb(m,x) denoting the m-th order Chebyshev polynomial calculated
## at the point x.
##
## Note that the denominator in W(k) above is not computed, and after
## the inverse Fourier transform the window is scaled by making its
## maximum value unitary.
##
## See also: kaiser

## $Id$
##
## Author:  André Carezia <acarezia@uol.com.br>
## Description:  Coefficients of the Dolph-Chebyshev window

function w = chebwin (n, at)

  if (nargin != 2)
    usage ("chebwin (n, at)");
  endif
  
  if !(isscalar (n) && (n == round(n)) && (n > 0))
    error ("chebwin: n has to be a positive integer");
  endif
  if !(isscalar (at) && (at == real (at)))
    error ("chebwin: at has to be a real scalar");
  endif
  
  if (n == 1)
    w = 1;
  else
				# beta calculation
    gamma = 10^(-at/20);
    beta = cosh(1/(n-1) * acosh(1/gamma));
				# freq. scale
    k = (0:n-1);
    x = beta*cos(pi*k/n);
				# Chebyshev window (freq. domain)
    p = cheb(n-1, x);
				# inverse Fourier transform
    if (rem(n,2))
      w = real(fft(p));
      M = (n+1)/2;
      w = w(1:M)/w(1);
      w = [w(M:-1:2) w]';
    else
				# half-sample delay (even order)
      p = p.*exp(j*pi/n * (0:n-1));
      w = real(fft(p));
      M = n/2+1;
      w = w/w(2);
      w = [w(M:-1:2) w(2:M)]';
    endif
  endif  
end

