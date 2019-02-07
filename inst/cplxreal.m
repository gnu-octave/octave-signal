## Copyright (C) 2005 Julius O. Smith III
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
## @deftypefn  {Function File} {[@var{zc}, @var{zr}] =} cplxreal (@var{z})
## @deftypefnx {Function File} {[@var{zc}, @var{zr}] =} cplxreal (@var{z}, @var{tol})
## @deftypefnx {Function File} {[@var{zc}, @var{zr}] =} cplxreal (@var{z}, @var{tol}, @var{dim})
## Sort the numbers @var{z} into complex-conjugate-valued and real-valued
## elements.  The positive imaginary complex numbers of each complex conjugate
## pair are returned in @var{zc} and the real numbers are returned in @var{zr}.
##
## @var{tol} is a weighting factor in the range [0, 1) which determines the
## tolerance of the matching.  The default value is @code{100 * eps} and the
## resulting tolerance for a given complex pair is
## @code{@var{tol} * abs (@var{z}(i)))}.
##
## By default the complex pairs are sorted along the first non-singleton
## dimension of @var{z}.  If @var{dim} is specified, then the complex pairs are
## sorted along this dimension.
##
## Signal an error if some complex numbers could not be paired.  Signal an
## error if all complex numbers are not exact conjugates (to within @var{tol}).
## Note that there is no defined order for pairs with identical real parts but
## differing imaginary parts.
## @seealso{cplxpair}
## @end deftypefn

function [zc, zr] = cplxreal (z, tol, dim)

  if (nargin < 1 || nargin > 3)
    print_usage ();
  endif

  if (isempty (z))
    zc = zeros (size (z));
    zr = zeros (size (z));
    return;
  endif

  cls = ifelse (isa (z, "single"), "single", "double");
  if (nargin < 2 || isempty (tol))
    tol = 100 * eps (cls);
  endif

  args = cell (1, nargin);
  args{1} = z;
  args{2} = tol;
  if (nargin >= 3)
    args{3} = dim;
  endif

  zcp = cplxpair (args{:});

  nz = length (z);
  idx = nz;
  while ((idx > 0) && ((abs (imag (zcp(idx))) ./ abs (zcp(idx))) <= tol))
    zcp(idx) = real (zcp(idx));
    idx--;
  endwhile

  if (mod (idx, 2) != 0)
    error ("cplxreal: odd number of complex values was returned from cplxpair");
  endif

  zc = zcp(2:2:idx);
  zr = zcp(idx+1:nz);

endfunction

%!test
%! [zc, zr] = cplxreal ([]);
%! assert (isempty (zc))
%! assert (isempty (zr))
%!test
%! [zc, zr] = cplxreal (1);
%! assert (isempty (zc))
%! assert (zr, 1)
%!test
%! [zc, zr] = cplxreal ([1+1i, 1-1i]);
%! assert (zc, 1+1i)
%! assert (isempty (zr))
%!test
%! [zc, zr] = cplxreal (roots ([1, 0, 0, 1]));
%! assert (zc, complex (0.5, sin (pi/3)), 10*eps)
%! assert (zr, -1, 2*eps)

## Test input validation
%!error cplxreal ()
%!error cplxreal (1, 2, 3, 4)
%!error cplxreal (1, ones (2, 3))
%!error cplxreal (1, -1)
%!error cplxreal (1, [], 3)
