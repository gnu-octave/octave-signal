## Copyright (C) 2019-2023 The Octave Project Developers
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
## @deftypefn {} {y =} vco (@var{x}, @var{fc}, @var{fs})
## @deftypefnx {} {y =} vco (@var{x}, [@var{fmin}, @var{fmax}], @var{fs})
## Creates a signal that oscillates at a frequency determined by input @var{x} with a sampling frequency @var{fs}.
##
## Inputs:
## @itemize
## @item
## @var{x} - input data with a range of -1 to 1. A value of -1 means no output, 0 cuoreesponds to @var{fc},
## and 1 corresponds to 2*@var{fc}.
##
## @item
## @var{fc} - Carrier frequency
##
## @item
## @var{fs} - Sampling rate
##
## @item
## @var{fmin}, @var{fmax} - Frequency modulation range limits.
## @end itemize
##
## Outputs:
## @itemize
## @item
## @var{y} - output signal
## @end itemize
## @end deftypefn

function [y,yn] = vco (x, fc = [], fs = [])

  if (nargin < 1 || nargin > 3)
    print_usage ();
  endif

  ## We can't just set default values in parameter list because
  ## default FC depends on value of FS and empty arguments may be
  ## used to request default values.

  if (isvector (x) && rows (x) == 1)
    x = x(:);
  endif

  if (any (x(:) > 1 | x(:) < -1))
    error ("vco: values in X must be in the range [-1, 1]");
  endif

  if (isempty  (fs))
    fs = 1;
  endif

  if (isempty (fc))
    fc = fs / 4;
  endif

  x_max = max (max (abs (x)));

  if (numel (fc) == 2)
    fmin = fc(1);
    fmax = fc(2);
    if (fmin > fs/2 || fmax > fs/2)
      error ("vco: FMIN and FMAX must be less than FS/2");
    endif
    if (fmin >= fmax)
      error ("vco: FMAX must be greater than FMIN");
    endif
    if (fmin < 0 || fmax < 0)
      error ("vco: FMIN and FMAX must be positive values");
    endif
    ## I don't know whether this is the best way, but I think it gives
    ## the proper value for fc and the proper deviation (+/-) from
    ## that value.
    fc = (fmin + fmax) / 2;
    kf = (fmax - fmin) / 2 / fs * 2 * pi / x_max;
  elseif (isscalar (fc))
    kf = (fc / fs) * 2 * pi / x_max;
  else
    error ("vco: FC must be a scalar");
  endif

  if (! (isscalar (fs)))
    error ("vco: FS must be a scalar");
  endif

  ## Note, no need to generate a matrix for T, we can rely on
  ## broadcasting instead.
  len = rows (x);
  t = (0 : (1/fs) : ((len-1)/fs))';

  ## Use modulate instead?
  y = cos (2*pi*fc*t + kf*cumsum (x));

endfunction

%!error vco
%!error vco([1 2])

