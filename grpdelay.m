## Copyright (C) 2000 Paul Kienzle
##
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; see the file COPYING.  If not, write to the Free
## Software Foundation, 59 Temple Place - Suite 330, Boston, MA
## 02111-1307, USA.
##
## Based on freqz.m, Copyright (C) 1996, 1997 John W. Eaton

## Compute the group delay of a filter.
##
## [g, w] = grpdelay(b)
##   returns the group delay g of the FIR filter with coefficients b.
##   The response is evaluated at 512 angular frequencies between 0 and
##   pi. w is a vector containing the 512 frequencies.
##
## [g, w] = grpdelay(b,a)
##   returns the group delay of the rational IIR filter whose numerator
##   has coefficients b and denominator coefficients a.
##
## [g, w] = grpdelay(b,a,n)
##   returns the group delay evaluated at n angular frequencies.  For fastest
##   computation n should factor into a small number of small primes.
##
## [g, w] = grpdelay(b,a,n,"whole")
##   evaluates the group delay at n frequencies between 0 and 2*pi.
##
## [g, w] = grpdelay(b,a,n,Fs)
##   evaluates the group delay at n frequencies between 0 and Fs/2.
##
## [g, w] = grpdelay(b,a,n,"whole",Fs)
##   evaluates the group delay at n frequencies between 0 and Fs.
##
## grpdelay(...)
##   plots the group delay vs. frequency.
##
## This computation is unstable since it involves cancellation of very
## small values.  If the denominator becomes too small, the group delay
## is artificially set to 0.  The computation is also unstable since the
## group delay can go to infinity for some filters.  These points are
## set to zero as well so that the graph looks reasonable.
##
## Theory: group delay, g(w) = -d/dw [arg{H(e^jw)}],  is the rate of change of
## phase with respect to frequency.  It can be computed as:
##
##               d/dw H(e^-jw)
##        g(w) = -------------
##                 H(e^-jw)
##
## where
##         H(z) = B(z)/A(z) = sum(b_k z^k)/sum(a_k z^k).
##
## By the quotient rule,
##                    A(z) d/dw B(z) - B(z) d/dw A(z)
##        d/dw H(z) = -------------------------------
##                               A(z) A(z)
## Substituting into the expression above yields:
##                A dB - B dA 
##        g(w) =  ----------- = dB/B - dA/A
##                    A B
##
## Note that,
##        d/dw B(e^-jw) = sum(k b_k e^-jwk)
##        d/dw A(e^-jw) = sum(k a_k e^-jwk)
## which is just the FFT of the coefficients multiplied by a ramp.

## TODO: demo("grpdelay",4) seems wrong.  The delays in the detail plot
## TODO:    are opposite those in the overall plot.
## TODO: combine with freqz since the two are almost identical
## TODO: don't reset graph state before exiting since the user may
## TODO:    want to further decorate the graph.
function [g_r, w_r] = grpdelay(b, a, n, region, Fs)

  if (nargin<1 || nargin>5)
    usage("[g, w]=grpdelay(b [, a [, n [, 'whole' [, Fs]]]])");
  elseif (nargin == 1)
    ## Response of an FIR filter.
    a=[]; n=[]; region=[]; Fs=[];
  elseif (nargin == 2)
    ## Response of an IIR filter
    n=[]; region=[]; Fs=[];
  elseif (nargin == 3)
    region=[]; Fs=[];
  elseif (nargin == 4)
    Fs=[];
    if !isstr(region) && !isempty(region)
      Fs = region; region=[];
    endif
  endif

  if isempty(a) a=1; endif
  if isempty(n) n=512; endif
  if isempty(region) 
    if isreal(b) && isreal(a)
      region = "half"; 
    else
      region = "whole";
    endif
  endif
  if isempty(Fs) 
    if (nargout==0) Fs = 2; else Fs = 2*pi; endif
  endif

  if !is_scalar(n)
    if nargin==4 ## Fs was specified
      w = 2*pi*n/Fs;
    else
      w = n;
    endif
    n = length(n);
    extent = 0;
  elseif (strcmp(region,"whole"))
    w = 2*pi*[0:(n-1)]/n;
    extent = n;
  else
    w = pi*[0:(n-1)]/n;
    extent = 2*n;
  endif

  la = length(a);
  a = reshape(a,1,la);
  lb = length(b);
  b = reshape(b,1,lb);
  k = max([la, lb]);

  if (length(b) == 1 && length(a)>1)
    hb = 1;
    if length(a) == 1
      dhb = zeros(1,n);
    else
      dhb = 0;
    endif
  elseif( extent >= k)
    hb = fft(postpad(b,extent));
    dhb = fft(postpad(b,extent).*[0:extent-1]);
  else
    hb = polyval(postpad(b,k),exp(j*w));
    dhb = polyval(postpad(b,k).*[0:k-1],exp(j*w));
  endif
  if (length(a) == 1)
    ha = a;
    dha = 0;
  elseif( extent >= k)
    ha = fft(postpad(a,extent));
    dha = fft(postpad(a,extent).*[0:extent-1]);
  else
    ha = polyval(postpad(a,k),exp(j*w));
    dha = polyval(postpad(a,k).*[0:k-1],exp(j*w));
  endif

  g = dhb./hb - dha./ha;
  idx = find(abs(hb.*ha)<100*eps); 
  g(idx)=zeros(size(idx));
  w = Fs*w/(2*pi);

  if nargout >= 1 # return values but don't plot
    g_r = g(1:n);
    w_r = w(1:n);
  else            # plot but don't return values
    unwind_protect
      grid;
      xlabel(["Frequency (Fs=", num2str(Fs), ")"]);
      ylabel("Group delay (samples)");
      plot(w(1:n), real(g(1:n)), ";;");
    unwind_protect_cleanup
      grid("off");
      xlabel("");
      ylabel("");
    end_unwind_protect
  endif

