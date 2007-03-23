## Copyright (C) 2003 Julius O. Smith III
##
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  The GNU
## General Public License has more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; see the file COPYING.  If not, write to the Free
## Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
## 02110-1301, USA.

## -*- texinfo -*-
## @deftypefn {Function File} freqs_plot (@var{w}, @var{h})
## Plot the amplitude and phase of the vector @var{h}.
##
## @end deftypefn

function freqs_plot(w,h)
    n = length(w);
    mag = 20*log10(abs(h));
    phase = unwrap(arg(h));
    maxmag = max(mag);

    subplot(211);
    plot(w, mag, ";Magnitude (dB);");
    title('Frequency response plot by freqs');
    axis("labely");
    ylabel("dB");
    xlabel("");
    grid("on");
    if (maxmag - min(mag) > 100) % make 100 a parameter?
      axis([w(1), w(n), maxmag-100, maxmag]);
    else
      axis("autoy");
    endif

    subplot(212);
    plot(w, phase/(2*pi), ";Phase (radians/2pi);");
    axis("label");
    title("");
    grid("on");
    axis("autoy");
    xlabel("Frequency (rad/sec)");
    ylabel("Cycles");
    axis([w(1), w(n)]);
endfunction
