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
## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA


## usage: [c, lag] = xcov (X [, Y] [, maxlag] [, scale])
##
## Compute covariance at various lags [=correlation(x-mean(x),y-mean(y))].
##
## X: input vector
## Y: if specified, compute cross-covariance between X and Y,
## otherwise compute autocovariance of X.
## maxlag: is specified, use lag range [-maxlag:maxlag], 
## otherwise use range [-n+1:n-1].
## Scale:
##    'biased'   for covariance=raw/N, 
##    'unbiased' for covariance=raw/(N-|lag|), 
##    'coeff'    for covariance=raw/(covariance at lag 0),
##    'none'     for covariance=raw
## 'none' is the default.
##
## Returns the covariance for each lag in the range, plus an 
## optional vector of lags.

## 2001-10-30 Paul Kienzle <pkienzle@users.sf.net>
##     - fix arg parsing for 3 args

function [retval, lags] = xcov (X, Y, maxlag, scale)

  if (nargin < 1 || nargin > 4)
    usage ("[c, lags] = xcov(x [, y] [, h] [, scale])");
  endif

  if nargin==1
    Y=[]; maxlag=[]; scale=[];
  elseif nargin==2
    maxlag=[]; scale=[];
    if ischar(Y), scale=Y; Y=[];
    elseif isscalar(Y), maxlag=Y; Y=[];
    endif
  elseif nargin==3
    scale=[];
    if ischar(maxlag), scale=maxlag; maxlag=[]; endif
    if isscalar(Y), maxlag=Y; Y=[]; endif
  endif

  ## XXX FIXME XXX --- should let center(Y) deal with []
  ## [retval, lags] = xcorr(center(X), center(Y), maxlag, scale);
  if (!isempty(Y))
    [retval, lags] = xcorr(center(X), center(Y), maxlag, scale);
  else
    [retval, lags] = xcorr(center(X), maxlag, scale);
  endif
  
endfunction
