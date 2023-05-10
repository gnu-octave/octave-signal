## Copyright (C) 2015 The Octave Project Developers
##
## See the file COPYRIGHT.md in the top-level directory of this
## distribution or <https://octave.org/copyright/>.
##
## This file is part of Octave.
##
## Octave is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <https://www.gnu.org/licenses/>.



## -*- texinfo -*-
## @deftypefn  {Function File} {[@var{n}, @var{Fout}, @var{a}, @var{w}] =} firpmord (@var{f}, @var{a}, @var{d})
## @deftypefnx {Function File} {[@var{n}, @var{Fout}, @var{a}, @var{w}] =} firpmord (@var{f}, @var{a}, @var{d}, @var{fs})
## @deftypefnx {Function File} {@var{c} =} firpmord (@var{f}, @var{a}, @var{d}, "cell")
## @deftypefnx {Function File} {@var{c} =} firpmord (@var{f}, @var{a}, @var{d}, @var{fs}, "cell")
## @cindex signal processing
##
## Estimate the filter-order needed for @code{firpm} to design a type-I or
## type-II linear-phase FIR filter according to the given specifications.
##
## @heading Arguments
##
## @table @var
##
## @item f
## A vector of real-numbers, increasing in the range (0, @var{fs}/2), giving the
## frequencies of the left and right edges of each band for which a specific
## amplitude response is desired (omitting 0 and @var{fs}/2, which are implied):
## [r1 l2 r2 @dots{}].  Transition-bands are defined implicitly as the regions
## between the given bands.
##
## @item a
## A vector of real-numbers giving the ideal amplitude response.  An amplitude
## value is given for each band specified by @var{f}: [a1 a2 @dots{}].  1
## represents unity-gain, 0 represents infinite attenuation, and @minus{}1
## represents a phase change of pi radians.
##
## @item d
## A vector of positive real-numbers giving the maximum allowable linear
## deviation from the amplitudes given in @var{a}, thus constraining the actual
## amplitude response (where defined by @var{f}) to be within @var{a} +/@minus{}
## @var{d}.  Note that, though related, @var{d} does not equate to
## @code{firpm}'s @var{w} argument.
##
## @item fs
##
## The sampling-frequency, which defaults to 2.
##
## @end table
##
## @heading Usage
##
## The function returns the estimated filter-order, together with the other
## design specification values, in one of two forms suitable for use with
## @code{firpm}.  By default, multiple return values are used; alternatively, by
## giving @qcode{"cell"} (or @qcode{"c"}) as the last argument to @code{firpmord},
## the returned values are contained within a cell-array that can, if desired,
## be passed directly to @code{firpm}.
##
## The following examples illustrate the use of both mechanisms, as well as
## aspects of @code{firpmord} usage in general:
##
## @example
## @group
## # Low-pass; frequencies in kHz:
## [n f a w] = firpmord ([2.5 3], [1 0], [0.01 db2mag(-60)], 8);
## b = firpm (n, f, a, w);
## @end group
## @end example
##
## @example
## @group
## # Band-pass:
## c = firpmord ([3 4 8 9], [0 1 0], [1e-3 1e-2 1e-3], 20, "cell");
## b = firpm (c@{:@});
## @end group
## @end example
##
## @example
## @group
## # High-pass:
## b = firpm (firpmord ([6.4 8]/16, [0 1], [1e-4 0.01], "c")@{:@});
## @end group
## @end example
##
## In cases where elements of @var{d} follow a repeating pattern (e.g.@: all the
## elements are equal, or elements corresponding to pass-bands are equal and
## elements corresponding to stop-bands are equal), only as many elements as are
## needed to establish the pattern need be given.
##
## For example, the following @code{firpmord} invocation pairs are equivalent:
##
## @example
## @group
## # Low-pass:
## firpmord ([0.4 0.5], [0 1], [db2mag(-72) db2mag(-72)]);
## firpmord ([0.4 0.5], [0 1], [db2mag(-72)]);
## @end group
## @end example
##
## @example
## @group
## # Multi-band-pass:
## ds = db2mag(-80); dp = 0.01;
## firpmord ([1 2 3 4 5 6 7 8]/10, [0 1 0 1 0], [ds dp ds dp ds]);
## firpmord ([1 2 3 4 5 6 7 8]/10, [0 1 0 1 0], [ds dp]);
## @end group
## @end example
##
## @heading Notes
##
## The estimation algorithm used is per Ichige et al.@footnote{ K. Ichige, M.
## Iwaki, algorithm and R. Ishii, `Accurate Estimation of Minimum Filter Length
## for Optimum FIR Digital Filters', IEEE Transactions on Circuits and Systems,
## Vol.@: 47, No.@: 10, 2000, pp.@: 1008--1017} Accuracy tends to decrease as
## the number of bands increases.  Even with two bands (i.e.@: high-pass or
## low-pass), the algorithm may under- or over-estimate.  See the
## @code{firpmord} demonstrations for some examples.
##
## In order to precisely determine the minimum order needed for a particular
## design, @code{firpmord} could be used to seed an algorithm iterating
## invocations of @code{firpm} (as exemplified in demonstration number five).
##
## @heading Related documentation
##
## @seealso{firpm, kaiserord}
##
## @end deftypefn



