## Copyright (C) 1999 Paul Kienzle
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
## @deftypefn  {Function File} {@var{n} =} buttord (@var{wp}, @var{ws}, @var{rp}, @var{rs})
## @deftypefnx {Function File} {@var{n} =} buttord ([@var{wp1}, @var{wp2}], [@var{ws1}, @var{ws2}], @var{rp}, @var{rs})
## @deftypefnx {Function File} {@var{n} =} buttord ([@var{wp1}, @var{wp2}], [@var{ws1}, @var{ws2}], @var{rp}, @var{rs}, "s")
## @deftypefnx {Function File} {[@var{n}, @var{wc_p}] =} buttord (@dots{})
## @deftypefnx {Function File} {[@var{n}, @var{wc_p}, @var{wc_s}] =} buttord (@dots{})
## Compute the minimum filter order of a Butterworth filter with the desired
## response characteristics.  The filter frequency band edges are specified by
## the passband frequency @var{wp} and stopband frequency @var{ws}.  Frequencies
## are normalized to the Nyquist frequency in the range [0,1].  @var{rp} is the
## allowable passband ripple measured in decibels, and @var{rs} is the minimum
## attenuation in the stop band, also in decibels.
##
## The output arguments @var{n} and @var{wc_p} (or @var{n} and @var{wc_n}) can
## be given as inputs to @code{butter}.
## Using @var{wc_p} makes the filter characteristic touch at least one pass band
## corner and using @var{wc_s} makes the characteristic touch at least one
## stop band corner.
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
## Theory: For Low pass filters, |H(W)|^2 = 1/[1+(W/Wc)^(2N)] = 10^(-R/10).
## With some algebra, you can solve simultaneously for Wc and N given
## Ws,Rs and Wp,Rp. Rounding N to the next greater integer, one can recalculate
## the allowable range for Wc (filter caracteristic touching the pass band edge
## or the stop band edge).
##
## For other types of filter, before making the above calculation, the
## requirements must be transformed to LP requirements. After calculation, Wc
## must be transformed back to original filter type.
## @seealso{butter, cheb1ord, cheb2ord, ellipord}
## @end deftypefn

function [n, Wc_p, Wc_s] = buttord (Wp, Ws, Rp, Rs, opt)

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
    validate_filter_bands ("buttord", Wp, Ws, "s");
  else
    validate_filter_bands ("buttord", Wp, Ws);
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
      if (Wpw(1) * Wpw(2) < Wsw(1) * Wsw(2))
        Wsw(2) = Wpw(1) * Wpw(2) / Wsw(1);
      else
        Wsw(1) = Wpw(1) * Wpw(2) / Wsw(2);
      endif

      w02 = Wpw(1) * Wpw(2);
      wp = Wpw(2) - Wpw(1);
      ws = Wsw(2) - Wsw(1);

    ## Band-stop / band-reject / notch filter
    else

      ## Modify band edges if not symmetrical.  For a band-stop filter,
      ## the lower or upper passband limit is moved, resulting in a smaller
      ## rejection band than the caller requested.
      if (Wpw(1) * Wpw(2) > Wsw(1) * Wsw(2))
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

  ## compute minimum n which satisfies all band edge conditions
  qs = log (10 ^ (Rs / 10) - 1);
  qp = log (10 ^ (Rp / 10) - 1);
  n = ceil (max (0.5 * (qs - qp) ./ log (ws./wp)));

  ## compute -3dB cutoff given Wp, Rp and n

  if (length (Wpw) == 2 && length (Wsw) == 2)

    ## Band-pass filter
    if (Wpw(1) > Wsw(1))
      w_prime_p = exp (log (Wpw) - qp / 2 / n); #   same formula as for LP
      w_prime_s = exp (log (Wsw) - qs / 2 / n); #           "

    ## Band-stop / band-reject / notch filter
    else
      w_prime_p = exp( log (Wpw) + qp / 2 / n); #   same formula as for HP
      w_prime_s = exp( log (Wsw) + qs / 2 / n); #           "
    endif

    ## Applying LP to BP (respectively HP to notch) transformation to -3dB
    ## angular frequency :
    ##   s_prime/wc = Q(s/w0+w0/s)  or  w_prime/wc = Q(w/w0-w0/w)
    ## Here we need to inverse above equation:
    ##   w = abs(w_prime+-sqrt(w_prime^2+4*Q^2))/(2*Q/w0);

    ## -3dB cutoff freq to match pass band
    w0 = sqrt (prod (Wpw));
    Q = w0 / diff (Wpw);                      # BW at -Rp dB not at -3dB
    wc = Wpw;
    W_prime = w_prime_p(1) / wc(1);           # same with w_prime(2)/wc(2)
    wa = abs (W_prime + sqrt (W_prime ^ 2 + 4 * Q ^ 2)) / (2 * Q / w0);
    wb = abs (W_prime - sqrt (W_prime ^ 2 + 4 * Q ^ 2)) / (2 * Q / w0);
    Wcw_p = [wb wa];

    ## -3dB cutoff freq to match stop band
    w0 = sqrt (prod (Wsw));
    Q = w0 / diff (Wsw);                      # BW at -Rs dB not at -3dB
    wc = Wsw;
    W_prime = w_prime_s(1) / wc(1);           # same with w_prime(2)/wc(2)
    wa =abs (W_prime + sqrt (W_prime ^ 2 + 4 * Q ^ 2)) / (2 * Q / w0);
    wb =abs (W_prime - sqrt (W_prime ^ 2 + 4 * Q ^ 2)) / (2 * Q / w0);
    Wcw_s = [wb wa];

  ## High-pass filter
  elseif (Wpw > Wsw)
    ## -3dB cutoff freq to match pass band
    Wcw_p = exp (log (Wpw) + qp / 2 / n);

    ## -3dB cutoff freq to match stop band
    Wcw_s = exp (log (Wsw) + qs / 2 / n);

  ## Low-pass filter
  else
    ## -3dB cutoff freq to match pass band
    Wcw_p = exp (log (Wpw) - qp / 2 / n);

    ## -3dB cutoff freq to match stop band
    Wcw_s = exp( log (Wsw) - qs / 2 / n);
  endif

  if (s_domain)
    # No prewarp in case of analog filter
    Wc_p = Wcw_p;
    Wc_s = Wcw_s;
  else
    # Inverse frequency warping for discrete-time filter
    Wc_p = atan (Wcw_p .* (T / 2)) .* (T / pi);
    Wc_s = atan (Wcw_s .* (T / 2)) .* (T / pi);
  endif

