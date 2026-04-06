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
## @deftypefn  {Function File} {@var{dbout} =} db (@var{x})
## @deftypefnx {Function File} {@var{dbout} =} db (@var{x}, @var{signaltype})
## @deftypefnx {Function File} {@var{dbout} =} db (@var{x}, @var{R})
## @deftypefnx {Function File} {@var{dbout} =} db (@var{x}, "voltage", @var{R})
##
## Convert signal values to decibels (dB).
##
## If @var{x} represents voltage (default):
## @display
## dbout = 10 * log10 (abs(@var{x}).^2 / @var{R})
## @end display
## where @var{R} is the resistance in ohms (default = 1).
##
## If @var{x} represents power:
## @display
## dbout = 10 * log10 (@var{x})
## @end display
##
## Usage forms:
##
## @table @code
## @item db(@var{x})
## Voltage conversion with @var{R} = 1.
##
## @item db(@var{x}, @var{signaltype})
## @var{signaltype} is @qcode{"voltage"} (default) or @qcode{"power"}.
##
## @item db(@var{x}, @var{R})
## Voltage conversion with resistance @var{R}.
##
## @item db(@var{x}, "voltage", @var{R})
## Same as @code{db(@var{x}, @var{R})}.
## @end table
##
## @seealso{pow2db, db2pow}
## @end deftypefn

function dbout = db (x, varargin)

  if (nargin < 1 || nargin > 3)
    print_usage ();
  endif

  ## Default values
  signaltype = "voltage";
  R = 1;

  ## Parse input arguments
  if (nargin >= 2)
    arg = varargin{1};
    if (ischar (arg))
      ## Second argument is signal type
      if (strcmpi (arg, "voltage"))
        signaltype = "voltage";
      elseif (strcmpi (arg, "power"))
        signaltype = "power";
      else
        error ('db: signaltype must be "voltage" or "power".');
      endif
      if (nargin == 3)
        R = varargin{2};
      endif
    elseif (isnumeric (arg))
      ## Second argument is resistance R, which should be a positive scalar in doc.
      ## But matlab don't check(2024b), it allows R to be a vector or matrix.
      signaltype = "voltage";
      R = arg;
      if (nargin == 3)
        error ('db: if R is the second argument, no third argument allowed.');
      endif
    else
      error ('db: second argument must be "voltage", "power", or a positive scalar R.');
    endif
  endif

  ## Validate signal type and data
  if (strcmpi (signaltype, "power"))
    if (any (x(:) < 0))
      error ('db: power measurements cannot be negative.');
    endif
    dbout = 10 * log10 (x);
  else
    dbout = 10 * log10 (abs (x).^2 ./ R);
  endif

endfunction

%!test
%! assert (db(2), 10*log10(2^2/1), eps);
%! assert (db([1 2]), 10*log10([1 4]), eps);

%!test
%! R = 2;
%! assert (db(1, R), 10*log10(1^2/R), eps);
%! assert (db([1 2], R), 10*log10([1 4]/R), eps);
%! assert (db(3, "voltage", R), 10*log10(3^2/R), eps);

%!test
%! assert (db(1, "power"), 10*log10(1), eps);
%! assert (db([1 10], "power"), 10*log10([1 10]), eps);
%! assert (db(0.5, "power"), 10*log10(0.5), eps);

%!test
%! assert (db(1+1i), 10*log10(abs(1+1i)^2), eps);
%! assert (db(1+1i, 2), 10*log10(abs(1+1i)^2/2), eps);

%!test
%! A = [1 2; 3 4];
%! expected = 10*log10(abs(A).^2);
%! assert (db(A), expected, eps);
%! expected_power = 10*log10(A);
%! assert (db(A, "power"), expected_power, eps);

%!error db(1, "invalid")
%!error db(-1, "power")
%!error db(1, 2, 3)
%!error db(1, 2, "voltage")
