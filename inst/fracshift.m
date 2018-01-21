## Copyright (C) 2008 Eric Chassande-Mottin
## Copyright (C) 2018 Juan Pablo Carbajal
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

## Author: Eric Chassande-Mottin, CNRS (France) <ecm@apc.univ-paris7.fr>

## -*- texinfo -*-
## @deftypefn  {Function File} {[@var{y}, @var{h}] =} fracshift (@var{x}, @var{d})
## @deftypefnx {Function File} {@var{y} =} fracshift (@var{x}, @var{d}, @var{h})
## Shift the series @var{x} by a (possibly fractional) number of samples @var{d}.
## The interpolator @var{h} is either specified or either designed with a
## Kaiser-windowed sinecard.
## @seealso{circshift}
## @end deftypefn

## Ref [1] A. V. Oppenheim, R. W. Schafer and J. R. Buck,
## Discrete-time signal processing, Signal processing series,
## Prentice-Hall, 1999
##
## Ref [2] T.I. Laakso, V. Valimaki, M. Karjalainen and U.K. Laine
## Splitting the unit delay, IEEE Signal Processing Magazine,
## vol. 13, no. 1, pp 30--59 Jan 1996

function  [y, h] = fracshift( x, d, h = [])

  if (nargin > 3 || nargin < 2)
    print_usage;
  endif;

  ## check if filter is a vector
  if ~isempty (h) && ~isvector (h)
    error ('Octave:invalid-input-arg', ...
           'fracshift.m: the filter h should be a vector');
  endif

  ## check if input is a row vector
  isrowvector = false;
  if ((rows (x) == 1) && (columns (x) > 1))
    x = x(:);
    isrowvector = true;
  endif

  ## if required, filter design using reference [1]
  if isempty (h)
    h = design_filter (d);
  endif

  Lx = length (x);
  Lh = length (h);
  L  = ( Lh - 1 ) / 2.0;
  Ly = Lx;

  ## pre and postpad filter response
  hpad   = prepad (h, Lh);
  offset = floor (L);
  hpad   = postpad (hpad, Ly + offset);

  ## filtering
  xfilt = upfirdn (x, hpad, 1, 1);
  y     = xfilt((offset + 1):(offset + Ly), :);

  ## if the delay is an exact integer, use circshift
  if d == fix (d)
    y = circshift (x, d);
  else
    y = circshift (y, fix (d));
  endif

  if isrowvector,
    y = y.';
  endif

endfunction

function h = design_filter (d)
  ## properties of the interpolation filter
  log10_rejection   = -3.0;
  ## use empirical formula from [1] Chap 7, Eq. (7.63) p 476
  rejection_dB = -20.0 * log10_rejection;
  ## determine parameter of Kaiser window
  ## use empirical formula from [1] Chap 7, Eq. (7.62) p 474
  ## FIXME since the parameters are fix the conditional below is not needed
  if ((rejection_dB >= 21) && (rejection_dB <= 50))
    beta = 0.5842 * (rejection_dB - 21.0) ^ 0.4 + ...
            0.07886 * (rejection_dB - 21.0);
  elseif (rejection_dB > 50)
    beta = 0.1102 * (rejection_dB - 8.7);
  else
    beta = 0.0;
  endif
  ## properties of the interpolation filter
  stopband_cutoff_f = 0.5;
  roll_off_width    = stopband_cutoff_f / 10;

  ## ideal sinc filter
  ## determine filter length
  L = ceil ((rejection_dB - 8.0) / (28.714 * roll_off_width));
  t = (-L:L).';
  ideal_filter = 2 * stopband_cutoff_f * ...
                     sinc (2 * stopband_cutoff_f * (t - (d - fix (d))));

  ## apodize ideal (sincard) filter response
  m = 2 * L;
  t = (0:m).' - (d - fix (d));
  t = 2 * beta / m * sqrt (t .* (m - t));
  w = besseli (0, t) / besseli (0, beta);
  h = w .* ideal_filter;
endfunction

%!test
%! d  = [1.5 7/6];
%! N  = 1024;
%! t  = ((0:N-1)-N/2).';
%! tt = t - d;
%! err1= err2 = zeros(N/2,1);
%! for n = 0:N/2-1,
%!   phi0      = 2*pi*rand;
%!   f0        = n/N;
%!   sigma     = N/4;
%!   x         = exp(-t.^2/(2*sigma)).*sin(2*pi*f0*t + phi0);
%!   xx        = exp(-tt.^2/(2*sigma)).*sin(2*pi*f0*tt + phi0);
%!   [y,h]     = fracshift(x, d(1));
%!   err1(n+1) = max (abs (y - xx(:,1)));
%!   [y,h]     = fracshift(x, d(2));
%!   err2(n+1) = max (abs (y - xx(:,2)));
%! endfor
%! rolloff    = .1;
%! rejection  = 10^-3;
%! idx_inband = 1:ceil((1-rolloff)*N/2)-1;
%! assert (max (err1(idx_inband)) < rejection);
%! assert (max (err2(idx_inband)) < rejection);

%!test
%! N  = 1024;
%! p  = 6;
%! q  = 7;
%! d1 = 64;
%! d2 = d1*p/q;
%! t  = 128;
%!
%! [b a] = butter (10,.25);
%! n = zeros (N, 1);
%! n(N/2+(-t:t)) = randn(2*t+1,1);
%! n  =  filter(b,a,n);
%! n1 = fracshift(n,d1);
%! n1 = resample(n1,p,q);
%! n2 = resample(n,p,q);
%! n2 = fracshift(n2,d2);
%! err = abs (n2 - n1);
%! rejection = 10^-3;
%! assert(max (err) < rejection);

%!test #integer shift similar similar to non-integer
%! N = 1024;
%! t = linspace(0, 1, N).';
%! x = exp(-t.^2/2/0.25^2).*sin(2*pi*10*t);
%! d  = 10;
%! y = fracshift(x, d);
%! yh = fracshift(x, d+1e-8);
%! assert(y, yh, 1e-8)

%!test #bug 52758
%! x = [0 1 0 0 0 0 0 0];
%! y = fracshift(x, 1);
%! assert (size(x) == size(y))

%!test #bug 47387
%! N = 1024;
%! t = linspace(0, 1, N).';
%! x = exp(-t.^2/2/0.25^2).*sin(2*pi*10*t);
%! dt = 0.25;
%! d  = dt / (t(2) - t(1));
%! y = fracshift(x, d);
%! L = 37;
%! _t = (-L:L).';
%! ideal_filter = sinc (_t - (d - fix (d)));
%! m = 2 * L;
%! _t = (0:m).' - (d - fix (d));
%! beta = 5.6533;
%! _t = 2 * beta / m * sqrt (_t .* (m - _t));
%! w = besseli (0, _t) / besseli (0, beta);
%! h = w .* ideal_filter;
%! yh = fracshift(x, d, h);
%! assert(y, yh, 1e-8)

%!demo
%! N = 1024;
%! t = linspace (0, 1, N).';
%! x = exp(-t.^2/2/0.25^2).*sin(2*pi*10*t);
%!
%! dt = 0.25;
%! d  = dt / (t(2) - t(1));
%! y = fracshift(x, d);
%!
%! plot(t,y,'r-;shifted;', t, x, 'k-;original;')
%! axis tight
%! xlabel ('time')
%! ylabel ('signal')
