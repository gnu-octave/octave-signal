## Copyright (C) 2001 Paul Kienzle
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

## F = sgolay (p, n)
##   Computes the filter coefficients for all Savitzsky-Golay smoothing
##   filters of order p for length n (odd).
##
## The early rows of F smooth based on future values and later rows
## smooth based on past values, with the middle row using half future
## and half past.  In particular, you can use row i to estimate x(k)
## based on the i-1 preceding values and the n-i following values of x
## values as y(k) = F(i,:) * x(k-i+1:k+n-i).
##
## Normally, you would apply the first (n-1)/2 rows to the first k
## points of the vector, the last k rows to the last k points of the
## vector and middle row to the remainder, but for example if you were
## running on a realtime system where you wanted to smooth based on the
## all the data collected up to the current time, with a lag of five
## samples, you could apply just the filter on row n-5 to your window
## of length n each time you added a new sample.
##
## Reference: Numerical recipes in C. p 650
##
## See also: sgolayfilt

## Author: Paul Kienzle <pkienzle@kienzle.powernet.co.uk>
## Based on smooth.m by E. Farhi <manuf@ldv.univ-montp2.fr>

## TODO: Doesn't accept "weight vector" as fourth parameter since
## TODO: Should be able to estimate derivatives using second and
## TODO: subsequent columns of A, but they seem to have the wrong
## TODO: sign and the wrong scale, so I won't put that in.

function F = sgolay (p, n)

  if (nargin < 2 || nargin > 3)
    usage ("F = sgolay (p, n)");
  elseif rem(n,2) != 1
    error ("sgolay needs an odd filter length n");
  elseif p >= n
    error ("sgolay needs filter length n larger than polynomial order p");
  else 
    k = floor (n/2);
    F = zeros (n, n);
    for row = 1:k+1
      A = pinv( ( [(1:n)-row]'*ones(1,p+1) ) .^ ( ones(n,1)*[0:p] ) );
      F(row,:) = A(1,:);
    end
    F(k+2:n,:) = F(k:-1:1,n:-1:1);
  endif

endfunction
