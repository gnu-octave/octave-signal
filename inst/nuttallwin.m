## Copyright (C) 2007   Sissou   <sylvain.pelissier@gmail.com>
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
## @deftypefn {Function File} {[@var{w}] =} nuttallwin(@var{L})
##	Compute the Blackman-Harris window defined by Nuttall of length L.
## @seealso{blackman, blackmanharris}
## @end deftypefn

function [w] = nuttallwin(L)
	if (nargin < 1); usage('nuttallwin(x)'); end
	if(! isscalar(L))
		error("L must be a number");
	endif
	
	N = L-1;
	a0 = 0.3635819;
	a1 = 0.4891775;
	a2 = 0.1365995;
	a3 = 0.0106411;
	n = -ceil(N/2):N/2;
	w = a0 + a1.*cos(2.*pi.*n./N) + a2.*cos(4.*pi.*n./N) + a3.*cos(6.*pi.*n./N);
endfunction;
	