## Copyright (C) 2002 Anand V
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

## A = convmtx(h,n)
##
## Returns the convolution matrix given a vector 'h' and length of x.
##
## The convolution matrix is the matrix formed from a vector whose 
## product with another vector is the convolution of the two vectors.
##
## A = convmtx(c,n) where c is a length m column vector returns a matrix A
## of size (m+n-1)-by-n. The product of A and a column vector x of
## length n is the convolution of c with x.
##
## A = convmtx(r,n) where r is a length m row vector returns a matrix A of
## size n-by-(m+n-1). The product of a row vector x of length n and A
## is the convolution of r with x.

## Author: Anand V <anand.v@achayans.com>
 
function retval = convmtx(h,n)
 
  if (nargin != 2)
    usage ("convmtx(h,n)");
  endif

  [nr, nc] = size(h);
  if ( (nr > 1) && (nc > 1) )
    error ("'h' should be either a row or column vector");
  endif

  r = [h(:);zeros(n-1,1)];
  c = [h(1);zeros(n-1,1)];
  retval = toeplitz(c,r);
 
  if (nc == 1)
    retval = retval.';
  endif
 
endfunction

%!assert(convmtx([3,4,5],3),[3,4,5,0,0;0,3,4,5,0;0,0,3,4,5])
%!assert(convmtx([3;4;5],3),[3,0,0;4,3,0;5,4,3;0,5,4;0,0,5])
