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
##
## Based on:
##    yulewalker.m
##    Copyright (C) 1995 (GPL)
##    Friedrich Leisch <Friedrich.Leisch@ci.tuwien.ac.at>

## usage:  [a, v, ref] = levinson (acf [, p])
##
## Use the Durbin-Levinson algorithm to solve:
##    toeplitz(acf(1:p)) * x = -acf(2:p+1).
## The solution [1, x'] is the denominator of an all pole filter
## approximation to the signal x which generated the autocorrelation
## function acf.  
##
## acf is the autocorrelation function for lags 0 to p.
## p defaults to length(acf)-1.
## Returns 
##   a=[1, x'] the denominator filter coefficients. 
##   v= variance of the white noise = square of the numerator constant
##   ref = reflection coefficients = coefficients of the lattice
##         implementation of the filter
## Use freqz(sqrt(v),a) to plot the power spectrum.
   
## Author:  PAK <pkienzle@kienzle.powernet.co.uk>

## TODO: Matlab doesn't return reflection coefficients and 
## TODO:    errors in addition to the polynomial a.
## TODO: What is the difference between aryule, levinson, 
## TODO:    ac2poly, ac2ar, lpc, etc.?
  
function [a, v, ref] = levinson (acf, p)
  
  if( columns (acf) > 1 ) acf=acf'; endif
  if (nargin == 1) p = length(acf) - 1; endif

  if nargout < 3 && p < 100
    ## direct solution [O(p^3), but no loops so slightly faster for small p]
    R = toeplitz(acf(1:p), conj(acf(1:p)));
    a = R \ -acf(2:p+1);
    a = [ 1, a' ];
    v = sum(a'.*acf(1:p+1));
  else
    ## durbin-levinson [O(p^2), so significantly faster for large p]
    ref = zeros (1, p);
    g = acf(2) / acf(1);
    a = [ g ];
    v = ( 1 - g^2 ) * acf(1);
    ref(1) = g;
    for t = 2 : p
      g = (acf(t+1) - a * acf(2:t)) / v;
      a = [ g,  a-g*a(t-1:-1:1) ];
      v = v * ( 1 - g^2 ) ;
      ref(t) = g;
    endfor
    a = [1, -a(p:-1:1)];
  endif
    
endfunction
