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

## usage:  [P, w] = __power (b, a, [, nfft [, Fs]] [, range] [, units])
## 
## Plot the power spectrum of the given filter.
##
## b, a: filter coefficients (b=numerator, a=denominator)
## nfft is number of points at which to sample the power spectrum
## Fs is the sampling frequency of x
## range is 'half' (default) or 'whole'
## units is  'squared' or 'db' (default)
## range and units may be specified any time after the filter, in either
## order
##
## Returns P, the magnitude vector, and w, the frequencies at which it
## is sampled.  If there are no return values requested, then plot the power
## spectrum and don't return anything.

## TODO: consider folding this into freqz --- just one more parameter to
## TODO:    distinguish between 'linear', 'log', 'logsquared' and 'squared'

function [varargou] = __power (b, a, varargin)
  usagestr = "[P w] = __power(b, a [,nfft [,Fs]] [,range] [, units])";
  if (nargin < 2 || nargin > 6) usage(usagestr); endif

  nfft = [];
  Fs = [];
  range = [];
  units = [];

  pos = 0;
  for i=1:length(varargin)
    arg = varargin{i};
    if strcmp(arg, 'squared') || strcmp(arg, 'db')
      units = arg;
    elseif strcmp(arg, 'whole') || strcmp(arg, 'half')
      range = arg;
    elseif isstr(arg)
      usage(usagestr);
    elseif pos == 0
      nfft = arg;
      pos++;
    elseif pos == 1
      Fs = arg;
      pos++;
    else
      usage(usagestr);
    endif
  endfor
  
  if isempty(nfft); nfft = 256; endif
  if isempty(Fs); Fs = 2; endif
  if isempty(range) range = 'half'; endif
  
  [P, w] = freqz(b, a, nfft, range, Fs);

  if strcmp(units, 'squared') 
    P = abs(P).^2;
  else
    P = 20.0*log10(abs(P));
  endif

  if nargout == 0, plot(w, P, ";;"); endif
  if nargout >= 1, varargout{1} = P; endif
  if nargout >= 2, varargout{2} = w; endif

endfunction

