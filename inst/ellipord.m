## Copyright (C) 2001 Paulo Neis
## Copyright (C) 2018 Charles Praplan
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
## @deftypefn  {Function File} {@var{n} =} ellipord (@var{wp}, @var{ws}, @var{rp}, @var{rs})
## @deftypefnx {Function File} {@var{n} =} ellipord ([@var{wp1}, @var{wp2}], [@var{ws1}, @var{ws2}], @var{rp}, @var{rs})
## @deftypefnx {Function File} {@var{n} =} ellipord ([@var{wp1}, @var{wp2}], [@var{ws1}, @var{ws2}], @var{rp}, @var{rs}, "s")
## @deftypefnx {Function File} {[@var{n}, @var{wc}] =} ellipord (@dots{})
## Compute the minimum filter order of an elliptic filter with the desired
## response characteristics.  The filter frequency band edges are specified
## by the passband frequency @var{wp} and stopband frequency @var{ws}.
## Frequencies are normalized to the Nyquist frequency in the range [0,1].
## @var{rp} is the allowable passband ripple measured in decibels, and @var{rs}
## is the minimum attenuation in the stop band, also in decibels.  The output
## arguments @var{n} and @var{wc} can be given as inputs to @code{ellip}.
##
## If @var{wp} and @var{ws} are scalars, then @var{wp} is the passband cutoff
## frequency and @var{ws} is the stopband edge frequency.  If @var{ws} is
## greater than @var{wp}, the filter is a low-pass filter.  If @var{wp} is
## greater than @var{ws}, the filter is a high-pass filter.
##
## If @var{wp} and @var{ws} are vectors of length 2, then @var{wp} defines the
## passband interval and @var{ws} defines the stopband interval.  If @var{wp}
## is contained within @var{ws} (@var{ws1} < @var{wp1} < @var{wp2} < @var{ws2}),
## the filter is a band-pass filter.  If @var{ws} is contained within @var{wp}
## (@var{wp1} < @var{ws1} < @var{ws2} < @var{wp2}), the filter is a band-stop
## or band-reject filter.
##
## If the optional argument @code{"s"} is given, the minimum order for an analog
## elliptic filter is computed.  All frequencies @var{wp} and @var{ws} are
## specified in radians per second.
##
## Reference: Lamar, Marcus Vinicius, @cite{Notas de aula da disciplina TE 456 -
## Circuitos Analogicos II}, UFPR, 2001/2002.
## @seealso{buttord, cheb1ord, cheb2ord, ellip}
## @end deftypefn

function [n, Wp] = ellipord (Wp, Ws, Rp, Rs, opt)

  if (nargin < 4 || nargin > 5)
    print_usage ();
  elseif (nargin == 5 && ! strcmp (opt, "s"))
    error ("ellipord: OPT must be the string \"s\"");
  endif

  if (nargin == 5 && strcmp (opt, "s"))
    s_domain = true;
  else
    s_domain = false;
  endif

  if (s_domain)
    validate_filter_bands ("ellipord", Wp, Ws, "s");
  else
    validate_filter_bands ("ellipord", Wp, Ws);
  endif

  if (s_domain)
    # No prewarp in case of analog filter
    Wpw = Wp;
    Wsw = Ws;
  else
    ## sampling frequency of 2 Hz
    T = 2;

    Wpw = (2 / T) .* tan (pi .* Wp ./ T);     # prewarp
    Wsw = (2 / T) .* tan (pi .* Ws ./ T);     # prewarp
  endif

  ## pass/stop band to low pass filter transform:
  if (length (Wpw) == 2 && length (Wsw) == 2)

    ## Band-pass filter
    if (Wpw(1) > Wsw(1))

      ## Modify band edges if not symmetrical.  For a band-pass filter,
      ## the lower or upper stopband limit is moved, resulting in a smaller
      ## stopband than the caller requested.
      if ((Wpw(1) * Wpw(2)) < (Wsw(1) * Wsw(2)))
        Wsw(2) = Wpw(1) * Wpw(2) / Wsw(1);
      else
        Wsw(1) = Wpw(1) * Wpw(2) / Wsw(2);
      endif

      wp = Wpw(2) - Wpw(1);
      ws = Wsw(2) - Wsw(1);

    ## Band-stop / band-reject / notch filter
    else

      ## Modify band edges if not symmetrical.  For a band-stop filter,
      ## the lower or upper passband limit is moved, resulting in a smaller
      ## rejection band than the caller requested.
      if ((Wpw(1) * Wpw(2)) > (Wsw(1) * Wsw(2)))
        Wpw(2) = Wsw(1) * Wsw(2) / Wpw(1);
      else
        Wpw(1) = Wsw(1) * Wsw(2) / Wpw(2);
      endif

      w02 = Wpw(1) * Wpw(2);
      wp = w02 / (Wpw(2) - Wpw(1));
      ws = w02 / (Wsw(2) - Wsw(1));

    endif
    ws = ws / wp;
    wp = 1;

  ## High-pass filter
  elseif (Wpw > Wsw)
    wp = Wsw;
    ws = Wpw;

  ## Low-pass filter
  else
    wp = Wpw;
    ws = Wsw;
  endif

  k = wp / ws;
  k1 = sqrt (1 - k^2);
  q0 = (1/2) * ((1 - sqrt (k1)) / (1 + sqrt (k1)));
  q = q0 + 2 * q0^5 + 15 * q0^9 + 150 * q0^13; #(....)
  D = (10 ^ (0.1 * Rs) - 1) / (10 ^ (0.1 * Rp) - 1);

  n = ceil (log10 (16 * D) / log10 (1 / q));

  if (s_domain)
    # No prewarp in case of analog filter
    Wp = Wpw;
  else
    # Inverse frequency warping for discrete-time filter
    Wp = atan (Wpw .* (T / 2)) .* (T / pi);
  endif

