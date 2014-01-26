## Copyright (C) 2007 Muthiah Annamalai <muthiah.annamalai@uta.edu>
## Copyright (C) 2008-2009 Mike Gross <mike@appl-tech.com>
## Copyright (C) 2008-2009 Peter V. Lanspeary <pvl@mecheng.adelaide.edu.au>
##
## This program is free software; you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation; either version 3 of the License, or (at your option) any later
## version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details.
##
## You should have received a copy of the GNU General Public License along with
## this program; if not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {[@var{w}] =} welchwin (@var{L},@var{c})
## Returns a row vector containing a Welch window, given by
## @var{w}(n)=1-(n/N-1)^2,   n=[0,1, ... @var{L}-1].
## Argument @var{L} is the length of the window.
## Optional argument @var{c} specifies a "symmetric" window (the default),
## or a "periodic" window.
##
## A symmetric window has zero at each end and maximum in the middle;
## @var{L} must be an integer larger than 2.
## @code{if c=="symmetric", N=(L-1)/2}
##
## A periodic window wraps around the cyclic interval [0,1, ... @var{L}-1],
## and is intended for use with the DFT  (functions fft(),
## periodogram() etc).
## @var{L} must be an integer larger than 1.
## @code{if c=="periodic", N=@var{L}/2}.
##
## @seealso{blackman, kaiser}
## @end deftypefn

function [w] = welchwin(L,c)

  if (nargin < 1 || nargin>2 )
    print_usage;
  endif
  symmetric=1;
  if ( nargin==2 && ! isempty(c) )
    if ( ! ischar(c) || size(c,1) != 1 ||
         ( ! strcmp(c,'periodic') && ! strcmp(c,'symmetric') ) )
      error( "arg 2 (c) must be \"periodic\" or \"symmetric\"" )
    endif
    symmetric = ! strcmp(c,'periodic');
  endif
  ##
  ## Periodic window is not properly defined if L<2.
  ## Symmetric window is not properly defined if L<3.
  min_L = 2 + symmetric;
  if ( ! isreal(L) || ! isscalar(L) || L<min_L || fix(L) != L )
    error("arg 1 (L) must be an integer larger than %d", min_L-1 );
  endif
  N = (L-symmetric)/2;
  n = 0:L-1;
  w = 1 - ((n-N)./N).^2;

endfunction;

%!demo
%! L = 32;
%! t = [0:L-1];
%! printf ("Graph: single period of ");
%! printf ("%d-point periodic (blue) and symmetric (red) windows\n", L);
%! xp = welchwin (L, "periodic");
%! xs = welchwin (L, "symmetric");
%! plot (t, xp, "b", t, xs, "r")

%!demo
%! L = 32;
%! t = [0:4*L-1];
%! printf ("Graph: 4 periods of ");
%! printf ("%d-point periodic (blue) and symmetric (red) windows\n", L);
%! xp = welchwin (L, "periodic");
%! xs = welchwin (L, "symmetric");
%! xp2 = repmat (xp, 1, 4);
%! xs2 = repmat (xs, 1, 4);
%! plot (t, xp2, "b", t, xs2, "r")

%!demo
%! L = 32;
%! n = 512;
%! xp = welchwin (L, "periodic");
%! s = fftshift (max (1e-2, abs (fft (postpad (xp, n)))));
%! f = [-0.5:1/n:0.5-1/n];
%! printf ("%dx null-padded, power spectrum of %d-point window\n", n/L, L);
%! semilogy (f, s)
