## Copyright (C) 1999 Paul Kienzle
## Copyright (C) 2007 Francesco Potortì
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

## usage: y = filtfilt(b, a, x)
##
## Forward and reverse filter the signal. This corrects for phase
## distortion introduced by a one-pass filter, though it does square the
## magnitude response in the process. That's the theory at least.  In
## practice the phase correction is not perfect, and magnitude response
## is distorted, particularly in the stop band.
####
## Example
##    [b, a]=butter(3, 0.1);                   % 10 Hz low-pass filter
##    t = 0:0.01:1.0;                         % 1 second sample
##    x=sin(2*pi*t*2.3)+0.25*randn(size(t));  % 2.3 Hz sinusoid+noise
##    y = filtfilt(b,a,x); z = filter(b,a,x); % apply filter
##    plot(t,x,';data;',t,y,';filtfilt;',t,z,';filter;')

## Changelog:
## 2000 02 pkienzle@kienzle.powernet.co.uk
##      - pad with zeros to load up the state vector on filter reverse.
##      - add example
## 2007 12 pot@gnu.org
##	- use filtic to compute initial and final states
##      - work for multiple columns as well

## TODO:  (pkienzle) My version seems to have similar quality to matlab,
##	but both are pretty bad.  They do remove gross lag errors, though.


function y = filtfilt(b, a, x)
  if (nargin != 3)
    usage("y=filtfilt(b,a,x)");
  end

  if ((rotate = (rows(x)==1)))	# a row vector
    x = x(:);			# make it a column vector
  endif

  for (c = 1:columns(x))	# filter all columns, one by one
    v = x(:,c);			# a column vector
    ## Compute an approximate final state, use it to compute a
    ## more precise initial state, iterate once.
    sf = filtic(b,a,flipud(v)); # approximate final state
    si = filtic(b,a,flipud(filter(b,a,flipud(v),sf)),v);
    sf = filtic(b,a,flipud(filter(b,a,v,si)),flipud(v));
    si = filtic(b,a,flipud(filter(b,a,flipud(v),sf)),v);
    ## Do forward and reverse filtering
    v = filter(b,a,v,si);		       # forward filter
    y(:,c) = flipud(filter(b,a,flipud(v),sf)); # reverse filter
  endfor

  if (rotate)			# x was a row vector
    y = rot90(y);		# rotate it back
  endif

endfunction
