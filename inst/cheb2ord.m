## Copyright (C) 2000 Paul Kienzle <pkienzle@users.sf.net>
## Copyright (C) 2018 Charles Praplan <charles.praplan@alumni.epfl.ch>
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
## @deftypefn  {Function File} {@var{n} =} cheb2ord (@var{wp}, @var{ws}, @var{rp}, @var{rs})
## @deftypefnx {Function File} {@var{n} =} cheb2ord ([@var{wp1}, @var{wp2}], [@var{ws1}, @var{ws2}], @var{rp}, @var{rs})
## @deftypefnx {Function File} {@var{n} =} cheb2ord ([@var{wp1}, @var{wp2}], [@var{ws1}, @var{ws2}], @var{rp}, @var{rs}, "s")
## @deftypefnx {Function File} {[@var{n}, @var{wc_s}] =} cheb2ord (@dots{})
## @deftypefnx {Function File} {[@var{n}, @var{wc_s}, @var{wc_p}] =} cheb2ord (@dots{})
## Compute the minimum filter order of a Chebyshev type II filter with the
## desired response characteristics. The filter frequency band edges are
## specified by the passband frequency @var{wp} and stopband frequency @var{ws}.
## Frequencies are normalized to the Nyquist frequency in the range [0,1].
## @var{rp} is the allowable passband ripple measured in decibels, and @var{rs}
## is the minimum attenuation in the stop band, also in decibels.
##
## The output arguments @var{n} and @var{wc_p} (or @var{n} and @var{wc_s}) can
## be given as inputs to @code{cheby2}.
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
## For Laplace space filters, an additional input parameter ("s") must be
## entered. In that case W is in rad/s.
##
## @seealso{buttord, cheb2ord, cheby2, ellipord}
## @end deftypefn

