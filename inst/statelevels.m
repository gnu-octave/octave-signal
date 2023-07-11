## Copyright (C) 2016 Chris Adams <octave@chrisada.co.uk>
##
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {@var{levels} =} statelevels (@var{A})
## @deftypefnx {Function File} {@var{levels} =} statelevels (@var{A}, @var{nbins})
## @deftypefnx {Function File} {@var{levels} =} statelevels (@var{A}, @var{nbins}, @var{method})
## @deftypefnx {Function File} {@var{levels} =} statelevels (@var{A}, @var{nbins}, @var{method}, @var{bounds})
## @deftypefnx {Function File} {[@var{levels}, @var{histograms}] =} statelevels (@dots{})
## @deftypefnx {Function File} {[@var{levels}, @var{histograms}, @var{binlevels}] =} statelevels (@dots{})
## @deftypefnx {Function File} {} statelevels (@dots{})
## Estimate state-level for bilevel waveform @var{A} using histogram method
##
## INPUTS:
##
## @table @var
## @item A
## Bylevel waveform
## @item nbins
## Number of histogram bins (100 default)
## @item method
## State-level estimation method 'mode' (default) or 'mean'.
## @item bounds
## 2 element vector for histogram lower and upper bounds. Values outside of this will be ignored.
## @end table
##
## OUTPUTS:
##
## @table @var
## @item levels
## Levels of high and low states
## @item histograms
## Histogram counts
## @item binlevels
## Histogram bincenters
## @end table
##
## If no outputs are provided, the signal and histogram will be plotted, and display the levels.
##
## @end deftypefn

function varargout = statelevels (A, varargin)

  if nargin == 0 || nargin > 4 || nargout > 3
    print_usage()
  endif

  # Setup arguments based on number of given arguments
  nBins = 100;
  method = 1;

  if nargin > 1
    if !isnumeric (varargin{1})
      error ('statelevels expects a number for argument 2');
    endif
    nBins = varargin{1};
  endif
 
  if nargin > 2
    if !ischar(varargin{2})
      error ("Expected method of 'mode' or 'mean'")
    endif
    if strcmp(varargin{2}, 'mode')
      method = 1;
    elseif strcmp(varargin{2}, 'mean')
      method = 0;  
    else
      error ("Expected method of 'mode' or 'mean'")
    endif
  endif

  # Get size first for various uses
  sz = size(A);
 
  # Row column vector checking
  # Are any of the columns of size one?
  if (sz(1) != 1 && sz(2) != 1) || (sz(1) == 1 && sz(2) == 1)
    error ('statelevels expects a numeric vector for waveform');
  endif

  if !isnumeric(A) || !isreal(A)
    error ('statelevels expects a numeric vector for waveform');
  endif
 
  # Switch to row if it's a column vector
  if sz(2) == 1
    X = A';
  else
    X = A;
  endif

  if nargin > 3
    b = varargin{3};
    if !isnumeric(b) || !isreal(b) || length(b) != 2
      error ('statelevels expects a 2 element numeric vector for bounds');
    endif
    lower = b(1);
    upper = b(2);
    if upper < lower
      error ('Upper bound should be greater than lower bound');
    endif
  else
    upper = max(X)+eps;
    lower = min(X)-eps;
  endif
 
  # Generate hist vector based on the bounds in the histogram
  histVec = lower + ((1:nBins) - 0.5)' * (upper - lower) / nBins;
 
  # Get a histogram
  # Generate indexes for the histogram
  idx = ceil(nBins * (X-lower)/(upper-lower));  

  # Pick only indexes in the range
  idx = idx(idx>=1 & idx<=nBins);

  # Initialise the histogram with zeros
  histogram = zeros(nBins, 1);

  # For every valid index increment the value if it hits
  for i = 1:size (idx,2)
    histogram(idx(i)) = histogram(idx(i)) + 1;
  endfor

  # Find the bounds, lowest non zero and highest
  iLow = 0;
  iHigh = 0;

  for i = 1:nBins
    if histogram(i) > 0
      iLow = i;
      break;
    endif
  endfor

  for i = nBins:-1:1
    if histogram(i) > 0
      iHigh = i;
      break;
    endif
  endfor

  # Define index pairs that define the lower and upper histogram slices.
  # We'll need these later
  lLow  = iLow;
  lHigh = iLow + floor ((iHigh - iLow)/2);
  uLow  = iLow + floor ((iHigh - iLow)/2);
  uHigh = iHigh;

  lHist = histogram(iLow:lHigh, 1);
  uHist = histogram(uLow:uHigh, 1);

  # What's the amplitude, size ratio (see ref)
  dy = (upper-lower) / size (histogram,1);

  # If mode (default)
  if method == 1
    [~, iMax] = max (lHist);
    [~, iMin] = max (uHist);
    S1 = lower + dy * (lLow + iMax(1) - 1.5);
    S2 = lower + dy * (uLow + iMin(1) - 1.5);
  elseif (method==0)
    S1 = lower + dy * dot ((lLow:lHigh)-0.5, lHist) / sum (lHist);
    S2 = lower + dy * dot ((uLow:uHigh)-0.5, uHist) / sum (uHist);
  endif

  varargout{1} = [S1 S2];

  if nargout == 0
    f = figure();
    subplot (2, 1, 1);
    plot(A)
    title('Signal');
    xlabel('Samples');
    ylabel('Level');

    subplot (2, 1, 2);
    plot(histVec, histogram);
    title(sprintf('Histogram of signal levels (%d bins)', nBins));
    xlabel('Level');
    ylabel('Count');
  endif

  if nargout > 1
    varargout{2} = histogram;
  endif

  if nargout > 2
    varargout{3} = histVec;
  endif

