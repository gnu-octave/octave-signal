## Copyright (C) 2023 The Octave Project Developers
##
## See the file COPYRIGHT.md in the top-level directory of this
## distribution or <https://octave.org/copyright/>.
##
## This file is part of Octave.
##
## Octave is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} taylorwin (@var{m})
## @deftypefnx {Function File} taylorwin (@var{m}, @var{nbar})
## @deftypefnx {Function File} taylorwin (@var{m}, @var{nbar}, @var{sll})
## @deftypefnx {Function File} taylorwin (@var{m}, @var{nbar}, @var{sll}, @var{plots})
## Return the coefficients of a Taylor window of length @var{m}, whose
## Fourier transform has @var{nbar} (default 4) quasi-equiripple side-lobes
## adjacent to the main-lobe, at a nominal level of @var{sll} (default
## @minus{}30) dBc.
##
## If @var{plots} is non-zero then time and frequency domains plots of the
## resultant window are shown.
##
## Reference:
## Doerry, `Catalog of Window Taper Functions for Sidelobe Control', 2017.
## @seealso{chebwin}
## @end deftypefn

function W = taylorwin (m, nbar=4, sll=-30, plots=0)
  if (nargin<1 || nargin>4)
    print_usage ();
  elseif (!isscalar (m) || imag (m) || mod (m,1) || m<1)
    error ('taylorwin: M must be a positive integer');
  elseif (!isscalar (nbar) || imag (nbar) || mod (nbar,1) || nbar<1)
    error ('taylorwin: NBAR must be a positive integer');
  elseif (!isscalar (sll) || imag (sll))
    error ('taylorwin: SLL must be a real scalar');
  elseif (!isscalar (plots))
    error ('taylorwin: PLOTS must be a scalar');
  endif

  a2 = (acosh (10^(sll/-20))/pi)^2;
  N = 1:nbar-1;
  M = (a2+(nbar-.5)^2)./(nbar^2*(a2+(N-.5).^2));
  T = pi/m*[1:2:m];
  W = T>0;
  
  for n=N
    W -= prod (1-n*n*M)/prod (nonzeros (1-(n./N).^2))*cos (T*n);
  endfor

  W = [W W(m-length (W):-1:1)]';

  if plots && m>2 clf
    subplot (311);
    ifelse (m>100,@plot,@stem) (linspace (-.5,.5,m),W);
    axis ([-.51 .51 min([W' 0]) max(W)/.9]); grid on;
    title (sprintf ('Taylor window: M = %i, NBAR = %i, SLL = %g', m, nbar, sll));
    [h f] = freqz (W/sum (W),1,2^(ceil (log2 (m))+7));
    x = f/pi*m/2;
    y = 20*log10 (abs (h));
    subplot (312);
    plot (x,y);
    axis ([0 min([m/2 nbar+4]) sll-25 ym=max([0 sll])+4]);
    ylabel ('dBc');
    xlabel ('Nominal bins');
    grid on;
    subplot (313);
    semilogx (x(2:end), y(2:end));
    axis ([.1 m/2 sll-40 ym]);
    ylabel ('dBc');
    xlabel ('Nominal bins');
    grid on;
  endif
endfunction

%!test % odd M; even NBAR:
%! w = [.2035 .272 .4013 .5717 .7626 .9644 1.1683 1.3598 1.5254 1.6541 1.7354 1.7629];
%! assert (taylorwin (23, 8, -40), [w w(end-1:-1:1)]', 51e-6);

%!test % even M; odd NBAR:
%! w = [.4025 .4488 .5367 .6576 .8004 .9528 1.1028 1.2402 1.3573 1.4484 1.5105 1.5419];
%! assert (taylorwin (24, 3), [w flip(w)]', 51e-6);

%% Test input validation:
%!error taylorwin
%!error taylorwin (0)
%!error taylorwin (30.5)
%!error taylorwin (30i)
%!error taylorwin (30:31)
%!error taylorwin ({30})
%!error taylorwin (30, 0)
%!error taylorwin (30, 4.5)
%!error taylorwin (30, 4i)
%!error taylorwin (30, 2:3)
%!error taylorwin (30, {4})
%!error taylorwin (30, 4, -30i)
%!error taylorwin (30, 4, -30:-20)
%!error taylorwin (30, 4, {-30})
%!error taylorwin (30, 4, -30, 0:1)
%!error taylorwin (30, 4, -30, {})
%!error taylorwin (30, 4, -30, 1, 0)

%% Demonstrations per Doerry:
%!demo taylorwin (2000, 4, -35, 1);
%!demo taylorwin (2000, 5, -40, 1);
%!demo taylorwin (2000, 7, -50, 1);
%!demo taylorwin (2000, 11, -70, 1);
