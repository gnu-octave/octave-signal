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
## @deftypefn {Function File} {[@var{w}] =} barthannwin(@var{L})
##	Compute the modified Bartlett-Hann window of lenght L.
## @seealso{rectwin,  bartlett}
## @end deftypefn

function [w] = barthannwin(L)
	if (nargin < 1); usage('barthannwin(x)'); end
	if(! isscalar(L))
		error("L must be a number");
	endif
	
	N = L-1;
	n = 0:N;
	
	w = 0.62 -0.48.*abs(n./(L-1) - 0.5)+0.38*cos(2.*pi*(n./(L-1)-0.5));
endfunction;
	
