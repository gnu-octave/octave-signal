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

## usage: [Cxy, w] = cohere(x, y, ...)
##
## Estimate coherence between two signals.
## This is simply Cxy = |Pxy|^2/(PxxPxy).
##
## See pwelch for an explanation of the available parameters.

function [...] = cohere(...)
  if nargin < 2
    usage("Cxy=cohere(x,y,...)  [see pwelch for details]"); 
  endif
  if nargout==0, 
    pwelch('cohere',all_va_args);
  elseif nargout==1
    Cxy=pwelch('cohere',all_va_args);
    vr_val(Cxy);
  elseif nargout==2
    [Cxy, w]=pwelch('cohere',all_va_args);
    vr_val(Cxy);
    vr_val(w);
  endif
endfunction
