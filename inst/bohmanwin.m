## Copyright (C) 2007 Sylvain Pelissier <sylvain.pelissier@gmail.com>
##
## This program is free software; you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation; either version 3 of the License, or (at your option) any later
## version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details.
##
## You should have received a copy of the GNU General Public License along with
## this program; if not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {[@var{w}] =} bohmanwin (@var{m})
## Compute the Bohman window of length @var{m}.
## @seealso{rectwin, bartlett}
## @end deftypefn

function [w] = bohmanwin(m)

  if (nargin < 1)
    print_usage
  elseif(! isscalar(m))
    error("M must be a number");
  elseif(m < 0)
    error('M must be positive');
  endif

  if(m ~= floor(m))
    m = round(m);
    warning('M rounded to the nearest integer.');
  endif

  if(m == 0)
    w = [];

  elseif(m == 1)
    w = 1;

  else
    N = m - 1;
    n = -N/2:N/2;

    w = (1-2.*abs(n)./N).*cos(2.*pi.*abs(n)./N) + (1./pi).*sin(2.*pi.*abs(n)./N);
    w(1) = 0;
    w(length(w))=0;
    w = w';
  endif

endfunction