function [N, Fout, A, W] = firpmord (F, A, D, Fs = 2, cell)

  len = @(x) length (x);

  cell_given = nargin > 4;
  if (ischar (Fs) && nargin == 4) cell = Fs; Fs = 2; cell_given = 1; endif
  return_as_cell = ischar (cell) && strncmpi (cell, "cell", numel (cell));

  Fs = real (Fs);
  if nargin < 3 || nargin > 5 || (!return_as_cell && cell_given)
    print_usage;
  elseif (! (isscalar (Fs) && Fs > 0))
    error ("firpmord parameter Fs (sampling-frequency) must be a positive \
number");
  endif

  F = real (F(:)) / Fs;
  A = real (A(:));
  D = real (D(:));

  if (any (F <= 0) || any (F >= .5) || any ([F; 1] - [0; F] <= 0))
    error ("firpmord parameter F (band-edge frequencies) elements must \
increase between 0 and Fs/2")
  elseif (len (F) == 0 || len (F) != 2 * len (A) - 2)
    error ("firpmord parameter F (band-edge frequencies) length must be twice \
the length of A, less 2")
  elseif (len (D) < 1 || len (D) > len (A) || any (D <= 0))
    error ("firpmord parameter D (deviations) must be a vector of positive \
numbers, its length not exceeding that of A")
  endif

  ## The following step could also be done for D, but the concision gain
  ## is not as compelling, and would result in the loss of the useful
  ## cross-check between the lengths of F and D.
  ##
  ## Repeat (as necessary) elements of A to obtain 1 element/band:

  l=1; for k=len (D)+1:len (A) D(k,1) = D(l++); endfor

  ## Scale D w.r.t. A:

  D ./= abs (A) + (A==0);

  ## Find the longest length needed to implement any of the
  ## low-pass or high-pass transitions within the given edges.
  ## HP transitions are mirrored in [0,.5] then treated as LP:

  Fl = F(1:2:(len (F) - 1));       # Freqs at left of transition.
  Fr = F(2:2:(len (F) - 0));       # Freqs at right of transition.
  L = 2;                           # Anything less is not a filter.
  for k=1:len (Fl)                 # (Fl, Fr have equal length.)
    if (A(k) > A(k+1))             # Low-pass transition?
      L = max (L, estimate_lp (Fl(k), Fr(k), D(k), D(k+1)));
    elseif (A(k) < A(k+1))         # High-pass transition?
      L = max (L, estimate_lp (.5-Fr(k), .5-Fl(k), D(k+1), D(k)));
    endif
  endfor

  ## Format length & specs for firpm:

  Fout = [0; F*2; 1];
  W = max (D) ./ D;
  N = ceil (L) - 1;                # Filter order.
  N += A(end) != 0 && rem (N, 2);  # Fix-up high-pass/band-stop.
  A = kron(A, [1;1]);
  if (nargout < 2 && return_as_cell)
    N = {N, Fout, A, W};
  endif

endfunction



## Estimate filter-length needed for LP transition (Ichige, 2000):

function L = estimate_lp (fp, fs, dp, ds)

  dF = fs-fp;
  assert (dF > 0)
                                                                # Ichige eqn.#
  v = @(d) 2.325 * (-log10 (d))^-.445 * dF^-1.39;                    # (10)
  g = @(fp,d) 2/pi * atan (v(d) * (1/fp - 1/(.5-dF)));               # (9)
  h = @(fp,c) 2/pi * atan (c/dF * (1/fp - 1/(.5-dF)));               # (15)

  Nc = ceil (1.101 * (-log10 (2*dp))^1.1 / dF + 1);                  # (8) ...
  N3 = ceil (Nc * (g(fp, dp) + g(.5-fs, dp) + 1)/3);                 # (11)
  Nm = .52 * log10 (dp/ds) / dF * (-log10 (dp))^.17;                 # (15)
  DN = ceil (Nm * (h(fp, 1.1) - (h(.5-fs, .29) - 1)/2));             # (15)
  L = N3 + DN;                                                       # (15)

endfunction



