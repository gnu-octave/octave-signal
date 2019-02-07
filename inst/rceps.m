## Copyright (C) 1999 Paul Kienzle <pkienzle@users.sf.net>
## Copyright (C) 2019 Mike Miller
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
## @deftypefn {Function File} {[@var{y}, @var{ym}] =} rceps (@var{x})
## Return the cepstrum of the signal @var{x}.
##
## If @var{x} is a matrix, return the cepstrum of each column.
##
## If called with two output arguments, the minimum phase reconstruction of
## the signal @var{x} is returned in @var{ym}.
##
## For example:
##
## @example
## @group
## f0 = 70; Fs = 10000;            # 100 Hz fundamental, 10kHz sampling rate
## a = poly (0.985 * exp (1i * pi * [0.1, -0.1, 0.3, -0.3])); # two formants
## s = 0.005 * randn (1024, 1);    # Noise excitation signal
## s(1:Fs/f0:length(s)) = 1;       # Impulse glottal wave
## x = filter (1, a, s);           # Speech signal
## [y, ym] = rceps (x .* hanning (1024));
## @end group
## @end example
##
## Reference: @cite{Programs for Digital Signal Processing}, IEEE Press,
## John Wiley & Sons, New York, 1979.
## @end deftypefn

function [y, ym] = rceps (x)

  if (nargin != 1)
    print_usage ();
  endif

  f = abs (fft (x));
  if (any (f == 0))
    error ("rceps: the spectrum of x contains zeros, unable to compute real cepstrum");
  endif

  y = real (ifft (log (f)));

  if (nargout == 2)
    n = length (x);
    if (rows (x) == 1)
      if (rem (n,2) == 1)
        ym = [y(1), 2 * y(2:fix (n/2) + 1), zeros(1, fix (n/2))];
      else
        ym = [y(1), 2 * y(2:n/2), y(n/2 + 1), zeros(1, n/2 - 1)];
      endif
    else
      if (rem (n,2) == 1)
        ym = [y(1,:); 2 * y(2:fix (n/2) + 1,:); zeros(fix (n/2), columns (y))];
      else
        ym = [y(1,:); 2 * y(2:n/2,:); y(n/2 + 1,:); zeros(n/2 - 1, columns (y))];
      endif
    endif

    ym = real (ifft (exp (fft (ym))));
  endif

endfunction

%!test
%! ## accepts matrices
%! x = randn (32, 3);
%! [y, xm] = rceps (x);
%! ## check the mag-phase response of the reproduction
%! hx = fft (x);
%! hxm = fft (xm);
%! assert (abs (hx), abs (hxm), 200*eps); # good magnitude response match
%! ## FIXME: test for minimum phase?  Stop using random datasets!
%! #assert (arg (hx) != arg (hxm));        # phase mismatch

%!test
%! ## accepts column and row vectors
%! x = randn (256, 1);
%! [y, xm] = rceps (x);
%! [yt, xmt] = rceps (x.');
%! assert (yt.', y, 1e-14);
%! assert (xmt.', xm, 1e-14);

## Test that an odd-length input produces an odd-length output
%!test
%! x = randn (33, 4);
%! [y, xm] = rceps (x);
%! assert (size (y), size (x));
%! assert (size (xm), size (x));

## Test input validation
%!error rceps
%!error rceps (1, 2)
%!error rceps (0)
%!error rceps (zeros (10, 1))

%!demo
%! f0 = 70; Fs = 10000;                 # 100 Hz fundamental, 10 kHz sampling rate
%! a = real (poly (0.985 * exp (1i * pi * [0.1, -0.1, 0.3, -0.3]))); # two formants
%! s = 0.05 * randn (1024, 1);          # Noise excitation signal
%! s(floor (1:Fs/f0:length (s))) = 1;   # Impulse glottal wave
%! x = filter (1, a, s);                # Speech signal in x
%! [y, xm] = rceps (x);                 # cepstrum and minimum phase x
%! [hx, w] = freqz (x, 1, [], Fs);
%! hxm = freqz (xm);
%! figure (1);
%! subplot (311);
%! len = 1000 * fix (min (length (x), length (xm)) / 1000);
%! plot ([0:len-1] * 1000 / Fs, x(1:len), "b;signal;", ...
%!       [0:len-1] * 1000 / Fs, xm(1:len), "g;reconstruction;");
%! ylabel ("Amplitude");
%! xlabel ("Time (ms)");
%! subplot (312);
%! axis ("ticy");
%! plot (w, log (abs (hx)), ";magnitude;", ...
%!       w, log (abs (hxm)), ";reconstruction;");
%! xlabel ("Frequency (Hz)");
%! subplot (313);
%! axis ("on");
%! plot (w, unwrap (arg (hx)) / (2 * pi), ";phase;", ...
%!       w, unwrap (arg (hxm)) / (2 * pi), ";reconstruction;");
%! xlabel ("Frequency (Hz)");
%! len = 1000 * fix (length (y) / 1000);
%! figure (2);
%! plot ([0:len-1] * 1000 / Fs, y(1:len), ";cepstrum;");
%! ylabel ("Amplitude");
%! xlabel ("Quefrency (ms)");
%! %-------------------------------------------------------------
%! % confirm the magnitude spectrum is identical in the signal
%! % and the reconstruction and that there are peaks in the
%! % cepstrum at 14 ms intervals corresponding to an F0 of 70 Hz.
