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

## usage:  [P, f] = pyulear (x, p [, nfft [, Fs [, range]]] [, units])
## 
## Fits x with an AR (p)-model with Yule-Walker estimates, and computes
## the power spectrum.
##
## x = signal to estimate
## nfft is number of points at which to sample the power spectrum
## Fs is the sampling frequency of x
## range is 'half' or 'whole'
## units is  'squared' for magnitude squared, or 'db' for decibels (default)
##
## Returns P, the magnitude vector, and f, the frequencies at which it
## is sampled.  If there are no return values requested, then plot the power
## spectrum and don't return anything.
##
function [P, w] = pyulear (x, p, varargin)
  
  if (nargin < 2 || nargin > 6) 
    usage("[P, f] = pyulear(x, p [,nfft [,Fs [,range]]] [, units])");
  endif
  
  [a, v] = aryule(x, p);
  if (nargout == 0)
    __power(sqrt(v), a, varargin{:});
  else
    [P, w] = __power(sqrt(v), a, varargin{:});
  endif

endfunction

%!demo
%! ## construct target system:
%! ##   symmetric zero-pole pairs at r*exp(iw),r*exp(-iw)
%! ##   zero-pole singletons at s
%! pw=[0.2, 0.4, 0.45, 0.95];   #pw = [0.4];
%! pr=[0.98, 0.98, 0.98, 0.96]; #pr = [0.85];
%! ps=[];
%! zw=[0.3];  # zw=[];
%! zr=[0.95]; # zr=[];
%! zs=[];
%! 
%! save_empty_list_elements_ok = empty_list_elements_ok;
%! unwind_protect
%!   empty_list_elements_ok = 1;
%!   ## system function for target system
%!   p=[[pr, pr].*exp(1i*pi*[pw, -pw]), ps];
%!   z=[[zr, zr].*exp(1i*pi*[zw, -zw]), zs];
%! unwind_protect_cleanup
%!   empty_list_elements_ok = save_empty_list_elements_ok;
%! end_unwind_protect
%! sys_a = real(poly(p));
%! sys_b = real(poly(z));
%! order = length(p)+length(z);
%!
%! ## simulation
%! n=512;
%! var=0.05;  #var=0;
%! s = [1; sqrt(var)*randn(n-1,1)]; var=(1+var*(n-1))/n;
%! x = filter(sys_b,sys_a,s); % AR system output
%!
%! ## test
%! subplot(211);
%! title("magnitude squared spectral estimate (pyulear)");
%! p = abs(fft(x)).^2;
%! plot(linspace(0,1,n/2),p(1:n/2),';FFT spectrum;');
%! hold on;
%! pyulear(x, order, 'squared');
%! hold off;
%!
%! subplot(212);
%! title("log-magnitude-squared spectral estimate (pyulear)");
%! p = 20*log10(abs(fft(x)));
%! plot(linspace(0,1,n/2),p(1:n/2),';FFT spectrum;');
%! hold on;
%! pyulear(x, order);
%! hold off;
%! oneplot();
