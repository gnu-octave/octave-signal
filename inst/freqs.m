## Copyright (C) 2003 Julius O. Smith III <jos@ccrma.stanford.edu>
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
## @deftypefn  {Function File} {@var{h} =} freqs (@var{b}, @var{a}, @var{w})
## @deftypefnx {Function File} {[@var{h}, @var{wout}] =} freqs (@var{b}, @var{a}, @var{n})
## @deftypefnx {Function File} {} freqs (@dots{})
## Compute the s-plane frequency response of the analog filter B(s)/A(s).
##
## The frequency response is evaluated at the angular frequencies specified
## by vector @var{w} (in rad/s).  If the third argument is a scalar integer
## @var{n}, or if it is omitted, the frequency response is computed at
## @var{n} logarithmically spaced frequencies (default @var{n} = 200).
##
## If no output argument is requested, the magnitude and phase are plotted.
##
## Example:
## @example
## b = [1 2]; a = [1 1];
## w = linspace (0, 4, 128);
## freqs (b, a, w);
## @end example
## @end deftypefn

function [H, Wout] = freqs(B, A, W)

  if (nargin < 2 || nargin > 3)
    print_usage ();
  endif

  have_w = false;

  if (nargin == 2)
    ## freqs (b, a)
    n = 200;
  else
    ## nargin == 3
    if (isscalar (W))
      ## freqs (b, a, n)
      if (! isreal (W) || W < 1 || W != fix (W))
        error ("freqs: W must be a positive integer");
      endif
      n = W;
    else
      ## freqs (b, a, w)
      have_w = true;
    endif
  endif

  if (have_w)
    H = polyval (B, 1j * W) ./ polyval (A, 1j * W);
    Wout = W;
  else
    ## Generate a logarithmically spaced frequency vector.
    ## Determine the frequency range from the filter poles.
    poles = roots (A);
    poles = poles(poles != 0);
    if (isempty (poles))
      wmin = 1e-3;
      wmax = 1e3;
    else
      pole_mags = abs (poles);
      wmin = min (pole_mags) * 0.1;
      wmax = max (pole_mags) * 10;
    endif
    ## FIXME: MATLAB's freqs uses a more sophisticated method to determine the frequency range.
    Wout = logspace (log10 (wmin), log10 (wmax), n).';
    H = polyval (B, 1j * Wout) ./ polyval (A, 1j * Wout);
  endif

  if (nargout == 0)
    freqs_plot (Wout, H);
    clear Wout;
    clear H;
  endif

endfunction

%!demo
%! B = [1 2];
%! A = [1 1];
%! w = logspace (-2, 1, 128);
%! freqs (B, A, w);

%!demo
%! B = [0.5 0.3 1];
%! A = [1 3 2];
%! freqs (B, A);

%!test
%! ## Test frequency response of H(s) = 1/(s+1) at known frequencies
%! B = [1];
%! A = [1 1];
%! w = logspace (-1, 1, 10);
%! H = freqs (B, A, w);
%! ## H(jw) = 1/(jw+1)
%! H_expected = 1 ./ (1 + 1j * w);
%! assert (H, H_expected, 1e-10);

%!test
%! ## Test with two outputs (H and Wout)
%! B = [1 0];
%! A = [1 2 1];
%! w = logspace (-1, 2, 100);
%! [H, Wout] = freqs (B, A, w);
%! assert (H, polyval (B, 1j * w) ./ polyval (A, 1j * w), 1e-10);
%! assert (Wout, w);

%!error <positive integer> freqs ([1], [1 1], 2.5)
%!error <positive integer> freqs ([1], [1 1], -1)
%!error freqs ([1])
%!error freqs ([1], [1 1], [1 2], 3)
