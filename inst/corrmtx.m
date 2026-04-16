## Copyright (C) 2026 Tang Chonghao <chadholton@qq.com>
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
## @deftypefn  {Function File} {@var{H} =} corrmtx (@var{x}, @var{m})
## @deftypefnx {Function File} {@var{H} =} corrmtx (@var{x}, @var{m}, @var{method})
## @deftypefnx {Function File} {[@var{H}, @var{R}] =} corrmtx (@dots{})
## Build a data matrix for autocorrelation matrix estimation.
##
## Given a vector @var{x} of length @math{N} and a model order @var{m},
## compute the rectangular Toeplitz matrix @var{H} such that @var{H}'*@var{H}
## is a biased estimate of the autocorrelation matrix. The size of @var{H}
## depends on the selected @var{method}:
##
## @table @asis
## @item 'autocorrelation' (default)
## Uses both prewindowed and postwindowed data.
##
## @item 'prewindowed'
## Uses prewindowed data only.
##
## @item 'postwindowed'
## Uses postwindowed data only.
##
## @item 'covariance'
## Uses nonwindowed data.
##
## @item 'modified'
## Uses forward and backward prediction error estimates.
## @end table
##
## The optional second output @var{R} is the biased autocorrelation matrix
## estimate @var{H}'*@var{H}.
##
## @seealso{aryule}
## @end deftypefn

function [H, R] = corrmtx (x, m, method = "autocorrelation")

  if (nargin < 2 || nargin > 3)
    print_usage ();
  endif

  if (! isvector (x))
    error ("corrmtx: X must be a vector.");
  endif
  if (! isreal (m) || ! isscalar (m) || m < 0 || fix (m) != m)
    error ("corrmtx: M must be a positive integer.");
  endif

  x = x(:).';
  N = length (x);
  if (N <= m)
    error ("corrmtx: length of X must be greater than M.");
  endif

  L = N - m; 
  switch (lower (method))
    case "autocorrelation"
      H = toeplitz([x, zeros(1, m)], [x(1), zeros(1, m)])/sqrt(N);
    case "prewindowed"
      H = toeplitz([x(:); zeros(m,1)], [x(1), zeros(1,m)]);
      H = H(1:N,:)/sqrt(N);
    case "postwindowed"
      H = toeplitz([x(m+1:N), zeros(1, m)], [x(m+1), x(m:-1:1)])/sqrt(N);
    case "covariance"
      H = toeplitz(x(m+1:N), [x(m+1), x(m:-1:1)])/sqrt(L);
    case "modified"
      H_f = toeplitz(x(m+1:N), [x(m+1), x(m:-1:1)]);
      H_b = hankel(x(1:L), x(L:N));
      H = [H_f; conj(H_b)]/sqrt(2*L);
    otherwise
      error ("corrmtx: unknown method '%s'.", method);
  endswitch

  if (nargout > 1)
    R = H'*H;
  endif

endfunction

%!error <X must be a vector.> corrmtx (ones(2,3), 2)
%!error <M must be a positive integer.> corrmtx (1:10, 1.5)
%!error <M must be a positive integer.> corrmtx (1:10, [2 3])
%!error <length of X must be greater than M.> corrmtx (1:5, 5)
%!error <unknown method> corrmtx (1:10, 3, "asd")

%!test
%! x = 1:5;
%! m = 2;
%! [H, R] = corrmtx (x, m);
%! expcted_H = (1/sqrt(5)) * [1 0 0; 2 1 0; 3 2 1; 4 3 2; 5 4 3; 0 5 4; 0 0 5];
%! assert (H, expcted_H, 1e-12);
%! assert (R, H'*H, 1e-12);

%!test
%! x = 1:5;
%! m = 2;
%! [H, R] = corrmtx (x, m, "prewindowed");
%! expcted_H = (1/sqrt(5)) * [1 0 0; 2 1 0; 3 2 1; 4 3 2; 5 4 3];
%! assert (H, expcted_H, 1e-12);
%! assert (R, H'*H, 1e-12);

%!test
%! x = 1:5;
%! m = 2;
%! [H, R] = corrmtx (x, m, "postwindowed");
%! expcted_H = (1/sqrt(5)) * [3 2 1; 4 3 2; 5 4 3; 0 5 4; 0 0 5];
%! assert (H, expcted_H, 1e-12);
%! assert (R, H'*H, 1e-12);

%!test
%! x = 1:5;
%! m = 2;
%! [H, R] = corrmtx (x, m, "covariance");
%! expcted_H = (1/sqrt(3)) * [3 2 1; 4 3 2; 5 4 3];
%! assert (H, expcted_H, 1e-12);
%! assert (R, H'*H, 1e-12);

%!test
%! x = 1:5;
%! m = 2;
%! [H, R] = corrmtx (x, m, "modified");
%! expcted_H = (1/sqrt(6)) * [3 2 1; 4 3 2; 5 4 3; 1 2 3; 2 3 4; 3 4 5];
%! assert (H, expcted_H, 1e-12);
%! assert (R, H'*H, 1e-12);
