## Copyright (C) 1999-2000 Paul Kienzle <pkienzle@users.sf.net>
## Copyright (C) 2018 Mike Miller
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
## along with this program. If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} {} chirp (@var{t})
## @deftypefnx {Function File} {} chirp (@var{t}, @var{f0})
## @deftypefnx {Function File} {} chirp (@var{t}, @var{f0}, @var{t1})
## @deftypefnx {Function File} {} chirp (@var{t}, @var{f0}, @var{t1}, @var{f1})
## @deftypefnx {Function File} {} chirp (@var{t}, @var{f0}, @var{t1}, @var{f1}, @var{shape})
## @deftypefnx {Function File} {} chirp (@var{t}, @var{f0}, @var{t1}, @var{f1}, @var{shape}, @var{phase})
##
## Evaluate a chirp signal at time @var{t}.  A chirp signal is a frequency
## swept cosine wave.
##
## @table @var
## @item t
## vector of times to evaluate the chirp signal
## @item f0
## frequency at time t=0 [ 0 Hz ]
## @item t1
## time t1 [ 1 sec ]
## @item f1
## frequency at time t=t1 [ 100 Hz ]
## @item shape
## shape of frequency sweep
##    'linear'      f(t) = (f1-f0)*(t/t1) + f0
##    'quadratic'   f(t) = (f1-f0)*(t/t1)^2 + f0
##    'logarithmic' f(t) = (f1/f0)^(t/t1) * f0
## @item phase
## phase shift at t=0
## @end table
##
## For example:
##
## @example
## @group
## @c doctest: +SKIP
## specgram (chirp ([0:0.001:5]));  # default linear chirp of 0-100Hz in 1 sec
## specgram (chirp ([-2:0.001:15], 400, 10, 100, "quadratic"));
## soundsc (chirp ([0:1/8000:5], 200, 2, 500, "logarithmic"), 8000);
## @end group
## @end example
##
## If you want a different sweep shape f(t), use the following:
##
## @group
## @verbatim
## y = cos (2 * pi * integral (f(t)) + phase);
## @end verbatim
## @end group
## @end deftypefn

function y = chirp (t, f0, t1, f1, shape, phase)

  if (nargin < 1 || nargin > 6)
    print_usage ();
  endif

  if ((nargin < 2) || (isempty (f0)))
    ## The default value for f0 depends on the shape
    if ((nargin >= 5) && (ischar (shape)) && (numel (shape) >= 2) ...
        && (strncmpi (shape, "logarithmic", numel (shape))))
      f0 = 1e-6;
    else
      f0 = 0;
    endif
  endif

  if ((nargin < 3) || (isempty (t1)))
    t1 = 1;
  endif

  if ((nargin < 4) || (isempty (f1)))
    f1 = 100;
  endif

  if ((nargin < 5) || (isempty (shape)))
    shape = "linear";
  endif

  if ((nargin < 6) || (isempty (phase)))
    phase = 0;
  endif

  phase = 2 * pi * phase / 360;

  if ((numel (shape) >= 2) && (strncmpi (shape, "linear", numel (shape))))
    a = pi * (f1 - f0) / t1;
    b = 2 * pi * f0;
    y = cos (a * t.^2 + b * t + phase);
  elseif ((numel (shape) >= 1) ...
          && (strncmpi (shape, "quadratic", numel (shape))))
    a = (2/3 * pi * (f1 - f0) / t1 / t1);
    b = 2 * pi * f0;
    y = cos (a * t.^3 + b * t + phase);
  elseif ((numel (shape) >= 2) ...
          && (strncmpi (shape, "logarithmic", numel (shape))))
    a = 2 * pi * f0 * t1 / log (f1 / f0);
    x = (f1 / f0) .^ (1 / t1);
    y = cos (a * x.^t + phase);
  else
    error ("chirp: invalid frequency sweep shape '%s'", shape);
  endif

endfunction

%!demo
%! t = 0:0.001:5;
%! y = chirp (t);
%! specgram (y, 256, 1000);
%! %------------------------------------------------------------
%! % Shows linear sweep of 100 Hz/sec starting at zero for 5 sec
%! % since the sample rate is 1000 Hz, this should be a diagonal
%! % from bottom left to top right.

%!demo
%! t = -2:0.001:15;
%! y = chirp (t, 400, 10, 100, "quadratic");
%! [S, f, t] = specgram (y, 256, 1000);
%! t = t - 2;
%! imagesc(t, f, 20 * log10 (abs (S)));
%! set (gca (), "ydir", "normal");
%! xlabel ("Time");
%! ylabel ("Frequency");
%! %------------------------------------------------------------
%! % Shows a quadratic chirp of 400 Hz at t=0 and 100 Hz at t=10
%! % Time goes from -2 to 15 seconds.

%!demo
%! t = 0:1/8000:5;
%! y = chirp (t, 200, 2, 500, "logarithmic");
%! specgram (y, 256, 8000);
%! %-------------------------------------------------------------
%! % Shows a logarithmic chirp of 200 Hz at t=0 and 500 Hz at t=2
%! % Time goes from 0 to 5 seconds at 8000 Hz.

## Test shape defaults and abbreviations
%!shared t
%! t = (0:5000) ./ 1000;
%!test
%! y1 = chirp (t);
%! y2 = chirp (t, 0, 1, 100, "linear", 0);
%! assert (y2, y1)
%!test
%! y1 = chirp (t, [], [], [], "li");
%! y2 = chirp (t, 0, 1, 100, "linear", 0);
%! assert (y2, y1)
%!test
%! y1 = chirp (t, [], [], [], "q");
%! y2 = chirp (t, 0, 1, 100, "quadratic", 0);
%! assert (y2, y1)
%!test
%! y1 = chirp (t, [], [], [], "lo");
%! y2 = chirp (t, 1e-6, 1, 100, "logarithmic", 0);
%! assert (y2, y1)

## Test input validation
%!error chirp ()
%!error chirp (1, 2, 3, 4, 5, 6, 7)
%!error <invalid frequency sweep shape> chirp (0, [], [], [], "l")
%!error <invalid frequency sweep shape> chirp (0, [], [], [], "foo")

