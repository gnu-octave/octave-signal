## Copyright (C) 2008 Sylvain Pelissier <sylvain.pelissier@gmail.com>
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
## @deftypefn {Function File} {[@var{ca}, @var{cd}] =} dwt (@var{x}, @var{lo_d}, @var{hi_d})
## Compute the discrete wavelet transform of @var{x} with one level.
## @end deftypefn

function [ca, cd] = dwt (x, lo_d, hi_d)

  if (nargin != 3)
    print_usage ();
  elseif (! isvector (x))
    error ("dwt: X must be a vector");
  elseif (! isvector (lo_d))
    error ("dwt: LO_D must be a vector");
  elseif (! isvector (hi_d))
    error ("dwt: HI_D must be a vector");
  endif

  h = filter (hi_d, 1, x);
  g = filter (lo_d, 1, x);

  cd = downsample (h, 2);
  ca = downsample (g, 2);

endfunction
