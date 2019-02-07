## Copyright (C) 2007 Sylvain Pelissier
## Copyright (C) 2018-2019 Mike Miller
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
## @deftypefn  {Function File} {@var{y} =} gauspuls (@var{t})
## @deftypefnx {Function File} {@var{y} =} gauspuls (@var{t}, @var{fc})
## @deftypefnx {Function File} {@var{y} =} gauspuls (@var{t}, @var{fc}, @var{bw})
## Generate a Gaussian modulated sinusoidal pulse sampled at times @var{t}.
## @seealso{pulstran, rectpuls, tripuls}
## @end deftypefn

function y = gauspuls (t, fc = 1e3, bw = 0.5)

  if (nargin < 1 || nargin > 3)
    print_usage ();
  endif

  if (! isreal (fc) || ! isscalar (fc) || fc < 0)
    error ("gauspuls: FC must be a non-negative real scalar")
  endif

  if (! isreal (bw) || ! isscalar (bw) || bw <= 0)
    error ("gauspuls: BW must be a positive real scalar")
  endif

  fv = -(bw^2 * fc^2) / (8 * log (10 ^ (-6/20)));
  tv = 1 / (4*pi^2 * fv);
  y = exp (-t .* t / (2*tv)) .* cos (2*pi*fc * t);

endfunction

%!demo
%! fs = 11025;  # arbitrary sample rate
%! f0 = 100;    # pulse train sample rate
%! x = pulstran (0:1/fs:4/f0, 0:1/f0:4/f0, "gauspuls");
%! plot ([0:length(x)-1]*1000/fs, x);
%! xlabel ("Time (ms)");
%! ylabel ("Amplitude");
%! title ("Gaussian pulse train at 10 ms intervals");

%!assert (gauspuls ([]), [])
%!assert (gauspuls (zeros (10, 1)), ones (10, 1))
%!assert (gauspuls (-1:1), [0, 1, 0])
%!assert (gauspuls (0:1/100:0.3, 0.1), gauspuls ([0:1/100:0.3]', 0.1)')

## Test input validation
%!error gauspuls ()
%!error gauspuls (1, 2, 3, 4)
%!error gauspuls (1, -1)
%!error gauspuls (1, 2j)
%!error gauspuls (1, 1e3, 0)
