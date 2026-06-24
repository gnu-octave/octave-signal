## Copyright (C) 1999 Paul Kienzle <pkienzle@users.sf.net>
## Copyright (C) 2026 Tang Chonghao <chadholton@qq.com>
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
## @deftypefn  {Function File} {[@var{x}, @var{t}] =} impz (@var{b})
## @deftypefnx {Function File} {[@var{x}, @var{t}] =} impz (@var{b}, @var{a})
## @deftypefnx {Function File} {[@var{x}, @var{t}] =} impz (@var{b}, @var{a}, @var{n})
## @deftypefnx {Function File} {[@var{x}, @var{t}] =} impz (@var{b}, @var{a}, @var{n}, @var{fs})
## @deftypefnx {Function File} {} impz (@dots{})
##
## Generate impulse-response characteristics of the filter.
##
## The filter coefficients correspond to the z-plane rational function
## with numerator b and denominator a.  If a is not specified, it
## defaults to 1.  When @var{n} is a scalar, it specifies the number of
## points to compute (default: determined by @code{impzlength}).  When
## @var{n} is a vector of non-negative integers, the response is
## computed only at those sample indices.  The sampling frequency
## @var{fs} (default: 1) controls the time spacing in the output
## @var{t}.  With no output arguments, the result is plotted.
##
## @seealso{freqz, zplane, stepz,impzlength}
## @end deftypefn

function [x_r, t_r] = impz(b, a = [1], n = [], fs = 1)

  if nargin == 0 || nargin > 4
    print_usage;
  endif

  ## Determine n (number of points or vector of indices)
  n_is_vector = false;
  if isempty (n)
    ## Auto-compute length using impzlength
    if nargin >= 2 && !isscalar (a)
      n = impzlength (b, a);
    else
      n = impzlength (b);
    endif
  elseif isscalar (n)
  ## n is a giving number for points
    if n < 0 || n != fix (n)
      error ("impz: N must be a non-negative integer when specified as a scalar as points");
    endif
  else
    ## n is a vector of non-negative integer indices
    n = n(:);
    if any (n < 0) || any (n != fix (n))
      error ("impz: N must contain non-negative integers when specified as a vector");
    endif
    n_is_vector = true;
  endif

  ## Compute impulse response
  if n_is_vector
    max_n = max (n);
    if length (a) == 1
      x_full = fftfilt (b / a, [1; zeros(max_n, 1)]);
    else
      x_full = filter (b, a, [1; zeros(max_n, 1)]);
    endif
    ## Extract the impulse response at the specified indices
    x = x_full(n + 1);
    t = n / fs;
  else
    if length (a) == 1
      x = fftfilt (b / a, [1; zeros(n-1, 1)]);
    else
      x = filter (b, a, [1; zeros(n-1, 1)]);
    endif
    t = (0:n-1).' / fs;
  endif

  if nargout >= 1 x_r = x; endif
  if nargout >= 2 t_r = t; endif
  if nargout == 0
    # scale and work out xlabel
    if nargin == 4
      if max(t) < 1
        label_text = "Time (msec)";
        t = t * 1000;
      else
        label_text = "Time (sec)";
      endif
    else
      label_text = "n (samples)";
    endif

    stem(t, x);
    title("Impulse Response");
    xlabel(label_text);
    ylabel("Amplitude");
  endif

endfunction

%!demo
%! ## Impulse response of a 4th-order lowpass Butterworth IIR filter
%! [b, a] = butter (4, 0.2);
%! impz (b, a);

%!demo
%! ## Impulse response with a custom number of points
%! impz (1, [1, -0.9], 30);

%!demo
%! ## Impulse response at specific sample indices
%! impz (1, [1, -0.9], [0 5 10 15 20]);

%!demo
%! ## Impulse response with sampling frequency (time axis in seconds)
%! [b, a] = butter (4, 0.2);
%! impz (b, a, [], 1000);

%!demo
%! ## Impulse response at specific time points with sampling frequency
%! [b, a] = butter (4, 0.2);
%! impz (b, a, 0:5:50, 1000);

%!assert (size (impz (1, [1 -1 0.9], 100)), [100 1])

%!test
%! [h, t] = impz (1, [1 -1 0.9], 0:101);
%! assert (size (h), [102 1]);
%! assert (t, (0:101)');

%!test
%! ## FIR filter with scalar n
%! [h, t] = impz (1, [1,-0.5], 5);
%! assert (h, [1.0000; 0.5000; 0.2500; 0.1250; 0.0625]);
%! assert (t, (0:4)');

%!test
%! ## FIR filter with vector n
%! [h, t] = impz (1, [1,-0.5], [0 2 4],2);
%! assert (h, [1.0000; 0.2500; 0.0625]);
%! assert (t, [0; 2; 4]/2);

%!test
%! ## With fs provided
%! [h, t] = impz (1, [1 -1 0.9], 10, 1000);
%! assert (size (h), [10, 1]);
%! assert (size (t), [10, 1]);
%! assert (t(2) - t(1), 0.001);

## old code for determining n based on poles of the filter
##
## if isempty(n) && length(a) > 1
##     precision = 1e-6;
##     r = roots(a);
##     maxpole = max(abs(r));
##     if (maxpole > 1+precision)     # unstable -- cutoff at 120 dB
##       n = floor(6/log10(maxpole));
##     elseif (maxpole < 1-precision) # stable -- cutoff at -120 dB
##       n = floor(-6/log10(maxpole));
##     else                           # periodic -- cutoff after 5 cycles
##       n = 30;
## 
##       ## find longest period less than infinity
##       ## cutoff after 5 cycles (w=10*pi)
##       rperiodic = r(find(abs(r)>=1-precision & abs(arg(r))>0));
##       if !isempty(rperiodic)
##         n_periodic = ceil(10*pi./min(abs(arg(rperiodic))));
##         if (n_periodic > n)
##           n = n_periodic;
##         endif
##       endif
## 
##       ## find most damped pole
##       ## cutoff at -60 dB
##       rdamped = r(find(abs(r)<1-precision));
##       if !isempty(rdamped)
##         n_damped = floor(-3/log10(max(abs(rdamped))));
##         if (n_damped > n)
##           n = n_damped;
##         endif
##       endif