endfunction


%!demo
%! subplot(211); 
%! title ("zero at .9");
%! grpdelay (poly (0.9 * exp(1i*pi)));
%! hold on; grid("on"); 
%! stem (1, -9, "bo;target;"); 
%! hold off;
%!
%! subplot(212); axis ([.9, 1.1, -9, 0]); 
%! grpdelay (poly(0.9*exp(1i*pi)),[],[.9:.0001:1.1]*pi);
%! hold on; grid("on"); 
%! stem(1,-9,"bo;target;"); 
%! hold off;
%! axis(); oneplot();
%! %--------------------------------------------------------------
%! % From Oppenheim and Schafer, a single zero of radius r=0.9 at
%! % angle pi should have a group delay of about -9 at 1 and 1/2
%! % at zero and 2*pi.

%!demo
%! grpdelay(poly([1/0.9*exp(1i*pi*0.2), 0.9*exp(1i*pi*0.6)]), ...
%!	    poly([0.9*exp(-1i*pi*0.6), 1/0.9*exp(-1i*pi*0.2)])); grid('on');
%! hold on; stem([0.2, 0.6, 1.4, 1.8], [9, -9, 9, -9],"bo;target;"); hold off;
%! %--------------------------------------------------------------
%! % confirm the group delays approximately meet the targets
%! % don't worry that it is not exact, as I have not entered
%! % the exact targets.

%!test
%! Fs = 8000;
%! [b, a] = cheby1(3, 3, 2*[1000, 3000]/Fs, 'stop');
%! [h, w] = grpdelay(b, a, 256, "half", Fs);
%! [h2, w2] = grpdelay(b, a, 512, "whole", Fs);
%! assert (size(h), size(w));
%! assert (length(h), 256); 
%! assert (size(h2), size(w2));
%! assert (length(h2), 512); 
%! assert (h, h2(1:256));
%! assert (w, w2(1:256));

%!demo
%! Fs = 8000;
%! [b, a] = cheby1(3, 3, 2*[1000, 3000]/Fs, 'stop');
%! grpdelay(b,a,[],Fs);
%! %--------------------------------------------------------------
%! % IIR bandstop filter has delays at [1000, 3000]

%!demo
%! subplot(211);
%! b = fir1(40,0.3);
%! grpdelay(b);
%! subplot(212); axis([0.3, 0.5]);
%! grpdelay(b,[],pi*[.3:.0001:.5]); axis(); oneplot();
%! %--------------------------------------------------------------
%! % fir lowpass order 40 with cutoff at w=0.3 and details of
%! % the transition band [.3, .5]
