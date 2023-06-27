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
## @deftypefn  {Function File} {[@var{phi}, @var{w}] = } phasez (@var{b}, @var{a}, @var{n})
## @deftypefnx {Function File} {[@var{phi}, @var{w}] = } phasez (@var{b}, @var{a})
## @deftypefnx {Function File} {[@var{phi}, @var{w}] = } phasez (@var{sos}, @var{n})
## @deftypefnx {Function File} {[@var{phi}, @var{w}] = } phasez (@var{sos})
## @deftypefnx {Function File} {[@var{phi}, @var{w}] = } phasez (@dots{}, @var{n}, "whole")
## @deftypefnx {Function File} {[@var{phi}, @var{w}] = } phasez (@dots{}, @var{n}, Fs)
## @deftypefnx {Function File} {} phasez (@dots{})
##
## Compute the phase response of digital filter defined either by its
## coefficients (@var{b} and @var{a} are the numerator and denominator
## coefficients respectively) or by its second-order sections representation,
## given by the matrix @var{sos}. The output @var{phi} is the phase response
## computed in a vector the vector of frequencies @var{w}.
##
## The phase response is evaluated at @var{n} angular frequencies between
## 0 and
## @ifnottex
## pi.
## @end ifnottex
## @tex
## $\pi$.
## @end tex
##
## @noindent
## If @var{a} is omitted, the denominator is assumed to be 1 (this
## corresponds to a simple FIR filter).
##
## If @var{n} is omitted, a value of 512 is assumed.
##
## If the third/forth argument, @qcode{"whole"}, is given, the response is
## evaluated at @var{n} angular frequencies between 0 and
## @ifnottex
## 2*pi.
## @end ifnottex
## @tex
## $\pi$.
## @end tex
## It is possible also to pass the value @qcode{"half"}, which will lead to
## the default behaviour.
##
## Example:
## @example
## [b, a] = butter (2, [.15,.3]);
## phasez (b, a);
## @end example
##
## Ref [1] Oppenheim, Alan, and Ronald Schafer. Discrete-Time Signal Processing.
## 3rd edition, Pearson, 2009.
##
## @seealso{freqz, phasedelay}
## @end deftypefn

function [phi, w] = phasez (b, a, n, region, Fs)
  if (nargin < 1 || nargin > 5)
    print_usage;
  elseif nargin == 1
    a = 1; region = Fs = []; n = 512;
  elseif nargin == 2
    if (! ismatrix (b) || ! ismatrix (a)), print_usage; endif
    n = 512; region = Fs = [];
  elseif nargin == 3
    if size (b, 1) > 1 && size (b, 2) == 6,
      if ischar (n)
        region = n; n = a; Fs = [];
      else
        Fs = n; n = a;
      endif
    else
      if ! isscalar (n), print_usage; endif
        region = Fs = [];
    endif
  elseif nargin ==4
    if ischar (region)
       Fs = [];
    else
       Fs = region; region = [];
    endif
  elseif nargin == 5 && ! ischar (region),
    print_usage;
  endif

  if isrow (b)
    [h, w] = freqz (b, a, n, region, Fs);
    phi = my_unwrap(angle(h));
  elseif (size (b, 1) > 1 && size (b, 2) == 6)
    phi = zeros (n, 1);
    for i=1:size (b,1)
      [h, w] = freqz (b(i,1:3), b(i,4:6), n, region, Fs);
      phi += my_unwrap(angle(h));
    endfor
  endif

  switch nargout
    case 0
      if isempty (Fs),
        plot (w/pi, phi);
        xlabel ( 'Normalized Frequency (\times\pi rad/sample)' );
      else
        plot (w, phi);
        xlabel ( "Frequency (Hz)" );
        xlim ([0 Fs/2]);
      endif
      ylabel ( "Phase (radians)" );
      grid ("on");
    case 1
      varargout = {phi};
    case 2
      varargout = {phi, w};
  endswitch

endfunction

%!demo
%! N = 2;
%! b = ones (1, N)/N;
%! a = 1;
%! [phi, w] = phasez (b, a)

%! ## test input validation
%!error n = phasez ()
%!error n = phasez (1, 1, 1, 1, 1)
%!error n = phasez (1:10, 1:10, 1:10)
%!error n = phasez (ones (3), ones (3))

%!test
%! % moving average
%! N = 2;
%! b = ones (1, N)/N;
%! a = 1;
%! [phi, w] = phasez (b, a);
%! PHI = -w * (N-1) /2;
%! assert (phi, PHI, eps^(3/5))

%!test
%! % moving average
%! N = 5;
%! b = ones (1, N)/N;
%! a = 1;
%! [phi, w] = phasez (b, a);
%! PHI = -w * (N-1) /2;
%! assert (phi, PHI, eps^(3/5))

%!test
%! % Oppenheim - Example 5.6 - 2nd-Order IIR System
%! %
%! %                     1
%! % H(z) = ---------------------------
%! %        1 − 2r cos θz^−1 + r^2 z^−2 
%! %
%! % ang(H(e^jω)) = − arctan[ r sin(ω − θ) / (1 − r cos(ω − θ)) ] − arctan[ r sin(ω + θ) / (1 − r cos(ω + θ)) ]
%! % 
%! r = 0.5; theta = pi/4;
%! b = 1;
%! a = [ 1 -2*r*cos(theta) r^2];
%! [phi, w] = phasez (b, a);
%! PHI = - atan ( r*sin (w - theta) ./ (1 - r*cos (w - theta)) ) - atan ( r*sin (w + theta) ./ (1 - r*cos (w+theta)) );
%! assert (phi, PHI, eps^(3/5))

function x = my_unwrap ( x )
  stillunwrap = true;
  while stillunwrap,
    dx = diff (x);
    idx = find (abs(dx) > pi-0.05 , 1);
    if ! isempty (idx),
      if dx(idx) > 0,
        x(idx+1:end)-=pi;
      else
        x(idx+1:end)+=pi;
      endif
    else
      stillunwrap = false;
    endif
  endwhile
endfunction