endfunction

%!demo
%! fs    = 44100;
%! Npts  = fs / 2;
%! fpass = 4000;
%! fstop = 10987;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = butter (n, Wn_p);
%! f = 8000:12000;
%! W = 2 * pi * f;
%! [H, f] = freqz (b, a, Npts, fs);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Butterworth low-pass : matching pass band");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_lp_pass_x = [f(2)  , fpass(1), fpass(1)];
%! outline_lp_pass_y = [-Rpass, -Rpass  , -80];
%! outline_lp_stop_x = [f(2)  , fstop(1), fstop(1), max(f)];
%! outline_lp_stop_y = [0     , 0       , -Rstop  , -Rstop];
%! hold on;
%! plot (outline_lp_pass_x, outline_lp_pass_y, "m");
%! plot (outline_lp_stop_x, outline_lp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! Npts  = fs / 2;
%! fpass = 4000;
%! fstop = 10987;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = butter (n, Wn_s);
%! f = 8000:12000;
%! W = 2 * pi * f;
%! [H, f] = freqz (b, a, Npts, fs);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Butterworth low-pass : matching stop band");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_lp_pass_x = [f(2)  , fpass(1), fpass(1)];
%! outline_lp_pass_y = [-Rpass, -Rpass  , -80];
%! outline_lp_stop_x = [f(2)  , fstop(1), fstop(1), max(f)];
%! outline_lp_stop_y = [0     , 0       , -Rstop  , -Rstop];
%! hold on;
%! plot (outline_lp_pass_x, outline_lp_pass_y, "m");
%! plot (outline_lp_stop_x, outline_lp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! Npts  = fs / 2;
%! fstop = 4000;
%! fpass = 10987;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = butter (n, Wn_p, "high");
%! f = 8000:12000;
%! W = 2 * pi * f;
%! [H, f] = freqz (b, a, Npts, fs);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Butterworth high-pass : matching pass band");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_hp_pass_x = [fpass(1), fpass(1), max(f)];
%! outline_hp_pass_y = [-80     , -Rpass  , -Rpass];
%! outline_hp_stop_x = [min(f)  , fstop(1), fstop(1), max(f)];
%! outline_hp_stop_y = [-Rstop  , -Rstop  , 0       , 0     ];
%! hold on;
%! plot (outline_hp_pass_x, outline_hp_pass_y, "m");
%! plot (outline_hp_stop_x, outline_hp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! Npts  = fs / 2;
%! fstop = 4000;
%! fpass = 10987;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = butter (n, Wn_s, "high");
%! f = 8000:12000;
%! W = 2 * pi * f;
%! [H, f] = freqz (b, a, Npts, fs);
%! plot (f, 20 * log10 (abs (H)))
%! title ("Digital Butterworth high-pass : matching stop band");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_hp_pass_x = [fpass(1), fpass(1), max(f)];
%! outline_hp_pass_y = [-80     , -Rpass  , -Rpass];
%! outline_hp_stop_x = [min(f)  , fstop(1), fstop(1), max(f)];
%! outline_hp_stop_y = [-Rstop  , -Rstop  , 0       , 0     ];
%! hold on;
%! plot (outline_hp_pass_x, outline_hp_pass_y, "m");
%! plot (outline_hp_stop_x, outline_hp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! fpass = [9500 9750];
%! fstop = [8500 10051];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = butter (n, Wn_p);
%! f = (8000:12000)';
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Butterworth band-pass : matching pass band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on;
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! fpass = [9500 9750];
%! fstop = [8500 10051];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = butter (n, Wn_s);
%! f = (8000:12000)';
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Butterworth band-pass : matching stop band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on;
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! fpass = [9500 9750];
%! fstop = [9204 10700];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = butter (n, Wn_p);
%! f = (8000:12000)';
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Butterworth band-pass : matching pass band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on;
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! fpass = [9500 9750];
%! fstop = [9204 10700];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = butter (n, Wn_s);
%! f = (8000:12000)';
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Butterworth band-pass : matching stop band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on;
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! fstop = [9875, 10126.5823];
%! fpass = [8500 10833];
%! Rpass = 0.5;
%! Rstop = 40;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = butter (n, Wn_p, "stop");
%! f = (8000:12000)';
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Butterworth notch : matching pass band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [min(f)  , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                                         fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , ...
%!                                                         0       , 0 ];
%! hold on;
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! fstop = [9875, 10126.5823];
%! fpass = [8500 10833];
%! Rpass = 0.5;
%! Rstop = 40;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = butter (n, Wn_s, "stop");
%! f = (8000:12000)';
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Butterworth notch : matching stop band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [min(f)  , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                                         fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , ...
%!                                                         0       , 0 ];
%! hold on;
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! fstop = [9875, 10126.5823];
%! fpass = [9183 11000];
%! Rpass = 0.5;
%! Rstop = 40;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = butter (n, Wn_p, "stop");
%! f = (8000:12000)';
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Butterworth notch : matching pass band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [min(f)  , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                                         fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , ...
%!                                                         0       , 0 ];
%! hold on;
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! fstop = [9875, 10126.5823];
%! fpass = [9183 11000];
%! Rpass = 0.5;
%! Rstop = 40;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop)
%! [b, a] = butter (n, Wn_s, "stop");
%! f = (8000:12000)';
%! W = f * (2 * pi / fs);
%! H = freqz (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Butterworth notch : matching stop band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [min(f)  , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                                         fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , ...
%!                                                         0       , 0 ];
%! hold on;
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fpass = 4000;
%! fstop = 13583;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = butter (n, Wn_p, "s");
%! f = 1000:10:100000;
%! W = 2 * pi * f;
%! H = freqs (b, a, W);
%! semilogx (f, 20 * log10 (abs (H)))
%! title ("Analog Butterworth low-pass : matching pass band");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_lp_pass_x = [f(2)  , fpass(1), fpass(1)];
%! outline_lp_pass_y = [-Rpass, -Rpass  , -80];
%! outline_lp_stop_x = [f(2)  , fstop(1), fstop(1), max(f)];
%! outline_lp_stop_y = [0     , 0       , -Rstop  , -Rstop];
%! hold on;
%! plot (outline_lp_pass_x, outline_lp_pass_y, "m");
%! plot (outline_lp_stop_x, outline_lp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fpass = 4000;
%! fstop = 13583;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = butter (n, Wn_s, "s");
%! f = 1000:10:100000;
%! W = 2 * pi * f;
%! H = freqs (b, a, W);
%! semilogx (f, 20 * log10 (abs (H)));
%! title ("Analog Butterworth low-pass : matching stop band");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_lp_pass_x = [f(2)  , fpass(1), fpass(1)];
%! outline_lp_pass_y = [-Rpass, -Rpass  , -80];
%! outline_lp_stop_x = [f(2)  , fstop(1), fstop(1), max(f)];
%! outline_lp_stop_y = [0     , 0       , -Rstop  , -Rstop];
%! hold on;
%! plot (outline_lp_pass_x, outline_lp_pass_y, "m");
%! plot (outline_lp_stop_x, outline_lp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fstop = 4000;
%! fpass = 13583;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = butter (n, Wn_p, "high", "s");
%! f = 1000:10:100000;
%! W = 2 * pi * f;
%! H = freqs (b, a, W);
%! semilogx (f, 20 * log10 (abs (H)));
%! title ("Analog Butterworth high-pass : matching pass band");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_hp_pass_x = [fpass(1), fpass(1), max(f)];
%! outline_hp_pass_y = [-80     , -Rpass  , -Rpass];
%! outline_hp_stop_x = [f(2)    , fstop(1), fstop(1), max(f)];
%! outline_hp_stop_y = [-Rstop  , -Rstop  , 0       , 0     ];
%! hold on;
%! plot (outline_hp_pass_x, outline_hp_pass_y, "m");
%! plot (outline_hp_stop_x, outline_hp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fstop = 4000;
%! fpass = 13583;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = butter (n, Wn_s, "high", "s");
%! f = 1000:10:100000;
%! W = 2 * pi * f;
%! H = freqs (b, a, W);
%! semilogx (f, 20 * log10 (abs (H)));
%! title ("Analog Butterworth high-pass : matching stop band");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_hp_pass_x = [fpass(1), fpass(1), max(f)];
%! outline_hp_pass_y = [-80     , -Rpass  , -Rpass];
%! outline_hp_stop_x = [f(2)    , fstop(1), fstop(1), max(f)];
%! outline_hp_stop_y = [-Rstop  , -Rstop  , 0       , 0     ];
%! hold on;
%! plot (outline_hp_pass_x, outline_hp_pass_y, "m");
%! plot (outline_hp_stop_x, outline_hp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fpass = [9875, 10126.5823];
%! fstop = [9000, 10436];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = butter (n, Wn_p, "s");
%! f = 8000:12000;
%! W = 2 * pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Butterworth band-pass : matching pass band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on;
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fpass = [9875, 10126.5823];
%! fstop = [9000, 10436];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = butter (n, Wn_s, "s");
%! f = 8000:12000;
%! W = 2 * pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Butterworth band-pass : matching stop band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on;
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fpass = [9875, 10126.5823];
%! fstop = [9582, 11000];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = butter (n, Wn_p, "s");
%! f = 8000:12000;
%! W = 2 * pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Butterworth band-pass : matching pass band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on;
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fpass = [9875, 10126.5823];
%! fstop = [9582, 11000];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = butter (n, Wn_s, "s");
%! f = 8000:12000;
%! W = 2 * pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Butterworth band-pass : matching stop band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on;
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fstop = [9875 10126.5823];
%! fpass = [9000 10436];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = butter (n, Wn_p, "stop", "s");
%! f = 8000:12000;
%! W = 2 * pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Butterworth notch : matching pass band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [f(2)    , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                                         fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , ...
%!                                                         0       , 0 ];
%! hold on;
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fstop = [9875 10126.5823];
%! fpass = [9000 10436];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = butter (n, Wn_s, "stop", "s");
%! f = 8000:12000;
%! W = 2 * pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Butterworth notch : matching stop band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [f(2)    , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                                         fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , ...
%!                                                         0       , 0 ];
%! hold on;
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fstop = [9875 10126.5823];
%! fpass = [9582 11000];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = butter (n, Wn_p, "stop", "s");
%! f = 8000:12000;
%! W = 2 * pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Butterworth notch : matching pass band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [f(2)    , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                                         fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , ...
%!                                                         0       , 0 ];
%! hold on;
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fstop = [9875 10126.5823];
%! fpass = [9582 11000];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [n, Wn_p, Wn_s] = buttord (Wpass, Wstop, Rpass, Rstop, "s")
%! [b, a] = butter (n, Wn_s, "stop", "s");
%! f = 8000:12000;
%! W = 2 * pi * f;
%! H = freqs (b, a, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Butterworth notch : matching stop band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [f(2)    , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                                         fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , ...
%!                                                         0       , 0 ];
%! hold on;
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);


%!test
%! # Analog band-pass
%! [n, Wn_p, Wn_s] = buttord (2 * pi * [9875, 10126.5823], ...
%!                            2 * pi * [9000, 10436], 1, 26, "s");
%! assert (n, 4);
%! assert (round (Wn_p), [61903, 63775]);
%! assert (round (Wn_s), [61575, 64114]);

%!test
%! # Analog band-pass
%! [n, Wn_p, Wn_s] = buttord (2 * pi * [9875, 10126.5823], ...
%!                            2 * pi * [9582, 11000], 1, 26, "s");
%! assert (n, 4);
%! assert (round (Wn_p), [61903, 63775]);
%! assert (round (Wn_s), [61575, 64115]);

%!test
%! # Analog band-pass
%! [n, Wn_p, Wn_s] = buttord (2 * pi * [9875, 10126.5823], ...
%!                            2 * pi * [9000, 10437], 1, 26, "s");
%! assert (n, 3);
%! assert (round (Wn_p), [61850, 63830]);
%! assert (round (Wn_s), [61848, 63831]);

%!test
%! # Analog band-pass
%! [n, Wn_p, Wn_s] = buttord (2 * pi * [9875, 10126.5823], ...
%!                            2 * pi * [9581, 11000], 1, 26, "s");
%! assert (n, 3);
%! assert (round (Wn_p), [61850, 63830]);
%! assert (round (Wn_s), [61847, 63832]);

%!test
%! # Analog high-pass
%! [n, Wn_p, Wn_s] = buttord (2 * pi * 13583, 2 * pi * 4000, 1, 26, "s");
%! assert (n, 4);
%! assert (round (Wn_p), 72081);
%! assert (round (Wn_s), 53101);

%!test
%! # Analog high-pass
%! [n, Wn_p, Wn_s] = buttord (2 * pi * 13584, 2 * pi * 4000, 1, 26, "s");
%! assert (n, 3);
%! assert (round (Wn_p), 68140);
%! assert (round (Wn_s), 68138);

%!test
%! # Analog low-pass
%! [n, Wn_p, Wn_s] = buttord (2 * pi * 4000, 2 * pi * 13583, 1, 26, "s");
%! assert (n, 4);
%! assert (round (Wn_p), 29757);
%! assert (round (Wn_s), 40394);

%!test
%! # Analog low-pass
%! [n, Wn_p, Wn_s] = buttord (2 * pi * 4000, 2 * pi * 13584, 1, 26, "s");
%! assert (n, 3);
%! assert (round (Wn_p), 31481);
%! assert (round (Wn_s), 31482);

%!test
%! # Analog notch (narrow band-stop)
%! [n, Wn_p, Wn_s] = buttord (2 * pi * [9000, 10436], ...
%!                            2 * pi * [9875, 10126.5823], 1, 26, "s");
%! assert (n, 4);
%! assert (round (Wn_p), [60607, 65138]);
%! assert (round (Wn_s), [61184, 64524]);

%!test
%! # Analog notch (narrow band-stop)
%! [n, Wn_p, Wn_s] = buttord (2 * pi * [9582, 11000], ...
%!                            2 * pi * [9875, 10126.5823], 1, 26, "s");
%! assert (n, 4);
%! assert (round (Wn_p), [60606, 65139]);
%! assert (round (Wn_s), [61184, 64524]);

%!test
%! # Analog notch (narrow band-stop)
%! [n, Wn_p, Wn_s] = buttord (2 * pi * [9000, 10437], ...
%!                            2 * pi * [9875, 10126.5823], 1, 26, "s");
%! assert (n, 3);
%! assert (round (Wn_p), [60722, 65015]);
%! assert (round (Wn_s), [60726, 65011]);

%!test
%! # Analog notch (narrow band-stop)
%! [n, Wn_p, Wn_s] = buttord (2 * pi * [9581, 11000], ...
%!                            2 * pi * [9875, 10126.5823], 1, 26, "s");
%! assert (n, 3);
%! assert (round (Wn_p), [60721, 65016]);
%! assert (round (Wn_s), [60726, 65011]);

%!test
%! # Digital band-pass
%! fs = 44100;
%! [n, Wn_p, Wn_s] = buttord (2 / fs * [9500, 9750], ...
%!                            2 / fs * [8500, 10051], 1, 26);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (n, 4);
%! assert (round (Wn_p), [9477, 9773]);
%! assert (round (Wn_s), [9425, 9826]);

%!test
%! # Digital band-pass
%! fs = 44100;
%! [n, Wn_p, Wn_s] = buttord (2 / fs * [9500, 9750], ...
%!                            2 / fs * [9204, 10700], 1, 26);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (n, 4);
%! assert (round (Wn_p), [9477, 9773]);
%! assert (round (Wn_s), [9425, 9826]);

%!test
%! # Digital band-pass
%! fs = 44100;
%! [n, Wn_p, Wn_s] = buttord (2 / fs * [9500, 9750], ...
%!                            2 / fs * [8500, 10052], 1, 26);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (n, 3);
%! assert (round (Wn_p), [9469, 9782]);
%! assert (round (Wn_s), [9468, 9782]);

%!test
%! # Digital band-pass
%! fs = 44100;
%! [n, Wn_p, Wn_s] = buttord (2 / fs * [9500, 9750], ...
%!                            2 / fs * [9203, 10700], 1, 26);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (n, 3);
%! assert (round (Wn_p), [9469, 9782]);
%! assert (round (Wn_s), [9468, 9782]);

%!test
%! # Digital high-pass
%! fs = 44100;
%! [n, Wn_p, Wn_s] = buttord (2 / fs * 10987, 2 / fs * 4000, 1, 26);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (n, 4);
%! assert (round (Wn_p), 9808);
%! assert (round (Wn_s), 7780);

%!test
%! # Digital high-pass
%! fs = 44100;
%! [n, Wn_p, Wn_s] = buttord (2 / fs * 10988, 2 / fs * 4000, 1, 26);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (n, 3);
%! assert (round (Wn_p), 9421);
%! assert (round (Wn_s), 9421);

%!test
%! # Digital low-pass
%! fs = 44100;
%! [n, Wn_p, Wn_s] = buttord (2 / fs * 4000, 2 / fs * 10987, 1, 26);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (n, 4);
%! assert (round (Wn_p), 4686);
%! assert (round (Wn_s), 6176);

%!test
%! # Digital low-pass
%! fs = 44100;
%! [n, Wn_p, Wn_s] = buttord (2 / fs * 4000, 2 / fs * 10988, 1, 26);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (n, 3);
%! assert (round (Wn_p), 4936);
%! assert (round (Wn_s), 4936);

%!test
%! # Digital notch (narrow band-stop)
%! fs = 44100;
%! [n, Wn_p, Wn_s] = buttord (2 / fs * [8500, 10833], ...
%!                            2 / fs * [9875,  10126.5823], 0.5, 40);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (n, 4);
%! assert (round (Wn_p), [9369, 10640]);
%! assert (round (Wn_s), [9605, 10400]);

%!test
%! # Digital notch (narrow band-stop)
%! fs = 44100;
%! [n, Wn_p, Wn_s] = buttord (2 / fs * [9183, 11000], ...
%!                            2 / fs * [9875,  10126.5823], 0.5, 40);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (n, 4);
%! assert (round (Wn_p), [9370, 10640]);
%! assert (round (Wn_s), [9605, 10400]);

%!test
%! # Digital notch (narrow band-stop)
%! fs = 44100;
%! [n, Wn_p, Wn_s] = buttord (2 / fs * [8500, 10834], ...
%!                            2 / fs * [9875, 10126.5823], 0.5, 40);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (n, 3);
%! assert (round (Wn_p), [9421, 10587]);
%! assert (round (Wn_s), [9422, 10587]);

%!test
%! # Digital notch (narrow band-stop)
%! fs = 44100;
%! [n, Wn_p, Wn_s] = buttord (2 / fs * [9182, 11000], ...
%!                            2 / fs * [9875, 10126.5823], 0.5, 40);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (n, 3);
%! assert (round (Wn_p), [9421, 10587]);
%! assert (round (Wn_s), [9422, 10587]);

## Test input validation
%!error buttord ()
%!error buttord (.1)
%!error buttord (.1, .2)
%!error buttord (.1, .2, 3)
%!error buttord ([.1 .1], [.2 .2], 3, 4)
%!error buttord ([.1 .2], [.5 .6], 3, 4)
%!error buttord ([.1 .5], [.2 .6], 3, 4)
