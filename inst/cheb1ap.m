## Copyright (C) 2021 The Octave Project Developers
## Copyright (C) 2013 Carnë Draug <carandraug+dev@gmail.com>
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
## @deftypefn {Function File} {[@var{z}, @var{p}, @var{g}] =} cheb1ap (@var{n}, @var{Rp})
## Design lowpass analog Chebyshev type I filter.
##
## This function exists for @sc{matlab} compatibility only, and is equivalent
## to @code{cheby1 (@var{n}, @var{Rp}, 1, "s")}.
##
## Input:
## @itemize
## @item @var{N} Order of the filter must be a positive integer
## @item @var{RP} Ripple in the passband in dB
## @end itemize
##
## Output:
## @itemize
## @item @var{z} The zero vector
## @item @var{p} The pole vectorAngle
## @item @var{g} The gain factor
## @end itemize
## 
## Example
## @example
## [z, p, g] = cheb1ap (2, 1)
## z = [](0x1)
## p =
##
##  -0.54887 - 0.89513i
##  -0.54887 + 0.89513i
##
## g =  0.98261
## @end example
## @seealso{buttap, cheby1, cheb2ap, ellipap}
## @end deftypefn

function [z, p, g] = cheb1ap (n, Rp)

  if (nargin != 2)
    print_usage ();
  elseif (! isscalar (n) || ! isnumeric (n) || fix (n) != n || n <= 0)
    error ("cheb1ap: N must be a positive integer")
  elseif (! isscalar (Rp) || ! isnumeric (Rp) || Rp < 0)
    error ("cheb1ap: RP must be a non-negative scalar")
  endif
  [z, p, g] = cheby1 (n, Rp, 1, "s");
  
  g = real (g); %Gain should only be the real component

endfunction
%!error <N must> cheb1ap (-1, 4)
%!error <N must> cheb1ap (1.5, 4)
%!error <RP must> cheb1ap (2, -1)

# From https://ewh.ieee.org/r1/ct/sps/PDF/MATLAB/chapter5.pdf
%!test 
%! [z,p,k]=cheb1ap(4,2);
%! assert (isempty(z), 1, 0)
%! assert (p, [  -0.10489 - 0.95795i;
%!               -0.25322 - 0.39680i;
%!               -0.25322 + 0.39680i;
%!               -0.10489 + 0.95795i], e-6)
%! assert (k, 0.1634, e-6)
