## Author: Paul Kienzle <pkienzle@users.sf.net> (2004)
## This program is granted to the public domain.

## -*- texinfo -*-
## @deftypefn  {Function File} {} flattopwin (@var{m})
## @deftypefnx {Function File} {} flattopwin (@var{m}, "symmetric")
## @deftypefnx {Function File} {} flattopwin (@var{m}, "periodic")
##
## Return the window f(w):
##
## @example
## @group
##   f(w) = 1 - 1.93 cos(2 pi w) + 1.29 cos(4 pi w)
##            - 0.388 cos(6 pi w) + 0.0322cos(8 pi w)
## @end group
## @end example
##
## where w = i/(m-1) for i=0:m-1 for a symmetric window, or
## w = i/m for i=0:m-1 for a periodic window.  The default
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
## @end deftypefn

function w = flattopwin (m, sym)

  if nargin == 0 || nargin > 2
    print_usage;
  endif

  divisor = m-1;
  if nargin > 1
    match = strmatch(sym,['periodic';'symmetric']);
    if isempty(match),
      error("window type must be periodic or symmetric");
    elseif match == 1
      divisor = m;
    else
      divisor = m-1;
    endif
  endif

  if (m == 1)
    w = 1;
  else
    x = 2*pi*[0:m-1]'/divisor;
    w = (1-1.93*cos(x)+1.29*cos(2*x)-0.388*cos(3*x)+0.0322*cos(4*x))/4.6402;
  endif

endfunction
