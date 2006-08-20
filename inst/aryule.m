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


## usage:  [a, v, k] = aryule (x, p)
## 
## fits an AR (p)-model with Yule-Walker estimates.
## x = data vector to estimate
## a: AR coefficients
## v: variance of white noise
## k: reflection coeffients for use in lattice filter 
##
## The power spectrum of the resulting filter can be plotted with
## pyulear(x, p), or you can plot it directly with power(sqrt(v), a).
##
## See also:
## pyulear, power, freqz, impz for measuring the characteristics 
##    of the resulting
## arburg for alternative spectral estimators
##
## Example: Use example from arburg, but substitute aryule for arburg.
##
## Note: Orphanidis '85 claims lattice filters are more tolerant of 
## truncation errors, which is why you might want to use them.  However,
## lacking a lattice filter processor, I haven't tested that the lattice
## filter coefficients are reasonable.


function [a, v, k] = aryule (x, p)

  if (nargin != 2) usage("[a, v, k] = aryule(x,p)"); end

  c = xcorr(x, p+1, 'none');
  c(1:p+1) = [];
  if nargout == 1
    a = levinson(c, p);
  elseif nargout == 2
    [a, v] = levinson(c, p);
  else
    [a, v, k] = levinson(c, p);
  endif
endfunction

%!demo
%! % use demo('pyulear')
