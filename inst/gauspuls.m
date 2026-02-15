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
## @deftypefn  {Function File} {@var{yi} =} gauspuls (@var{t})
## @deftypefnx {Function File} {@var{yi} =} gauspuls (@var{t}, @var{fc})
## @deftypefnx {Function File} {@var{yi} =} gauspuls (@var{t}, @var{fc}, @var{bw})
## @deftypefnx {Function File} {@var{yi} =} gauspuls (@var{t}, @var{fc}, @var{bw}, @var{bwr})
## @deftypefnx {Function File} {[@var{yi}, @var{yq}] =} gauspuls (@dots{})
## @deftypefnx {Function File} {[@var{yi}, @var{yq}, @var{ye}] =} gauspuls (@dots{})
## Generate a Gaussian modulated sinusoidal pulse sampled at times @var{t}.
##
## The input arguments are:
## @itemize
## @item @var{t} : vector of time values (in seconds) at which the pulse is
## evaluated.
## @item @var{fc} : center frequency in Hz (default 1000).  Must be a
## non-negative real scalar.
## @item @var{bw} : fractional bandwidth (default 0.5).  Must be a positive
## real scalar.  The bandwidth is measured at the reference level given by
## @var{bwr}.
## @item @var{bwr} : reference level in dB (default -6).  Must be a negative
## real scalar.  The pulse's envelope amplitude at the band edges is
## @code{10^(@var{bwr}/20)} times the peak amplitude.
## @end itemize
##
## The output arguments are:
## @itemize
## @item @var{yi} : inphase (cosine) component of the pulse.
## @item @var{yq} : quadrature (sine) component of the pulse.
## @item @var{ye} : envelope of the pulse 
## (same as @code{sqrt (@var{yi}.^2 + @var{yq}.^2)}).
## @end itemize
## @seealso{pulstran, rectpuls, tripuls}
## @end deftypefn

function [yi, yq, ye] = gauspuls (t, fc = 1000, bw = 0.5, bwr = -6)

  if (nargin < 1 || nargin > 4)
    print_usage ();
  endif

  if (! isreal (fc) || ! isscalar (fc) || fc < 0)
    error ("gauspuls: FC must be a non-negative real scalar")
  endif

  if (! isreal (bw) || ! isscalar (bw) || bw <= 0)
    error ("gauspuls: BW must be a positive real scalar")
  endif

  if (! isreal (bwr) || ! isscalar (bwr) || bwr >= 0)
    error ("gauspuls: BWR must be a negative real scalar");
  endif

  tv = (-bwr * log (10) / 10) / (pi^2 * bw^2 * fc^2);
  ye = exp (-t .* t / (2 * tv));
  yi = ye .* cos (2 * pi * fc * t);
  yq = ye .* sin (2 * pi * fc * t);

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
%!error gauspuls (1, 2, 3, 4, 5)
%!error <FC must be a non-negative real scalar> gauspuls (1, -1)
%!error <FC must be a non-negative real scalar> gauspuls (1, 2j)
%!error <BW must be a positive real scalar> gauspuls (1, 1e3, 0)
%!error <BW must be a positive real scalar> gauspuls (1, 1e3, -1)
%!error <BW must be a positive real scalar> gauspuls (1, 1e3, 0.5j)
%!error <BWR must be a negative real scalar> gauspuls (1, 1e3, 0.5, 0)
%!error <BWR must be a negative real scalar> gauspuls (1, 1e3, 0.5, 1)
%!error <BWR must be a negative real scalar> gauspuls (1, 1e3, 0.5, -2j)

%!test
%! ## Check that default bwr = -6 yields same as old version
%! t = linspace (-1, 1, 100);
%! yi_new = gauspuls (t, 100, 0.5);
%! tv_old = (-(-6) * log (10) / 10) / (pi^2 * 0.5^2 * 100^2);
%! ye_old = exp (-t .* t / (2 * tv_old));
%! yi_old = ye_old .* cos (2 * pi * 100 * t);
%! assert (yi_new, yi_old, 1e-12);