function [n, Wc_p, Wc_s]  = cheb2ord (Wp, Ws, Rp, Rs, opt)

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
    validate_filter_bands ("cheb2ord", Wp, Ws, "s");
  else
    validate_filter_bands ("cheb2ord", Wp, Ws);
  endif

  if (s_domain)
    Wpw = Wp;                                 # No prewarp for analog filter
    Wsw = Ws;                                 # No prewarp for analog filter
  else
    ## sampling frequency of 2 Hz
    T = 2;

    Wpw = (2 / T) * tan (pi .* Wp ./ T);      # prewarp
    Wsw = (2 / T) * tan (pi .* Ws ./ T);      # prewarp
  endif

  ## pass/stop band to low pass filter transform:
  if (length (Wpw) == 2 && length (Wsw) == 2)

    if (Wpw(1) > Wsw(1))                      # Band pass filter

      if (Wpw(1) * Wpw(2) < Wsw(1) * Wsw(2))  # Modify band edges if not sym.
        Wsw(2) = Wpw(1) * Wpw(2) / Wsw(1);    #   smaller stopband
      else
        Wsw(1) = Wpw(1) * Wpw(2) / Wsw(2);    #   smaller stopband
      endif

      w02 = Wpw(1) * Wpw(2);
      wp = Wpw(2) - Wpw(1);
      ws = Wsw(2) - Wsw(1);

    else                                      # Notch filter

      if (Wpw(1) * Wpw(2) > Wsw(1) * Wsw(2))  # Modify band edges if not sym.
        Wpw(2) = Wsw(1) * Wsw(2) / Wpw(1);    #   smaller passband
      else
        Wpw(1) = Wsw(1) * Wsw(2) / Wpw(2);    #   smaller passband
      endif

      w02 = Wpw(1) * Wpw(2);
      wp = w02 / (Wpw(2) - Wpw(1));
      ws = w02 / (Wsw(2) - Wsw(1));
    endif
    ws = ws / wp;
    wp = 1;

  elseif (Wpw > Wsw)                          # High pass filter
    wp = Wsw;
    ws = Wpw;
  else                                        # Low pass filter
    wp = Wpw;
    ws = Wsw;
  endif

  Wa = ws ./ wp;

  ## compute minimum n which satisfies all band edge conditions
  stop_atten = 10 ^ (abs (Rs) / 10);
  pass_atten = 10 ^ (abs (Rp) / 10);
  n = ceil (acosh (sqrt ((stop_atten - 1) / (pass_atten - 1))) / acosh (Wa));


  ## compute stopband frequency limits to make the the filter characteristic
  ## touch either at least one stop band corner or one pass band corner.

  epsilon = 1 / sqrt (10 ^ (.1 * abs (Rs)) - 1);
  k = cosh (1 / n * acosh (sqrt (1 / (10 ^ (.1 * abs (Rp)) - 1)) / epsilon));
                                              # or k = fstop / fpass

  if (length (Wpw) == 2 && length (Wsw) == 2) # Band pass or notch filter


    if (Wpw(1) > Wsw(1))                      # Band pass filter
      w_prime_s = Wsw;                        #   same formula as for LP
      w_prime_p = k * Wpw;                    #           "
    else                                      # Notch filter
      w_prime_s = Wsw;                        #   same formula as for HP
      w_prime_p = Wpw / k;                    #           "
    endif

    ## Applying LP to BP (respectively HP to notch) transformation to
    ## angular frequency to be returned:
    ##   s_prime/wc = Q(s/w0+w0/s)  or  w_prime/wc = Q(w/w0-w0/w)
    ## Here we need to inverse above equation:
    ##   w = abs(w_prime+-sqrt(w_prime^2+4*Q^2))/(2*Q/w0);

    ## freq to be returned to match pass band
    w0 = sqrt (prod (Wpw));
    Q = w0 / diff (Wpw);                      # BW at -Rp dB not at -3dB
    wc = Wpw;
    W_prime = w_prime_p(1) / wc(1);           # same with w_prime(2)/wc(2)
    wa = abs (W_prime + sqrt (W_prime ^ 2 + 4 * Q ^ 2)) / (2 * Q / w0);
    wb = abs (W_prime - sqrt (W_prime ^ 2 + 4 * Q ^ 2)) / (2 * Q / w0);
    Wcw_p = [wb wa];

    ## freq to be returned to match stop band
    w0 = sqrt (prod (Wsw));
    Q = w0 / diff (Wsw);                      # BW at -Rs dB not at -3dB
    wc = Wsw;
    W_prime = w_prime_s(1) / wc(1);           # same with w_prime(2)/wc(2)
    wa = abs (W_prime + sqrt (W_prime ^ 2 + 4 * Q ^ 2)) / (2 * Q / w0);
    wb = abs (W_prime - sqrt (W_prime ^ 2 + 4 * Q ^ 2)) / (2 * Q / w0);
    Wcw_s = [wb wa];

  elseif (Wpw > Wsw)                          # High pass filter
    Wcw_s = Wsw;                              #   to match stop band
    Wcw_p = Wpw / k;                          #   to match pass band
  else                                        # Low pass filter
    Wcw_s = Wsw;                              #   to match stop band
    Wcw_p = k * Wpw;                          #   to match pass band
  endif


  if (s_domain)                               # No prewarp for analog filter
    Wc_s = Wcw_s;
    Wc_p = Wcw_p;
  else
    ## sampling frequency of 2 Hz
    T = 2;
    Wc_s = atan (Wcw_s / (2 / T)) * (T / pi); # inv. prewarp after evt. symmetr.
    Wc_p = atan (Wcw_p / (2 / T)) * (T / pi); # inv. prewarp after evt. symmetr.
  endif

endfunction

