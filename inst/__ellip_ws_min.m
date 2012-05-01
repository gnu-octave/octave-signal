## Copyright (C) 2001 Paulo Neis <p_neis@yahoo.com.br>
##
## This program is free software; you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation; either version 3 of the License, or (at your option) any later
## version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details.
##
## You should have received a copy of the GNU General Public License along with
## this program; if not, see <http://www.gnu.org/licenses/>.

## usage: err = __ellip_ws_min(kl, x)
##
## Function used by nellip()/ncauer().
##
## References: 
##
## - Serra, Celso Penteado, Teoria e Projeto de Filtros, Campinas: CARTGRAF, 
##   1983.

function err=__ellip_ws_min(kl, x)

  int=ellipke([kl; 1-kl]);
  ql=int(1);
  q=int(2);
  err=abs((ql/q)-x);

endfunction
