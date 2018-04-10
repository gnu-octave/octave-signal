## Copyright (C) 2001 Paulo Neis <p_neis@yahoo.com.br>
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
## @deftypefnx {Function File} {@var{n} =} ellipord ([@var{wp1}, @var{wp2}], [@var{ws1}, @var{ws2}], @var{rp}, @var{rs}, 's')
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
## For Laplace space filters, an additional input parameter ('s') must be entered.
## In that case W is in rad/s.
##
## Reference: Lamar, Marcus Vinicius, @cite{Notas de aula da disciplina TE 456 -
## Circuitos Analogicos II}, UFPR, 2001/2002.
## @seealso{buttord, cheb1ord, cheb2ord, ellip}
## @end deftypefn

function [n, Wp] = ellipord(Wp, Ws, Rp, Rs, opt)

  if (nargin != 4 && nargin != 5)
    print_usage ();
  endif;

  if (nargin == 5 && strcmp(opt,'s'))
    s_domain = 1;
  else
    s_domain = 0;
  endif;

  if s_domain == 0
    validate_filter_bands ("ellipord", Wp, Ws);
  else
    validate_filter_bandss ("ellipord", Wp, Ws);
  endif

  if s_domain == 1
    Wpw = Wp; # No prewarp in case of analog filter
    Wsw = Ws; # No prewarp in case of analog filter
  else
    ## sampling frequency of 2 Hz
    T = 2;

    Wpw = (2/T)*tan(pi.*Wp./T); # prewarp
    Wsw = (2/T)*tan(pi.*Ws./T); # prewarp
  endif

  ## pass/stop band to low pass filter transform:
  if (length(Wpw)==2 && length(Wsw)==2)

    if Wpw(1) > Wsw(1) % Band pass filter

      if Wpw(1)*Wpw(2) < Wsw(1)*Wsw(2)  %Modify band edges if not symmetrical
        Wsw(2) = Wpw(1)*Wpw(2)/Wsw(1); % smaller stopband
        %Wpw(2) = Wsw(1)*Wsw(2)/Wpw(1); % larger passband (less efficient for BP)
      else
        Wsw(1) = Wpw(1)*Wpw(2)/Wsw(2); % smaller stopband
        %Wpw(1) = Wsw(1)*Wsw(2)/Wpw(2); % larger stopband (less efficient for BP)
      end;

      w02 = Wpw(1)*Wpw(2);
      wp=Wpw(2)-Wpw(1);
      ws=Wsw(2)-Wsw(1);

    else               % Notch filter

      if Wpw(1)*Wpw(2) > Wsw(1)*Wsw(2)  %Modify band edges if not symmetrical
        %Wsw(2) = Wpw(1)*Wpw(2)/Wsw(1); % larger stopband
        Wpw(2) = Wsw(1)*Wsw(2)/Wpw(1); % smaller passband (less efficient for notch)
      else
        %Wsw(1) = Wpw(1)*Wpw(2)/Wsw(2); % larger stopband
        Wpw(1) = Wsw(1)*Wsw(2)/Wpw(2); % smaller passband (less efficient for notch)
      end;

      w02 = Wpw(1)*Wpw(2);
      wp=w02/(Wpw(2)-Wpw(1));
      ws=w02/(Wsw(2)-Wsw(1));
    end
    ws=ws/wp;
    wp=1;

  elseif (Wpw > Wsw)   % High pass filter
    wp = Wsw;
    ws = Wpw;
  else                 % Low pass filter
    wp = Wpw;
    ws = Wsw;
  end


  k=wp/ws;
  k1=sqrt(1-k^2);
  q0=(1/2)*((1-sqrt(k1))/(1+sqrt(k1)));
  q= q0 + 2*q0^5 + 15*q0^9 + 150*q0^13; #(....)
  D=(10^(0.1*Rs)-1)/(10^(0.1*Rp)-1);

  n=ceil(log10(16*D)/log10(1/q));

  if s_domain == 1 # No prewarp in case of analog filter
    Wp = Wpw;
  else
    ## sampling frequency of 2 Hz
    T = 2;
    Wp = atan(Wpw/(2/T)) * (T/pi); # inverse prewarp after evt. symmetrisation
  end

endfunction

%% Test input validation
%!error ellipord ()
%!error ellipord (.1)
%!error ellipord (.1, .2)
%!error ellipord (.1, .2, 3)
%!error ellipord (.1, .2, 3, 4, 5)
%!error ellipord ([.1 .1], [.2 .2], 3, 4)
%!error ellipord ([.1 .2], [.5 .6], 3, 4)
%!error ellipord ([.1 .5], [.2 .6], 3, 4)
