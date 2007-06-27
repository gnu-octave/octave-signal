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
## @deftypefn {Function File} {[@var{y}] =} gauspuls(@var{t},@var{fc},@var{bw})
##	Return the Gaussian modulated sinusoidal pulse.
## @end deftypefn

function [y] = gauspuls(t,fc,bw)
	if nargin<1, error("Usage : gauspuls(t,fc,bw)"); end
	if nargin<2, 
		fc = 1e3;
		bw = 0.5;
	end
	if nargin < 3, bw = 0.5; end
	if fc < 0 , error("fc must be positive"); end
	if bw <= 0, error("bw must be stricltly positive"); end
	
	fv = -(bw.*bw.*fc.^2)/(8.*log(10.^(-6/20)));
	tv = 1/(4.*pi.*pi.*f); 
	y = exp(-t.*t/(2.*tv)).*sin(2.*pi.*fc.*t);
endfunction