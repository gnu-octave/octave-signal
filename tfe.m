## Copyright (C) 2000 Paul Kienzle.
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

## usage: [Txy, w] = tfe(x, y, ...)
##
## Estimate transfer function from input signal x to output signal y.
## This is simply Txy = Pxy/Pxx.
##
## See pwelch for an explanation of the available parameters.
##
## See also: csd, cohere

function [varargout] = tfe(varargin)
  if nargin < 2
    usage("Pxy=tfe(x,y,...)  [see pwelch for details]"); 
  endif
  if nargout==0, 
    pwelch('tfe',varargin{:});
  elseif nargout==1
    Txy=pwelch('tfe',varargin{:});
    varargout{1} = Txy;
  elseif nargout==2
    [Txy, w]=pwelch('tfe',varargin{:});
    varargout{1} = Txy;
    varargout{2} = w;
  endif
endfunction
