## Copyright (C) 2018 Leonardo Araujo
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
## @deftypefn  {Function File} {@var{c} =} cconv (@var{a}, @var{b}, @var{n})
## @deftypefnx {Function File} {@var{c} =} cconv (@var{a}, @var{b})
## Compute the modulo-N circular convolution.
##
## @var{a} and @var{b} are input vectors and @var{c} is the modolo-@var{n}
## convolution of @var{a} and @var{b}. If @var{n} is not provided,
## its assumed default value is @code{length(@var{a}) + length(@var{b}) - 1},
## which provides the same result as a linear convolution.
##
## Examples:
##
## @example
## @group
## cconv (1:2, 1:4)
##    @result{}  1   4   7   10   8
## @end group
## @end example
##
## @example
## @group
## cconv (1:2, 1:4, 2)
##    @result{}  16   14
## @end group
## @end example
##
## @example
## @group
## cconv (1:2, 1:4, 4)
##    @result{}  9   4   7   10
## @end group
## @end example
##
## @seealso{conv, circshift}
## @end deftypefn


function c = cconv (a, b, n)

  if (nargin < 2 || nargin > 3)
    print_usage ();
  endif

  la = length (a);
  lb = length (b);
  if (nargin == 3)
    if (! isscalar (n))
      error ("cconv: N must be a scalar");
    elseif (any (n != fix (n)))
      error ("cconv: N must be an integer");
    endif
  else
    n = la + lb - 1;
  endif

  if (! isvector (a) || ! isvector (b))
    error ("cconv: both arguments A and B must be vectors");
  endif

  flgcolumn = false;
  if ((la > 1 && iscolumn (a)) || (lb > 1 && iscolumn (b)))
    flgcolumn = true;
  endif

  a = a(:);
  b = b(:);
  if (la < lb)
    a = [a; zeros(lb - la, 1)];
  elseif (lb < la)
    b = [b; zeros(la - lb, 1)];
  end

  N = length (a);
  if (n < N)
    an = zeros (n, 1);
    bn = zeros (n, 1);
    for i = 0 : N - 1,
      an(mod (i, n) + 1) += a(i + 1);
      bn(mod (i, n) + 1) += b(i + 1);
    endfor
    a = an;
    b = bn;
  elseif (n > N)
    a = [a; zeros(n - N, 1)];
    b = [b; zeros(n - N, 1)];
  endif

  c = ifft (fft (a) .* fft (b)) ;

  if (!flgcolumn)
    c = c';
  endif

endfunction


%!shared x
%! x = [1, 2, 3, 4, 5];

%!assert (cconv (x, 1), [1, 2, 3, 4, 5])
%!assert (cconv (x', 1), [1; 2; 3; 4; 5])
%!assert (cconv (x, [1 1]), [1, 3, 5, 7, 9, 5])
%!assert (cconv (x, [1 1], 3), [8, 12, 10])

%!assert (cconv ([2 1 2 1], [1 2 3 4]), [2 5 10 16 12 11 4], 1e-14)
%!assert (cconv ([2 1 2 1], [1 2 3 4], 4), [14 16 14 16])
%!assert (cconv ([2 1 2 1], [1 2 3 4], 3), [22 17 21])
%!assert (cconv ([2 1 2 1], [1 2 3 4], 2), [28 32])
%!assert (cconv ([2 1 2 1], [1 2 3 4], 1), 60)

## Test input validation
%!error cconv ()
%!error cconv (1)
%!error <N must be a scalar> cconv (1, 1, [1 1])
%!error <both arguments A and B must be vectors> cconv (ones (2, 2), 1)
%!error <both arguments A and B must be vectors> cconv (1, ones (2, 2))
%!error <N must be an integer> cconv (1, 1, 3.5)

