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
## @deftypefn  {Function File} {@var{f} =} freqspace (@var{N})
## @deftypefnx {Function File} {@var{f} =} freqspace (@var{N}, "whole")
## @deftypefnx {Function File} {[@var{f1}, @var{f2}] =} freqspace (@var{n})
## @deftypefnx {Function File} {[@var{f1}, @var{f2}] =} freqspace ([@var{m}, @var{n}])
## @deftypefnx {Function File} {[@var{x}, @var{y}] =} freqspace (@dots{}, "meshgrid")
## Generate frequency spacing for frequency responses.
##
## For one-dimensional usage, @code{freqspace (@var{N})} returns @var{N}
## equally-spaced points along the upper half of the unit circle, with
## normalized frequency in [0, 1].  When "whole" is specified, returns points
## along the entire unit circle, ranging from [0, 2).
##
## For two-dimensional usage, @code{[@var{f1}, @var{f2}] = freqspace (@var{n})}
## returns two frequency vectors for an @var{n}-@var{n} matrix;
## @code{[@var{f1}, @var{f2}] = freqspace ([@var{m}, @var{n}])} returns
## vectors for an @var{m}-@var{n} matrix.  The 2-D frequency vectors are
## equally spaced between -1 and 1, where 1 corresponds to the Nyquist
## frequency.
##
## When "meshgrid" is specified, it is equivalent to calling @code{freqspace}
## followed by @code{meshgrid} on the results.
## @end deftypefn

function [varargout] = freqspace (varargin)

  if (nargin < 1 || nargin > 2)
    print_usage ();
  endif

  meshgrid_flag = false;
  whole_flag    = false;

  sz = varargin{1};
  if (! isnumeric (sz) || ! isreal (sz) || any (sz <= 0) || any (sz != round (sz)))
    error ("freqspace: first argument must be positive integer as N or [M, N].");
  endif

  if (nargin > 1)
    opt = varargin{2};
    if (strcmpi (opt, "meshgrid"))
      meshgrid_flag = true;
    elseif (strcmpi (opt, "whole"))
      whole_flag = true;
    else
      error ("freqspace: second argument must be 'whole' or 'meshgrid'.");
    endif
  endif

  if (nargout == 1 && isscalar (sz) && !meshgrid_flag)
    N = sz;
    if (whole_flag)
      ## f = freqspace(N, 'whole')
      f = 0:2/N:2*(N-1)/N;
    else
      ## f = freqspace(N)
      f = 0:2/N:1;
    endif
    varargout{1} = f;
  else
    if (nargout != 2)
      error ("freqspace: not enough output arguments.");
    endif

    if (isscalar (sz))
      ## [f1,f2] = freqspace(n)
      m = sz;
      n = sz;
    else
      ## [f1,f2] = freqspace([m,n])
      m = sz(1);
      n = sz(2);
    endif

    if (mod (n, 2) == 0)
      f1 = (-n:2:n-2) / n;
    else
      f1 = (-n+1:2:n-1) / n;
    endif

    if (mod (m, 2) == 0)
      f2 = (-m:2:m-2) / m;
    else
      f2 = (-m+1:2:m-1) / m;
    endif

    if (meshgrid_flag)
      ## [x,y] = freqspace(___,'meshgrid')
      [x, y] = meshgrid (f1, f2);
      varargout{1} = x;
      varargout{2} = y;
    else
      varargout{1} = f1;
      varargout{2} = f2;
    endif  
  endif

endfunction

%!test
%! ## 1D: freqspace(N) returns upper half-circle points
%! f = freqspace (4);
%! assert (f, [0 0.5 1], 1e-10);
%! f = freqspace (5);
%! assert (f, [0 0.4 0.8], 1e-10);
%! f = freqspace (1);
%! assert (f, 0, 1e-10);

%!test
%! ## 1D: freqspace(N, 'whole') returns full unit circle
%! f = freqspace (4, "whole");
%! assert (f, [0 0.5 1 1.5], 1e-10);
%! f = freqspace (5, "whole");
%! assert (f, [0 0.4 0.8 1.2 1.6], 1e-10);
%! f = freqspace (2, "whole");
%! assert (f, [0 1], 1e-10);

%!test
%! ## 2D: [f1,f2] = freqspace(n)
%! [f1, f2] = freqspace (5);
%! assert (f1, [-0.8 -0.4 0 0.4 0.8], 1e-10);
%! assert (f2, [-0.8 -0.4 0 0.4 0.8], 1e-10);

%!test
%! ## 2D: [f1,f2] = freqspace([m,n])
%! [f1, f2] = freqspace ([4, 3]);
%! assert (f1, [-2/3 0 2/3], 1e-10);
%! assert (f2, [-1 -0.5 0 0.5], 1e-10);

%!demo
%! clf;
%! ## Display 2-D frequency grid points
%! n = 9;
%! [f1, f2] = freqspace (n);
%! [x, y] = meshgrid (f1, f2);
%! plot (x(:), y(:), "o");
%! xlabel ("f1 (normalized frequency)");
%! ylabel ("f2 (normalized frequency)");
%! title ({"2-D frequency grid from freqspace (9)"; ...
%!         "Each point corresponds to a 2-D DFT frequency"});
%! axis ([-1.2, 1.2, -1.2, 1.2]);
%! grid on;

%!demo
%! clf;
%! ## Design a simple 2-D lowpass frequency response using freqspace
%! n = 21;
%! [f1, f2] = freqspace (n, "meshgrid");
%! ## Design an ideal circularly symmetric lowpass filter, cutoff 0.4
%! r = sqrt (f1.^2 + f2.^2);
%! H = double (r <= 0.4);
%! mesh (f1, f2, H);
%! xlabel ("f1");
%! ylabel ("f2");
%! zlabel ("Magnitude");
%! title ("2-D lowpass frequency response using freqspace");
