## Copyright (C) 2014 Georgios Ouzounis <ouzounis_georgios@hotmail.com>
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or (at
## your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} {[@var{out}] =} unshiftdata (@var{in}, @var{perm}, @var{shifts})
## Reverse what is done by shiftdata.
## @seealso{shiftdata}
## @end deftypefn

function out = unshiftdata (in, perm, shifts)

  if (nargin != 3)
    print_usage ();
  endif

  if (! isempty (perm))
    if (perm != fix (perm))
      error ("unshiftdata : PERM must be a vector of integers.");
    endif
    dimention = perm(1);
  elseif (! isempty (shifts))
    if (shifts != fix (shifts))
      error ("unshiftdata : SHIFTS must be an integer.");
    endif
    dimention = shifts + 1;
  else
    error ("unshiftdata : Either PERM or SHIFTS must not be empty.");
  endif

  out = ipermute (in, [dimention 1: (dimention - 1) (dimention + 1): (length (size (in)))]);

endfunction

%!test
%! x = 1:5;
%! [y perm shifts] = shiftdata (x);
%! x2 = unshiftdata (y, perm, shifts);
%! assert (x, x2);

%!test
%! X = fix (rand (3, 3) * 100);
%! [Y perm shifts] = shiftdata (X, 2);
%! X2 = unshiftdata (Y, perm, shifts);
%! assert (X, X2);

%!test
%! X = fix (rand (4, 4, 4, 4) * 100);
%! [Y perm shifts] = shiftdata (X, 3);
%! X2 = unshiftdata (Y, perm, shifts);
%! assert (X, X2);

%!test
%! X = fix (rand (1, 1, 3, 4) * 100);
%! [Y perm shifts] = shiftdata (X);
%! X2 = unshiftdata (Y, perm, shifts);
%! assert (X, X2);