## Invocation tests:

%!error <firpmord parameter Fs \(sampling-frequency\) must be a positive number> firpmord ([1 2], [1 0], [1 1], [1 1]);
%!error <firpmord parameter F \(band-edge frequencies\) elements must increase between 0 and Fs/2> firpmord ([0 2], [1 0], [1 1]);
%!error <firpmord parameter F \(band-edge frequencies\) elements must increase between 0 and Fs/2> firpmord ([.1 1], [1 0], [1 1]);
%!error <firpmord parameter F \(band-edge frequencies\) length must be twice the length of A, less 2> firpmord ([.1 .9], [1], [.1 .1]);
%!error <firpmord parameter D \(deviations\) must be a vector of positive numbers, its length not exceeding that of A> firpmord ([.1 .2], [1 0], [.1 .1 .1]);
%!error <firpmord parameter D \(deviations\) must be a vector of positive numbers, its length not exceeding that of A> firpmord ([.1 .2], [1 0], [1 0]);

%!assert (
%!  firpmord ([0.4 0.5], [0 1], [2.5e-4 2.5e-4]),
%!  firpmord ([0.4 0.5], [0 1], [2.5e-4]))

%!test ds = 1e-4; dp = 0.01; assert (
%!  firpmord ([1 2 3 4 5 6 7 8]/10, [0 1 0 1 0], [ds dp ds dp ds]),
%!  firpmord ([1 2 3 4 5 6 7 8]/10, [0 1 0 1 0], [ds dp]))



## Tests using examples from the Ichige paper, tables II & III.
## There are some slight discrepancies; the reason is unknown:

%!assert (1 + firpmord ([.1 .2], [0 1], [1e-4 .01], 1), 33)

%!assert (1 + firpmord ([      15 20], [  1 0], [      .1  .001], 100), 38)
%!assert (1 + firpmord ([ 8 10      ], [0 1  ], [.001  .1      ], 100), 91)
%!assert (1 + firpmord ([ 8 10 15 20], [0 1 0], [.001  .1  .001], 100), 90) #+1?

%!assert (1 + firpmord ([17 20      ], [1 0  ], [.01 1e-4      ], 100), 107)#-1?
%!assert (1 + firpmord ([      22 25], [  0 1], [    1e-4   .01], 100), 107)
%!assert (1 + firpmord ([17 20 22 25], [1 0 1], [.01 1e-4   .01], 100), 107)

%!assert (1 + firpmord ([      21 25], [  1 0], [     .01  1e-4], 100), 81) #+1?
%!assert (1 + firpmord ([10 20      ], [0 1  ], [1e-4 .01      ], 100), 33)
%!assert (1 + firpmord ([10 20 21 25], [0 1 0], [1e-4 .01  1e-4], 100), 81) #+1?

%!assert (1 + firpmord ([20 25      ], [1 0  ], [.01 1e-4      ], 100), 65) #+1?
%!assert (1 + firpmord ([      26 30], [  0 1], [    1e-4   .01], 100), 81) #+2?
%!assert (1 + firpmord ([20 25 26 30], [1 0 1], [.01 1e-4   .01], 100), 81) #+2?