%!demo
%! fs    = 44100;
%! fpass = 4000;
%! fstop = 10988;
%! Rpass     = 1;
%! Rstop     = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop)
%! [B, A] = cheby2 (N, Rstop, Wn_p);
%! SYS = tf (B, A, 1 / fs);
%! f = (0:fs/2)';
%! W = f * (2 * pi / fs);
%! [H, P] = bode (SYS, 2 * pi * f);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Chebyshev low-pass Typ II : matching pass band");
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
%! fpass = 4000;
%! fstop = 10988;
%! Rpass     = 1;
%! Rstop     = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop)
%! [B, A] = cheby2 (N, Rstop, Wn_s);
%! SYS = tf (B, A, 1 / fs);
%! f = (0:fs/2)';
%! W = f * (2 * pi / fs);
%! [H, P] = bode (SYS, 2 * pi * f);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Chebyshev low-pass Typ II : matching stop band");
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
%! fstop = 4000;
%! fpass = 10988;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop)
%! [B, A] = cheby2 (N, Rstop, Wn_p, "high");
%! f = (0:fs/2)';
%! W = f * (2 * pi / fs);
%! [H] = freqz (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Chebyshev high-pass Typ II : matching pass band");
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
%! fstop = 4000;
%! fpass = 10988;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop)
%! [B, A] = cheby2 (N, Rstop, Wn_s, "high");
%! f = (0:fs/2)';
%! W = f * (2 * pi / fs);
%! [H] = freqz (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Chebyshev high-pass Typ II : matching stop band");
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
%! fs = 44100;
%! fpass = [9500 9750];
%! fstop = [8500, 10052];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop)
%! [B, A] = cheby2 (N, Rstop, Wn_p);
%! f = (6000:14000)';
%! W = f * (2 * pi / fs);
%! [H] = freqz (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Chebyshev band-pass Typ II : matching pass band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! grid on;
%! ylim ([-80, 0]);

%!demo
%! fs = 44100;
%! fpass = [9500 9750];
%! fstop = [8500, 10052];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop)
%! [B, A] = cheby2 (N, Rstop, Wn_s);
%! f = (6000:14000)';
%! W = f * (2 * pi / fs);
%! [H] = freqz (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Chebyshev band-pass Typ II : matching stop band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! grid on;
%! ylim ([-80, 0]);

%!demo
%! fs = 44100;
%! fpass = [9500 9750];
%! fstop = [9182 12000];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop)
%! [B, A] = cheby2 (N, Rstop, Wn_p);
%! f = (6000:14000)';
%! W = f * (2 * pi / fs);
%! [H] = freqz (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Chebyshev band-pass Typ II : matching pass band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! grid on;
%! ylim ([-80, 0]);

%!demo
%! fs = 44100;
%! fpass = [9500 9750];
%! fstop = [9182 12000];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop)
%! [B, A] = cheby2 (N, Rstop, Wn_s);
%! f = (6000:14000)';
%! W = f * (2 * pi / fs);
%! [H] = freqz (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Chebyshev band-pass Typ II : matching stop band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! grid on;
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! fstop = [9875, 10126.5823];
%! fpass = [8500, 10834];
%! Rpass     = 0.5;
%! Rstop     = 40;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop)
%! [B, A] = cheby2 (N, Rstop, Wn_p, "stop");
%! f = (6000:14000)';
%! W = f * (2 * pi / fs);
%! [H] = freqz (B , A, W);
%! Ampl = abs (H);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Chebyshev notch Typ II : matching pass band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [min(f)  , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                               fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0, 0 ];
%! hold on;
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! fstop = [9875, 10126.5823];
%! fpass = [8500, 10834];
%! Rpass     = 0.5;
%! Rstop     = 40;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop)
%! [B, A] = cheby2 (N, Rstop, Wn_s, "stop");
%! f = (6000:14000)';
%! W = f * (2 * pi / fs);
%! [H] = freqz (B , A, W);
%! Ampl = abs (H);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Chebyshev notch Typ II : matching stop band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [min(f)  , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                               fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0, 0 ];
%! hold on;
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! fstop = [9875, 10126.5823];
%! fpass = [9182, 12000];
%! Rpass     = 0.5;
%! Rstop     = 40;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop)
%! [B, A] = cheby2 (N, Rstop, Wn_p, "stop");
%! f = (6000:14000)';
%! W = f * (2 * pi / fs);
%! [H] = freqz (B , A, W);
%! Ampl = abs (H);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Chebyshev notch Typ II : matching pass band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [min(f)  , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                               fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0, 0 ];
%! hold on;
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fs    = 44100;
%! fstop = [9875, 10126.5823];
%! fpass = [9182, 12000];
%! Rpass     = 0.5;
%! Rstop     = 40;
%! Wpass = 2 / fs * fpass;
%! Wstop = 2 / fs * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop)
%! [B, A] = cheby2 (N, Rstop, Wn_s, "stop");
%! f = (6000:14000)';
%! W = f * (2 * pi / fs);
%! [H] = freqz (B , A, W);
%! Ampl = abs (H);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Digital Chebyshev notch Typ II : matching stop band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [min(f)  , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [min(f)  , fstop(1), fstop(1), fstop(2), ...
%!                                               fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0, 0 ];
%! hold on;
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fpass = 4000;
%! fstop = 13584;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop, "s")
%! [B, A] = cheby2 (N, Rstop, Wn_p, "s");
%! f = 1000:10:100000;
%! W = 2 * pi * f;
%! [H] = freqs (B, A, W);
%! semilogx (f, 20 * log10 (abs (H)));
%! title ("Analog Chebyshev low-pass Typ II : matching pass band");
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
%! fstop = 13584;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop, "s")
%! [B, A] = cheby2 (N, Rstop, Wn_s, "s");
%! f = 1000:10:100000;
%! W = 2 * pi * f;
%! [H] = freqs (B, A, W);
%! semilogx (f, 20 * log10 (abs (H)));
%! title ("Analog Chebyshev low-pass Typ II : matching stop band");
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
%! fpass = 13584;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop, "s")
%! [B, A] = cheby2 (N, Rstop, Wn_p, "high", "s");
%! f = 1000:10:100000;
%! W = 2 * pi * f;
%! [H] = freqs (B, A, W);
%! semilogx (f, 20 * log10 (abs (H)));
%! title ("Analog Chebyshev high-pass Typ II : matching pass band");
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
%! fpass = 13584;
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop, "s")
%! [B, A] = cheby2 (N, Rstop, Wn_s, "high", "s");
%! f = 1000:10:100000;
%! W = 2 * pi * f;
%! [H] = freqs (B, A, W);
%! semilogx (f, 20 * log10 (abs (H)));
%! title ("Analog Chebyshev high-pass Typ II : matching stop band");
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
%! fstop = [9000, 10437];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop, "s")
%! [B, A] = cheby2 (N, Rstop, Wn_p, "s");
%! f = 6000:14000;
%! W = 2 * pi * f;
%! [H] = freqs (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Chebyshev band-pass Typ II : matching pass band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! grid on;
%! ylim ([-80, 0]);

%!demo
%! fpass = [9875, 10126.5823];
%! fstop = [9000, 10437];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop, "s")
%! [B, A] = cheby2 (N, Rstop, Wn_s, "s");
%! f = 6000:14000;
%! W = 2 * pi * f;
%! [H] = freqs (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Chebyshev band-pass Typ II : matching stop band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! grid on;
%! ylim ([-80, 0]);

%!demo
%! fpass = [9875, 10126.5823];
%! fstop = [9581, 12000];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop, "s")
%! [B, A] = cheby2 (N, Rstop, Wn_p, "s");
%! f = 6000:14000;
%! W = 2 * pi * f;
%! [H] = freqs (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Chebyshev band-pass Typ II : matching pass band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! grid on;
%! ylim ([-80, 0]);

%!demo
%! fpass = [9875, 10126.5823];
%! fstop = [9581, 12000];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop, "s")
%! [B, A] = cheby2 (N, Rstop, Wn_s, "s");
%! f = 6000:14000;
%! W = 2 * pi * f;
%! [H] = freqs (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Chebyshev band-pass Typ II : matching stop band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_bp_pass_x = [fpass(1), fpass(1), fpass(2), fpass(2)];
%! outline_bp_pass_y = [-80     , -Rpass  , -Rpass  , -80];
%! outline_bp_stop_x = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                                    fstop(2), max(f)];
%! outline_bp_stop_y = [-Rstop  , -Rstop  , 0       , 0       , ...
%!                                                    -Rstop  , -Rstop];
%! hold on
%! plot (outline_bp_pass_x, outline_bp_pass_y, "m");
%! plot (outline_bp_stop_x, outline_bp_stop_y, "m");
%! grid on;
%! ylim ([-80, 0]);

