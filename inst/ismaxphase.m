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
## @deftypefn  {Function File} {@var{L} = } ismaxphase (@var{b}, @var{a})
## @deftypefnx {Function File} {@var{L} = } ismaxphase (@var{sos})
## @deftypefnx {Function File} {@var{L} = } ismaxphase (@dots{}, @var{tol})
##
## Determine whether a digital filter is maximum phase (maximum energy-delay).
## The filter might be defined by the numerator coefficients, @var{b}, and the
## denominator coefficients, @var{a}, or, alternatively, by a matrix of
## second-order sections, @var{sos}. A tolerance @var{tol} might be given to
## define when two numbers are close enough to be considered equal.
##
## Example:
## @example
## b = [1 2 4 4 2 1];
## zplane (b);
## ismaxphase (b)
## @end example
##
## Ref [1] Oppenheim, Alan, and Ronald Schafer. Discrete-Time Signal Processing.
## 3rd edition, Pearson, 2009.
## @end deftypefn

function flag = ismaxphase (b, a, tol)
  if (nargin < 1 || nargin > 3 )
    print_usage;
  endif

  if (nargin == 2 && ( ! isrow (a) || ! isrow (b) ))
    error ( "coefficient array should be a row vector" );
  endif

  if (nargin == 1 && isrow (b))
    a = 1;
  endif

  if nargin < 3
    tol = eps^(3/4);
  elseif length (tol) > 1
    error ( "a scalar is expected as the tolerance value" );
  endif

  if (nargin > 1 && isrow (a) && isrow (b)) || (nargin == 1 && isrow (b))
    zm = abs (roots (b));
    pm = abs (roots (a));
    # Zeros of a maximum phase filter are constrained to lie outside the unit circle.
    #  The filter should be stable (poles inside the unit circle).
    flag = (all (zm > 1 + tol) || isempty (zm)) && (all (pm < 1 - tol) || isempty (pm));
  elseif (nargin == 1 && all(size (b) > [1 1]))
    [b, a] = sos2tf (b);
    flag = ismaxphase (b, a, tol);
  endif

endfunction

%!demo
%! [b, a] = butter (1, .5);
%! f = ismaxphase (b, a)

## test input validation
%!error n = ismaxphase ()
%!error n = ismaxphase (1, 1, 1, 1)
%!error n = ismaxphase (1, 1, 1, 1, 1)
%!error n = ismaxphase ([1:10]', 1)
%!error n = ismaxphase (1, [1:10]')
%!error n = ismaxphase ([1:10]', [1:10]')
%!error n = ismaxphase (1:10, 1:10, 1:10)
%!error n = ismaxphase (ones (3), ones (3))

%!test
%! z1 = [0.9*exp(j*0.6*pi), 0.9*exp(-j*0.6*pi)];
%! z2 = [0.8*exp(j*0.8*pi), 0.8*exp(-j*0.8*pi)];
%! b = poly ([z1 z2]);
%! a = 1;
%! f = ismaxphase (b, a);
%! assert (f, false)

%!test
%! z1 = [0.9*exp(j*0.6*pi), 0.9*exp(-j*0.6*pi)];
%! z2 = [0.8*exp(j*0.8*pi), 0.8*exp(-j*0.8*pi)];
%! b = poly ([1./z1 1./z2]);
%! a = 1;
%! f = ismaxphase (b, a);
%! assert (f, true)

%!test
%! z1 = [0.9*exp(j*0.6*pi), 0.9*exp(-j*0.6*pi)];
%! z2 = [0.8*exp(j*0.8*pi), 0.8*exp(-j*0.8*pi)];
%! b = poly ([z1 1./z2]);
%! a = 1;
%! f = ismaxphase (b, a);
%! assert (f, false)

%!test
%! z1 = [0.9*exp(j*0.6*pi), 0.9*exp(-j*0.6*pi)];
%! z2 = [0.8*exp(j*0.8*pi), 0.8*exp(-j*0.8*pi)];
%! b = poly ([1./z1 z2]);
%! a = 1;
%! f = ismaxphase (b, a);
%! assert (f, false)

%!test
%! [b, a] = butter (1, .5);
%! f = ismaxphase (b, a);
%! assert (f, false)

%!test
%! [b, a] = butter (8, .5);
%! f = ismaxphase (b, a);
%! assert (f, false)
