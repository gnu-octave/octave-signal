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
## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

## usage:  w = boxcar (n)
##
## Returns the filter coefficients of a rectangular window of length n.

function w = boxcar (n)
  
  if (nargin != 1)
    usage ("w = boxcar(n)");
  endif
  
  if !isscalar(n) || n != floor(n) || n <= 0
    error ("boxcar:  n must be an integer > 0");
  endif

  w = ones(n, 1);
  
endfunction
