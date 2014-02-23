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

## usage: [n,wp] = ellipord(wp,ws, rp,rs)
##
## Calculate the order for the elliptic filter (discrete)
## wp: Cutoff frequency
## ws: Stopband edge
## rp: decibels of ripple in the passband.
## rs: decibels of ripple in the stopband.
##
## References:
##
## - Lamar, Marcus Vinicius, Notas de aula da disciplina TE 456 - Circuitos
##   Analogicos II, UFPR, 2001/2002.

function [n, Wp] = ellipord(Wp, Ws, Rp, Rs)

  if (nargin != 4)
    print_usage ();
  else
    validate_filter_bands ("ellipord", Wp, Ws);
  endif

  ## sampling frequency of 2 Hz
  T = 2;

  Wpw = tan(pi.*Wp./T); # prewarp
  Wsw = tan(pi.*Ws./T); # prewarp

  ## pass/stop band to low pass filter transform:
  if (length(Wpw)==2 && length(Wsw)==2)
    wp=1;
    w02 = Wpw(1) * Wpw(2);      # Central frequency of stop/pass band (square)
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
    wp=1;
    w02 = Wpw(1) * Wpw(2);
    if (Wsw > Wpw(2))
      w3 = w02/Wsw;
      ws = (Wsw - w3)/(Wpw(2) - Wpw(1));
    else
      w4 = w02/Wsw;
      ws = (w4 - Wsw)/(Wpw(2) - Wpw(1));
    endif
  elseif (Wpw > Wsw)
    wp = Wsw;
    ws = Wpw;
  else
    wp = Wpw;
    ws = Wsw;
  endif

  k=wp/ws;
  k1=sqrt(1-k^2);
  q0=(1/2)*((1-sqrt(k1))/(1+sqrt(k1)));
  q= q0 + 2*q0^5 + 15*q0^9 + 150*q0^13; #(....)
  D=(10^(0.1*Rs)-1)/(10^(0.1*Rp)-1);

  n=ceil(log10(16*D)/log10(1/q));

endfunction
