## Copyright (C) 2007 Sylvain Pelissier <sylvain.pelissier@gmail.com>
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
## along with this program; If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {[@var{y} @var{i}] =} bitrevorder(@var{x})
## Reorder x in the bit reversed order
## @seealso{fft,ifft}
## @end deftypefn

function [y i] = bitrevorder(x)
	
	if(nargin < 1 || nargin >1)
		error('usage : [y i] = bitrevorder(x)');
	end
	
	if(log2(length(x)) ~= floor(log2(length(x))))
		error('x must have a length equal to a power of 2');
	end
	
	old_ind = 0:length(x)-1;
	new_ind = bi2de(fliplr(de2bi(old_ind)));
	i = new_ind + 1;

	y(old_ind+1) = x(i);
