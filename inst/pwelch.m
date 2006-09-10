## Copyright (C) 1999-2001 Paul Kienzle
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

## usage: [Pxx, w] = pwelch(x,n,Fs,window,overlap,ci,range,units,trend)
##        [Pxx, Pci, w] = pwelch(x,n,Fs,window,overlap,ci,range,units,trend)
##
## Estimate power spectrum of a stationary signal. This chops the signal
## into overlapping slices, windows each slice and applies a Fourier
## transform to determine the frequency components at that slice. The
## magnitudes of these slices are then averaged to produce the estimate Pxx.
## The confidence interval around the estimate is returned in Pci.
##
## x: vector of samples
## n: size of fourier transform window, or [] for default=256
## Fs: sample rate, or [] for default=2 Hz
## window: shape of the fourier transform window, or [] for default=hanning(n)
##    Note: window length can be specified instead, in which case
##    window=hanning(length)
## overlap: overlap with previous window, or [] for default=length(window)/2
## ci: confidence interval, or [] for default=0.95
##    ci must be between 0 and 1; if ci is not passed, or if it is
##    passed as 0, then no confidence intervals will be computed.
## range: 'whole',  or [] for default='half'
##    show all frequencies, or just half of the frequencies
## units: 'squared', or [] for default='db'
##    show results as magnitude squared or as log magnitude squared
## trend: 'mean', 'linear', or [] for default='none'
##    remove trends from the data slices before computing spectral estimates
##
## Example
##    [b,a] = cheby1(4,3,[0.2, 0.4]);     ## define noise colour
##    pwelch(filter(b,a,randn(2^12,1))); ## estimate noise colour

## 2001-04-02 Paul Kienzle
##    * return nfft/2+1 elements rather than nfft/2 for even nfft.
##    * use more accurate (and faster) computation of confidence intervals