endfunction

%!demo
%! fs    = 44100;
%! Npts  = fs;
%! fpass = 4000;
%! fstop = 13713;
%! Rpass = 3;
%! Rstop = 40;
%! Wpass = 2/fs * fpass;
%! Wstop = 2/fs * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = ellip (n, Rpass, Rstop, Wn);
%! f = 0:fs/2;
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! outline_lp_pass_x = [f(2)  , fpass(1), fpass(1)];
%! outline_lp_pass_y = [-Rpass, -Rpass  , -80];
%! outline_lp_stop_x = [f(2)  , fstop(1), fstop(1), max(f)];
%! outline_lp_stop_y = [0     , 0       , -Rstop  , -Rstop];
%! hold on
%! plot (outline_lp_pass_x, outline_lp_pass_y, "m", outline_lp_stop_x, outline_lp_stop_y, "m");
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("2nd order digital elliptical low-pass (without margin)");

%!demo
%! fs    = 44100;
%! Npts  = fs;
%! fpass = 4000;
%! fstop = 13712;
%! Rpass = 3;
%! Rstop = 40;
%! Wpass = 2/fs * fpass;
%! Wstop = 2/fs * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = ellip (n, Rpass, Rstop, Wn);
%! f = 0:fs/2;
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! outline_lp_pass_x = [f(2)  , fpass(1), fpass(1)];
%! outline_lp_pass_y = [-Rpass, -Rpass  , -80];
%! outline_lp_stop_x = [f(2)  , fstop(1), fstop(1), max(f)];
%! outline_lp_stop_y = [0     , 0       , -Rstop  , -Rstop];
%! hold on
%! plot (outline_lp_pass_x, outline_lp_pass_y, "m", outline_lp_stop_x, outline_lp_stop_y, "m");
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("3rd order digital elliptical low-pass (just exceeds 2nd order i.e. large margin)");

%!demo
%! fs    = 44100;
%! Npts  = fs;
%! fstop = 4000;
%! fpass = 13713;
%! Rpass = 3;
%! Rstop = 40;
%! Wpass = 2/fs * fpass;
%! Wstop = 2/fs * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "high");
%! f = 0:fs/2;
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! outline_hp_pass_x = [fpass(1), fpass(1), max(f)];
%! outline_hp_pass_y = [-80     , -Rpass  , -Rpass];
%! outline_hp_stop_x = [min(f)  , fstop(1), fstop(1), max(f)];
%! outline_hp_stop_y = [-Rstop  , -Rstop  , 0       , 0     ];
%! hold on
%! plot (outline_hp_pass_x, outline_hp_pass_y, "m", outline_hp_stop_x, outline_hp_stop_y, "m");
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("2nd order digital elliptical high-pass (without margin)");

