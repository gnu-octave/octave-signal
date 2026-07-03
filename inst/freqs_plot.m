## Copyright (C) 2003 Julius O. Smith III <jos@ccrma.stanford.edu>
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; see the file COPYING. If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} {} freqs_plot (@var{w}, @var{h})
## @deftypefnx {Function File} {} freqs_plot (@var{w}, @var{h}, @var{freqscale})
## Plot the amplitude and phase of the vector @var{h}.
##
## The optional argument @var{freqscale} specifies the scaling of the
## frequency axis.  It can be @qcode{"log"} (default) or @qcode{"linear"}.
## @seealso{freqs}
## @end deftypefn

function freqs_plot(w, h, freqscale)

  if (nargin < 2 || nargin > 3)
    print_usage ();
  endif

  if (nargin < 3)
    freqscale = "log";
  endif

  n = length(w);
  mag = 20*log10(abs(h));
  phase = unwrap(arg(h));
  maxmag = max(mag);

  switch (freqscale)
    case "log"
      ## Kick out zero frequencies (can't plot on log scale)
      idx = (w > 0);
      w = w(idx);
      mag = mag(idx);
      phase = phase(idx);

      subplot(211);
      semilogx(w, mag);
      xlim([w(1), w(end)]);
      grid("on");
      ylabel("Magnitude (dB)");
      title("Frequency Response");

      subplot(212);
      semilogx(w, phase*180/pi);
      xlim([w(1), w(end)]);
      grid("on");
      xlabel("Frequency (rad/s)");
      ylabel("Phase (degrees)");

    case "linear"
      ## Original style with linear frequency axis
      subplot(211);
      plot(w, mag, ";Magnitude (dB);");
      title('Frequency response plot by freqs');
      axis("labely");
      ylabel("dB");
      xlabel("");
      grid("on");
      if (maxmag - min(mag) > 100) # make 100 a parameter?
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

    otherwise
      error('freqs_plot: FREQSCALE must be "log" or "linear"');
  endswitch

endfunction