%!demo
%! fstop = [9875, 10126.5823];
%! fpass = [9000, 10437];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop, "s")
%! [B, A] = cheby2 (N, Rstop, Wn_p, "stop", "s");
%! f = 6000:14000;
%! W = 2 * pi * f;
%! [H] = freqs (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Chebyshev notch Typ II : matching pass band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [f(2)    , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                               fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0, 0 ];
%! hold on
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fstop = [9875, 10126.5823];
%! fpass = [9000, 10437];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop, "s")
%! [B, A] = cheby2 (N, Rstop, Wn_s, "stop", "s");
%! f = 6000:14000;
%! W = 2 * pi * f;
%! [H] = freqs (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Chebyshev notch Typ II : matching stop band, limit on upper freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [f(2)    , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                               fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0, 0 ];
%! hold on
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fstop = [9875, 10126.5823];
%! fpass = [9581 12000];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop, "s")
%! [B, A] = cheby2 (N, Rstop, Wn_p, "stop", "s");
%! f = 6000:14000;
%! W = 2 * pi * f;
%! [H] = freqs (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Chebyshev notch Typ II : matching pass band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [f(2)    , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                               fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0, 0 ];
%! hold on
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);

%!demo
%! fstop = [9875, 10126.5823];
%! fpass = [9581 12000];
%! Rpass = 1;
%! Rstop = 26;
%! Wpass = 2 * pi * fpass;
%! Wstop = 2 * pi * fstop;
%! [N, Wn_p, Wn_s] = cheb2ord (Wpass, Wstop, Rpass, Rstop, "s")
%! [B, A] = cheby2 (N, Rstop, Wn_s, "stop", "s");
%! f = 6000:14000;
%! W = 2 * pi * f;
%! [H] = freqs (B, A, W);
%! plot (f, 20 * log10 (abs (H)));
%! title ("Analog Chebyshev notch Typ II : matching stop band, limit on lower freq");
%! xlabel ("Frequency (Hz)");
%! ylabel ("Attenuation (dB)");
%! grid on;
%! outline_notch_pass_x_a = [f(2)    , fpass(1), fpass(1)];
%! outline_notch_pass_x_b = [fpass(2), fpass(2), max(f)];
%! outline_notch_pass_y_a = [-Rpass  , -Rpass  , -80];
%! outline_notch_pass_y_b = [-80     , -Rpass  , -Rpass];
%! outline_notch_stop_x   = [f(2)    , fstop(1), fstop(1), fstop(2), ...
%!                                               fstop(2), max(f)];
%! outline_notch_stop_y   = [0       , 0       , -Rstop  , -Rstop  , 0, 0 ];
%! hold on
%! plot (outline_notch_pass_x_a, outline_notch_pass_y_a, "m");
%! plot (outline_notch_pass_x_b, outline_notch_pass_y_b, "m");
%! plot (outline_notch_stop_x, outline_notch_stop_y, "m");
%! ylim ([-80, 0]);


