## Copyright (C) 2000 Paul Kienzle
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

## usage:  w = triang (n)
##
## Returns the filter coefficients of a triangular window of length n.
## Unlike the bartlett window, triang does not go to zero at the edges
## of the window.  For odd n, triang(n) is equal to bartlett(n+2) except
## for the zeros at the edges of the window.
##
## Note that the definition of triang for even values and odd values is
## different.  For odd values, it samples the continous function
## y=1-|x| at equally spaced points in the range (-1,1) whereas
## for even values it samples from y=1+1/n-|x|.

## 2001-04-07  Paul Kienzle
##    * return column vector like other window functions.

function w = triang(n)
  if (nargin != 1) 
    usage("w = triang(n)"); 
  endif
  if (n != fix (n) || n < 1)
    error("triang(n): n hast to be an integer > 0"); 
  endif
  k=(n-1)/2;
  if rem(n,2)
    w = 1-abs([-k:k]')/(k+1);
  else
    w = (k+1-abs([-k:k]'))/(k+1/2);
  endif
endfunction

%!error triang
%!error triang(1,2)
%!error triang([1,2]);
%!assert (triang(1), 1)
%!assert (triang(2), [1, 1])
%!test
%! x = bartlett(5);
%! assert (triang(3), x(2:4));

%!demo
%! subplot(221); axis([-1, 1, 0, 1.3]); grid("on");
%! title("comparison with continuous for odd n");
%! n=7; k=(n-1)/2; t=[-k:0.1:k]/(k+1); 
%! plot(t,1-abs(t),";continuous;",[-k:k]/(k+1),triang(n),"g*;discrete;");
%!
%! subplot(222); axis([-1, 1, 0, 1.3]); grid("on");
%! n=8; k=(n-1)/2; t=[-k:0.1:k]/(k+1/2); 
%! title("note the higher peak for even n");
%! plot(t,1+1/n-abs(t),";continuous;",[-k:k]/(k+1/2),triang(n),"g*;discrete;");
%!
%! subplot(223); axis; grid("off");
%! title("n odd, triang(n)==bartlett(n+2)");
%! n=7;
%! plot(0:n+1,bartlett(n+2),"g-*;bartlett;",triang(n),"r-+;triang;");
%!
%! subplot(224); axis; grid("off");
%! title("n even, triang(n)!=bartlett(n+2)");
%! n=8;
%! plot(0:n+1,bartlett(n+2),"g-*;bartlett;",triang(n),"r-+;triang;");
%!
%! oneplot; title("");
