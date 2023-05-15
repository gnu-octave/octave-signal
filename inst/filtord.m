## Copyright (C) 2023 Leonardo Araujo <leolca@gmail.com>
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
## @deftypefn  {Function File} {@var{n} = } filtord (@var{b}, @var{a})
## @deftypefnx {Function File} {@var{n} = } filtord (@var{sos})
##
## Returns the filter order @var{n} for a filter defined by the numerator
## coefficients, @var{b}, and the denominator coefficients, @var{a}.
## It also accepts a filter defined by a matrix of second-order sections,
## @var{sos}.
##
## Example:
## @example
## [b, a] = butter (8, 0.5);
## filtord (b, a)
## @end example
## @end deftypefn

function n = filtord (b, a)
  if (nargin < 1 || nargin > 2) || ( nargin == 2 && ( ! isrow (b) || ! isrow (a) ) )
    print_usage;
  endif

  if (nargin == 1 && isrow (b))
    a = 1;
  endif

  if isrow (b)
    n = max ( length (b)-1, length (a)-1 );
  else
    n = (size (b, 1) - 1) * 2 + max (sum (b(end,1:3) != 0) , sum (b(end,4:6) != 0)) - 1;
  endif

endfunction

%!demo
%! b = [1 0];
%! a = [1 1];
%! n = filtord (b, a)

%!demo
%! b = [1 0 0 0 0 0 0 1];
%! a = [1 0 0 0 0 0 0 .5];
%! [sos, g] = tf2sos (b, a);
%! n = filtord (sos)

%! ## test input validation
%!error n = filtord ()
%!error n = filtord (1, 1, 1)
%!error n = filtord ([1:10]', 1)
%!error n = filtord (1, [1:10]')
%!error n = filtord ([1:10]', [1:10]')
%!error n = filtord (1:10, 1:10, 1:10)
%!error n = filtord (ones(3), ones(3))

%!test
%! b = [1 0 0];
%! a = [1 0 0 0];
%! n = filtord (b, a);
%! assert (n, 3, 1e-6)

%!test
%! [b, a] = butter (5, .5);
%! n = filtord (b, a);
%! assert (n, 5, 1e-6)

%!test
%! [b, a] = butter (6, .5);
%! n = filtord (b, a);
%! assert (n, 6, 1e-6)

%!test
%! b = [1 0 0 0 0 0 1];
%! a = [1 0 0 0 0 0 .5];
%! [sos, g] = tf2sos (b, a);
%! n = filtord (sos);
%! assert (n, 6, 1e-6)

%!test
%! b = [1 0 0 0 0 0 0 1];
%! a = [1 0 0 0 0 0 0 .5];
%! [sos, g] = tf2sos (b, a);
%! n = filtord (sos);
%! assert (n, 7, 1e-6)
