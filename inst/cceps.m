## Copyright (C) 1994 Dept of Probability Theory and Statistics TU Wien <Andreas.Weingessel@ci.tuwien.ac.at>
## Copyright (C) 2019 Mike Miller
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
## @deftypefn  {Function File} {} cceps (@var{x})
## @deftypefnx {Function File} {} cceps (@var{x}, @var{correct})
## Return the complex cepstrum of the vector @var{x}.
## If the optional argument @var{correct} has the value 1, a correction
## method is applied.  The default is not to do this.
## @end deftypefn

function cep = cceps (x, c)

  if (nargin == 1)
    c = false;
  elseif (nargin != 2)
    print_usage ();
  endif

  [nr, nc] = size (x);
  if (nc != 1)
    if (nr == 1)
      x = x';
      nr = nc;
    else
      error ("cceps: X must be a vector");
    endif
  endif

  bad_signal_message = "cceps: signal X has some zero Fourier coefficients";

  F = fft (x);
  if (min (abs (F)) == 0)
    error (bad_signal_message);
  endif

  ## determine if correction necessary
  half = fix (nr / 2);
  cor = false;
  if (2 * half == nr)
    cor = (c && (real (F (half + 1)) < 0));
    if (cor)
      F = fft (x(1:nr-1))
      if (min (abs (F)) == 0)
        error (bad_signal_message);
      endif
    endif
  endif

  cep = fftshift (ifft (log (F)));

  ## make result real
  if (c)
    cep = real (cep);
    if (cor)
      ## make cepstrum of same length as input vector
      cep (nr) = 0;
    endif
  endif

endfunction

%!test
%! x = randn (256, 1);
%! c = cceps (x);
%! assert (size (c), size (x))

## Test input validation
%!error cceps ()
%!error cceps (1, 2, 3)
%!error cceps (ones (4))
%!error cceps (0)
%!error cceps (zeros (10, 1))