## TODO: Should be extended to accept a vector of frequencies at which to
## TODO:    evaluate the fourier transform (via filterbank or chirp
## TODO:    z-transform).
## TODO: What should happen with the final window when it isn't full?
## TODO:    currently I dump it, but I should probably zero pad and add
## TODO:    it in.
## TODO: Consider returning the whole gamit of Pxx, Pyy, Pxy, Cxy, Txy
## TODO:    as well as confidence intervals for each;  if users tend
## TODO:    only to use one of these don't bother, but if they ever need
## TODO:    more than one, then it's free.  Alternatively, break out the
## TODO:    compute engine into a function that the user can call directly.
## TODO: Check if Cxy, Txy are computed frame-by-frame or on the average
## TODO:    of the frames.  SpcTools and I do it on the average, 
## TODO:    wdkirby@ix.netcom.com (1998-04-29 octave-sources) computes 
## TODO:    them frame-by-frame.
function [varargout] = pwelch(x, varargin)
  ## sort out parameters
  if nargin < 1, 
    usage("[Pxx, w] = pwelch(x,nfft,Fs,window,overlap,pc,range,units,trend)");
  endif

  ## Determine if we are called as pwelch, csd, cohere or tfe
  if ischar(x)
    calledby = x;
  else
    calledby = "pwelch";
  endif
  if !ischar(x)
    ftype = 1;
  elseif strcmp(x, 'csd')
    ftype = 2;
  elseif strcmp(x, 'cohere')
    ftype = 3;
  elseif strcmp(x, 'tfe')
    ftype = 4;
  endif

  ## Sort out x and y vectors
  if ftype!=1 
    x=varargin{1}; y=varargin{2}; 
    first = 3;
  else
    y=[];
    first = 1;
  endif
  if (columns(x) != 1 && rows(x) != 1) || ...
    (!isempty(y) && columns(y) != 1 && rows(y) != 1)
    error ([calledby, " data must be a vector"]);
  end
  x = x(:); y = y(:);
  if !isempty(y) && rows(x)!=rows(y)
    error ([calledby, " x and y vectors must be the same length"]);
  endif

  ## interpret remaining arguments
  trend=nfft=Fs=window=overlap=whole=use_dB=[];
  ci=-1; ## need to do stupid things with ci
  pos=0; ## no positional parameters yet interpreted.
  for i=first:length(varargin)
    arg = varargin{i};
    if ischar(arg), 
      arg=tolower(arg); 
      if strcmp(arg, 'squared')
      	use_dB = 0;
      elseif strcmp(arg, 'db')
	use_dB = 1;
      elseif strcmp(arg, 'whole')
	whole = 1;
      elseif strcmp(arg, 'half')
	whole = 0;
      elseif strcmp(arg, 'none')
      	trend = -1;
      elseif strcmp(arg, 'mean')
      	trend = 0;
      elseif strcmp(arg, 'linear')
      	trend = 1;
      else
      	error([calledby, " doesn't understand '", arg, "'"]);
      endif
    elseif pos == 0
      nfft = arg;
      pos++;
    elseif pos == 1
      Fs = arg;
      pos++;
    elseif pos == 2
      window = arg;
      pos++;
    elseif pos == 3
      overlap = arg;
      pos++;
    elseif pos == 4
      ci = arg;
      pos++;
    else
      error ("pwelch: Too many numerical arguments defined");
    endif
  endfor

  ## Fill in defaults for arguments that aren't specified
  if isempty(nfft), nfft = min(256, length(x)); endif
  if isempty(Fs), Fs = 2; endif
  if isempty(window), window = hanning(nfft); endif
  if isempty(overlap), overlap = length(window)/2; endif
  if isempty(whole), whole = !isreal(x)||(!isempty(y)&&!isreal(y)); endif
  if isempty(trend), trend=-1; endif
  if isempty(use_dB), 
    ## don't default to db for cohere, or for returned values
    use_dB = (ftype!=3 && nargout == 0); 
  endif 
  if isempty(ci), ci=0.95; endif # if ci was not passed in, it would be 0

  ## sort out default confidence intervals
  if (ci < 0) # ci was not passed in
    if nargout > 2
      ci = 0.95;
    else
      ci = 0.0;
    endif
  endif
  if (ftype > 2 && ci > 0)
    error([ calledby, " can't compute confidence intervals" ]);
  elseif (ci < 0 || ci > 1)
    error([ calledby, " confidence interval must be between 0 and 1" ]);
  endif

  ## if only the window length is given, generate hanning window
  if length(window) == 1, window = hanning(window); endif
  if rows(window)==1, window = window.'; endif

  ## Normalize the window
  window = window / norm(window);

  ## compute window offsets
  win_size = length(window);
  if (win_size > nfft)
    nfft = win_size;
    warning (sprintf("%s fft size adjusted to %d", calledby, nfft));
  end
  step = win_size - overlap;

  ## Determine which correlations to compute
  Pxx = Pyy = Pxy = [];
  if ftype!=2, Pxx = zeros(nfft,1); endif # Not needed for csd
  if ftype==3, Pyy = zeros(nfft,1); endif # Only needed for cohere
  if ftype!=1, Pxy = zeros(nfft,1); endif # Not needed for psd

  ## Average the slices
  offset = 1:step:length(x)-win_size+1;
  N = length(offset);
  for i=1:N
    a = x(offset(i):offset(i)+win_size-1);
    if trend>=0, a=detrend(a,trend); endif
    a = fft(postpad(a.*window, nfft));
    if !isempty(Pxx), Pxx = Pxx + a.*conj(a);  endif
    if !isempty(Pxy)
      b = y(offset(i):offset(i)+win_size-1);
      if trend>=0, b=detrend(b,trend); endif
      b = fft(postpad(b.*window, nfft));
      Pxy = Pxy + a .*conj(b);
      if !isempty(Pyy), Pyy = Pyy + b.*conj(b); endif
    endif
  endfor
  if (ftype <= 2)
    ## the factors of N cancel when computing cohere and tfe
    if !isempty(Pxx), Pxx = Pxx / N; endif
    if !isempty(Pxy), Pxy = Pxy / N; endif
    if !isempty(Pyy), Pyy = Pyy / N; endif
  endif

  ## Compute confidence intervals
  if ci > 0, Pci = zeros(nfft,1); endif
  if (ci > 0 && N > 1)
    if ftype>2
      error([calledby, ": internal error -- shouldn't compute Pci"]); 
    end

    ## c.i. = mean +/- dev
    ## dev = z_ci*std/sqrt(n)
    ## std = sqrt(sumsq(P-mean(P))/(N-1))
    ## z_ci = normal_inv( 1-(1-ci)/2 ) = normal_inv( (1+ci)/2 );
    ## normal_inv(x) = sqrt(2) * erfinv(2*x-1)
    ##    => z_ci = sqrt(2)*erfinv(2*(1+ci)/2-1) = sqrt(2)*erfinv(ci)
    for i=1:N
      a=x(offset(i):offset(i)+win_size-1);
      if trend>=0, a=detrend(a,trend); endif
      a=fft(postpad(a.*window, nfft));
      if ftype == 1 # psd
      	P = a.*conj(a) - Pxx;
      	Pci = Pci + P.*conj(P);
      else          # csd
      	b=y(offset(i):offset(i)+win_size-1);
      	if trend>=0, b=detrend(b,trend); endif
      	b=fft(postpad(b.*window, nfft));
      	P = a.*conj(b) - Pxy;
      	Pci = Pci + P.*conj(P);
      endif
    endfor
      
    Pci = ( erfinv(ci) * sqrt( 2/N/(N-1) ) ) * sqrt ( Pci );
  endif

  switch (ftype)
    case 1, # psd
      P = Pxx / Fs;
      if ci > 0, Pci = Pci / Fs; endif
    case 2, # csd
      P = Pxy;
    case 3, # cohere
      P = Pxy.*conj(Pxy)./Pxx./Pyy;
    case 4, # tfe
      P = Pxy./Pxx;
  endswitch

  ## compute confidence intervals
  if ci > 0, Pci = [ P - Pci, P + Pci ]; endif
    
  if use_dB
    P = 10.0*log10(P); 
    if ci > 0, Pci = 10.0*log10(Pci); endif
  endif

  ## extract the positive frequency components
  if whole
    ret_n = nfft;
  elseif rem(nfft,2)==1
    ret_n = (nfft+1)/2;
  else
    ret_n = nfft/2 + 1;
  end
  P = P(1:ret_n, :);
  if ci > 0, Pci = Pci(1:ret_n, :); endif
  f = [0:ret_n-1]*Fs/nfft;

  ## Plot if there is no 
  if nargout==0, 
    unwind_protect
      if Fs==2
      	xlabel("Frequency (rad/pi)");
      else
      	xlabel("Frequency (Hz)");
      endif
      if ftype==1
      	title ("Welch's Spectral Estimate Pxx/Fs");
      	ytext="Power Spectral Density";
      elseif ftype==2
      	title ("Cross Spectral Estimate Pxy");
      	ytext="Cross Spectral Density";
      elseif ftype==3
      	title ("Coherence Function Estimate |Pxy|^2/(PxxPyy)");
      	ytext="Coherence ";
      else
      	title ("Transfer Function Estimate Pxy/Pxx");
      	ytext="Transfer";
      endif
      if use_dB,
      	ylabel(strcat(ytext, " (dB)"));
      else
      	ylabel(ytext);
      endif
      grid("on");
      if ci>0
      	plot(f, [P, Pci], ";;"); 
      else
      	plot(f, P, ";;");
      endif
    unwind_protect_cleanup
      grid("off");
      title("");
      xlabel("");
      ylabel("");
    end_unwind_protect
  endif
	   
  if nargout>=1, varargout{1} = P; endif
  if nargout>=2 && ci>0, varargout{2} = Pci; endif
  if nargout>=2 && ci==0, varargout{2} = f; endif
  if nargout>=3 && ci>0, varargout{3} = f; endif

