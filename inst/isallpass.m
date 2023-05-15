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
## @deftypefn  {Function File} {@var{L} = } isallpass (@var{b}, @var{a})
## @deftypefnx {Function File} {@var{L} = } isallpass (@var{sos})
##
## Determine whether a digital filter is allpass. The filter might be defined
## by the numerator coefficients, @var{b}, and the denominator coefficients,
## @var{a}, or, alternatively, by a matrix of second-order sections, @var{sos}.
##
## Example:
## @example
## a = [1 2 3];
## b = [3 2 1];
## isallpass (b, a)
## @end example
##
## Ref [1] Shyu, Jong-Jy, & Pei, Soo-Chang,
## A new approach to the design of complex all-pass IIR digital filters,
## Signal Processing, 40(2–3), 207–215, 1994.
## https://doi.org/10.1016/0165-1684(94)90068-x
##
## Ref [2] Vaidyanathan, P. P. Multirate Systems and Filter Banks.
## 1st edition, Pearson College Div, 1992.
## @end deftypefn

function flag = isallpass (b, a)
  if (nargin < 1 || nargin > 2 )
    print_usage;
  endif

  if (nargin == 2 && ( ! isrow (a) || ! isrow (b) ))
    error ( "coefficient array should be a row vector" );
  endif

  if (nargin == 1 && ! all(size (b) > [1 1]) )
    error ( "a valid second-order section representation should be given" );
  endif

  if nargin == 2 && !all(size (b) == size (a)),
    flag = false;
    return;
  elseif (nargin == 2 && isrow (a) && isrow (b))
    # remove leading and trailing zeros
    b = b(find (b, 1):end);
    a = a(find (a, 1):end);
    b = b(1:find (b,1,"last"));
    a = a(1:find (a,1,"last"));
    # normalize
    b = b./b(end);
    a = a./a(1);
    flag = (all(b == fliplr (conj(a))) || all(b == -fliplr (conj(a))));
  elseif (nargin == 1 && all(size (b) > [1 1]))
    [b, a] = sos2tf (b);
    flag = isallpass (b, a);
  endif

endfunction

%!demo
%! # H(z) = (b1 - z^-1) * (b2 - z^-1) / ((1 - b1*z^-1) * (1 - b2*z^-1))
%! b1 = 0.5 * (1 + i);
%! b2 = 0.7 * (cos (pi/6) + i*sin (pi/6));
%! b = conv ([b1 -1], [b2 -1]);
%! a = conv ([1 (-1)*conj(b1)],[1 (-1)*conj(b2)]);
%! freqz (b, a);
%! f = isallpass (b, a)

%! ## test input validation
%!error n = isallpass ()
%!error n = isallpass (1)
%!error n = isallpass (1, 1, 1)
%!error n = isallpass (1, 1, 1, 1)
%!error n = isallpass (1, 1, 1, 1, 1)
%!error n = isallpass ([1:10]', 1)
%!error n = isallpass (1, [1:10]')
%!error n = isallpass ([1:10]', [1:10]')
%!error n = isallpass (1:10, 1:10, 1:10)
%!error n = isallpass (ones (3), ones (3))

%!test
%! b = [(1+i)/2 -1];
%! a = [1 -(1-i)/2];
%! f = isallpass (b, a);
%! assert (f, true)

%!test
%! b = [(1+i)/2 -1];
%! a = [-1 (1-i)/2];
%! f = isallpass (b, a);
%! assert (f, true)

%!test
%! [b, a] = butter (1, 0.5);
%! f = isallpass (b, a);
%! assert (f, false)

%!test
%! b1 = 0.5 * (1 + i);
%! b2 = 0.7 * (cos (pi/6) + i*sin (pi/6));
%! b = conv ([b1 -1], [b2 -1]);
%! a = conv ([1 -conj(b1)],[1, -conj(b2)]);
%! f = isallpass (b, a);
%! assert (f, true)
