## Copyright (C) 2005 Julius O. Smith III <jos@ccrma.stanford.edu>
## Copyright (C) 2021 Charles Praplan
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
## @deftypefn  {Function File} {[@var{sos}, @var{g}] =} zp2sos (@var{z})
## @deftypefnx {Function File} {[@var{sos}, @var{g}] =} zp2sos (@var{z}, @var{p})
## @deftypefnx {Function File} {[@var{sos}, @var{g}] =} zp2sos (@var{z}, @var{p}, @var{k})
## @deftypefnx {Function File} {@var{sos} =} zp2sos (@dots{})
## Convert filter poles and zeros to second-order sections.
##
## INPUTS:
## @itemize
## @item
## @var{z} = column-vector containing the filter zeros
## @item
## @var{p} = column-vector containing the filter poles
## @item
## @var{k} = overall filter gain factor. If not given the gain is assumed to be 1.
## @end itemize
##
## RETURNED:
## @itemize
## @item
## @var{sos} = matrix of series second-order sections, one per row:
## @example
## @var{sos} = [@var{B1}.' @var{A1}.'; ...; @var{BN}.' @var{AN}.']
## @end example
## where
## @code{@var{B1}.' = [b0 b1 b2] and @var{A1}.' = [a0 a1 a2]} for
## section 1, etc.
## See @code{filter} for documentation of the second-order direct-form filter
## coefficients @var{B}i and %@var{A}i, i=1:N.
##
## @item
## @var{g} is the overall gain factor that effectively scales
## any one of the @var{B}i vectors.
## @end itemize
##
## If called with only one output argument, the overall filter gain is
## applied to the first second-order section in the matrix @var{sos}.
##
## EXAMPLE:
## @example
##   [z, p, k] = tf2zp ([1 0 0 0 0 1], [1 0 0 0 0 .9]);
##   [sos, g] = zp2sos (z, p, k)
##
## sos =
##    1.0000    0.6180    1.0000    1.0000    0.6051    0.9587
##    1.0000   -1.6180    1.0000    1.0000   -1.5843    0.9587
##         0    1.0000    1.0000         0    1.0000    0.9791
##
## g =
##     1
## @end example
##
## @seealso{sos2zp, sos2tf, tf2sos, zp2tf, tf2zp}
## @end deftypefn

function [SOS,G] = zp2sos(z,p,k,DoNotCombineReal)

  if nargin<3, k=1; endif
  if nargin<2, p=[]; endif

  DoNotCombineReal = 1;

  [zc, zr] = cplxreal (z(:));
  [pc, pr] = cplxreal (p(:));

  nzc = length (zc);
  npc = length (pc);

  nzr = length (zr);
  npr = length (pr);

  if DoNotCombineReal

    # Handling complex conjugate poles
    for count = 1:npc
      SOS(count, 4:6) = [1, -2 * real(pc(count)), abs(pc(count))^2];
    endfor

    # Handling real poles
    for count = 1:npr
      SOS(count + npc, 4:6) = [0, 1, -pr(count)];
    endfor

    # Handling complex conjugate zeros
    for count = 1:nzc
      SOS(count, 1:3) = [1, -2 * real(zc(count)), abs(zc(count))^2];
    endfor

    # Handling real zeros
    for count = 1:nzr
      SOS(count+nzc, 1:3) = [0, 1, -zr(count)];
    endfor

    # Completing SOS if needed (sections without pole or zero)
    if npc + npr > nzc + nzr
      for count = nzc + nzr + 1 : npc + npr % sections without zero
        SOS(count, 1:3) = [0, 0, 1];
      end
    else
      for count = npc + npr + 1 : nzc + nzr % sections without pole
        SOS(count, 4:6) = [0, 0, 1];
      endfor
    endif

  else

    # Handling complex conjugate poles
    for count = 1:npc
      SOS(count, 4:6) = [1, -2 * real(pc(count)), abs(pc(count))^2];
    endfor

    # Handling pair of real poles
    for count = 1:floor(npr/2)
       SOS(count+npc, 4:6) = [1, - pr(2 * count - 1) - pr(2 * count), pr(2 * count - 1) * pr(2 * count)];
    endfor

    # Handling last real pole (if any)
    if mod (npr,2) == 1
      SOS(npc + floor (npr / 2) + 1, 4:6)= [0, 1, -pr(end)];
    endif


    # Handling complex conjugate zeros
    for count = 1:nzc
      SOS(count, 1:3)= [1, -2 * real(zc(count)), abs(zc(count))^2];
    endfor

    # Handling pair of real zeros
    for count = 1:floor(nzr / 2)
       SOS(count+nzc, 1:3)= [1, - zr(2 * count - 1) - zr(2 * count), zr(2 * count - 1) * zr(2 * count)];
    endfor

    # Handling last real zero (if any)
    if mod (nzr, 2) == 1
      SOS(nzc + floor (nzr / 2) + 1, 1:3) = [0, 1, -zr(end)];
    endif

    # Completing SOS if needed (sections without pole or zero)
    if npc + ceil(npr / 2) > nzc + ceil(nzr / 2)
      for count = nzc + ceil (nzr / 2) + 1 : npc + ceil (npr / 2) % sections without zero
        SOS(count, 1:3) = [0, 0, 1];
      endfor
    else
      for count = npc + ceil(npr / 2) + 1:nzc + ceil (nzr / 2) % sections without pole
        SOS(count, 4:6) = [0, 0, 1];
      endfor
    endif
  endif

  if ~exist ('SOS')
    SOS=[0, 0, 1, 0, 0, 1];
  endif

  ## If no output argument for the overall gain, combine it into the
  ## first section.
  if (nargout < 2)
    SOS(1,1:3) = k * SOS(1,1:3);
  else
    G = k;
  endif

%!test
%! B=[1 0 0 0 0 1]; A=[1 0 0 0 0 .9];
%! [z,p,k] = tf2zp(B,A);
%! [sos,g] = zp2sos(z,p,k);
%! [Bh,Ah] = sos2tf(sos,g);
%! assert({Bh,Ah},{B,A},100*eps);

%!test
%! sos = zp2sos ([]);
%! assert (sos, [0, 0, 1, 0, 0, 1], 100*eps);

%!test
%! sos = zp2sos ([], []);
%! assert (sos, [0, 0, 1, 0, 0, 1], 100*eps);

%!test
%! sos = zp2sos ([], [], 2);
%! assert (sos, [0, 0, 2, 0, 0, 1], 100*eps);

%!test
%! [sos, g] = zp2sos ([], [], 2);
%! assert (sos, [0, 0, 1, 0, 0, 1], 100*eps);
%! assert (g, 2, 100*eps);

%!test
%! sos = zp2sos([], [0], 1);
%! assert (sos, [0, 0, 1, 0, 1, 0], 100*eps);

%!test
%! sos = zp2sos([0], [], 1);
%! assert (sos, [0, 1, 0, 0, 0, 1], 100*eps);

%!test
%! sos = zp2sos([-1-j -1+j], [-1-2j -1+2j], 10);
%! assert (sos, [10, 20, 20, 1, 2, 5], 100*eps);