endfunction

%!demo
%! Fs=8000;
%! [b,a] = cheby1(4,3,2*[500, 1000]/Fs);    ## define spectral envelope
%! s=0.05*randn(2^11,1);                    ## define noise
%! idx=fix(1:Fs/70:length(s))'; 
%! s(idx)=s(idx)+ones(size(idx));           ## add 70 Hz excitation
%! x=filter(b,a,s);                         ## generate signal
%!
%! figure(1); subplot(221); 
%! text(0,0.9,'basic estimate','Units','Normalized'); 
%! pwelch(x',[],Fs); text;   # slip in a test for row vs. column vector
%! subplot(222); 
%! text(0,0.9,'nfft=1024 instead of 256','Units','Normalized'); 
%! pwelch(x,1024); text;
%! subplot(223); 
%! text(0,0.9,'boxcar instead of hanning','Units','Normalized');
%! pwelch(x,[],[],boxcar(256)); text;
%! subplot(224); 
%! text(0,0.9,'no overlap','Units','Normalized'); 
%! pwelch(x,[],[],[],0); text;
%!
%! figure(2); subplot(121);
%! text(0,0.9,'magnitude units, whole range','Units','Normalized'); 
%! pwelch(x,'whole','squared'); text;
%! subplot(122);
%! text(0,0.9,'90% confidence intervals','Units','Normalized'); 
%! pwelch(x,[],[],[],[],0.9); text;
%! oneplot();
%! %----------------------------------------------------------
%! % plots should show a chebyshev bandpass filter shape
