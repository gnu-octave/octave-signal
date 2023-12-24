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
## @deftypefn  {Function File} expwin (@var{m}, @var{alpha})
## @deftypefnx {Function File} expwin (@var{m}, @var{sll})
## @deftypefnx {Function File} expwin (@dots{}, "canonical")
## Return the coefficients of an exponential window@footnote{K. Avci & A.
## Nacaroglu, `Exponential Window Family', SIPIJ Vol.@: 4 No.@: 4, August
## 2013.} of length @var{m}.
##
## The window's adjustable parameter can be set directly as
## @var{alpha} (@geq{}0) or indirectly with
## @var{sll} (<0), the latter being the desired side-lobe level in dBc.
##
## By default, the returned window is both symmetric and periodic.  With the
## optional argument @qcode{"canonical"}, the canonical form of the window is
## returned, which is symmetric but not periodic.
##
## @seealso{kaiser, poisswin}
## @end deftypefn

function W = expwin (m, a, opt)

  if nargin<2 || nargin>3 || (nargin==3 && !strcmp (opt,'canonical'))
    print_usage ();
  elseif !isscalar (m) || imag (m) || mod (m,1) || m<0
    error ('expwin: M must be a positive integer');
  elseif !isscalar (a) || imag (a)
    error ('expwin: ALPHA/SLL must be a real scalar');
  endif

  if m<3 W = ones (m,1); return endif

  % If given SLL then  estimate alpha:
  if     a<=-50    a = -1.085e-4*a*a-0.1506*a-0.304;
  elseif a<=-13.26 a = -1.513e-3*a*a-0.2809*a-3.398;
  elseif a<0       a = 0; endif

  T = [1-m:2:0]/(m-(nargin==3));
  T = sqrt (1-T.^2)-1;
  W = exp (a*T);
  W = [W W(m-length (W):-1:1)]';

endfunction

%!test % even M; odd alpha:
%! w=[0.0321 0.09385 0.184 0.3011 0.4386 0.5858 0.7289 0.8532 0.945 0.9938];
%! assert (expwin (20, 5), [w flip(w)]', 51e-6);

%!test % odd M; even alpha:
%! w=[0.06202 0.1437 0.2443 0.3611 0.488 0.6172 0.7396 0.8464 0.9294 0.982];
%! assert (expwin (21, 4), [w 1 flip(w)]', 51e-6);

%!test % even M; odd alpha; canonical:
%! w=[0.006738 0.06285 0.145 0.2583 0.3973 0.5507 0.7035 0.8384 0.9392 0.9931];
%! assert (expwin (20, 5, 'canonical'), [w flip(w)]', 51e-6);

%!test % odd M; even alpha; canonical:
%! w=[0.01832 0.1047 0.2019 0.3187 0.4493 0.5851 0.7161 0.8317 0.9224 0.9801];
%! assert (expwin (21, 4, 'canonical'), [w 1 flip(w)]', 51e-6);

%% Test input validation:
%!error expwin
%!error expwin (21.5,1)
%!error expwin (21i,1)
%!error expwin (21:22,1)
%!error expwin ({21},1)
%!error expwin (21, 4i)
%!error expwin (21, 2:3)
%!error expwin (21, {4})
%!error expwin (21, 4, 1)
%!error expwin (21, 4, 'canonical', 1)