%% Test input validation
%!error cheb2ord ()
%!error cheb2ord (.1)
%!error cheb2ord (.1, .2)
%!error cheb2ord (.1, .2, 3)
%!error cheb2ord ([.1 .1], [.2 .2], 3, 4)
%!error cheb2ord ([.1 .2], [.5 .6], 3, 4)
%!error cheb2ord ([.1 .5], [.2 .6], 3, 4)

%!test
%! # Ana BP
%! [N, Wn_p, Wn_s] = cheb2ord (2 * pi * [9875, 10126.5823], ...
%!                             2 * pi * [9000, 10437], 1, 26, "s");
%! assert (N, 3);
%! assert (round (Wn_p), [61074, 64640]);
%! assert (round (Wn_s), [60201, 65578]);

%!test
%! # Ana BP
%! [N, Wn_p, Wn_s] = cheb2ord (2 * pi * [9875, 10126.5823], ...
%!                             2 * pi * [9581 12000], 1, 26, "s");
%! assert (N, 3);
%! assert (round (Wn_p), [61074, 64640]);
%! assert (round (Wn_s), [60199, 65580]);

%!test
%! # Ana HP
%! [N, Wn_p, Wn_s] = cheb2ord (2 * pi * 13584, 2 * pi * 4000, 1, 26, "s");
%! assert (N, 3);
%! assert (round (Wn_p), 37832);
%! assert (round (Wn_s), 25133);

