## Copyright (C) 2001 Paulo Neis
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

## N-ellip 0.2.1
##usage: [Zz, Zp, Zg] = ellip(n, Rp, Rs, Wp, stype)
##
## Generate an Elliptic or Cauer filter (discrete).
## 
## [b,a] = ellip(n, Rp, Rs, Wp)
##  low pass filter with order n, cutoff pi*Wp radians, Rp decibels of ripple in the passband and a stopband Rs decibels down.
##
## [b,a] = ellip(n, Rp, Rs, Wp, 'high')
##  high pass filter with cutoff pi*Wp...
##
## [b,a] = ellip(n, Rp, Rs, [Wl, Wh])
##  band pass filter with band pass edges pi*Wl and pi*Wh ...
##
## [b,a] = ellip(n, Rp, Rs, [Wl, Wh], 'stop')
##  band reject filter with edges pi*Wl and pi*Wh, ...
##
## [z,p,g] = ellip(...)
##  return filter as zero-pole-gain.
## References: 
##
## - Oppenheim, Alan V., Discrete Time Signal Processing, Hardcover, 1999.
## - Parente Ribeiro, E., Notas de aula da disciplina TE498 -  Processamento 
##   Digital de Sinais, UFPR, 2001/2002.
## - Kienzle, Paul, functions from Octave-Forge, 1999 (http://octave.sf.net).
##
## Author: p_neis@yahoo.com.br

function [Zz, Zp, Zg] = ellip(n, Rp, Rs, Wp, stype)

if (nargin>5 || nargin<4) || (nargout>3 || nargout<2)
	usage ("[b, a] or [z, p, g] = ellip (n, Rp, Rs, Wp, [, 'ftype'])");
end

## interpret the input parameters
if (!(length(n)==1 && n == round(n) && n > 0))
	error ("butter: filter order n must be a positive integer");
end

stop = nargin==5;
if stop && !(strcmp(stype, 'high') || strcmp(stype, 'stop'))
	error ("ellip: ftype must be 'high' or 'stop'");
end

[rp, cp]=size(Wp);

if ( !( length(Wp)<=2 && (rp==1 || cp==1) ) )
	error ("ellip: frequency must be given as w0 or [w0, w1]");
elseif ( !all( Wp >= 0 & Wp <= 1 ) )
	error ("ellip: critical frequencies must be in (0 1)");
elseif ( !( length(Wp)==1 || length(Wp) == 2 ) )
	error ("ellip: only one filter band allowed");
elseif ( length(Wp)==2 && !( Wp(1) < Wp(2 ) ) )
	error ("ellip: first band edge must be smaller than second");
endif

##Prewarp the digital frequencies
T = 2;       		# sampling frequency of 2 Hz
Wpw = tan(pi*Wp/T);


##Generate s-plane poles, zeros and gain
[zer, pol, gain] = ncauer(Rp, Rs, n);

## splane frequency transform
[Sz, Sp, Sg] = sftrans(zer, pol, gain, Wpw, stop);

## Use bilinear transform to convert poles to the z plane
[Zz, Zp, Zg] = bilinear(Sz, Sp, Sg, T);

if nargout==2,
	Zz = real(Zg*poly(Zz));
	Zp = real(poly(Zp));
endif

endfunction

