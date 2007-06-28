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
## @deftypefn {Function File} {[@var{y}] =} sawtooth(@var{t})
##	Return a a sawtooth wave of period 2*pi.
## @end deftypefn

function [y] = sawtooth(t)
	if nargin<1, error("Usage : sawtooth(t)"); end
	if !isvector(t), error("t must be a vector"); end
	fs = 4/(2*pi);
	p = [0 1 0 -1 0];
	k1 = floor(t(1)/(2*pi))
	k2 = ceil(t(length(t))/(2*pi))
	d = (k1:k2).*(2.*pi)
	y = pulstran(t,d,p,fs);

endfunction
