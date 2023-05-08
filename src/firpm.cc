/*        Copyright (c) 2014/15 Rob Sykes <robs@users.sourceforge.net>
 *
 * This file is part of Octave.
 *
 * Octave is free software; you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 3 of the License, or (at your option) any later
 * version.
 *
 * Octave is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, see <http://www.gnu.org/licenses/>.                  */



#include "mmfir.h"

#include <octave/oct.h>
#include <octave/Cell.h>

#include "octave-compat.h"

#define AL(x) (int)(sizeof(x)/sizeof(x[0])) // Array-Length
#define returnError(...) do { error(__VA_ARGS__);\
  return octave_value_list(); } while (0)



DEFUN_DLD (firpm, args, , "\
-*- texinfo -*-\n\
@deftypefn  {Loadable Function} {@var{b} =} firpm (@var{n}, @var{f}, @var{a})\n\
@deftypefnx {Loadable Function} {@var{b} =} firpm (@var{n}, @var{f}, @var{a}, @var{w})\n\
@deftypefnx {Loadable Function} {@var{b} =} firpm (@var{n}, @var{f}, @var{a}, @var{w}, @var{properties})\n\
@deftypefnx {Loadable Function} {@var{b} =} firpm (@var{n}, @var{f}, @var{a}, @var{properties})\n\
@deftypefnx {Loadable Function} {[@var{b}, @var{minimax}] =} firpm (@dots{})\n\
@deftypefnx {Loadable Function} {[@var{b}, @var{minimax}, @var{result}] =} firpm (@dots{})\n\
@cindex signal processing\n\
\n\
Return as column-vector @var{b}, the coefficients of a linear-phase FIR\n\
filter designed according to given specifications and the `minimax'\n\
criterion.  The method (per McClellan et al.@footnote{ J. H. McClellan, T.\n\
W. Parks and L. R. Rabiner, `A Computer Program for Designing Optimum FIR\n\
Linear Phase Digital Filters', IEEE Trans.@: Audio Electroacoust., vol.@:\n\
AU-21, 1973, pp.@: 506--525.}) uses successive approximation to minimise the\n\
maximum weighted error between the desired and actual frequency response of\n\
the filter.  Filters thus designed are variably described as being `minimax',\n\
`equiripple', or `optimal (in the Chebyshev sense)'.\n\
\n\
@heading Arguments\n\
\n\
@table @var\n\
\n\
@item n\n\
A positive integer giving the filter order.\n\
\n\
@item f\n\
A vector of real-numbers, increasing in the range [0,1], giving the\n\
frequencies of the left and right edges of each band for which a specific\n\
amplitude response is desired: [l1 r1 l2 r2 @dots{}].  1 represents the\n\
Nyquist-frequency.  Transition-bands are defined implicitly as the regions\n\
between or outside the given bands.\n\
\n\
@item a\n\
A vector of real-numbers giving the desired amplitude response.  An amplitude\n\
value is given either for each band edge: [a(l1) a(r1) a(l2) a(r2) @dots{}],\n\
or for each band: [a1 a2 @dots{}].  In the former case, in-band amplitude is\n\
determined by linear interpolation between the given band-edge values.  1\n\
represents unity-gain, 0 represents infinite attenuation, and @minus{}1\n\
represents a phase change of pi radians.\n\
\n\
@item w\n\
An optional vector of positive real-numbers giving error-weightings to be\n\
applied at each given band-edge [w(l1) w(r1) w(l2) w(r2) @dots{}], or for\n\
each band [w1 w2 @dots{}].  In the former case, in-band weighting is\n\
determined by linear interpolation between the given band-edge values.  A\n\
higher relative error weighting yields a lower relative error.\n\
\n\
@item properties\n\
A value for a `property' is given by a consecutive pair of arguments: the\n\
first, a string, gives the property name; the second gives its value.\n\
Available property names are as follows:\n\
\n\
@table @var\n\
@item class\n\
Specifies the filter-class; values are @qcode{\"symmetric\"} (the default) for\n\
type I or II filters, @qcode{\"antisymmetric\"} for standard type III or IV\n\
filters, or @qcode{\"differentiator\"} for type III or IV filters with inverted\n\
phase and with error-weighting (further to @var{w}) of 2/f applied in the\n\
pass-band(s).  The value-string may be abbreviated.\n\
\n\
@ignore\n\
@c  The usefulness of this is for further consideration.\n\
@item target\n\
A positive real number giving a target minimax error; see Diagnostics, below.\n\
@end ignore\n\
\n\
@item accuracy\n\
Controls how close the computed filter will be to the ideal minimax solution.\n\
\n\
@item persistence\n\
Controls the number of computation iterations over which the required\n\
accuracy will be sought.\n\
\n\
@item robustness\n\
Controls the precision of certain internal processing.\n\
@end table\n\
\n\
Each of @var{accuracy}, @var{persistence}, and @var{robustness} can be set to\n\
a small positive number (typically @leq{}3), to increment the controlled\n\
item; this may increase computation time, but the need to do so should be\n\
rare.\n\
\n\
@end table\n\
\n\
@heading Syntax examples\n\
\n\
Type I low-pass; lower relative error in stop-band; increased @var{accuracy}:\n\
\n\
@example\n\
b = firpm(40, [0 0.4 0.5 1], [1 0], [1 10], \"accuracy\", +1);\n\
@end example\n\
\n\
Type II band-pass; amplitude per band-edge; even weight; default\n\
@var{properties}:\n\
\n\
@example\n\
b = firpm(41, [0 0.5 0.6 0.7 0.8 1], [0 0 1 1 0 0]);\n\
@end example\n\
\n\
Type III differentiator:\n\
\n\
@example\n\
b = firpm(40, [0 0.9], [0 0.9], \"class\", \"differentiator\");\n\
@end example\n\
\n\
Type IV high-pass with gain; @var{class} value abbreviated:\n\
\n\
@example\n\
b = firpm(31, [0 0.5 0.7 1], [0 2.5], \"class\", \"antisym\");\n\
@end example\n\
\n\
To use other units for @var{f}, divide by the value in those units that\n\
represents the Nyquist-frequency.  For example:\n\
\n\
@example\n\
@group\n\
Fs = 96000;    % Sampling frequency in Hz\n\
Fn = Fs / 2;   % Nyquist frequency in Hz\n\
b = firpm(50, [0 20000 28000 48000] / Fn, [1 0]);\n\
@end group\n\
@end example\n\
\n\
Further syntax examples can be found among the demonstration designs.\n\
\n\
@heading Compatibility\n\
\n\
For compatibility with other implementations, the following alternative\n\
syntax is available:\n\
\n\
@itemize @bullet\n\
@item\n\
@var{class} values @qcode{\"bandpass\"} and @qcode{\"hilbert\"} may be used in\n\
place of @qcode{\"symmetric\"} and @qcode{\"antisymmetric\"} respectively.\n\
\n\
@item\n\
The @var{class} property-name argument can be omitted if its associated value\n\
argument is not followed by another property pair.\n\
\n\
@item\n\
The single argument @code{@{4^(x+2)@}} can substitute for the pair\n\
@code{\"accuracy\", +x} (where @code{x} is variable).\n\
\n\
@end itemize\n\
\n\
For example, the following three invocations are equivalent:\n\
\n\
@example\n\
@group\n\
firpm(30, [0.1 0.9], 1, \"class\", \"antisymmetric\");\n\
firpm(30, [0.1 0.9], 1, \"class\", \"hilbert\");\n\
firpm(30, [0.1 0.9], 1, \"hilbert\");\n\
@end group\n\
@end example\n\
\n\
as are the following two:\n\
\n\
@example\n\
@group\n\
firpm(11, [0 0.9], 1, \"accuracy\", +1);\n\
firpm(11, [0 0.9], 1, @{64@});\n\
@end group\n\
@end example\n\
\n\
This function is broadly compatible with the Matlab@registeredsymbol{}\n\
function of the same name. However, the following differences are noted:\n\
\n\
@itemize @bullet\n\
@item\n\
Octave does not currently support the `function function' invocation form.\n\
\n\
@item\n\
Whereas Matlab produces a type-I filter when an invalid type-II filter has\n\
been specified, Octave reports an error.\n\
\n\
@item\n\
The filter coefficients are returned by Octave as a column-vector, but by\n\
Matlab as a row-vector.\n\
\n\
@item\n\
The third returned value differs between the two implementations.\n\
\n\
@end itemize\n\
\n\
@heading Diagnostics\n\
\n\
If a problem occurs during the computation, a diagnostic message will\n\
normally be displayed.  If this happens, adjusting @var{accuracy},\n\
@var{persistence}, or @var{robustness} may provide the solution.  Some\n\
filters however,  may not be realisable due to machine-precision limitations;\n\
in this case, relaxing the design specification (e.g.@: reducing the\n\
filter-order) might be an option.\n\
\n\
If the computation fails early on, no value will be returned.  Otherwise,\n\
@var{minimax} is the approximated, minimised, maximum weighted error, and\n\
@var{result} is zero for success, or non-zero if the required accuracy could\n\
not be achieved (in which case @var{minimax} may not be accurate).\n\
\n\
Returned @var{minimax} and @var{result} values could be used in an iterative\n\
algorithm to determine the minimum filter order needed to meet a given\n\
specification (see the @code{firpmord} demonstration code for a simple\n\
example of this).\n\
@ignore\n\
In implementing such an algorithm, giving the @var{target} property can save a\n\
little time by halting the processing early if the target minimax error can not\n\
be achieved.  Giving a @var{target} value also suppresses diagnostic display,\n\
so @var{result} must be used for diagnostics in this case.\n\
@end ignore\n\
\n\
Note that multiplying @var{w} by a constant affects @var{minimax} similarly.\n\
Hence, in the following example, b1 and b2 are equal, but m1 and m2 are not:\n\
\n\
@example\n\
@group\n\
[b1 m1] = firpm(20, [0 0.4 0.5 1], [1 0], [1 1/8])\n\
[b2 m2] = firpm(20, [0 0.4 0.5 1], [1 0], [8   1])\n\
@end group\n\
@end example\n\
\n\
With this filter design method, transition-band behaviour is not specified,\n\
which can sometimes cause transition-band `anomalies'.  For this reason (and\n\
perhaps others), it is wise to check that the actual response of the computed\n\
filter is satisfactory.  For example:\n\
\n\
@example\n\
@group\n\
b = firpm(40, [0 3 4 6 8 10]/10, [0 1 0]);\n\
freqz(b)\n\
@end group\n\
@end example\n\
\n\
For how to prevent transition-band anomalies (and for general discussion of\n\
minimax filter design) see Saram@\"aki.@footnote{ Tapio Saram@\"aki, `Finite\n\
impulse response filter design', Chapter 4 in `Handbook for Digital Signal\n\
Processing', edited by S.  K. Mitra and J. F. Kaiser, John Wiley and Sons,\n\
New York, 1993, pp.@: 155--277.\n\
(@url{http://www.cs.tut.fi/~ts/Mitra_Kaiser.pdf})}\n\
\n\
@heading Related documentation\n\
\n\
@seealso{firpmord, firls}\n\
\n\
@end deftypefn\n\
")
{
  int i, arg(0), nargin(args.length ()), N;

  // The first 3 parameters are mandatory:
  if (nargin < 3)
    {
      print_usage ();
      return octave_value_list ();
    }

  // N:
  octave_value const & v = args(arg++);
  if (!v.is_real_scalar () || (N = (int)v.scalar_value ()) != v.scalar_value ())
    returnError ("firpm parameter N (filter order) must be an integer");

  // F[]:
  ColumnVector freqs;
  if (!args(arg).is_string () && args(arg).is_real_matrix ())
    freqs = args(arg++).vector_value ();
  if (freqs.numel () < 2 || (freqs.numel () & 1))
    returnError ("firpm parameter F (band-edge frequencies) "
        "must be a real, even-lengthed vector");
  int numBands(freqs.numel () >> 1);
  OCTAVE_LOCAL_BUFFER(mmfirBandSpec, bands, numBands);
  for (i = 0; i < numBands; ++i)
    bands[i].freqL = freqs(2*i), bands[i].freqR = freqs(2*i+1);

  // A[]:
  ColumnVector amps;
  if (!args(arg).is_string () && (args(arg).is_real_matrix ()
        || (args(arg).is_real_scalar () && numBands == 1)))
    amps = args(arg++).vector_value ();
  bool have2(amps.numel () == numBands * 2);
  if (amps.numel () != numBands && !have2)
    returnError ("firpm parameter A must be a real vector of "
        "response amplitudes: one per band, or per band-edge");
  for (i = 0; i < numBands; ++i)
    if (have2)
      bands[i].ampL = amps(2*i), bands[i].ampR = amps(2*i+1);
    else bands[i].ampL = bands[i].ampR = amps(i);

  // W[]:
  if (arg < nargin && !args(arg).is_string () && (
        args(arg).is_real_matrix () ||
        (args(arg).is_real_scalar () && numBands == 1)))
    {
      ColumnVector weights(args(arg++).vector_value ());
      bool have2(weights.numel () == numBands * 2);
      if (weights.numel () != numBands && !have2)
        returnError ("firpm parameter W must be a real vector of "
            "error weights: one per band, or per band-edge");
      for (i = 0; i < numBands; ++i)
        if (have2)
          bands[i].weightL = weights(2*i), bands[i].weightR = weights(2*i+1);
        else bands[i].weightL = bands[i].weightR = weights(i);
    }
  else for (i = 0; i < numBands; ++i)
    bands[i].weightL = bands[i].weightR = 1;

  // PROPERTIES:
  static char const * const propertyNames[] =
    { "ACCURACY", "PERSISTENCE", "ROBUSTNESS", "TARGET", "FLAGS", "CLASS" };
  double realProperties[] = { 0, 0, 0, 0, 0 };
  int Class(0);
  while (arg < nargin && (args(arg).is_string () || octave::signal::iscell(args(arg))))
    {
      if (octave::signal::iscell(args(arg)))
        { // Support Matlab's lgrid syntax and emulate its effect:
          Cell c(args(arg).cell_value ());
          if (c.numel() == 1 && c(0).is_real_scalar ())
            {
              double const density(c(0).double_value ());
              realProperties[0] = log ( std::max (density, 16.)) / log (4) - 2;
              ++arg;
              continue;
            }
          break;
        }

      std::string name(propertyNames[AL(propertyNames)-1]);
      if (arg + 1 < nargin && !octave::signal::iscell(args(arg + 1)))
        name = args(arg++).string_value ();
      std::transform(name.begin(), name.end(), name.begin(), ::toupper);
      for (i = 0; i < AL(propertyNames) && name != propertyNames[i]; ++i);
      if (!(i < AL(propertyNames)))
        returnError ("firpm unknown PROPERTIES name `%s'", name.c_str ());
      if (i < AL(realProperties))
        {
          if (!args(arg).is_real_scalar ())
            returnError ("firpm property %s must be a real scalar"
                , name.c_str ());
          realProperties[i] = args(arg++).double_value ();
        }
      else
        {
          char const * names[] =
            {
              "symmetric", "bandpass",
              "antisymmetric", "hilbert",
              "differentiator"
            };
          std::string s(args(arg).is_string ()
              ? args(arg++).string_value () : ".");
          for (; Class < AL(names)
              && std::string(names[Class]).substr (0, s.size()) != s; ++Class);
          if (!(Class < AL(names)))
            returnError ("firpm property CLASS must be in "
                "{'%s' (or '%s'), '%s' (or '%s'), '%s'}",
                names[0], names[1], names[2], names[3], names[4]);
          Class >>= 1; // Shift away alternative names.
        }
    }

  // If any args remain at this point, then something has gone awry:
  if (arg < nargin)
    {
      std::ostringstream os;
      octave_value tmp(args(arg)); // Need tmp since print is no longer const.
      tmp.print (os, true);
      std::string s(os.str ());
      size_t p = s.find_last_not_of (" \t\r\n");
      if (p != std::string::npos)
        s.erase (p+1);
      returnError ("firpm argument # %i is invalid: %s", arg+1, s.c_str ());
    }

  // Convert N from filter-order to # of taps; attempt to generate the filter:
  OCTAVE_LOCAL_BUFFER (double, h, ++N);
  mmfirReport report(mmfir (h, (mmfirFilterClass)Class, N, numBands, bands,
        realProperties[0], realProperties[1], realProperties[2],
        realProperties[3], octave::math::nint (realProperties[4])));

  // Warn if any controls were clamped:
  for (i = 0; i < AL(report.controls); ++i)
    if (report.controls[i] != realProperties[i])
      warning ("firpm property %s was clamped to %g",
          propertyNames[i], report.controls[i]);

  // Check if a filter was generated:
  if (report.result >= mmfirInvocationError)
    returnError ("firpm invocation error: %s", report.text);
  else if (report.result >= mmfirError)
    returnError ("firpm failed to make a filter (result=%i)", report.result);

  // Missed-target is handled silently:
  if (report.result == mmfirMissedTarget)
    N = 0; // Return empty B.
  else // Check if a warning should be issued:
    if (report.result >= mmfirWarning)
      warning ("firpm %s (result=%i)", report.text, report.result);

  // Copy filter coefficients to an Octave column-vector:
  ColumnVector b(N);
  while (N--) b(N) = h[N];

  // Return [B, MINIMAX, RESULT]:
  octave_value_list retval;
  retval(0) = octave_value(b);
  retval(1) = octave_value(report.minimax);
  retval(2) = octave_value(report.result); // Numeric (not textual) result.
  return retval;
}



