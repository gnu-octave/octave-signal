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
## @deftypefn  {Function File} {} strips (@var{x})
## @deftypefnx {Function File} {} strips (@var{x}, @var{n})
## @deftypefnx {Function File} {} strips (@var{x}, @var{sd}, @var{fs})
## @deftypefnx {Function File} {} strips (@var{x}, @var{sd}, @var{fs}, @var{scale})
## Cut signal data into horizontal strips and plot for visualization.
##
## @code{strips (@var{x})} plots the input signal @var{x} in horizontal strips
## of length 250 samples each.
##
## @code{strips (@var{x}, @var{n})} uses strips of length @var{n} samples.
##
## @code{strips (@var{x}, @var{sd}, @var{fs})} uses strips of duration
## @var{sd} seconds given the sample rate @var{fs} (in Hz). The strip length
## in samples is calculated as @code{ceil (@var{sd} * @var{fs})}.
##
## @code{strips (@var{x}, @var{sd}, @var{fs}, @var{scale})} scales the
## vertical axis of each strip by the factor @var{scale}.
##
## If @var{x} is a matrix, each column is plotted as a separate strip.
##
## @end deftypefn

function strips (varargin)

  if (nargin < 1 || nargin > 4)
    print_usage ();
  endif

  x = varargin{1};
  if (isempty (x))
    return;
  elseif(!isnumeric (x) || !(ismatrix (x)|| isvector (x)))
    error ("strips: X must be a numeric vector or matrix.");
  elseif (iscomplex (x))
    warning ("strips: Complex input detected, using real part only.");
    x = real (x);
  endif

  if (isvector (x))
    x = x(:);
  endif

  ## Default values
  strip_len = 250;
  scale = 1;
  sd = [];

  if (nargin == 2)
    ## strips(x, n)
    strip_len = varargin{2};
    if (!isscalar (strip_len) || !isnumeric (strip_len) ...
        || strip_len <= 0 || strip_len != fix (strip_len))
      error ("strips: N must be a positive integer scalar.");
    endif
  elseif (nargin >= 3)
    ## strips(x, sd, fs) or strips(x, sd, fs, scale)
    sd = varargin{2};
    fs = varargin{3};

    if (!isscalar (sd) || !isnumeric (sd) || sd <= 0)
      error ("strips: SD must be a positive scalar.");
    endif
    if (!isscalar (fs) || !isnumeric (fs) || fs <= 0)
      error ("strips: FS must be a positive scalar.");
    endif

    strip_len = ceil (sd * fs);
    if (strip_len < 1)
      error ("strips: SD*FS must be at least 1 sample.");
    endif

    if (nargin == 4)
      scale = varargin{4};
      if (!isscalar (scale) || !isnumeric (scale))
        error ("strips: SCALE must be a numeric scalar.");
      endif
      if (iscomplex (scale))
        warning ("strips: Complex input detected, using real part only.");
        scale = real (scale);
      endif
    endif
  endif

  ## Create the strip plot
  [n_samples, cols] = size (x);
  n_strips = ceil (n_samples / strip_len);

  ## Don't include the last strip if it has only 1 sample
  if (rem (n_samples, strip_len) == 1)
    n_strips = n_strips - 1;
  endif

  ## Compute global min/max for scaling
  x = x * scale;
  global_min = min (x(:));
  global_max = max (x(:));
  range = global_max - global_min;
  center = (global_max + global_min) / 2;

  if (range == 0)
  ## if all values are the same, just use 1 unit of spacing
    vertical_spacing = 1;
  else
    vertical_spacing = range * 1.2;
  endif

  newplot ();
  hold on;

  color_order = get (gca (), "colororder");
  n_colors = size (color_order, 1);

  ## Plot each column in its own strip
  for col = 1:cols
    col_color = color_order (mod (col-1, n_colors) + 1, :);

    for strip = 1:n_strips
      start_idx = (strip - 1) * strip_len + 1;
      end_idx = min (strip * strip_len, n_samples);

      ## center the segment around zero
      segment = x(start_idx:end_idx, col) - center;
      segment_len = length (segment);

      y_offset = (n_strips - strip) * vertical_spacing;
      if (nargin >= 3)
        ## time mode: x axis shows time in seconds
        x_axis = (0:segment_len-1) / fs;
      else
        ## sample mode: x axis shows sample indices
        x_axis = 0:segment_len-1;
      endif

      plot (x_axis, segment + y_offset, "color", col_color);
    endfor
  endfor

  hold off;

  if (nargin >= 3)
    start_times = flip ((0:n_strips-1) * sd);
    yticks = (0:n_strips-1) * vertical_spacing;
    yticklabels = cellstr (num2str (start_times'));
    xlim ([0, sd]);
  else
    start_indices = flip ((0:n_strips-1) * strip_len);
    yticks = (0:n_strips-1) * vertical_spacing;
    yticklabels = cellstr (num2str (start_indices'));
    xlim ([0, strip_len]);
  endif

  ## set y-axis
  set (gca (), "ytick", yticks, "yticklabel", yticklabels);
  ylim ([-0.7*vertical_spacing, (n_strips-0.2) * vertical_spacing]);
  set (gca (), 'YGrid', 'on', 'XGrid', 'off');

endfunction

%!demo
%! ## 1) strips(x) default strip length of 250 samples
%! fs = 1000;
%! t = (0:999) / fs;
%! x = sin (2*pi*5*t) + 0.5*sin (2*pi*50*t) + 0.25*randn (size(t));
%! strips (x);
%! title ("strips(x): default 250-sample strips");

%!demo
%! ## 2) strips(x, n) custom strip length in samples
%! fs = 1000;
%! t = (0:1999) / fs;
%! x = chirp (t, 10, 2, 200);
%! strips (x, 400);
%! title ("strips(x, n): chirp with 400-sample strips");

%!demo
%! ## 3) strips(x, sd, fs) strip duration in seconds
%! fs = 8000;
%! t = (0:3*fs-1) / fs;
%! x = sin (2*pi*200*t) .* exp (-2*t);
%! strips (x, 0.5, fs);
%! title ("strips(x, sd, fs): 0.5-second strips");

%!demo
%! ## 4) strips(x, sd, fs, scale) with vertical scaling
%! fs = 1000;
%! t = (0:2999) / fs;
%! x = sin (2*pi*3*t) + 0.5*sin (2*pi*15*t);
%! strips (x, 0.8, fs, 1.5);
%! title ("strips(x, sd, fs, scale): scaled by 1.5");

%!demo
%! ## 5) matrix input
%! fs = 1000;
%! t = (0:1999) / fs;
%! x1 = cos (2*pi*10*t);
%! x2 = cos (2*pi*10*t) .* exp (-t);
%! X = [x1', x2'];
%! strips (X, 500);
%! title ("strips(X, n): two signals in 500-sample strips");

%!error <numeric vector or matrix> strips ("asdf")
%!error <positive integer scalar> strips (randn (100,1), -5)
%!error <positive scalar> strips (randn (100,1), -0.5, 1000)
%!error <positive scalar> strips (randn (100,1), 0.5, -1000)
%!error <numeric scalar> strips (randn (100,1), 0.5, 1000, "invalid")
