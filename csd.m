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

## usage: [Pxy, w] = csd(x, y, ...)
##        [Pxy, Pci, w] = csd(x, y, ...)
##
## Estimate cross spectrum density of a pair of signals. This chops the 
## signals into overlapping slices, windows each slice and applies a Fourier
## transform to determine the frequency components at that slice. The
## magnitudes of these slices are then averaged to produce the estimate Pxy.
## The confidence interval around the estimate is returned in Pci.
##
## See pwelch for an explanation of the available parameters.
##
## See also: tfe, cohere

function [...] = csd(...)
  if nargin < 2
    usage("Pxy=csd(x,y,...)  [see pwelch for details]"); 
  endif
  if nargout==0, 
    pwelch('csd',all_va_args);
  elseif nargout==1
    Pxy=pwelch('csd',all_va_args);
    vr_val(Pxy);
  elseif nargout==2
    [Pxy, w]=pwelch('csd',all_va_args);
    vr_val(Pxy);
    vr_val(w);
  else
    [Pxy, Pci, w]=pwelch('csd',all_va_args);
    vr_val(Pxx);
    vr_val(Pci);
    vr_val(w);
  endif
endfunction
