## Copyright (C) 2000 Paul Kienzle
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

## usage y=czt(x, m, w, a)
##
## Chirp z-transform.  Compute the frequency response starting at a and
## stepping by w for m steps.  a is a point in the complex plane, and
## w is the ratio between points in each step (i.e., radius increases
## exponentially, and angle increases linearly).
##
## To evaluate the frequency response for the range f1 to f2 in a signal
## with sampling frequency Fs, use the following:
##     m = 32;                          ## number of points desired
##     w = exp(-2i*pi*(f2-f1)/(m*Fs));  ## freq. step of f2-f1/m
##     a = exp(2i*pi*f1/Fs);            ## starting at frequency f1
##     y = czt(x, m, w, a);
##
## If you don't specify them, then the parameters default to a fourier 
## transform:
##     m=length(x), w=exp(2i*pi/m), a=1
## Because it is computed with three FFTs, this will be faster than
## computing the fourier transform directly for large m (which is
## otherwise the best you can do with fft(x,n) for n prime).

## TODO: More testing---particularly when m+N-1 approaches a power of 2
## TODO: Consider treating w,a as f1,f2 expressed in radians if w is real
function y = czt(x, m, w, a)
  if nargin < 1 || nargin > 4, usage("y=czt(x, m, w, a)"); endif
  if nargin < 2 || isempty(m), m = length(x); endif
  if nargin < 3 || isempty(w), w = exp(2i*pi/m); endif
  if nargin < 4 || isempty(a), a = 1; endif

  N = length(x);
  if (columns(x) == 1)
    k = [0:m-1]';
    Nk = [-(N-1):m-2]';
  else
    k = [0:m-1];
    Nk = [-(N-1):m-2];
  endif
  nfft = 2^nextpow2(min(m,N)+length(Nk)-1); 
  Wk2 = w.^(-(Nk.^2)/2);
  AWk2 = (a.^-k) .* (w.^((k.^2)/2));
  y = ifft(fft(postpad(Wk2,nfft)).*fft(postpad(x,nfft).*postpad(AWk2,nfft)));
  y = w.^((k.^2)/2).*y(1+N:m+N);
endfunction
