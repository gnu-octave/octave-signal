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

## usage: ws = __ellip_ws(n, rp, rs)
##
##Function used by nellip()/ncauer().
##Calculate the stop band edge for the Cauer filter.
##
## References: 
##
## - Serra, Celso Penteado, Teoria e Projeto de Filtros, Campinas: CARTGRAF, 
##   1983.
## Author: p_neis@yahoo.com.br

function ws=__ellip_ws(n, rp, rs)
##
##
kl0=((10^(0.1*rp)-1)/(10^(0.1*rs)-1));
k0=(1-kl0);
int=ellipke([kl0 ; k0]);
ql0=int(1);
q0=int(2);
x=n*ql0/q0;
kl=fminbnd('__ellip_ws_min',eps, 1-eps, [], x);
ws=sqrt(1/kl);

endfunction
