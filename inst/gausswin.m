## Copyright (C) 1999 Paul Kienzle
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

## usage: w = gausswin(n, a)
##
## Generate an n-point gaussian window of the given width. Use larger a
## for a narrow window.  Use larger n for a smoother curve. 
##
##     w = exp ( -(a*x)^2/2 )
##
## for x = linspace(-(n-1)/n, (n-1)/n, n)
function x = gausswin(n, w)

  if nargin < 1 || nargin > 2
    usage("x = gausswin(n, w)");
  end
  if nargin == 1, w = 2.5; endif
  x = exp ( -0.5 * ( w/n * [ -(n-1) : 2 : n-1 ]' ) .^ 2 );

endfunction