%!demo
%! fs    = 44100;
%! Npts  = fs;
%! fstop = 4000;
%! fpass = 13712;
%! Rpass = 3;
%! Rstop = 40;
%! Wpass = 2/fs * fpass;
%! Wstop = 2/fs * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "high");
%! f = 0:fs/2;
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! outline_hp_pass_x = [fpass(1), fpass(1), max(f)];
%! outline_hp_pass_y = [-80     , -Rpass  , -Rpass];
%! outline_hp_stop_x = [min(f)  , fstop(1), fstop(1), max(f)];
%! outline_hp_stop_y = [-Rstop  , -Rstop  , 0       , 0     ];
%! hold on
%! plot (outline_hp_pass_x, outline_hp_pass_y, "m", outline_hp_stop_x, outline_hp_stop_y, "m");
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("3rd order digital elliptical high-pass (just exceeds 2nd order i.e. large margin)");

%!demo
%! fs    = 44100;
%! Npts  = fs;
%! fpass = [9500 9750];
%! fstop = [8500 10261];
%! Rpass = 3;
%! Rstop = 40;
%! Wpass = 2/fs * fpass;
%! Wstop = 2/fs * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = ellip (n, Rpass, Rstop, Wn);
%! f = 5000:15000;
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [min(f)  , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m", outline_bp_stop_x, outline_bp_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("4th order digital elliptical band-pass (without margin) limitation on upper freq");

%!demo
%! fs    = 44100;
%! Npts  = fs;
%! fpass = [9500 9750];
%! fstop = [9000 10700];
%! Rpass = 3;
%! Rstop = 40;
%! Wpass = 2/fs * fpass;
%! Wstop = 2/fs * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = ellip (n, Rpass, Rstop, Wn);
%! f = 5000:15000;
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [min(f)  , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m", outline_bp_stop_x, outline_bp_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("4th order digital elliptical band-pass (without margin) limitation on lower freq");

%!demo
%! fs    = 44100;
%! Npts  = fs;
%! fpass = [9500 9750];
%! fstop = [8500 10260];
%! Rpass = 3;
%! Rstop = 40;
%! Wpass = 2/fs * fpass;
%! Wstop = 2/fs * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = ellip (n, Rpass, Rstop, Wn);
%! f = 5000:15000;
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [min(f)  , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m", outline_bp_stop_x, outline_bp_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("6th order digital elliptical band-pass (just exceeds 4th order i.e. large margin) limitation on upper freq");

%!demo
%! fs    = 44100;
%! Npts  = fs;
%! fpass = [9500 9750];
%! fstop = [9001 10700];
%! Rpass = 3;
%! Rstop = 40;
%! Wpass = 2/fs * fpass;
%! Wstop = 2/fs * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = ellip (n, Rpass, Rstop, Wn);
%! f = 5000:15000;
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [min(f)  , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m", outline_bp_stop_x, outline_bp_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("6th order digital elliptical band-pass (just exceeds 4th order i.e. large margin) limitation on lower freq");

%!demo
%! fs    = 44100;
%! Npts  = fs;
%! fstop = [9875 10126.5823];
%! fpass = [8500 11073];
%! Rpass = 0.5;
%! Rstop = 40;
%! Wpass = 2/fs * fpass;
%! Wstop = 2/fs * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "stop");
%! f = 5000:15000;
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_notch_pass_x_a = [min(f)  , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [min(f)  , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0       , 0 ];
%! hold on
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m", outline_notch_pass_x_b, outline_notch_pass_y_b, "m", outline_notch_stop_x, outline_notch_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("4th order digital elliptical notch (without margin) limit on upper freq");

%!demo
%! fs    = 44100;
%! Npts  = fs;
%! fstop = [9875 10126.5823];
%! fpass = [8952 12000];
%! Rpass = 0.5;
%! Rstop = 40;
%! Wpass = 2/fs * fpass;
%! Wstop = 2/fs * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "stop");
%! f = 5000:15000;
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_notch_pass_x_a = [min(f)  , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [min(f)  , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0       , 0 ];
%! hold on
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m", outline_notch_pass_x_b, outline_notch_pass_y_b, "m", outline_notch_stop_x, outline_notch_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("4th order digital elliptical notch (without margin) limit on lower freq");

%!demo
%! fs    = 44100;
%! Npts  = fs;
%! fstop = [9875 10126.5823];
%! fpass = [8500 11072];
%! Rpass = 0.5;
%! Rstop = 40;
%! Wpass = 2/fs * fpass;
%! Wstop = 2/fs * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "stop");
%! f = 5000:15000;
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_notch_pass_x_a = [min(f)  , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [min(f)  , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0       , 0 ];
%! hold on
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m", outline_notch_pass_x_b, outline_notch_pass_y_b, "m", outline_notch_stop_x, outline_notch_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("6th order digital elliptical notch (just exceeds 4th order) limit on upper freq");

%!demo
%! fs    = 44100;
%! Npts  = fs;
%! fstop = [9875 10126.5823];
%! fpass = [8953 12000];
%! Rpass = 0.5;
%! Rstop = 40;
%! Wpass = 2/fs * fpass;
%! Wstop = 2/fs * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "stop");
%! f = 5000:15000;
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_notch_pass_x_a = [min(f)  , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [min(f)  , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0       , 0 ];
%! hold on
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m", outline_notch_pass_x_b, outline_notch_pass_y_b, "m", outline_notch_stop_x, outline_notch_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("6th order digital elliptical notch (just exceeds 4th order) limit on lower freq");

%!demo
%! fpass = 4000;
%! fstop = 20224;
%! Rpass = 3;
%! Rstop = 40;
%! Wpass = 2*pi * fpass;
%! Wstop = 2*pi * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "s");
%! f = 1000:10:100000;
%! W = 2*pi * f;
%! H = freqs (b, a, W);
%! semilogx(f, 20 * log10 (abs (H)))
%! outline_lp_pass_x = [f(2)  , fpass(1), fpass(1)];
%! outline_lp_pass_y = [-Rpass, -Rpass  , -80];
%! outline_lp_stop_x = [f(2)  , fstop(1), fstop(1), max(f)];
%! outline_lp_stop_y = [0     , 0       , -Rstop  , -Rstop];
%! hold on
%! plot (outline_lp_pass_x, outline_lp_pass_y, "m", outline_lp_stop_x, outline_lp_stop_y, "m")
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("2nd order analog elliptical low-pass (without margin)");

%!demo
%! fpass = 4000;
%! fstop = 20223;
%! Rpass = 3;
%! Rstop = 40;
%! Wpass = 2*pi * fpass;
%! Wstop = 2*pi * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "s");
%! f = 1000:10:100000;
%! W = 2*pi * f;
%! H = freqs (b, a, W);
%! semilogx (f, 20 * log10 (abs (H)))
%! outline_lp_pass_x = [f(2)  , fpass(1), fpass(1)];
%! outline_lp_pass_y = [-Rpass, -Rpass  , -80];
%! outline_lp_stop_x = [f(2)  , fstop(1), fstop(1), max(f)];
%! outline_lp_stop_y = [0     , 0       , -Rstop  , -Rstop];
%! hold on
%! plot (outline_lp_pass_x, outline_lp_pass_y, "m", outline_lp_stop_x, outline_lp_stop_y, "m")
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("3rd order analog elliptical low-pass (just exceeds 2nd order i.e. large margin)");

%!demo
%! fstop = 4000;
%! fpass = 20224;
%! Rpass = 3;
%! Rstop = 40;
%! Wpass = 2*pi * fpass;
%! Wstop = 2*pi * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "high", "s");
%! f = 1000:10:100000;
%! W = 2*pi * f;
%! H = freqs (b, a, W);
%! semilogx (f, 20 * log10 (abs (H)))
%! outline_hp_pass_x = [fpass(1), fpass(1), max(f)];
%! outline_hp_pass_y = [-80     , -Rpass  , -Rpass];
%! outline_hp_stop_x = [f(2)    , fstop(1), fstop(1), max(f)];
%! outline_hp_stop_y = [-Rstop  , -Rstop  , 0       , 0     ];
%! hold on
%! plot (outline_hp_pass_x, outline_hp_pass_y, "m", outline_hp_stop_x, outline_hp_stop_y, "m")
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("2nd order analog elliptical high-pass (without margin)");

%!demo
%! fstop = 4000;
%! fpass = 20223;
%! Rpass = 3;
%! Rstop = 40;
%! Wpass = 2*pi * fpass;
%! Wstop = 2*pi * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "high", "s");
%! f = 1000:10:100000;
%! W = 2*pi * f;
%! H = freqs (b, a, W);
%! semilogx (f, 20 * log10 (abs (H)))
%! outline_hp_pass_x = [fpass(1), fpass(1), max(f)];
%! outline_hp_pass_y = [-80     , -Rpass  , -Rpass];
%! outline_hp_stop_x = [f(2)    , fstop(1), fstop(1), max(f)];
%! outline_hp_stop_y = [-Rstop  , -Rstop  , 0       , 0     ];
%! hold on
%! plot (outline_hp_pass_x, outline_hp_pass_y, "m", outline_hp_stop_x, outline_hp_stop_y, "m")
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("3rd order analog elliptical high-pass (just exceeds 2nd order i.e. large margin)");

