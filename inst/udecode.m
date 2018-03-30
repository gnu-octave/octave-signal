## Copyright (C) 2014 Georgios Ouzounis <ouzounis_georgios@hotmail.com>
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
## @deftypefn  {Function File} {@var{out} =} udecode (@var{in}, @var{n})
## @deftypefnx {Function File} {@var{out} =} udecode (@var{in}, @var{n}, @var{v})
## @deftypefnx {Function File} {@var{out} =} udecode (@var{in}, @var{n}, @var{v}, @var{overflows})
## Invert the operation of uencode.
## @seealso{uencode}
## @end deftypefn

function out = udecode (in, n, v = 1, overflows = "saturate")

  if (nargin < 2 || nargin > 4)
    print_usage ();
  endif

  if (in != fix (in))
    error ("udecode: IN must be matrix of integers");
  endif

  if (n < 2 || n > 32 || n != fix (n))
    error ("udecode: N must be an integer in the range [2, 32]");
  endif

  if (v <= 0)
    error ("udecode: V must be a positive integer");
  endif

  if (! (strcmp (overflows, "saturate") || strcmp (overflows, "wrap")))
    error ("uencode: OVERFLOWS must be either \"saturate\" or \"wrap\"");
  endif

  if ( all (in >= 0))
    signed = "unsigned";
    lowerlevel = 0;
    upperlevel = (2 ^ n) - 1;
  else
    signed = "signed";
    lowerlevel = - 2 ^ (n - 1);
    upperlevel = (2 ^ (n - 1)) - 1;
  endif

  if (strcmp (overflows, "saturate"))

    if (strcmp (signed, "unsigned"))
      in(in > upperlevel) = upperlevel;
    elseif (strcmp (signed, "signed"))
      in(in < lowerlevel) = lowerlevel;
      in(in > upperlevel) = upperlevel;
    endif

  elseif (strcmp (overflows, "wrap"))

    if (strcmp (signed, "unsigned"))
      idx = in > upperlevel;
      in(idx) = mod (in(idx), 2 ^ n);
    elseif (strcmp (signed, "signed"))
      idx = in < lowerlevel;
      in(idx) = mod (in(idx) + 2 ^ (n - 1), 2 ^ n) - 2 ^ (n - 1);
      idx = in > upperlevel;
      in(idx) = mod (in(idx) + 2 ^ (n - 1), 2 ^ n) - 2 ^ (n - 1);
    endif

  endif

  width = 2 * v / 2 ^ n;

  out = double (in) .* width;
  if (strcmp (signed, "unsigned"))
    out = out - v;
  endif

endfunction

%!test
%! u = [0 0 0 0 0 1 2 3 3 3 3 3 3];
%! y = udecode(u, 2);
%! assert(y, [-1 -1 -1 -1 -1 -0.5 0 0.5 0.5 0.5 0.5 0.5 0.5]);

%!test
%! u = [0 1 2 3 4 5 6 7 8 9 10];
%! y = udecode(u, 2, 1, "saturate");
%! assert(y, [-1 -0.5 0 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5]);

%!test
%! u = [0 1 2 3 4 5 6 7 8 9 10];
%! y = udecode(u, 2, 1, "wrap");
%! assert(y, [-1 -0.5 0 0.5 -1 -0.5 0 0.5 -1 -0.5 0]);

%!test
%! u = [-4 -3 -2 -1 0 1 2 3];
%! y = udecode(u, 3, 2);
%! assert(y, [-2, -1.5 -1 -0.5 0 0.5 1 1.5]);

%!test
%! u = [-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7];
%! y = udecode(u, 3, 2, "saturate");
%! assert(y, [-2 -2 -2 -2 -1.5 -1 -0.5 0 0.5 1 1.5 1.5 1.5 1.5 1.5]);

%!test
%! u = [-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7];
%! y = udecode(u, 3, 2, "wrap");
%! assert(y, [0.5 1 1.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 -2 -1.5 -1 -0.5]);

## Test input validation
%!error udecode ()
%!error udecode (1)
%!error udecode (1, 2, 3, 4, 5)
%!error udecode (1.5)
%!error udecode (1, 100)
%!error udecode (1, 4, 0)
%!error udecode (1, 4, -1)
%!error udecode (1, 4, 2, "invalid")