/* GNU Octave tests and demos:

                                Invocation tests

%!error <firpm parameter N \(filter order\) must be an integer> firpm (1.1, 2, 3);
%!error <firpm parameter N \(filter order\) must be an integer> firpm (i, 2, 3);
%!error <firpm parameter N \(filter order\) must be an integer> firpm ([1 2], 2, 3);

%!error <firpm parameter F \(band-edge frequencies\) must be a real, even-lengthed vector> firpm (1, 2, 3);
%!error <firpm parameter F \(band-edge frequencies\) must be a real, even-lengthed vector> firpm (2, [1 2 3], 3);
%!error <firpm parameter F \(band-edge frequencies\) must be a real, even-lengthed vector> firpm (2, [1 i], 3);

%!error <firpm parameter A must be a real vector of response amplitudes: one per band, or per band-edge> firpm (1, [1 2], i);
%!error <firpm parameter A must be a real vector of response amplitudes: one per band, or per band-edge> firpm (1, [1 2], []);
%!error <firpm parameter A must be a real vector of response amplitudes: one per band, or per band-edge> firpm (1, [1 2], [1 2 3]);
%!error <firpm parameter A must be a real vector of response amplitudes: one per band, or per band-edge> firpm (1, [1 2], [1 i]);

%!error <firpm parameter W must be a real vector of error weights: one per band, or per band-edge> firpm (1, [1 2], 1, []);
%!error <firpm parameter W must be a real vector of error weights: one per band, or per band-edge> firpm (1, [1 2], 1, [1 2 3]);

%!error <firpm property CLASS must be in {'symmetric' \(or 'bandpass'\), 'antisymmetric' \(or 'hilbert'\), 'differentiator'}> firpm (1, [1 2], 1, [1 2], 'diffi');
%!error <firpm property CLASS must be in {'symmetric' \(or 'bandpass'\), 'antisymmetric' \(or 'hilbert'\), 'differentiator'}> firpm (1, [1 2], 1, [1 2], 'hilberts');

%!error <firpm property ACCURACY must be a real scalar> firpm (1, [1 2], 1, [1 2], 'accuracy', 'antisymmetric');
%!error <firpm property PERSISTENCE must be a real scalar> firpm (1, [1 2], 1, [1 2], 'persistence', [1 1]);

%!error <firpm argument # 4 is invalid: \(0,1\)> firpm (1, [1 2], 1, i);
%!error <firpm argument # 4 is invalid: {}\(0x0\)> firpm (2, [0 1], [1 0], {}, 1);

%!warning <firpm property ROBUSTNESS was clamped to 0> firpm (1, [.1 .9], 1, [1 2], 'robustness',-1);
%!error <firpm failed to make a filter \(result=4\)> firpm (2, [.1 .9], 1);

%!error <band-edge frequencies must increase in \[0,1\]> firpm (1, [1 2], 1, [1 2], 'diff');
%!error <type II/III Nyquist amplitude response must be 0> firpm (81, [0 .2 .3 1], [1 -1]);
%!error <type III/IV DC amplitude response must be 0> firpm (81, [0 .2 .3 1], [-1 0], 'a');



                                Functional tests

The first 6 tests exercise all 6 filter type (3 classes, odd/even-order).
The b0 values come from a reference implementation.

%!test b0 = [
%!  -0.01306844322361
%!  -0.00576879446491
%!   0.00838126690529
%!  -0.04580777271297
%!  -0.03857170268345
%!  -0.06564404551953
%!  -0.03895798206108
%!   0.10957536253443
%!  -0.09596565600341
%!  -0.04596208116089
%!   0.25250866248593
%!  -0.04596208116089
%!  -0.09596565600341
%!   0.10957536253443
%!  -0.03895798206108
%!  -0.06564404551953
%!  -0.03857170268345
%!  -0.04580777271297
%!   0.00838126690529
%!  -0.00576879446491
%!  -0.01306844322361
%! ];
%! [b m r] = firpm (20, [0 .2 .3 .4 .5 .7 .9 1], [0 .2 0 0 .5 .7 0 0], [1 4 16 64], 'b', {256});
%! assert (b0, b, 1e-5); assert (r, 0); assert (m, 0.21493, -5e-5);

%!test b0 = [
%!  -0.00025230206347
%!  -0.01634334994986
%!   0.02291167335102
%!   0.04226921430992
%!   0.01542390317553
%!   0.03368560169380
%!  -0.07263229297607
%!   0.02402776579442
%!   0.10971999889298
%!  -0.19495185723437
%!                  0
%!   0.19495185723437
%!  -0.10971999889298
%!  -0.02402776579442
%!   0.07263229297607
%!  -0.03368560169380
%!  -0.01542390317553
%!  -0.04226921430992
%!  -0.02291167335102
%!   0.01634334994986
%!   0.00025230206347
%! ];
%! [b m r] = firpm (20, [0 .2 .3 .4 .5 .7 .9 1], [0 .2 0 0 .5 .7 0 0], [1 4 16 64], 'h', {256});
%! assert (b0, b, 1e-5); assert (r, 0); assert (m, 0.19499, -5e-5);

%!test b0 = [
%!  -0.00377491711564
%!   0.00749876297245
%!  -0.01857378491500
%!  -0.02436623414958
%!   0.02123220611895
%!  -0.00133887288041
%!   0.08769905297256
%!  -0.01438000909341
%!  -0.11006930405280
%!   0.20125570410204
%!                  0
%!  -0.20125570410204
%!   0.11006930405280
%!   0.01438000909341
%!  -0.08769905297256
%!   0.00133887288041
%!  -0.02123220611895
%!   0.02436623414958
%!   0.01857378491500
%!  -0.00749876297245
%!   0.00377491711564
%! ];
%! [b m r] = firpm (20, [0 .2 .3 .4 .5 .7 .9 1], [0 .2 0 0 .5 .7 0 0], [1 4 16 64], 'd', {256});
%! assert (b0, b, 1e-5); assert (r, 0); assert (m, 0.49129, -5e-5);

%!test b0 = [
%!   0.00110112420442
%!   0.00032786748236
%!   0.03890416611405
%!   0.02776952210339
%!  -0.00513106293312
%!   0.00821219616448
%!  -0.05050622257469
%!   0.07143158068636
%!   0.04353182141693
%!  -0.17253512167493
%!   0.13296924791431
%!   0.13296924791431
%!  -0.17253512167493
%!   0.04353182141693
%!   0.07143158068636
%!  -0.05050622257469
%!   0.00821219616448
%!  -0.00513106293312
%!   0.02776952210339
%!   0.03890416611405
%!   0.00032786748236
%!   0.00110112420442
%! ];
%! [b m r] = firpm (21, [0 .2 .3 .4 .5 .7 .9 1], [0 .2 0 0 .5 .7 0 0], [1 4 16 64], 'b', {256});
%! assert (b0, b, 1e-5); assert (r, 0); assert (m, 0.19215, -5e-5);

%!test b0 = [
%!   0.00688473243750
%!  -0.00142370547227
%!   0.00792901881787
%!   0.05914568352388
%!   0.03038499582274
%!   0.03374098557746
%!  -0.02191978751853
%!  -0.08702247834731
%!   0.10568616843372
%!  -0.06074859970379
%!  -0.18689246939614
%!   0.18689246939614
%!   0.06074859970379
%!  -0.10568616843372
%!   0.08702247834731
%!   0.02191978751853
%!  -0.03374098557746
%!  -0.03038499582274
%!  -0.05914568352388
%!  -0.00792901881787
%!   0.00142370547227
%!  -0.00688473243750
%! ];
%! [b m r] = firpm (21, [0 .2 .3 .4 .5 .7 .9 1], [0 .2 0 0 .5 .7 0 0], [1 4 16 64], 'h', {256});
%! assert (b0, b, 1e-5); assert (r, 0); assert (m, 0.20726, -5e-5);

%!test b0 = [
%!  -0.00164508269033
%!   0.00067200008069
%!   0.00268424782721
%!  -0.03510524314006
%!   0.00455581822868
%!   0.00862256307919
%!   0.03221163698642
%!   0.08429446688809
%!  -0.12214036419364
%!   0.04373834279952
%!   0.19029552670347
%!  -0.19029552670347
%!  -0.04373834279952
%!   0.12214036419364
%!  -0.08429446688809
%!  -0.03221163698642
%!  -0.00862256307919
%!  -0.00455581822868
%!   0.03510524314006
%!  -0.00268424782721
%!  -0.00067200008069
%!   0.00164508269033
%! ];
%! [b m r] = firpm (21, [0 .2 .3 .4 .5 .7 .9 1], [0 .2 0 0 .5 .7 0 0], [1 4 16 64], 'd', {256});
%! assert (b0, b, 1e-5); assert (r, 0); assert (m, 0.47868, -5e-5);



%!test b0=[
%!   0.01402447013732010
%!  -0.00187656470348210
%!  -0.03037226560233987
%!   0.01238671724689763
%!   0.01701736750357643
%!   0.00130000669025103
%!   0.01887058201233184
%!  -0.04786566643294526
%!  -0.02646470269612746
%!   0.05579339917757684
%!   0.00111880676596655
%!   0.05887956174380488
%!  -0.03589764058661398
%!  -0.22983989436822705
%!   0.17175369560988285
%!   0.28425948627067166 ]';
%! [b m r] = firpm (31 , [0 .3 .4 .7 .8 1], [0 1 0], [10 1 10], 'accuracy', 1, 'class', 'a');
%! assert (b', [-b0 fliplr(b0)], 5e-9);
%! assert (r, 0); assert (m, 0.059734, -5e-5);



%!test [b m r] = firpm (40, [0 .5 .6 1], [1 0]);
%! assert (r, 0); assert (m, 0.010304, -5e-5);

%!test [b m r] = firpm (40, [0 .25 .3 .6 .65 1], [0 1 0]);
%! assert (r, 0); assert (m, 0.055834, -5e-5);

%!test [b m r] = firpm (30, [0 .2 .4 .6 .8 1], [1 .5 0]);
%! assert (r, 0); assert (m, 5.6274e-04, -5e-5);

%!test
%! [b m r] = firpm (40, [0 .2 .3 .4 .5 .6 .7 .8 .9 1], [1 0 1 0 1], [11 100 7 10 5]);
%! assert (r, 0); assert (m, 0.25720, -5e-5);

%!test [b m r] = firpm (80, [0 .2 .3 1], [1 -1]);
%! assert (r, 0); assert (m, 6.6123e-04, -5e-5);

%!test [b m r] = firpm (40, [0 2.5/pi], [0 2.5], [.5], 'class', 'differentiator');
%! assert (r, 0); assert (m, 2.5226e-06, -5e-5);

%!test [b m r] = firpm (59, [0 .2 .3 1], [0 1 0 0], 'd');
%! assert (r, 0); assert (m, 0.0073785, -5e-5);

%!test [b m r] = firpm (31, [0 .5 .7 1], [0 1], 'class', 'antisymmetric');
%! assert (r, 0); assert (m, 0.0015660, -5e-5);

%!test assert (firpm (31, [0 .5 .7 1], [0 1], 'class', 'antisymmetric'), firpm (31, [0 .5 .7 1], [0 1], 'hilbert'))

%!test [b m r] = firpm (30, [.1 .9], 1, 'class', 'antisymmetric');
%! assert (r, 0); assert (m, 0.0027064, -5e-5);

%!test [b m r] = firpm (1000, [0 .4 .41 1], [1 0]);
%! assert (r, 0); assert (m, 5.2892e-05, -5e-5);

%!test [b m r] = firpm (120, [0 .5 .55 .75 .75 1], [1 0 0], [1 1 4 64 64 64]);
%! assert (r, 0); assert (m, 0.0048543, -5e-5);

%!test [b m r] = firpm (11, [0 2*.45], .5, 'class', 'symmetric');
%! assert (r, 0); assert (m, 0.045066, -5e-5);

%!warning <firpm not-converged \(result=1\)> firpm (298, [0 .28 .33 .48 .53 1], [0 1 0], [93 68 89]);

%!test [b m r] = firpm (298, [0 .28 .33 .48 .53 1], [0 1 0], [93 68 89], 'persistence', 3);
%! assert (r, 0); assert (m, 6.8598e-05, -5e-5);

%!test assert (firpm (11, [0 2*.45], .5, 'class', 'symmetric'), firpm (11, [0 2*.45], .5, 'bandpass'))
%!test assert (firpm (11, [0 2*.45], .5, 'class', 'symmetric'), firpm (11, [0 2*.45], .5))

%!assert (firpm (20, [0 .3 .5 1], [1 1 0 0]), firpm (20, [0 .3 .5 1], [1 0]))



%!test assert (
%!  firpm(30, [0.1 0.9], 1, "class", "antisymmetric"),
%!  firpm(30, [0.1 0.9], 1, "class", "hilbert"))
%!test assert (
%!  firpm(30, [0.1 0.9], 1, "class", "hilbert"),
%!  firpm(30, [0.1 0.9], 1, "hilbert"))
%!test assert (
%!  firpm(11, [0 0.9], 1, "accuracy", 1),
%!  firpm(11, [0 0.9], 1, {64}))



%!test
%! [b1 m1] = firpm(20, [0 0.4 0.5 1], [1 0], [1 1/8]);
%! [b2 m2] = firpm(20, [0 0.4 0.5 1], [1 0], [8   1]);
%! assert (b1, b2)
%! assert (m1 * 8, m2)



%!
%! # N.B. Demos 1-7 are purposely common with firls
%!
%!demo
%!
%! b = firpm (40, [0 .5 .6 1], [1 0]);
%!
%! clf
%! [h f] = freqz (b, 1, 2^14);
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! axis ([0 1 -55 2])
%! title ('firpm type-I low-pass filter design');
%! ylabel ('Magnitude response (dB)'); xlabel ('Frequency (normalized)')
%! axes ('position', [.21 .55 .3 .2])
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! axis ([0 .52 -(e=1.1e-1) e])
%! title ('Pass-band detail')
%! axes ('position', [.21 .2 .3 .2])
%! stem (b, '.'); grid ('on')
%! title ('Impulse response')
%! axis ([1 length(b) -.2 .6])
%! %--------------------------------------------------
%! % Figure shows transfer and impulse-response of
%! % low-pass filter design.
%!
%!demo
%!
%! b = firpm (40, [0 .25 .3 .6 .65 1], [0 1 0]);
%!
%! clf
%! [h f] = freqz (b, 1, 2^14);
%! subplot (2, 2, 1:2)
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! axis ([0 1 -50 5])
%! title ('firpm type-I band-pass filter design');
%! ylabel ('Magnitude response (dB)'); xlabel ('Frequency (normalized)')
%! subplot (2, 2, 3)
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! axis ([.29 .61 -(e=6e-1) e])
%! title ('Pass-band detail')
%! subplot (2, 2, 4)
%! stem (b, '.'); grid ('on')
%! title ('Impulse response')
%! axis ([1 length(b) -.3 .4])
%! %--------------------------------------------------
%! % Figure shows transfer and impulse-response of
%! % band-pass filter design.
%!
%!demo
%!
%! b = firpm (30, [0 .2 .4 .6 .8 1], [1 .5 0]);
%!
%! clf
%! [h f] = freqz (b, 1, 2^14);
%! plot (f/pi, abs (h)); grid ('on'); axis ([0 1 -.1 1.1])
%! title ('firpm type-I multi-level filter design');
%! ylabel ('Magnitude response'); xlabel ('Frequency (normalized)')
%! axes ('position', [.21 .2 .3 .2])
%! plot (f/pi, abs (h)); grid ('on'); axis ([.39 .61 .5-(e=1e-3) .5+e])
%! title ('Mid-band detail')
%! axes ('position', [.55 .65 .3 .2])
%! plot (f/pi, abs (h)); grid ('on'); axis ([0 .21 1-(e=1e-3) 1+e])
%! title ('Pass-band detail')
%! %--------------------------------------------------
%! % Figure shows transfer of multi-level filter design.
%!
%!demo
%!
%! b = firpm (40, [0 .2 .3 .4 .5 .6 .7 .8 .9 1], [1 0 1 0 1], [11 100 7 10 5]);
%!
%! clf
%! [h f] = freqz (b, 1, 2^14);
%! subplot (2, 1, 1)
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! axis ([0 1 -60 5]); set (gca, 'xtick', [0:.1:1])
%! title ('firpm type-I multi-band, multi-weight filter design');
%! ylabel ('Magnitude response (dB)'); xlabel ('Frequency (normalized)')
%! subplot (2, 1, 2)
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! axis ([0 1 -.5 .5]); set (gca, 'xtick', [0:.1:1])
%! title ('Pass-band detail')
%! %--------------------------------------------------
%! % Figure shows transfer of multi-band, multi-weight filter design.
%!
%!demo
%!
%! b = firpm (80, [0 .2 .3 1], [1 -1]);
%!
%! clf
%! [h f] = freqz (b, 1, 2^14);
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! axis ([0 1 -60 5])
%! title ('firpm type-I notch filter design');
%! ylabel ('Magnitude response (dB)'); xlabel ('Frequency (normalized)')
%! axes ('position', [.42 .55 .45 .2])
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! axis ([0 1 -(e=1e-2) e])
%! title ('Pass-band detail')
%! axes ('position', [.42 .2 .45 .2])
%! stem (b, '.'); grid ('on')
%! title ('Impulse response')
%! axis ([1 length(b) -.55 .5])
%! %--------------------------------------------------
%! % Figure shows transfer and impulse-response of
%! % notch filter design.
%!
%!demo
%!
%! b = firpm (1000, [0 .4 .41 1], [1 0]);
%!
%! clf
%! [h f] = freqz (b, 1, 2^17);
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! title ('firpm type-I brick-wall low-pass filter design');
%! ylabel ('Magnitude response (dB)'); xlabel ('Frequency (normalized)')
%! axis ([0 1 -100 5])
%! axes ('position', [.55 .6 .3 .2])
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! title ('Details')
%! axis ([.38 .401 -(e=1e-3) e])
%! axes ('position', [.55 .3 .3 .2])
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! axis ([.409 .43 -86 -85])
%! axes ('position', [.2 .35 .2 .3])
%! semilogy (abs (b))
%! title ('Impulse response magnitude')
%! axis ([0 length(b)+1 1e-8 1])
%! %--------------------------------------------------
%! % Figure shows transfer and impulse-response of
%! % brick-wall low-pass filter design.
%!
%!demo
%!
%! b1=firpm (11, [0 2*.45], .5);
%! b=zeros (length(b1)*2-1, 1); b (1:2:length(b))=b1; b (length(b1))=.5;
%!
%! clf
%! [h f] = freqz (b, 1, 2^14);
%! plot (f/pi, abs (h)); grid ('on')
%! axis ([0 1 0 1.1])
%! title ('firpm type-I half-band filter design');
%! ylabel ('Magnitude response'); xlabel ('Frequency (normalized)')
%! set (gca, 'xtick', [0:.1:1]);
%! set (gca, 'ytick', [0:.1:1]);
%! axes ('position', [.58 .35 .3 .5])
%! stem (b, '.'); grid ('on')
%! title ('Impulse response')
%! axis ([1 length(b) -.15 .55])
%! %--------------------------------------------------
%! % Figure shows transfer and impulse-response of
%! % half-band filter design (using an approach that
%! % uses less CPU and yields exact zero coefficients).
%!
%!demo
%!
%! b1 = firpm (65, [0 .4 .42 .6 .6 1], [1 0 0], [1 1 2 2 2 64]);
%! b2 = firpm (65, [0 .4 .42 .7 .7 1], [1 0 0], [1 1 2 32 32 32]);
%!
%! clf
%! subplot (2, 1, 1)
%! [h f] = freqz (b1, 1, 2^14);
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! axis ([0 1 -55 5])
%! title ('firpm type-II low-pass filter designs with shaped stop-band error');
%! ylabel ('Magnitude response (dB)')
%! subplot (2, 1, 2)
%! [h f] = freqz (b2, 1, 2^14);
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! axis ([0 1 -55 5])
%! ylabel ('Magnitude response (dB)'); xlabel ('Frequency (normalized)')
%! %--------------------------------------------------
%! % Figure shows transfer of low-pass filter designs
%! % with shaped error-weight in the stop-band.
%!
%!demo
%!
%! b = firpm (40, [0 2.5]/pi, [0 2.5], 'class', 'differentiator');
%!
%! clf
%! [h f] = freqz (b, 1, 2^14);
%! subplot (2, 1, 1)
%! plot (f, abs (h)); grid ('on')
%! title ('firpm type-III differentiator filter design');
%! ylabel ('Magnitude response'); xlabel ('Frequency (radians/sample)')
%! axis ([0 pi 0 pi])
%! subplot (2, 1, 2)
%! plot (f, abs (abs (h)./f-1)); grid ('on')
%! axis ([0 2.5 0 1e-6])
%! title ('Pass-band error (inverse-f weighted)')
%! %--------------------------------------------------
%! % Figure shows transfer of differentiator filter design.
%! % above: full-band
%! % below: detail of pass-band error (inverse-f weighted)
%!
%!demo
%!
%! b = firpm (30, [.1 .9], 1, 'class', 'antisymmetric');
%!
%! clf
%! [h f] = freqz (b, 1, 2^14);
%! plot (f/pi, abs (h)); grid ('on')
%! title ('firpm type-III hilbert transformer filter design');
%! ylabel ('Magnitude response'); xlabel ('Frequency (normalized)')
%! axis ([0 1 0 1.1])
%! axes ('position', [.3 .55 .45 .2])
%! plot (f/pi, abs (h)); grid ('on')
%! axis ([0 1 1-(e=4e-3) 1+e])
%! title ('Pass-band detail')
%! axes ('position', [.3 .2 .45 .2])
%! stem (b, '.'); grid ('on')
%! title ('Impulse response')
%! axis ([1 length(b) -.7 .7])
%! %--------------------------------------------------
%! % Figure shows transfer and impulse-response of
%! % hilbert filter design.
%!
%!demo
%!
%! b = firpm (31, [0 .5 .7 1], [0 1], 'class', 'antisymmetric');
%!
%! clf
%! [h f] = freqz (b, 1, 2^14);
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! axis ([0 1 -80 5])
%! title ('firpm type-IV high-pass filter design');
%! ylabel ('Magnitude response (dB)'); xlabel ('Frequency (normalized)')
%! axes ('position', [.2 .65 .3 .2])
%! plot (f/pi, 20*log10 (abs (h))); grid ('on')
%! axis ([.69 1 -(e=2e-2) e])
%! title ('Pass-band detail')
%! axes ('position', [.57 .3 .3 .2])
%! stem (b, '.'); grid ('on')
%! title ('Impulse response')
%! axis ([1 length(b) -.4 .4])
%! %--------------------------------------------------
%! % Figure shows transfer and impulse-response of
%! % odd-order high-pass filter design.
%!

*/
