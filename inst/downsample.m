## Copyright (C) 2007   Sylvain Pelissier   <sylvain.pelissier@gmail.com>
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

## -*- texinfo -*-
## @deftypefn {Function File} {[@var{y}] =} downsample(@var{x},@var{n})
##	Build the vector y by keeping only nth sample of x. x can be a vector or a matrix.
## @end deftypefn


function [y] = downsample(x,n)
	if (nargin < 2); usage('downsample(x,n)'); end

	if(isvector(x))
		k = 1:n:length(x);
		y = x(k);
	else
		if(ismatrix(x))
			k = 1:n:length(x);
			s = size(x,2);
			i = 1:s;
			y(:,i) = x(k,i);
		end
	end
endfunction