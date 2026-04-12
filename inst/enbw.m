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
## @deftypefn  {Function File} {@var{bw} =} enbw (@var{window})
## @deftypefnx {Function File} {@var{bw} =} enbw (@var{window}, @var{fs})
##
## Compute the equivalent noise bandwidth of a window.
##
## @end deftypefn

function bw = enbw (window, fs)

  if (nargin < 1 || nargin > 2)
    print_usage ();
  endif

  if (! isvector (window) || ! isnumeric (window) || ! isreal (window))
    error ("enbw: WINDOW must be a real numeric vector.");
  endif

  bw_norm = sum (window.^2) / sum (window)^2;

  if (nargin == 1)
    N = length (window);
    bw = bw_norm * N;
  else
    if (! isscalar (fs) || ! isnumeric (fs) || fs <= 0)
      error ("enbw: FS must be a positive scalar.");
    endif
    bw = bw_norm * fs;
  endif

endfunction

%!error <WINDOW must be a real numeric vector.> enbw ("asdf")
%!error <WINDOW must be a real numeric vector.> enbw (1+1i)
%!error <FS must be a positive scalar.> enbw (hann(10), -1)
%!error <FS must be a positive scalar.> enbw (hann(10), [1 2])

%!test assert (enbw (hann(100)), 1.5151515, 1e-7)
%!test assert (enbw(gausswin(10)), 1.5825667, 1e-7)
%!test assert (enbw (hann(10), 100), 16.6666667, 1e-7)
%!test assert (enbw(gausswin(10), 100), 15.8256672, 1e-7)