%!test
%! # Ana LP
%! [N, Wn_p, Wn_s] = cheb2ord (2 * pi * 4000, 2 * pi * 13584, 1, 26, "s");
%! assert (N, 3);
%! assert (round (Wn_p), 56700);
%! assert (round (Wn_s), 85351);

%!test
%! # Ana Notch
%! [N, Wn_p, Wn_s] = cheb2ord (2 * pi * [9000, 10437], ...
%!                             2 * pi * [9875, 10126.5823], 1, 26, "s");
%! assert (N, 3);
%! assert (round (Wn_p), [61652, 64035]);
%! assert (round (Wn_s), [62046, 63627]);

%!test
%! # Ana Notch
%! [N, Wn_p, Wn_s] = cheb2ord (2 * pi * [9581, 12000], ...
%!                             2 * pi * [9875, 10126.5823], 1, 26, "s");
%! assert (N, 3);
%! assert (round (Wn_p), [61651, 64036]);
%! assert (round (Wn_s), [62046, 63627]);

%!test
%! # Dig BP
%! fs = 44100;
%! [N, Wn_p, Wn_s] = cheb2ord (2 / fs * [9500, 9750], ...
%!                             2 / fs * [8500, 10052], 1, 26);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (N, 3);
%! assert (round (Wn_p), [9344, 9908]);
%! assert (round (Wn_s), [9203, 10052]);

%!test
%! # Dig BP
%! fs = 44100;
%! [N, Wn_p, Wn_s] = cheb2ord (2 / fs * [9500, 9750], ...
%!                             2 / fs * [9182, 12000], 1, 26);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (N, 3);
%! assert (round (Wn_p), [9344, 9908]);
%! assert (round (Wn_s), [9182, 10073]);

%!test
%! # Dig HP
%! fs = 44100;
%! [N, Wn_p, Wn_s] = cheb2ord (2 / fs * 10988, 2 / fs * 4000, 1, 26);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (N, 3);
%! assert (round (Wn_p), 5829);
%! assert (round (Wn_s), 4000);

%!test
%! # Dig LP
%! fs = 44100;
%! [N, Wn_p, Wn_s] = cheb2ord (2 / fs * 4000, 2 / fs * 10988, 1, 26);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (N, 3);
%! assert (round (Wn_p), 8197);
%! assert (round (Wn_s), 10988);

%!test
%! # Dig Notch
%! fs = 44100;
%! [N, Wn_p, Wn_s] = cheb2ord (2 / fs * [8500, 10834], ...
%!                             2 / fs * [9875,  10126.5823], 0.5, 40);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (N, 3);
%! assert (round (Wn_p), [9804, 10198]);
%! assert (round (Wn_s), [9875, 10127]);

%!test
%! # Dig Notch
%! fs = 44100;
%! [N, Wn_p, Wn_s] = cheb2ord (2 / fs * [9182 12000], ...
%!                             2 / fs * [9875,  10126.5823], 0.5, 40);
%! Wn_p = Wn_p * fs / 2;
%! Wn_s = Wn_s * fs / 2;
%! assert (N, 3);
%! assert (round (Wn_p), [9804, 10198]);
%! assert (round (Wn_s), [9875, 10127]);
