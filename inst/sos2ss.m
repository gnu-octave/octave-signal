## Copyright (C) 2018 John W. Eaton
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
## @deftypefn  {Function File} {[@var{a}, @var{b}, @var{c}, @var{d}] =} sos2ss (@var{sos})
## Convert series second-order sections to state-space.
##
## @seealso{sos2ss, ss2tf}
## @end deftypefn

function [a, b, c, d] = sos2ss (sos, g = 1)

  if (nargin < 1 || nargin > 2)
    print_usage ();
  endif

  [num, den] = sos2tf (sos, g);

  [a, b, c, d] = tf2ss (num, den);

endfunction

%!test
%! sos = [1, 1, 0, 1, 0.5, 0];
%! g = 1;
%! [a, b, c, d] = sos2ss (sos, g);
%! assert ({a, b, c, d}, {-0.5, 0.5, 1, 1});
