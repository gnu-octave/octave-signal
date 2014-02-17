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
## @deftypefn {Function File} {} nuttallwin (@var{m})
## Return the filter coefficients of a Blackman-Harris window defined by Nuttall
## of length @var{m}.
## @seealso{blackman, blackmanharris}
## @end deftypefn

function w = nuttallwin (m)

  if (nargin != 1)
    print_usage ();
  elseif (! (isscalar (m) && (m == fix (m)) && (m > 0)))
    error ("nuttallwin: M must be a positive integer");
  endif

  if (m == 1)
    w = 1;
  else
    N = m - 1;
    a0 = 0.355768;
    a1 = 0.487396;
    a2 = 0.144232;
    a3 = 0.012604;
    n = -N/2:N/2;
    w = a0 + a1.*cos(2.*pi.*n./N) + a2.*cos(4.*pi.*n./N) + a3.*cos(6.*pi.*n./N);
    w = w';
  endif

endfunction

%!assert (nuttallwin (1), 1)
%!assert (nuttallwin (2), zeros (2, 1), eps)

%% Test input validation
%!error nuttallwin ()
%!error nuttallwin (0.5)
%!error nuttallwin (-1)
%!error nuttallwin (ones (1, 4))
%!error nuttallwin (1, 2)
