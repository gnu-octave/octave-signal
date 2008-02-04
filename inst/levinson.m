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
## along with this program; If not, see <http://www.gnu.org/licenses/>.
##
## Based on:
##    yulewalker.m
##    Copyright (C) 1995 Friedrich Leisch <Friedrich.Leisch@ci.tuwien.ac.at>
##    GPL license

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
   
## Author:  Paul Kienzle <pkienzle@users.sf.net>

## TODO: Matlab doesn't return reflection coefficients and 
## TODO:    errors in addition to the polynomial a.
## TODO: What is the difference between aryule, levinson, 
## TODO:    ac2poly, ac2ar, lpc, etc.?
  
## Changes (Peter Lanspeary, 6 Nov 2006):
##  Add input sanitising;
##  avoid using ' (conjugate transpose) to force a column vector;
##  take direct solution from Kay & Marple Eqn (2.39), code is now same
##        as the theory;
##  take Durbin-Levinson recursion from Kay & Marple Eqns (2.42-2.46),
##        now works for complex data, code is now same as the theory;
##  force real variance (get rid of imaginary part due to rounding error);
##
## REFERENCE
## [1] Steven M. Kay and Stanley Lawrence Marple Jr.:
##   "Spectrum analysis -- a modern perspective",
##   Proceedings of the IEEE, Vol 69, pp 1380-1419, Nov., 1981

function [a, v, ref] = levinson (acf, p)
if ( nargin<1 )
  error( 'usage: [a,v,ref]=levinson(acf,p)\n', 1);
elseif( ~isvector(acf) || length(acf)<2 )
  error( 'levinson: arg 1 (acf) must be vector of length >1\n', 1);
elseif ( nargin>1 && ( ~isscalar(p) || fix(p)~=p || p>length(acf)-2 ) )
  error( 'aryule: arg 2 (p) must be integer >0 and <length(acf)-1\n', 1);
else
  if (nargin == 1) p = length(acf) - 1; endif
  if( columns(acf)>1 ) acf=acf(:); endif      # force a column vector

  if nargout < 3 && p < 100
    ## direct solution [O(p^3), but no loops so slightly faster for small p]
    ##   Kay & Marple Eqn (2.39)
    R = toeplitz(acf(1:p), conj(acf(1:p)));
    a = R \ -acf(2:p+1);
    a = [ 1, a.' ];
    v = real( a*conj(acf(1:p+1)) );
  else
    ## durbin-levinson [O(p^2), so significantly faster for large p]
    ##   Kay & Marple Eqns (2.42-2.46)
    ref = zeros(p,1);
    g = -acf(2)/acf(1);
    a = [ g ];
    v = real( ( 1 - g*conj(g)) * acf(1) );
    ref(1) = g;
    for t = 2 : p
      g = -(acf(t+1) + a * acf(t:-1:2)) / v;
      a = [ a+g*conj(a(t-1:-1:1)), g ];
      v = v * ( 1 - real(g*conj(g)) ) ;
      ref(t) = g;
    endfor
    a = [1, a];
  endif
endif    
endfunction
