## Copyright (C) 2022 The Octave Project Developers
## Copyright (C) 2017 Vasilis Lefkopoulos <vlefkopo@gmail.com>
##
## This program is free software; you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation; either version 3 of the License, or (at your option) any later
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
## @deftypefn {Function File} {@var{FLAG} =} isstable (@var{B}, @var{A})
## Returns a logical output equal to TRUE, if the filter is stable.
## This can be done with coeffients of the filer @var{B} and @var{A}.
## Alternatively by using a second order sections matrix (SOS).
##
## Inputs:
## @itemize
## @item
## @var{B}: Numerator coefficients of the filter
##
## @item
## @var{A}: Denominator coeffients of the filter. Can be an empty vector.
## @end itemize
##
## Output:
## @itemize
## @item
## @var{FLAG}: Returns a logical output, equal to TRUE if the filter is stable. 
## @end itemize
##
## Examples:
## @example
##   b = [1 2 3 4 5 5 1 2];
##   a = [4 5 6 7 9 10 4 6];
##   flag = isstable (b, a)
##   flag = 0
## @end example
##
## Using SOS
## @example 
##   [z, p, k] = butter (6, 0.7, 'high');
##   sos = zp2sos (z, p, k);
##   flag = isstable (sos)
##   flag = 1
## @end example
## @end deftypefn


function flag = isstable (b, varargin)
  
  if isempty (varargin)
    # Only one argument was given
    if any(size (b) > [1 1])
      # A matrix was given and is converted to vectors b & a
      [b, a] = sos2tf (b);
    else
      # Second input vector was omitted
      a = 1;
    endif  
  else
    a = varargin{1};
  endif

  if isempty (a) || (length (a) == 1)
    # An FIR filter is always stable
    flag = true;
  else
    if (a(1) != 1)
      # Normalization, so that a(1) equals 1
      b = b ./ a(1);
      a = a ./ a(1);
    endif
    r = roots (a);
    if any (abs (r) > 1)
      flag = false;
    else
      flag = true;
    endif
  endif

endfunction

%!test
%! b = [1 2 3 4 5 5 1 2];
%! a = [];
%! assert (isstable (b,a), true)

%!test
%! b = [1 2 3 4 5 5 1 2];
%! a = [4 5 6 7 9 10 4 6];
%! assert (isstable (b,a), false)

%!test
%! b = [1 2 3 4 5 5 1 2];
%! a = [4 5 6 7 9 10 4 6];
%! a = polystab(a);
%! assert (isstable (b,a), true)

%!test
%! [z,p,g] = butter(6,0.7,'high');
%! sos = zp2sos(z,p,g);
%! assert (isstable(sos) , true)
