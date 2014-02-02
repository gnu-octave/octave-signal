## Copyright (C) 2014 Mike Miller <mtmiller@ieee.org>
##
## This program is free software: you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation, either version 3 of the License, or (at your option) any later
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
## @deftypefn  {Function File} {} hann (@var{n})
## Return the filter coefficients of a Hanning window of length @var{n}.
## This function exists for @sc{matlab} compatibility only, and is equivalent
## to @code{hanning (@var{n})}.
## @seealso{hanning}
## @end deftypefn

function w = hann (n)

  if (nargin != 1)
    print_usage ();
  endif

  w = hanning (n);

endfunction

%!assert (hann (1), 1);
%!assert (hann (2), zeros (2, 1));
%!assert (hann (16), fliplr (hann (16)));
%!assert (hann (15), fliplr (hann (15)));
%!test
%! N = 15;
%! A = hann (N);
%! assert (A(ceil (N/2)), 1);

%% Test input validation
%!error hann ()
%!error hann (0.5)
%!error hann (-1)
%!error hann (1, 2)
