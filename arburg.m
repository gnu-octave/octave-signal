## Copyright (C) 1999 Paul Kienzle
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


## usage:  [a, v, k] = arburg (x, p)
## 
## fits an AR (p)-model using Burg method (a so called maximum entropy model).
## x = data vector to estimate
## a: AR coefficients
## v: variance of white noise
## k: reflection coeffients for use in lattice filter 
##
## The power spectrum of the resulting filter can be plotted with
## pburg(x, p), or you can plot it directly with power(sqrt(v), a).
##
## Example
##   ## Target system
##   pw=[0.2, 0.4, 0.45, 0.95];   # pole angle (nyquist freq. is 1.0)
##   pr=[0.98, 0.98, 0.98, 0.96]; # pole distance (0.0<=x<1.0)
##   sys_a = real(poly([pr, pr].*exp(1i*pi*[pw, -pw])));
##   order = 2*length(pw);
##   ## Filter impulse+random gaussian noise to produce signal
##   n = 1024;
##   s = [1 ; 0.1*randn(n-1,1)];
##   x = filter(1,sys_a,s); % AR system output
##   ## Determine system from signal
##   [a, v] = arburg(x, order);
##   ## Plot magnitude response of signal and matched system
##   figure(0);
##   mag = abs(fft(x))/sqrt(n);
##   [h, w] = freqz(sqrt(v), a, [], 2);
##   semilogy(2*[0:n/2-1]/n,mag(1:(n/2)),'1;spectrum;');
##   hold on;
##   semilogy(w,abs(h),sprintf('2;order %d burg;', order));
##   hold off;
##   ## Plot zero-pole graph of target system and matched system
##   figure(1); 
##   axis("square"); gset pointsize 2; grid;
##   r = exp(2i*pi*[0:100]/100); plot(real(r), imag(r), "0;;");
##   hold on;
##   r = roots(sys_a); plot(real(r), imag(r), "1x;system;");
##   r = roots(a); plot(real(r), imag(r), "2x;arburg;");
##   hold off;
##   axis("normal"); gset pointsize 1; grid('off');
##
## See also:
## pburg, power, freqz, impz for measuring the characteristics 
##    of the resulting filter
## aryule for alternative spectral estimators
##
## Note: Orphanidis '85 claims lattice filters are more tolerant of 
## truncation errors, which is why you might want to use them.  However,
## lacking a lattice filter processor, I haven't tested that the lattice
## filter coefficients are reasonable.
##
## Algorithm derived from:
##    Sophocles J. Orfanidis (1985).
##    Optimum signal processing: An introduction.
##    New York: Macmillan.

function [a, v, k] = arburg (x, p)

  if (nargin != 2) usage("[a, v, k] = arburg(x,p)"); end

  k = zeros(1,p);
  n = length(x);
  v = sumsq(x);

  ## f and b are the forward and backward error sequences
  f = x(2:n);
  b = x(1:n-1);

  ## remaining stages i=2 to p
  for i=1:p

    ## get the i-th reflection coefficient
    g = 2 * sum(f.*b)/(sumsq(f)+sumsq(b));
    k(i) = g;

    ## generate next filter order
    if i==1
      a = [ g ] ;
    else
      a = [ g, a-g*a(i-1:-1:1) ];
    endif

    ## keep track of the error
    v = v*(1-g^2);

    ## update the prediction error sequences
    oldf = f;
    f = oldf(2:n-i) - g*b(2:n-i);
    b = b(1:n-i-1) - g*oldf(1:n-i-1);

  endfor
  a = [ 1, -a(p:-1:1) ] ;

endfunction

%!demo
%! % use demo('pburg');
