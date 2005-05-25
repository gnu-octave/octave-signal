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

## Y = filter2 (B, X)
##	Apply the 2-D FIR filter B to the matrix X.
## Y = filter2 (B, X, 'shape')
##      Apply the 2-D FIR filter B to the matrix X, returning the
##      desired shape:
##          full  - pad X with zeros on all sides before filtering
##          same  - unpadded X (default)
##          valid - trim X after filtering so edge effects are no included
##
## Note this is just a variation on convolution, with the parameters
## reversed and B rotated 180 degrees.

## Author: Paul Kienzle <pkienzle@users.sf.net>
## 2001-02-08 
##    * initial release

function Y = filter2 (B, X, shape)

  if (nargin < 2 || nargin > 3)
    usage ("Y = filter2 (B, X [, 'shape'])");
  endif
  if nargin < 3
    shape = "same";
  endif

  [nr, nc] = size(B);
  Y = conv2 (X, B(nr:-1:1, nc:-1:1), shape);

endfunction
