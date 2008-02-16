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
## @deftypefn {Function File} {[@var{psi,x}] =} cmorwavf (@var{lb,ub,n,fb,fc})
##	Compute the Complex Morlet wavelet.
## @end deftypefn

function [psi,x] = cmorwavf (lb,ub,n,fb,fc)
	if (nargin ~= 5); usage('[psi,x] = cmorwavf(lb,ub,n,fb,fc)'); end
	
	if (n <= 0 || floor(n) ~= n)
		error("n must be an integer strictly positive");
	endif
	x = linspace(lb,ub,n);
	psi =((pi*fb)^(-0.5))*exp(2*i*pi*fc.*x).*exp(-x.^2/fb);
endfunction

