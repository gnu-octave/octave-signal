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
## @deftypefn {Function File} {[@var{z}, @var{p}, @var{g}] =} cheb2ap (@var{n}, @var{Rs})
## Design lowpass analog Chebyshev type II filter.
##
## This function exists for @sc{matlab} compatibility only, and is equivalent
## to @code{cheby2 (@var{n}, @var{Rs}, 1, "s")}.
##
## Demo
## @example
## demo cheb2ap
## @end example
##
## @seealso{cheby2}
## @end deftypefn

function [z, p, g] = cheb2ap (n, Rs)

  if (nargin != 2)
    print_usage();
  elseif (! isscalar (n) || ! isnumeric (n) || fix (n) != n || n <= 0)
    error ("cheb2ap: N must be a positive integer")
  elseif (! isscalar (Rs) || ! isnumeric (Rs) || Rs < 0)
    error ("cheb2ap: RS must be a non-negative scalar")
  endif
  [z, p, g] = cheby2 (n, Rs, 1, "s");

endfunction
%!error <N must> cheb2ap (-1, 3)
%!error <RS must> cheb2ap (3, -1)

#From Steven T. Karris "Signals and Systems Second Edition"  [pg. 11-36]
%!demo
%! w=0:0.01:1000;
%! [z, p, k] = cheb2ap (3, 3);
%! [b, a] = zp2tf (z, p, k);
%! Gs = freqs (b, a, w);
%! semilogx (w, abs (Gs));
%! xlabel('Frequency in rad/sec')
%! ylabel('Magnitude of G(s)');
%! title('Type 2 Chebyshev Low-Pass Filter, k=3, 3 dB ripple in stop band')
%! grid;