## Copyright (C) 2026 John Donoghue
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
## @deftypefn {} {[@var{b}, @var{a}] =} eqtflength (@var{num}, @var{den})
## @deftypefnx {} {[@var{b}, @var{a}, @var{n}, @var{m}] =} eqtflength (@var{num}, @var{den})
## Equalize numerator and denominator polynomial lengths.
##
## Pads the shorter polynomial with trailing zeros so that the returned
## numerator @var{b} and denominator @var{a} have equal length while
## representing the same discrete-time transfer function.
##
## Outputs @var{n} and @var{m} are the numerator and
## denominator orders, respectively, excluding trailing zeros.
##
## Example:
##
## @example
## [b, a] = eqtflength ([1 2], [1 0.5 0.25])
##      b = [1 2 0]
##      a = [1 0.5 0.25]
## @end example
##
## @seealso{tf2ss, tf2zp}
## @end deftypefn

function [b, a, n, m] = eqtflength (num, den)

  if (nargin != 2)
    print_usage ();
  endif

  if (! isvector (num) || ! isvector (den))
    error ("eqtflength: NUM and DEN must be vectors");
  endif

  ## Return row vectors
  b = num(:).';
  a = den(:).';

  ## Determine polynomial orders excluding trailing zeros
  if (isempty (b))
    n = -1;
  endif
  idx = find (b != 0, 1, "last");
  if (isempty (idx))
    ## Zero polynomial
    n = 0;
  else
    n = idx - 1;
  endif

  if (isempty (a))
    m = -1;
  endif
  idx = find (a != 0, 1, "last");
  if (isempty (idx))
    ## Zero polynomial
    m = 0;
  else
    m = idx - 1;
  endif

  ## Equalize lengths
  len = max (length (b), length (a));

  if (length (b) < len)
    b(end+1:len) = 0;
  endif

  if (length (a) < len)
    a(end+1:len) = 0;
  endif

endfunction

%!test
%! [b,a] = eqtflength([1 2],[1 2 3 4]);
%! assert(b, [1 2 0 0]);
%! assert(a, [1 2 3 4]);

%!test
%! [b,a,n,m] = eqtflength([0 0 0],[1]);
%! assert(b, [0 0 0]);
%! assert(a, [1 0 0]);
%! assert(n, 0);
%! assert(m, 0);

%!test
%! num = [0 0 2];
%! den = [4 0 3 -1];
%! 
%! [b,a,n,m] = eqtflength(num,den);
%! assert(b, [0 0 2 0]);
%! assert(a, [4 0 3 -1]);
%! assert(n,2);
%! assert(m,3);