%!demo
%! fpass = [9875 10126.5823];
%! fstop = [9000 10657];
%! Rpass = 3;
%! Rstop = 40;
%! fcenter = sqrt (fpass(1) * fpass(2));
%! Wpass = 2*pi * fpass;
%! Wstop = 2*pi * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "s");
%! f = 5000:15000;
%! W = 2*pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [f(2)    , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m", outline_bp_stop_x, outline_bp_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("4th order analog elliptical band-pass (without margin) limitation on upper freq");

%!demo
%! fpass = [9875 10126.5823];
%! fstop = [9384 12000];
%! Rpass = 3;
%! Rstop = 40;
%! fcenter = sqrt (fpass(1) * fpass(2));
%! Wpass = 2*pi * fpass;
%! Wstop = 2*pi * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "s");
%! f = 5000:15000;
%! W = 2*pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [f(2)    , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m", outline_bp_stop_x, outline_bp_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("4th order analog elliptical band-pass (without margin) limitation on lower freq");

%!demo
%! fpass = [9875 10126.5823];
%! fstop = [9000 10656];
%! Rpass = 3;
%! Rstop = 40;
%! fcenter = sqrt (fpass(1) * fpass(2));
%! Wpass = 2*pi * fpass;
%! Wstop = 2*pi * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "s");
%! f = 5000:15000;
%! W = 2*pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [f(2)    , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m", outline_bp_stop_x, outline_bp_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("6th order analog elliptical band-pass (just exceeds 4th order i.e. large margin) limitation on upper freq");

%!demo
%! fpass = [9875 10126.5823];
%! fstop = [9385 12000];
%! Rpass = 3;
%! Rstop = 40;
%! fcenter = sqrt (fpass(1) * fpass(2));
%! Wpass = 2*pi * fpass;
%! Wstop = 2*pi * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "s");
%! f = 5000:15000;
%! W = 2*pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [f(2)    , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m", outline_bp_stop_x, outline_bp_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("6th order analog elliptical band-pass (just exceeds 4th order i.e. large margin) limitation on lower freq");

%!demo
%! fstop = [9875 10126.5823];
%! fpass = [9000 10657];
%! Rpass = 3;
%! Rstop = 40;
%! fcenter = sqrt (fpass(1) * fpass(2));
%! Wpass = 2*pi * fpass;
%! Wstop = 2*pi * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "stop", "s");
%! f = 5000:15000;
%! W = 2*pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_notch_pass_x_a = [f(2)    , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [f(2)    , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0       , 0 ];
%! hold on
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m", outline_notch_pass_x_b, outline_notch_pass_y_b, "m", outline_notch_stop_x, outline_notch_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("4th order analog elliptical notch (without margin) limit on upper freq");

%!demo
%! fstop = [9875 10126.5823];
%! fpass = [9384 12000];
%! Rpass = 3;
%! Rstop = 40;
%! fcenter = sqrt (fpass(1) * fpass(2));
%! Wpass = 2*pi * fpass;
%! Wstop = 2*pi * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "stop", "s");
%! f = 5000:15000;
%! W = 2*pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_notch_pass_x_a = [f(2)    , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [f(2)    , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0       , 0 ];
%! hold on
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m", outline_notch_pass_x_b, outline_notch_pass_y_b, "m", outline_notch_stop_x, outline_notch_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("4th order analog elliptical notch (without margin) limit on lower freq");

%!demo
%! fstop = [9875 10126.5823];
%! fpass = [9000 10656];
%! Rpass = 3;
%! Rstop = 40;
%! fcenter = sqrt (fpass(1) * fpass(2));
%! Wpass = 2*pi * fpass;
%! Wstop = 2*pi * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "stop", "s");
%! f = 5000:15000;
%! W = 2*pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_notch_pass_x_a = [f(2)    , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [f(2)    , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0       , 0 ];
%! hold on
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m", outline_notch_pass_x_b, outline_notch_pass_y_b, "m", outline_notch_stop_x, outline_notch_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("6th order analog elliptical notch (just exceeds 4th order) limit on upper freq");

%!demo
%! fstop = [9875 10126.5823];
%! fpass = [9385 12000];
%! Rpass = 3;
%! Rstop = 40;
%! fcenter = sqrt (fpass(1) * fpass(2));
%! Wpass = 2*pi * fpass;
%! Wstop = 2*pi * fstop;
%! [n, Wn] = ellipord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = ellip (n, Rpass, Rstop, Wn, "stop", "s");
%! f = 5000:15000;
%! W = 2*pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)))
%! outline_notch_pass_x_a = [f(2)    , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [f(2)    , fstop(1), fstop(1), fstop(2), fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0       , 0 ];
%! hold on
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m", outline_notch_pass_x_b, outline_notch_pass_y_b, "m", outline_notch_stop_x, outline_notch_stop_y, "m")
%! xlim ([f(1), f(end)]);
%! ylim ([-80, 0]);
%! grid on
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! title ("6th order analog elliptical notch (just exceeds 4th order) limit on lower freq");


%!test
%! # Analog band-pass
%! [n, Wn] = ellipord (2 * pi * [9875, 10126.5823], ...
%!                     2 * pi * [9000, 10657], 3, 40, "s");
%! assert (n, 2);
%! assert (round (Wn), [62046, 63627]);

%!test
%! # Analog band-pass
%! [n, Wn] = ellipord (2 * pi * [9875, 10126.5823], ...
%!                     2 * pi * [9384, 12000], 3, 40, "s");
%! assert (n, 2);
%! assert (round (Wn), [62046, 63627]);

%!test
%! # Analog band-pass
%! [n, Wn] = ellipord (2 * pi * [9875, 10126.5823], ...
%!                     2 * pi * [9000, 10656], 3, 40, "s");
%! assert (n, 3);
%! assert (round (Wn), [62046, 63627]);

%!test
%! # Analog band-pass
%! [n, Wn] = ellipord (2 * pi * [9875, 10126.5823], ...
%!                     2 * pi * [9385, 12000], 3, 40, "s");
%! assert (n, 3);
%! assert (round (Wn), [62046, 63627]);

%!test
%! # Analog high-pass
%! [n, Wn] = ellipord (2 * pi * 20224, 2 * pi * 4000, 3, 40, "s");
%! assert (n, 2);
%! assert (round (Wn), 127071);

%!test
%! # Analog high-pass
%! [n, Wn] = ellipord (2 * pi * 20223, 2 * pi * 4000, 3, 40, "s");
%! assert (n, 3);
%! assert (round (Wn), 127065);

%!test
%! # Analog low-pass
%! [n, Wn] = ellipord (2 * pi * 4000, 2 * pi * 20224, 3, 40, "s");
%! assert (n, 2);
%! assert (round (Wn), 25133);

%!test
%! # Analog low-pass
%! [n, Wn] = ellipord (2 * pi * 4000, 2 * pi * 20223, 3, 40, "s");
%! assert (n, 3);
%! assert (round (Wn), 25133);

%!test
%! # Analog notch (narrow band-stop)
%! [n, Wn] = ellipord (2 * pi * [9000, 10657], ...
%!                     2 * pi * [9875, 10126.5823], 3, 40, "s");
%! assert (n, 2);
%! assert (round (Wn), [58958, 66960]);

%!test
%! # Analog notch (narrow band-stop)
%! [n, Wn] = ellipord (2 * pi * [9384, 12000], ...
%!                     2 * pi * [9875, 10126.5823], 3, 40, "s");
%! assert (n, 2);
%! assert (round (Wn), [58961 , 66956]);

%!test
%! # Analog notch (narrow band-stop)
%! [n, Wn] = ellipord (2 * pi * [9000, 10656], ...
%!                     2 * pi * [9875, 10126.5823], 3, 40, "s");
%! assert (n, 3);
%! assert (round (Wn), [58964, 66954]);

%!test
%! # Analog notch (narrow band-stop)
%! [n, Wn] = ellipord (2 * pi * [9385, 12000], ...
%!                     2 * pi * [9875, 10126.5823], 3, 40, "s");
%! assert (n, 3);
%! assert (round (Wn), [58968, 66949]);

%!test
%! # Digital band-pass
%! fs = 44100;
%! [n, Wn] = ellipord (2 / fs * [9500, 9750], 2 / fs * [8500, 10261], 3, 40);
%! Wn = Wn * fs / 2;
%! assert (n, 2);
%! assert (round (Wn), [9500, 9750]);

%!test
%! # Digital band-pass
%! fs = 44100;
%! [n, Wn] = ellipord (2 / fs * [9500, 9750], 2 / fs * [9000, 10700], 3, 40);
%! Wn = Wn * fs / 2;
%! assert (n, 2);
%! assert (round (Wn), [9500, 9750]);

%!test
%! # Digital band-pass
%! fs = 44100;
%! [n, Wn] = ellipord (2 / fs * [9500, 9750], 2 / fs * [8500, 10260], 3, 40);
%! Wn = Wn * fs / 2;
%! assert (n, 3);
%! assert (round (Wn), [9500, 9750]);

%!test
%! # Digital band-pass
%! fs = 44100;
%! [n, Wn] = ellipord (2 / fs * [9500, 9750], 2 / fs * [9001, 10700], 3, 40);
%! Wn = Wn * fs / 2;
%! assert (n, 3);
%! assert (round (Wn), [9500, 9750]);

%!test
%! # Digital high-pass
%! fs = 44100;
%! [n, Wn] = ellipord (2 / fs * 13713, 2 / fs * 4000, 3, 40);
%! Wn = Wn * fs / 2;
%! assert (n, 2);
%! assert (round (Wn), 13713);

%!test
%! # Digital high-pass
%! fs = 44100;
%! [n, Wn] = ellipord (2 / fs * 13712, 2 / fs * 4000, 3, 40);
%! Wn = Wn * fs / 2;
%! assert (n, 3);
%! assert (round (Wn), 13712);

%!test
%! # Digital low-pass
%! fs = 44100;
%! [n, Wn] = ellipord (2 / fs * 4000, 2 / fs * 13713, 3, 40);
%! Wn = Wn * fs / 2;
%! assert (n, 2);
%! assert (round (Wn), 4000);

%!test
%! # Digital low-pass
%! fs = 44100;
%! [n, Wn] = ellipord (2 / fs * 4000, 2 / fs * 13712, 3, 40);
%! Wn = Wn * fs / 2;
%! assert (n, 3);
%! assert (round (Wn), 4000);

%!test
%! # Digital notch (narrow band-stop)
%! fs = 44100;
%! [n, Wn] = ellipord (2 / fs * [8500, 11073], 2 / fs * [9875, 10126.5823], 0.5, 40);
%! Wn = Wn * fs / 2;
%! assert (n, 2);
%! assert (round (Wn), [8952, 11073]);

%!test
%! # Digital notch (narrow band-stop)
%! fs = 44100;
%! [n, Wn] = ellipord (2 / fs * [8952, 12000], 2 / fs * [9875, 10126.5823], 0.5, 40);
%! Wn = Wn * fs / 2;
%! assert (n, 2);
%! assert (round (Wn), [8952, 11073]);

%!test
%! # Digital notch (narrow band-stop)
%! fs = 44100;
%! [n, Wn] = ellipord (2 / fs * [8500, 11072], 2 / fs * [9875, 10126.5823], 0.5, 40);
%! Wn = Wn * fs / 2;
%! assert (n, 3);
%! assert (round (Wn), [8953, 11072]);

%!test
%! # Digital notch (narrow band-stop)
%! fs = 44100;
%! [n, Wn] = ellipord (2 / fs * [8953, 12000], 2 / fs * [9875, 10126.5823], 0.5, 40);
%! Wn = Wn * fs / 2;
%! assert (n, 3);
%! assert (round (Wn), [8953, 11072]);

## Test input validation
%!error ellipord ()
%!error ellipord (.1)
%!error ellipord (.1, .2)
%!error ellipord (.1, .2, 3)
%!error ellipord ([.1 .1], [.2 .2], 3, 4)
%!error ellipord ([.1 .2], [.5 .6], 3, 4)
%!error ellipord ([.1 .5], [.2 .6], 3, 4)
