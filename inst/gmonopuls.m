## Copyright (C) 2007 Sylvain Pelissier <sylvain.pelissier@gmail.com>
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; see the file COPYING. If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {@var{y} =} gmonopuls (@var{t},@var{fc})
## @deftypefnx {Function File} {@var{tc} =} gmonopuls ('cutoff', @var{fc})
## Return the gaussian monopulse or compute its cutoff time.
## @end deftypefn

function y = gmonopuls (t, fc = 1e3)

  if (nargin < 1 || nargin > 2)
    print_usage ();
  endif

  if (fc < 0)
    error ("gmonopuls: fc must be positive.");
  endif

  if (ischar (t))
    if(!strcmp (t, 'cutoff'))
      error ("gmonopuls: first argument must be 'cutoff' or a time value vector.");
    endif
    ## Second form: gmonopuls('cutoff', fc)
    ## tc = 1/(pi*fc)
    y = 1 / (pi * fc);
    return;
  endif

  y = 2*sqrt(exp(1)) .* pi.*t.*fc.*exp(-2 .* (pi.*t.*fc).^2);

endfunction
