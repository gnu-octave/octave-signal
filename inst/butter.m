## Copyright (C) 1999 Paul Kienzle <pkienzle@users.sf.net>
## Copyright (C) 2003 Doug Stewart <dastew@sympatico.ca>
## Copyright (C) 2011 Alexander Klein <alexander.klein@math.uni-giessen.de>
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
## @deftypefn  {Function File} {[@var{b}, @var{a}] =} butter (@var{n}, @var{wc})
## @deftypefnx {Function File} {[@var{b}, @var{a}] =} butter (@var{n}, @var{wc}, @var{filter_type})
## @deftypefnx {Function File} {[@var{z}, @var{p}, @var{g}] =} butter (@dots{})
## @deftypefnx {Function File} {[@var{a}, @var{b}, @var{c}, @var{d}] =} butter (@dots{})
## @deftypefnx {Function File} {[@dots{}] =} butter (@dots{}, "s")
## Generate a Butterworth filter.
## Default is a discrete space (Z) filter.
##
## The cutoff frequency, @var{wc} should be specified in radians for
## analog filters.  For digital filters, it must be a value between zero
## and one.  For bandpass filters, @var{wc} is a two-element vector
## with @code{w(1) < w(2)}.
##
## The filter type must be one of @qcode{"low"}, @qcode{"high"},
## @qcode{"bandpass"}, or @qcode{"stop"}.  The default is @qcode{"low"}
## if @var{wc} is a scalar and @qcode{"bandpass"} if @var{wc} is a
## two-element vector.
##
## If the final input argument is @qcode{"s"} design an analog Laplace
## space filter.
##
## Low pass filter with cutoff @code{pi*Wc} radians:
##
## @example
## [b, a] = butter (n, Wc)
## @end example
##
## High pass filter with cutoff @code{pi*Wc} radians:
##
## @example
## [b, a] = butter (n, Wc, "high")
## @end example
##
## Band pass filter with edges @code{pi*Wl} and @code{pi*Wh} radians:
##
## @example
## [b, a] = butter (n, [Wl, Wh])
## @end example
##
## Band reject filter with edges @code{pi*Wl} and @code{pi*Wh} radians:
##
## @example
## [b, a] = butter (n, [Wl, Wh], "stop")
## @end example
##
## Return filter as zero-pole-gain rather than coefficients of the
## numerator and denominator polynomials:
##
## @example
## [z, p, g] = butter (@dots{})
## @end example
##
## Return a Laplace space filter, @var{Wc} can be larger than 1:
##
## @example
## [@dots{}] = butter (@dots{}, "s")
## @end example
##
## Return state-space matrices:
##
## @example
## [a, b, c, d] = butter (@dots{})
## @end example
##
## References:
##
## Proakis & Manolakis (1992). Digital Signal Processing. New York:
## Macmillan Publishing Company.
## @end deftypefn

function [a, b, c, d] = butter (n, wc, varargin)

  if (nargin > 4 || nargin < 2 || nargout > 4)
    print_usage ();
  endif

  type = "lowpass";
  stop = false;
  digital = true;

  if (! (isscalar (n) && (n == fix (n)) && (n > 0)))
    error ("butter: filter order N must be a positive integer");
  endif

  if (! isvector (wc) || numel (wc) > 2)
    error ("butter: cutoff frequency must be given as WC or [WL, WH]");
  endif

  if (numel (wc) == 2)
    if (wc(1) > wc(2))
      error ("butter: W(1) must be less than W(2)");
    endif
    type = "bandpass";
    stop = false;
  endif

  ## Is final argument "s" (or "z")?
  if (numel (varargin) > 0)
    switch (varargin{end})
      case "s"
        digital = false;
        varargin(end) = [];
      case "z"
        ## This is the default setting.
        ## Accept "z" for backward compatibility with older versions
        ## of Octave's signal processing package.
        varargin(end) = [];
    endswitch
  endif

  ## Is filter type specified?
  if (numel (varargin) > 0)
    switch (varargin{end})
      case {"high", "stop"}
        type = varargin{end};
        stop = true;
        varargin(end) = [];
      case {"low", "bandpass"}
        type = varargin{end};
        stop = false;
        varargin(end) = [];
      case "pass"
        ## Accept "pass" for backward compatibility with older versions
        ## of Octave's signal processing package.
        type = "bandpass";
        stop = false;
        varargin(end) = [];
      otherwise
        error ("butter: expected 'high', 'stop', 'low', 'bandpass', or 's'");
    endswitch
  endif

  if (numel (varargin) > 0)
    ## Invalid arguments.  For example: butter (n, wc, "s", "high").
    print_usage ();
  endif

  switch (type)
    case {"stop", "bandpass"}
      if (numel (wc) != 2)
        error ("butter: Wc must be two elements for stop and bandpass filters");
      endif
  endswitch

  if (digital && ! all ((wc >= 0) & (wc <= 1)))
    error ("butter: all elements of Wc must be in the range [0,1]");
  elseif (! digital && ! all (wc >= 0))
    error ("butter: all elements of Wc must be in the range [0,inf]");
  endif

  ## Prewarp to the band edges to s plane
  if (digital)
    T = 2;       # sampling frequency of 2 Hz
    wc = 2 / T * tan (pi * wc / T);
  endif

  ## Generate splane poles for the prototype Butterworth filter
  ## source: Kuc
  C = 1;  ## default cutoff frequency
  pole = C * exp (1i * pi * (2 * [1:n] + n - 1) / (2 * n));
  if (mod (n, 2) == 1)
    pole((n + 1) / 2) = -1;  ## pure real value at exp(i*pi)
  endif
  zero = [];
  gain = C^n;

  ## splane frequency transform
  [zero, pole, gain] = sftrans (zero, pole, gain, wc, stop);

  ## Use bilinear transform to convert poles to the z plane
  if (digital)
    [zero, pole, gain] = bilinear (zero, pole, gain, T);
  endif

  ## convert to the correct output form
  ## note that poly always outputs a row vector
  if (nargout <= 2)
    a = real (gain * poly (zero));
    b = real (poly (pole));
  elseif (nargout == 3)
    a = zero(:);
    b = pole(:);
    c = gain;
  else
    ## output ss results
    [a, b, c, d] = zp2ss (zero, pole, gain);
  endif

