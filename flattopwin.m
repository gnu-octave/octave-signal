## flattopwin(n, [periodic|symmetric])
##
## Return the window f(w):
##
##   f(w) = 1 - 1.93 cos(2 pi w) + 1.29 cos(4 pi w)
##            - 0.388 cos(6 pi w) + 0.0322cos(8 pi w)
##
## where w = i/(n-1) for i=0:n-1 for a symmetric window, or
## w = i/n for i=0:n-1 for a periodic window.  The default
## is symmetric.  The returned window is normalized to a peak
## of 1 at w = 0.5.
##
## This window has low pass-band ripple, but high bandwidth.
##
## According to [1]:
##
##    The main use for the Flat Top window is for calibration, due
##    to its negligible amplitude errors.
##
## [1] Gade, S; Herlufsen, H; (1987) "Use of weighting functions in DFT/FFT
## analysis (Part I)", Bruel & Kjaer Technical Review No.3.

## This program is public domain.

function w = flattopwin(n,sym)
  if nargin == 0 || nargin > 2
    usage("flattopwin(n, [periodic|symmetric])"); 
  endif

  divisor = n-1;
  if nargin > 1
    match = strmatch(sym,['periodic';'symmetric']);
    if isempty(match),
      error("window type must be periodic or symmetric");
    elseif match == 1
      divisor = n;
    else
      divisor = n-1;
    endif
  endif
    
  x = 2*pi*[0:n-1]'/divisor;
  w = (1-1.93*cos(x)+1.29*cos(2*x)-0.388*cos(3*x)+0.0322*cos(4*x))/4.6402;
