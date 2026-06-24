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
## @deftypefn  {Function File} {@var{len} =} impzlength (@var{b})
## @deftypefnx {Function File} {@var{len} =} impzlength (@var{b}, @var{a})
## @deftypefnx {Function File} {@var{len} =} impzlength (@var{sos})
## @deftypefnx {Function File} {@var{len} =} impzlength (@dots{}, @var{tol})
## Return the impulse response length of the specified filter.
##
## For a finite impulse response (FIR) filter specified by the numerator
## coefficients @var{b}, the length is simply the number of coefficients
## in @var{b}.
##
## For an infinite impulse response (IIR) filter specified by the numerator
## @var{b} and denominator @var{a} polynomials in z^-1, the function
## computes an effective impulse response sequence length.
##
## The filter can also be specified by a @var{K}-by-6 second-order sections
## matrix @var{sos}, where @var{K} is the number of sections.  In this case,
## the matrix is converted to transfer function form @var{b} and @var{a}
## before computing the length.
##
## The algorithm proceeds as follows:
##
## @enumerate
## @item
## If the filter is FIR, the length is simply length (@var{b}).
##
## @item
## The poles of the transfer function are computed as the roots of the
## denominator polynomial @var{a}.
##
## @item
## The multiplicity of the dominant pole (the pole with the largest
## magnitude) is determined by counting poles at the same complex
## coordinate within tolerance.
##
## @item
## For a stable IIR filter (dominant pole magnitude @math{< 1 - 10^{-5}}),
## the effective length is estimated as
##
## @code{floor (M * log10 (tol) / log10 (maxpole)) + delay}
##
## where @math{M} is the multiplicity of the dominant pole and @math{d}
## is the initial delay (number of leading zeros in @var{b}).
##
## @item
## For an unstable IIR filter (dominant pole magnitude @math{> 1 + 10^{-4}}),
## a heuristic formula is used:
##
## @code{floor (6 / log10 (maxpole))}
##
## @item
## For filters with poles near the unit circle (oscillatory behavior), the
## length is the maximum of: five periods of the slowest oscillation,
## and the decay length of damped poles, plus the initial delay.
##
## @end enumerate
##
## The optional argument @var{tol} specifies the tolerance used to
## estimate the effective length of an IIR filter's impulse response.
## The default tolerance is 5e-5.  Increasing @var{tol} estimates a
## shorter effective length, while decreasing @var{tol} produces a longer
## effective length.
##
## The returned value @var{len} is the effective impulse response length
## of the specified filter.  This function is used by @code{impz} and
## @code{stepz} to determine the number of points to plot.
##
## @seealso{impz, stepz}
## @end deftypefn

