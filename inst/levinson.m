## Copyright (C) 1999 Paul Kienzle <pkienzle@users.sf.net>
## Copyright (C) 2006 Peter V. Lanspeary <peter.lanspeary@.adelaide.edu.au>
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
## @deftypefn  {Function File} {[@var{a}, @var{v}, @var{ref}] =} levinson (@var{acf})
## @deftypefnx {Function File} {[@dots{}] =} levinson (@var{acf}, @var{p})
##
## Use the Durbin-Levinson algorithm to solve:
##    toeplitz(acf(1:p)) * x = -acf(2:p+1).
## The solution [1, x'] is the denominator of an all pole filter
## approximation to the signal x which generated the autocorrelation
## function acf.
##
## acf is the autocorrelation function for lags 0 to p.
## p defaults to length(acf)-1.
## Returns
##   a=[1, x'] the denominator filter coefficients.
##   v= variance of the white noise = square of the numerator constant
##   ref = reflection coefficients = coefficients of the lattice
##         implementation of the filter
## Use freqz(sqrt(v),a) to plot the power spectrum.
##
## REFERENCE
## [1] Steven M. Kay and Stanley Lawrence Marple Jr.:
##   "Spectrum analysis -- a modern perspective",
##   Proceedings of the IEEE, Vol 69, pp 1380-1419, Nov., 1981
## @end deftypefn

## Based on:
##    yulewalker.m
##    Copyright (C) 1995 Friedrich Leisch <Friedrich.Leisch@ci.tuwien.ac.at>
##    GPL license

## FIXME: What is the difference between aryule, levinson,
##        ac2poly, ac2ar, lpc, etc.?

function [a, v, ref] = levinson (acf, p)

  if (nargin < 1 || nargin > 2)
    print_usage ();
  endif

  if (isempty (acf) || !(isvector (acf) || ismatrix (acf)))
    error("levinson: arg 1 (acf) must be a non-empty vector or matrix.");
  endif

  if (isvector (acf))
    acf = acf(:);  # force to a column vector
  endif
  [row, col] = size (acf);
  if (nargin < 2 || p >= row)
    p = row - 1;
  endif
  if (nargin > 1 && (!isscalar (p) || fix (p) != p || p < 0 ))
    if (fix (p) != p)
      p = floor (p);  ## for compatibility
    else
      error("levinson: arg 2 (p) must be a non-negative integer.");
    endif
  endif

  ## If acf is a scalar, or if p=0, algorithm gives error.
  ## These cases are trivial, so just return the trivial solution in these cases.
  if (numel (acf) == 1 || p == 0)
    a = ones(col, 1); v = real(acf(1,:)); ref = zeros(0, col); return;
  endif

  a_result = zeros(col, p+1);
  v_result = zeros(col, 1);
  ref_result = zeros(p, col);
  acf_orig = acf;

  for idx = 1:col

    acf = acf_orig(:, idx);
    if nargout < 3 && p < 100
      ## direct solution [O(p^3), but no loops so slightly faster for small p]
      ##   Kay & Marple Eqn (2.39)
      R = toeplitz(acf(1:p), conj(acf(1:p)));
      a = R \ -acf(2:p+1);
      a = [ 1, a.' ];
      v = real( a*conj(acf(1:p+1)) );
    else
      ## durbin-levinson [O(p^2), so significantly faster for large p]
      ##   Kay & Marple Eqns (2.42-2.46)
      ref = zeros(p,1);
      g = -acf(2)/acf(1);
      a = [ g ];
      v = real( ( 1 - g*conj(g)) * acf(1) );
      ref(1) = g;
      for t = 2 : p
        g = -(acf(t+1) + a * acf(t:-1:2)) / v;
        a = [ a+g*conj(a(t-1:-1:1)), g ];
        v = v * ( 1 - real(g*conj(g)) ) ;
        ref(t) = g;
      endfor
      a = [1, a];
      ref_result(:, idx) = ref;
    endif
    a_result(idx, :) = a;
    v_result(idx) = v;
  endfor

  a = a_result;
  v = v_result;
  ref = ref_result;
endfunction

%!error levinson ()
%!error levinson (1, 1, 1)
%!error levinson ([])
%!error <non-negative integer> levinson ([1, 0.5], -1)
%!error <non-negative integer> levinson ([1, 0.5], [1, 2])

%!shared x
%! x = [1, 3, 3, 1];

%!test
%! ## default n
%! [a,b,c] = levinson (x);
%! assert (a, [1, 0, 0, -1]);
%! assert (b, 0);
%! assert (c, [-3; -0.75; -1]);

%!test
%! ## n = 1
%! [a,b,c] = levinson (x, 1);
%! assert (a, [1, -3]);
%! assert (b, -8);
%! assert (c, -3);

%!test
%! ## n = 2
%! [a,b,c] = levinson (x, 2);
%! assert (a, [1, -0.75, -0.75]);
%! assert (b, -3.5);
%! assert (c, [-3; -0.75]);

%!test
%! ## n = 4 (>= length(r)-1) should use default n = length(r)-1 = 3
%! [a,b,c] = levinson (x, 4);
%! assert (a, [1, 0, 0, -1]);
%! assert (b, 0);
%! assert (c, [-3; -0.75; -1]);

%!test
%! ## n = 0 return trivial solution
%! [a,b,c] = levinson (x, 0);
%! assert (a, 1);
%! assert (b, 1);
%! assert (c, zeros(0, 1));

%!test
%! ## column vector
%! [a,b,c] = levinson (x');
%! assert (a, [1, 0, 0, -1]);
%! assert (b, 0);
%! assert (c, [-3; -0.75; -1]);

%!test
%! ## Matrix input default n
%! matrix = [x', x'];
%! [a, b, c] = levinson (matrix);
%! assert (a, [1, 0, 0, -1; 1, 0, 0, -1]);
%! assert (b, [0; 0]);
%! assert (c, [-3, -3; -0.75, -0.75; -1, -1]);

%!test
%! ## Matrix input with n not default
%! matrix = [x', x'];
%! [a, b, c] = levinson (matrix, 2);
%! assert (a, [1, -0.75, -0.75; 1, -0.75, -0.75]);
%! assert (b, [-3.5; -3.5]);
%! assert (c, [-3, -3; -0.75, -0.75]);

%!test
%! ## direct solve method 
%! [a, b] = levinson (x, 2);
%! assert (a, [1, -0.75, -0.75]);
%! assert (b, -3.5);

%!test
%! ## Complex input
%! r = [2 + 0i; 1 + 1i; 0.2 - 0.1i];
%! [a, b, c] = levinson (r, 2);
%! assert (a, [1, -0.95-1.15i, -0.2+1.1i], 1e-4);
%! assert (b, -0.25, 1e-4);
%! assert (c, [-0.5-0.5i; -0.2+1.1i], 1e-4);
