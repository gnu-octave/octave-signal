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

## usage: window = gaussian(n, width)
##
## Generate an n-point gaussian convolution window of the given
## width as measured in frequency units (sample rate/num samples). 
## Should be f when multiplying in the time domain, but 1/f when 
## multiplying in the frequency domain (for use in convolutions).
function x = gaussian(n, w)

  if nargin != 2
    usage("x = gaussian(n, w)");
  end
  x = exp(-0.5*(([1:n]'-n/2)*w).^2);

endfunction