## Demonstrations:
%!
%!demo
%!
%! db2mag = @(x) 10^(x/20);
%!
%! fs = 8000;
%! [n f a w] = firpmord ([2500 3000], [1 0], [0.01 db2mag(-60)], fs);
%! b = firpm (n, f, a, w);
%!
%! [h f] = freqz (b, 1, 2^14); clf
%! plot (fs/2*f/pi, 20*log10 (abs (h))); grid on; axis ([0 fs/2 -90 5])
%! ylabel ("Magnitude (dB)"); xlabel ("Frequency (Hz)")
%! title (sprintf ("Response analysis of firpmord / firpm low-pass filter design (order=%i)", length (b) - 1))
%! axes ("position", [.24 .4 .4 .3])
%! plot (fs/2*f/pi, abs (h)); grid on; axis ([0 2600 x=.987 2-x])
%! ylabel ("Magnitude")
%! title ("Pass-band detail")
%! %--------------------------------------------------
%! % Figure shows analysis of filter designed using
%! % firpm with firpmord; specs. are almost met.
%!
%!demo
%!
%! db2mag = @(x) 10^(x/20);
%!
%! b = firpm (firpmord ([0.3 0.4], [0 1], [db2mag(-80) .01], "c"){:});
%!
%! [h f] = freqz (b, 1, 2^14); clf
%! plot (f/pi, 20*log10 (abs (h))); grid on; axis ([0 1 -110 5])
%! ylabel ("Magnitude (dB)"); xlabel ("Frequency (normalized)")
%! title (sprintf ("Response analysis of firpmord / firpm high-pass filter design (order=%i)", length (b) - 1))
%! axes ("position", [.52 .4 .35 .3])
%! plot (f/pi, abs (h)); grid on; axis ([.39 1 x=.987 2-x])
%! ylabel ("Magnitude")
%! title ("Pass-band detail")
%! %--------------------------------------------------
%! % Figure shows analysis of filter designed using
%! % firpm with firpmord; specs. are exceeded.
%!
%!demo
%!
%! db2mag = @(x) 10^(x/20);
%!
%! ds = db2mag (-80); dp = 0.01;
%! b = firpm (firpmord ([1 2 3 4 5 6 7 8]/10, [0 1 0 1 0], [ds dp], "c"){:});
%!
%! [h f] = freqz (b, 1, 2^14); clf
%! plot (f/pi, 20*log10 (abs (h))); grid on; axis ([0 1 -110 5])
%! ylabel ("Magnitude (dB)"); xlabel ("Frequency (normalized)")
%! title ("Response analysis of firpmord / firpm multi-band-pass filter design")
%! title (sprintf ("Response analysis of firpmord / firpm multi-band-pass filter design (order=%i)", length (b) - 1))
%! axes ("position", [.38 .5 .5 .2])
%! plot (f/pi, abs (h)); grid on; axis ([.11 .79 x=.986 2-x])
%! ylabel ("Magnitude")
%! title ("Pass-bands detail")
%! %--------------------------------------------------
%! % Figure shows analysis of filter designed using
%! % firpm with firpmord; specs. are met.
%!
%!demo
%!
%! db2mag = @(x) 10^(x/20);
%!
%! ds = db2mag (-40); dp = 1 - db2mag (-0.1);
%! b = firpm (firpmord ([2 3 8 9]/32, [0 1 0], [ds dp], "c"){:});
%!
%! [h f] = freqz (b, 1, 2^14); clf
%! plot (f/pi, 20*log10 (abs (h))); grid on; axis ([0 1 -50 3])
%! ylabel ("Magnitude (dB)"); xlabel ("Frequency (normalized)")
%! title (sprintf ("Response analysis of firpmord / firpm band-pass filter design (order=%i)", length (b) - 1))
%! axes ("position", [.45 .5 .4 .3])
%! plot (f/pi, 20*log10 (abs (h))); grid on; axis ([.08 .26 x=-.13 -x])
%! ylabel ("Magnitude (dB)")
%! title ("Pass-band detail")
%! %--------------------------------------------------
%! % Figure shows analysis of filter designed using
%! % firpm with firpmord; specs. are not met.
%!
%!demo
%!
%! % FIRPMX: F, A, D, Fs are as firpmord.
%! % type in {0,1,2} constrains order to be {even,odd,either} resp.
%!
%! function h = firpmx (type, F, A, D, Fs = 2)
%!   type *= !A(end); step = 2; bounds = [0 0];
%!   while (bounds(2) - bounds(1) != step)
%!     if all (!bounds) [n f a w] = firpmord (F, A, D, Fs);
%!     elseif (!bounds(1)) n = min (n - step, round (n * 0.994));
%!     elseif (!bounds(2)) n = max (n + step, round (n / 0.998));
%!     else                n = fix (mean (bounds));
%!     endif
%!     n += rem (n + rem (type, 2), step);
%!     [b m] = firpm (n, f, a, w);
%!     bounds(1 + (met = (abs(m) <= max (D)))) = n;
%!     step -= bounds(2) - bounds(1) == type;
%!     if (met) h = b; endif
%!   endwhile
%! endfunction
%!
%! db2mag = @(x) 10^(x/20);
%!
%! ds = db2mag (-40); dp = 1 - db2mag (-0.1);
%! b = firpmx (2, [2 3 8 9]/32, [0 1 0], [ds dp]);
%!
%! [h f] = freqz (b, 1, 2^14); clf
%! plot (f/pi, 20*log10 (abs (h))); grid on; axis ([0 1 -50 3])
%! ylabel ("Magnitude (dB)"); xlabel ("Frequency (normalized)")
%! title (sprintf ("Response analysis of firpmord / iterative-firpm band-pass filter design (order=%i)", length (b) - 1))
%! axes ("position", [.45 .5 .4 .3])
%! plot (f/pi, 20*log10 (abs (h))); grid on; axis ([.08 .26 x=-.13 -x])
%! ylabel ("Magnitude (dB)")
%! title ("Pass-band detail")
%! %--------------------------------------------------
%! % Figure shows analysis of filter designed iteratively
%! % using firpm with firpmord, so that specs. are met.