endfunction

%! ## test input validation
%!error l = statelevels()
%!error l = statelevels("test")
%!error l = statelevels(1)
%!error l = statelevels([1 2 3], 'test')
%!error l = statelevels([1 2 3], 3, 'test')
%!error l = statelevels([1 2 3], 3, 'mode', 1)
%!error l = statelevels([1 2 3], 3, 'mode', [1 -1])

%!shared X
%! t = linspace(0,2*pi*10,100);
%! X = square(t) + cos(t);

%!test
%! l = statelevels(X);
%! assert(l, [-1.9795 1.9800], 1e5)

%!test
%! [l, h] = statelevels(X);
%! assert(l, [-1.9795 1.9800], 1e5)
%! assert(sum(h), 100)
%! assert(length(h), 100)

%!test
%! [l, h, b] = statelevels(X);
%! assert(l, [-1.9795 1.9800], 1e5)
%! assert(sum(h), 100)
%! assert(length(h), 100)
%! assert(h(1), 4)
%! assert(h(2), 2)
%! assert(h(4), 1)
%! assert(h(11), 0)
%! assert(b(1), -1.9795, 1e5)
%! assert(b(2), -1.9395, 1e5)

%!test
%! [l, h, b] = statelevels(X, 100);
%! assert(l, [-1.9795 1.9800], 1e5)
%! assert(sum(h), 100)
%! assert(length(h), 100)
%! assert(h(1), 4)
%! assert(h(2), 2)
%! assert(h(4), 1)
%! assert(h(11), 0)
%! assert(b(1), -1.9795, 1e5)
%! assert(b(2), -1.9395, 1e5)

%!test
%! [l, h, b] = statelevels(X, 50);
%! assert(l, [-1.9595 1.9600], 1e5)
%! assert(sum(h), 100)
%! assert(length(h), 50)
%! assert(h(1), 6)
%! assert(h(2), 3)
%! assert(h(4), 2)
%! assert(h(11), 1)
%! assert(b(1), -1.9595, 1e5)
%! assert(b(2), -1.8795, 1e5)

%!test
%! [l, h, b] = statelevels(X, 100, 'mode');
%! assert(l, [-1.9795 1.9800], 1e5)
%! assert(sum(h), 100)
%! assert(length(h), 100)
%! assert(h(1), 4)
%! assert(h(2), 2)
%! assert(h(4), 1)
%! assert(h(11), 0)
%! assert(b(1), -1.9795, 1e5)
%! assert(b(2), -1.9395, 1e5)

%!test
%! [l, h, b] = statelevels(X, 100, 'mean');
%! assert(l, [-1.0090 0.9532], 1e5)
%! assert(sum(h), 100)
%! assert(length(h), 100)
%! assert(h(1), 4)
%! assert(h(2), 2)
%! assert(h(4), 1)
%! assert(h(11), 0)
%! assert(b(1), -1.9795, 1e5)
%! assert(b(2), -1.9395, 1e5)

%!test
%! [l, h, b] = statelevels(X, 100, 'mode', [-1.8 1.0]);
%! assert(l, [-1.7860 0.0060], 1e5)
%! assert(sum(h), 64)
%! assert(length(h), 100)
%! assert(h(1), 1)
%! assert(h(2), 1)
%! assert(h(3), 0)
%! assert(b(1), -1.7860, 1e5)
%! assert(b(2), -1.7580, 1e5)

%!demo
%! # Generate test signal
%! t = linspace(0,2*pi*10,100);
%! X = square(t) + cos(t);
%! # plot the waveform and provide the levels
%! statelevels(X)
