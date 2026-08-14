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
## @deftypefn {Function File} {[@var{psi}, @var{x}] =} mexihat (@var{lb}, @var{ub}, @var{n})
## Compute the Mexican hat wavelet.
## @end deftypefn

function [psi,x] = mexihat(lb,ub,n)

  if (nargin < 3); print_usage; endif

  if (n <= 0)
    error("n must be strictly positive");
  endif
  x = linspace(lb,ub,n);
  psi = (1-x.^2).*(2/(sqrt(3)*pi^0.25)) .* exp(-x.^2/2)  ;

endfunction

%!error mexihat
%!error mexihat(1)
%!error mexihat(1, 2)
%!error mexihat(1, 2, 0)

%!test
%! [psi, x] = mexihat(-5, 5, 3);
%!
%! # types/size
%! assert(length(psi), 3);
%! assert(length(psi), length(x));
%! assert(isreal(psi));
%! assert(isreal(x));
%! assert(max(psi) > 0);
%! assert(min(psi) < 0);
%! assert(x, [-5  0 5])
%!
%! # wavelet is symmetric
%! assert(psi, fliplr(psi), 100*eps);
%!
%! # wavelet has a positive center and negative side lobes
%! center = ceil(length(psi) / 2);
%! assert(psi(center) > 0);
%! assert(psi(1) < 0);
%! assert(psi(end) < 0);

%!test
%! [psi, x] = mexihat(-15, 15, 3);
%! assert(length(psi), 3);
%! assert(length(psi), length(x));
%! assert(x, [-15 0 15])
%! assert(psi, fliplr(psi), 100*eps);

%!test
%! [psi, x] = mexihat(-5, 5, 5);
%! assert(length(psi), 5);
%! assert(length(psi), length(x));
%! assert(x, [-5.0000 -2.5000 0 2.5000 5.0000])
%! assert(psi, fliplr(psi), 100*eps);
