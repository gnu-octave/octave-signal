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
## References: 
##
## Oppenheim, Alan V., Discrete Time Signal Processing, Hardcover, 1999.
## Author: p_neis@yahoo.com.br

## usage: [Zz, Zp, Zg] = nellip(Rp, Rs, Wp, Ws, stype)
##
## Gera um filtro Eliptico ou Cauer.
## Generate an Elliptic or Cauer filter.
## 
##[b,a] = nellip(Rp, Rs, Wp, Ws)
##  passa-baixas com frequencia de corte pi*Wp, largura da banda de transicao Ws-Wp, Rp decibeis de "ripple" na banda de passagem e banda de rejeicao Rs decibeis abaixo.
##  low pass filter with cutoff pi*Wp radians, transition band Ws-Wp wide, Rp decibels of ripple in the passband and a stopband Rs decibels down.
##
## [b,a] = nellip(Rp, Rs, Wp, Ws, 'high')
##  passa-altas com freq. de corte pi*Wp, banda de transicao Ws-Wp ...
##  high pass filter with cutoff pi*Wp, transition band Ws-Wp ...
##
## [b,a] = nellip(Rp, Rs, [Wl, Wh], [Wlr, Whr])
##  passa-bandas com bordas da banda de passagem pi*Wl e pi*Wh, inicio das bandas de rejeicao em pi*Wlr e pi*Whr (Wlr < Wl < Wh < Whr) ...
##  band pass filter with band pass edges pi*Wl and pi*Wh, stop band edges pi*Wlr and pi*Whr (Wlr < Wl < Wh < Whr) ...
##
## [b,a] = nellip(Rp, Rs, [Wl, Wh], [Wlr Whr], 'stop')
##  rejeita-bandas com bordas pi*Wl e pi*Wh, ...
##  band reject filter with edges pi*Wl and pi*Wh, ...
##
## [z,p,g] = nellip(...)
##  retorna o filtro na forma zero-polo-ganho.
##  return filter as zero-pole-gain.
function [Zz, Zp, Zg] = nellip(Rp, Rs, Wp, Ws, stype)

if (nargin>5 || nargin<4) || (nargout>3 || nargout<2)
	usage ("[b, a] or [z, p, g] = nellip (Rp, Rs, Wp, Ws,  [, 'ftype'])");
end

stop = nargin==5;
if stop && !(strcmp(stype, 'high') || strcmp(stype, 'stop'))
	error ("nellip: ftype must be 'high' or 'stop'");
end

[rp, cp]=size(Wp);
[rs, cs]=size(Ws);
if ( !(length(Wp)<=2 && (rp==1 || cp==1) && length(Ws)<=2 && (rs==1 || cs==1)) )
	error ("nellip: frequency must be given as w0 or [w0, w1]");
elseif (!all(Wp >= 0 & Wp <= 1 & Ws >= 0 & Ws <= 1)) #####
	error ("nellip: critical frequencies must be in (0 1)");
elseif (!(length(Wp)==1 || length(Wp) == 2 & length(Ws)==1 || length(Ws) == 2))
	error ("nellip: only one filter band allowed");
elseif (length(Wp)==2 && !(Wp(1) < Wp(2)))
	error ("nellip: first band edge must be smaller than second");
elseif (length(Ws)==2 && !(length(Wp)==2))
	error ("nellip: you must specify band pass borders.");
elseif (length(Wp)==2 && length(Ws)==2 && !(Ws(1) < Wp(1) && Ws(2) > Wp(2)) )
	error ("nellip: ( Wp(1), Wp(2) ) must be inside of interval ( Ws(1), Ws(2) )");
elseif (length(Wp)==2 && length(Ws)==1 && !(Ws < Wp(1) || Ws > Wp(2)) )
	error ("nellip: Ws must be out of interval ( Wp(1), Wp(2) )");
endif

##Pré-distorção das frequências digitais 
##Prewarp the digital frequencies
T = 2;       		# sampling frequency of 2 Hz
Wpw = 2/T*tan(pi*Wp/T);
Wsw = 2/T*tan(pi*Ws/T);

##Obter as freqências normalizadas para o protótipo do filtro (wp = 1)
##Obtain the normalized frequencies for the filter prototype (wp = 1)
wp=1;
if (length(Wpw)==1 && length(Wsw)==1)
	ws=Wsw/Wpw;
endif

##Transformação do filtro passa/rejeita faixas em passa baixas:
##pass/stop band to low pass filter transform:
if (length(Wpw)==2 && length(Wsw)==2)
	w02 = Wpw(1) * Wpw(2);	# Central frequency of stop/pass band (square)
	w3 = w02/Wsw(2);
	w4 = w02/Wsw(1);
	if (w3 > Wsw(1))
		ws = (Wsw(2)-w3)/(Wpw(2)-Wpw(1));
	elseif (w4 < Wsw(2))
		ws = (w4-Wsw(1))/(Wpw(2)-Wpw(1));
	else
		ws = (Wsw(2)-Wsw(1))/(Wpw(2)-Wpw(1));
	endif
elseif (length(Wpw)==2 && length(Wsw)==1)
	w02 = Wpw(1) * Wpw(2);
	if (Wsw > Wpw(2))
	w3 = w02/Wsw;
	ws = (Wsw - w3)/(Wpw(2) - Wpw(1));
	else
	w4 = w02/Wsw;
	ws = (w4 - Wsw)/(Wpw(2) - Wpw(1));
	endif
endif


##Gerar os pólos, zeros e ganho, no plano-s
##Generate s-plane poles, zeros and gain
ws
[zer, pol, gain] = ncauer(Rp, Rs, ws);

  ## splane frequency transform
  [Sz, Sp, Sg] = sftrans(zer, pol, gain, Wpw, stop);

  ## Use bilinear transform to convert poles to the z plane
  [Zz, Zp, Zg] = bilinear(Sz, Sp, Sg, T);

  if nargout==2, [Zz, Zp] = zp2tf(Zz, Zp, Zg); endif

endfunction