endfunction

%!shared sf, sf2, off_db
%! off_db = 0.5;
%! ## Sampling frequency must be that high to make the low pass filters pass.
%! sf = 6000; sf2 = sf/2;
%! data=[sinetone(5,sf,10,1),sinetone(10,sf,10,1),sinetone(50,sf,10,1),sinetone(200,sf,10,1),sinetone(400,sf,10,1)];

%!test
%! ## Test low pass order 1 with 3dB @ 50Hz
%! data=[sinetone(5,sf,10,1),sinetone(10,sf,10,1),sinetone(50,sf,10,1),sinetone(200,sf,10,1),sinetone(400,sf,10,1)];
%! [b, a] = butter ( 1, 50 / sf2 );
%! filtered = filter ( b, a, data );
%! damp_db = 20 * log10 ( max ( filtered ( end - sf : end, : ) ) );
%! assert ( [ damp_db( 4 ) - damp_db( 5 ), damp_db( 1 : 3 ) ], [ 6 0 0 -3 ], off_db )

%!test
%! ## Test low pass order 4 with 3dB @ 50Hz
%! data=[sinetone(5,sf,10,1),sinetone(10,sf,10,1),sinetone(50,sf,10,1),sinetone(200,sf,10,1),sinetone(400,sf,10,1)];
%! [b, a] = butter ( 4, 50 / sf2 );
%! filtered = filter ( b, a, data );
%! damp_db = 20 * log10 ( max ( filtered ( end - sf : end, : ) ) );
%! assert ( [ damp_db( 4 ) - damp_db( 5 ), damp_db( 1 : 3 ) ], [ 24 0 0 -3 ], off_db )

%!test
%! ## Test high pass order 1 with 3dB @ 50Hz
%! data=[sinetone(5,sf,10,1),sinetone(10,sf,10,1),sinetone(50,sf,10,1),sinetone(200,sf,10,1),sinetone(400,sf,10,1)];
%! [b, a] = butter ( 1, 50 / sf2, "high" );
%! filtered = filter ( b, a, data );
%! damp_db = 20 * log10 ( max ( filtered ( end - sf : end, : ) ) );
%! assert ( [ damp_db( 2 ) - damp_db( 1 ), damp_db( 3 : end ) ], [ 6 -3 0 0 ], off_db )

%!test
%! ## Test high pass order 4 with 3dB @ 50Hz
%! data=[sinetone(5,sf,10,1),sinetone(10,sf,10,1),sinetone(50,sf,10,1),sinetone(200,sf,10,1),sinetone(400,sf,10,1)];
%! [b, a] = butter ( 4, 50 / sf2, "high" );
%! filtered = filter ( b, a, data );
%! damp_db = 20 * log10 ( max ( filtered ( end - sf : end, : ) ) );
%! assert ( [ damp_db( 2 ) - damp_db( 1 ), damp_db( 3 : end ) ], [ 24 -3 0 0 ], off_db )

%% Test input validation
%!error [a, b] = butter ()
%!error [a, b] = butter (1)
%!error [a, b] = butter (1, 2, 3, 4, 5)
%!error [a, b] = butter (.5, .2)
%!error [a, b] = butter (3, .2, "invalid")

%!error [a, b] = butter (9, .6, "stop")
%!error [a, b] = butter (9, .6, "bandpass")

%!error [a, b] = butter (9, .6, "s", "high")

%% Test output orientation
%!test
%! butter (9, .6);
%! assert (isrow (ans));
%!test
%! A = butter (9, .6);
%! assert (isrow (A));
%!test
%! [A, B] = butter (9, .6);
%! assert (isrow (A));
%! assert (isrow (B));
%!test
%! [z, p, g] = butter (9, .6);
%! assert (iscolumn (z));
%! assert (iscolumn (p));
%! assert (isscalar (g));
%!test
%! [a, b, c, d] = butter (9, .6);
%! assert (ismatrix (a));
%! assert (iscolumn (b));
%! assert (isrow (c));
%! assert (isscalar (d));

%!demo
%! sf = 800; sf2 = sf/2;
%! data=[[1;zeros(sf-1,1)],sinetone(25,sf,1,1),sinetone(50,sf,1,1),sinetone(100,sf,1,1)];
%! [b,a]=butter ( 1, 50 / sf2 );
%! filtered = filter(b,a,data);
%!
%! clf
%! subplot ( columns ( filtered ), 1, 1)
%! plot(filtered(:,1),";Impulse response;")
%! subplot ( columns ( filtered ), 1, 2 )
%! plot(filtered(:,2),";25Hz response;")
%! subplot ( columns ( filtered ), 1, 3 )
%! plot(filtered(:,3),";50Hz response;")
%! subplot ( columns ( filtered ), 1, 4 )
%! plot(filtered(:,4),";100Hz response;")

