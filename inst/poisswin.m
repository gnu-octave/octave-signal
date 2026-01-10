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
## @deftypefn  {Function File} poisswin (@var{m}, @var{alpha})
## Return the coefficients of a Poisson (a.k.a. exponential) window@footnote{S.
## Gade & H. Herlufsen, `Windows to FFT analysis (Part I)', Technical Review 3,
## Bruel & Kjaer, 1987} of length @var{m} and adjustable parameter
## @var{alpha}.
## @end deftypefn

function W = poisswin (m, a)

  if nargin!=2
    print_usage ();
  elseif !isscalar (m) || imag (m) || mod (m,1) || m<0
    error ('poisswin: M must be a positive integer');
  elseif !isscalar (a) || imag (a)
    error ('poisswin: ALPHA must be a real scalar');
  endif

  if m<3 W = ones (m,1); return endif

  T = [1-m:2:0]/(m-1);
  T -= T(end);
  W = exp (a*T);
  W = [W W(m-length (W):-1:1)]';

endfunction

%!test % even M; odd alpha:
%! w=[0.3878 0.4308 0.4786 0.5318 0.5908 0.6564 0.7292 0.8102 0.9001 1];
%! assert (poisswin (20, 1), [w flip(w)]', 51e-6);

%!test % odd M; even alpha:
%! w=[0.1353 0.1653 0.2019 0.2466 0.3012 0.3679 0.4493 0.5488 0.6703 0.8187];
%! assert (poisswin (21, 2), [w 1 flip(w)]', 51e-6);

%% Test input validation:
%!error poisswin
%!error poisswin (21.5,1)
%!error poisswin (21i,1)
%!error poisswin (21:22,1)
%!error poisswin ({21},1)
%!error poisswin (21, 4i)
%!error poisswin (21, 2:3)
%!error poisswin (21, {4})
%!error poisswin (21, 4, 1)

%!demo wvtool ('poisswin: α = 2, 3, 4', poisswin (m=200,2), poisswin (m,3), poisswin (m,4));