function len = impzlength (b, a, tol)

  if (nargin < 1 || nargin > 3)
    print_usage ();
  endif

  if (nargin < 3)
    tol = 5e-5;
  endif

  ## Check if first input is a second-order sections matrix (K-by-6, K >= 2)
  if (ismatrix (b) && size (b, 2) == 6 && size (b, 1) >= 2)
    ## impzlength (sos) or impzlength (sos, tol)
    if (nargin >= 2 && isscalar (a))
      tol = a;
    endif
    [b, a] = sos2tf (b);
  elseif (nargin == 1)
    ## impzlength (b) — FIR filter, use a = 1
    a = 1;
  endif

  if (isscalar (a) || isempty (a))
    ## FIR filter: length equals number of numerator coefficients
    len = length (b);
    return;
  endif

  ## [0, 0, ..., 0, b_delay, ...] find delay index of first non-zero coefficient in b
  idx = find (b, 1, 'first');
  if isempty (idx)
    b_delay = 0;
  else
    b_delay = idx - 1;
  end

  ## Find poles of the transfer function
  r = roots (a);
  abs_r = abs (r);
  maxpole = max (abs_r);

  ## Find multiplicity of the dominant pole (true repeated roots).
  ## Count poles at the same complex coordinate, NOT just same magnitude,
  ## to avoid counting complex conjugate pairs as repeated.
  idx_maxmag = abs (abs_r - maxpole) < tol;
  candidates = r(idx_maxmag);
  if (!isempty (candidates))
    ref = candidates(1);
    mult = sum (abs (r - ref) < tol);
  else
    mult = 1; 
  endif

  if (maxpole > 1 + 1e-4)
    ## Unstable IIR filter
    len = floor (6 / log10 (maxpole));

  elseif (maxpole < 1 - 1e-5)
    ## Stable IIR filter
    len = floor (mult * log10 (tol) / log10 (maxpole))+ b_delay;

  else
    ## Filter has poles near the unit circle (oscillatory).
    ## Compute five periods of the slowest oscillation.
    n_periodic = 10;
    for i = 1:length (r)
      if abs(r(i)-1)<1e-5
        r(i) = -r(i);  ## avoid numerical issues with arg(r) near 0
      endif
    endfor
    rperiodic = r(abs_r >= 1 - 1e-5 & abs_r <= 1 + 1e-4 & abs (arg (r)) > 0);
    if (!isempty (rperiodic))
      n_periodic = floor (5 * 2 * pi / min (abs (arg (rperiodic))));
    endif

    ## Compute damped component length
    n_damped = 0;
    rdamped = r(abs_r < 1 - 1e-5);
    if (!isempty (rdamped))
      max_rdamped = max (abs (rdamped));

      ## Find true repeated roots among damped poles (same complex coordinate)
      idx_damped_max = abs (abs (rdamped) - max_rdamped) < tol;
      candidates_damped = rdamped(idx_damped_max);

      if (!isempty (candidates_damped))
        ref_damped = candidates_damped(1);
        mult_damped = sum (abs (rdamped - ref_damped) < tol);
      else
        mult_damped = 1;
      endif

      n_damped = floor (mult_damped * log10 (tol) / log10 (max_rdamped));
    endif

    len = max (n_periodic, n_damped) + b_delay;
  endif

endfunction

## test below shows different pole cases
%!test
%! ## FIR filter
%! assert (impzlength ([1 2 3 4 5]), 5);

%!test
%! ## Stable IIR filter and with different tolerance
%! b = 1;
%! a = [1 -0.95];
%! len1 = impzlength (b, a);
%! len2 = impzlength (b, a, 1e-3);
%! len3 = impzlength (b, a, 1e-7);
%! assert (len1, 193);
%! assert (len2, 134);
%! assert (len3, 314);

%!test
%! ## Unstable IIR filter
%! b = 1;
%! a = [1 -1.1];
%! len = impzlength (b, a);
%! assert (len, 144);

%!test
%! ## Oscillatory IIR filter
%! b = 1;
%! a = [1 0.5 1];
%! len = impzlength (b, a);
%! assert (len, 17);

%!test
%! ## IIR filter with repeated poles
%! b = 1;
%! a = conv([1 -0.9], [1 -0.9]);
%! len = impzlength(b, a);
%! assert (len, 187);

%!test
%! ## Oscillatory IIR filter with damped component
%! b = 1;
%! a1 = [1, 0.5, 1];  ## oscillatory,len = 17
%! a2 = [1, -0.1];    ## damped,len=4
%! a3 = [1, -0.9];    ## damped,len=93
%! len1 = impzlength(b, conv(a1, a2));  ## damped component shorter than oscillatory
%! len2 = impzlength(b, conv(a1, a3));  ## damped component longer than oscillatory
%! assert (len1, 17);
%! assert (len2, 93);

%!test
%! ## IIR filter with delay
%! b = [0 0 1]; 
%! a = [1 -0.95];
%! len = impzlength(b, a);
%! assert (len, 195);  ## 193 + 2 delay

%!test
%! ## Special case: this is why r(i) = -r(i) to avoid case with arg(r) near 0
%! b = 1;
%! a = [1, -1];
%! len=impzlength(b,a);
%! assert(len,10);

%!test
%! ## Second-order sections input
%! [z, p, k] = ellip (4, 1, 60, 0.4);
%! sos = zp2sos (z, p, k);
%! len = impzlength (sos);
%! assert (len, 80);

%!test
%! ## Input validation
%!error impzlength ();
%!error impzlength (1, 2, 3, 4);
