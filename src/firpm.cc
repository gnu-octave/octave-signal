////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2014/15/21 Rob Sykes <robs@users.sourceforge.net>
//
// See the file COPYRIGHT.md in the top-level directory of this
// distribution or <https://octave.org/copyright/>.
//
// This file is part of Octave.
//
// Octave is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Octave is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Octave; see the file COPYING.  If not, see
// <https://www.gnu.org/licenses/>.
//
////////////////////////////////////////////////////////////////////////



#include "mmfir.h"

#include <octave/oct.h>
#include <octave/Cell.h>
#include <ov-fcn-handle.h>
#include <ov-scalar.h>
#include <octave/parse.h>

#include "octave-compat.h"


#define AL(x) (int)(sizeof (x)/sizeof (x[0])) // Array-Length
#define returnError(...) do { error (__VA_ARGS__);\
  return octave_value_list (); } while (0)



enum
  {
    RESP_FN_ARG_N,
    RESP_FN_ARG_F,
    RESP_FN_ARG_G,
    RESP_FN_ARG_W,
    RESP_FN_ARG_VAR
  };



static MmfirResult mmfirRespFn (MmfirBandSpec const * bandSpecs,
    int len, MmfirPoint points[], va_list args)
{
  (void)bandSpecs;
  octave_fcn_handle * const respFnHandle(va_arg (args, octave_fcn_handle *));
  octave_value_list * const respFnArgs  (va_arg (args, octave_value_list *));
  ColumnVector G (len);
  for (int i=0; i<len; ++i) G (i) = points[i].f;
  (*respFnArgs) (RESP_FN_ARG_G) = G;
  octave_value_list const result(
      octave::feval (respFnHandle->function_value (), *respFnArgs, 2));
  auto const nargout (result.length ());
  ColumnVector A; if (nargout>0) A=result (0).vector_value ();
  ColumnVector W; if (nargout>1) W=result (1).vector_value ();
  if (A.numel ()!=len)
    {
      error ("firpm respFn amplitude length %i should be %i", (int)A.numel (), len);
      return MmfirInvalidAmplitude;
    }
  if (W.numel ()!=len && nargout>1)
    {
      error ("firpm respFn weight length %i should be %i", (int)W.numel (), len);
      return MmfirInvalidWeight;
    }
  if (nargout>1)
    for (int i=0; i<len; ++i) points[i].a=A (i), points[i].w=W (i);
  else
    for (int i=0; i<len; ++i) points[i].a=A (i), points[i].w=1;
  return MmfirSuccess;
}



static double lgrid (octave_value const & v)
{
  double const density(v.double_value ());
  return log ( std::max (density, 16.)) / log (4) - 2;
}




DEFUN_DLD (firpm, args, nargout, "\
-*- texinfo -*-\n\
@deftypefn  {Loadable Function} {@var{b} =} firpm (@var{n}, @var{f}, @var{a})\n\
@deftypefnx {Loadable Function} {@var{b} =} firpm (@var{n}, @var{f}, @@@var{respFn})\n\
@deftypefnx {Loadable Function} {@var{b} =} firpm (@var{n}, @var{f}, @{@@@var{respFn}, @dots{}@})\n\
@deftypefnx {Loadable Function} {@var{b} =} firpm (@dots{}, @var{w})\n\
@deftypefnx {Loadable Function} {@var{b} =} firpm (@dots{}, @var{class})\n\
@deftypefnx {Loadable Function} {@var{b} =} firpm (@dots{}, @{@var{accuracy, @dots{}@}})\n\
@deftypefnx {Loadable Function} {[@var{b}, @var{minimax}] =} firpm (@dots{})\n\
@deftypefnx {Loadable Function} {[@var{b}, @var{minimax}, @var{res}] =} firpm (@dots{})\n\
@cindex signal processing\n\
\n\
Designs a linear-phase FIR filter according to given specifications and the\n\
`minimax' criterion.  The method (per McClellan et al.@footnote{ J. H.\n\
McClellan, T.  W. Parks and L. R.  Rabiner, `A Computer Program for Designing\n\
Optimum FIR Linear Phase Digital Filters', IEEE Trans.@: Audio Electroacoust.,\n\
vol.@: AU-21, 1973, pp.@: 506--525.}) uses successive approximation to minimize\n\
the maximum weighted error between the desired and actual frequency response of\n\
the filter.  Such filters are variably described as being `minimax',\n\
`equiripple', or `optimal (in the Chebyshev sense)'.\n\
\n\
@heading Arguments\n\
\n\
@table @var\n\
\n\
@item @dots{}\n\
Where shown as the first argument to @code{firpm}, indicates that any\n\
previously-indicated list of arguments may substitute for the ellipsis.\n\
\n\
@item n\n\
A positive integer giving the filter order.\n\
\n\
@item f\n\
A vector of real-numbers, increasing in the range [0,1], giving the frequencies\n\
of the left and right edges of each band for which a specific amplitude\n\
response is desired: [l1 r1 l2 r2 @dots{}].  1 represents the\n\
Nyquist-frequency.  Transition-bands are defined implicitly as the regions\n\
between or outside the given bands.\n\
\n\
@item a\n\
A vector of real-numbers giving the desired amplitude response.  An amplitude\n\
value is given either for each band edge: [a(l1) a(r1) a(l2) a(r2) @dots{}], or\n\
for each band: [a1 a2 @dots{}].  In the former case, in-band amplitude is\n\
determined by linear interpolation between the given band-edge values.  1\n\
represents unity-gain, 0 represents infinite attenuation, and @minus{}1\n\
represents a phase change of pi radians.\n\
\n\
Note that amplitude response is necessarily zero at @var{f}=0 for type III and\n\
IV filters, and at @var{f}=1 for type II and III filters.\n\
\n\
@item @@respFn\n\
A handle to a `response function' that supplies the desired amplitude response\n\
and error-weighting.  This, unlike @var{a} above, allows the response to be\n\
arbitrary (subject to the note above).  @qcode{firpm} invokes the response\n\
function according to the following syntax:\n\
\n\
@example\n\
@var{ag} = @qcode{respFn} (@var{n},@var{f},@var{g},@var{w}, @dots{})\n\
[@var{ag} @var{wg}] = @qcode{respFn} (@var{n},@var{f},@var{g},@var{w}, @dots{})\n\
@var{symmetry} = @qcode{respFn} (\"defaults\", @{@var{n},@var{f},@var{g},@var{w}, @dots{}@})\n\
@end example\n\
\n\
where:\n\
@itemize\n\
@item\n\
@var{n} and @var{f} are as given to @qcode{firpm}.\n\
\n\
@item\n\
@var{w} is as given to @qcode{firpm}, or ones if not given.\n\
\n\
@item\n\
@var{ag} and @var{wg} are the desired amplitude and weighting functions\n\
evaluated at each frequency in vector @var{g} (which are frequencies within the\n\
non-transition bands of @var{f}).  Returning @var{ag} alone gives uniform\n\
weighting.\n\
\n\
@item\n\
@var{symmetry} is either @qcode{\"even\"} or @qcode{\"odd\"}; this provides an\n\
alternative to using the @var{class} values @qcode{\"symmetric\"}\n\
and @qcode{\"antisymmetric\"}.\n\
\n\
@item\n\
Per the ellipses shown here and above, when @@@var{respFn} is given contained\n\
in a cell-array, any additionally contained values are appended to the\n\
@var{respFn} invocation argument-list.\n\
\n\
@end itemize\n\
\n\
@item w\n\
When used in conjunction with @var{a}, @var{w} is a vector of positive\n\
real-numbers giving error-weightings to be applied at each given band-edge\n\
[w(l1) w(r1) w(l2) w(r2) @dots{}], or for each band [w1 w2 @dots{}].  In the\n\
former case, in-band weighting is determined by linear interpolation between\n\
the given band-edge values.  A higher relative error weighting yields a lower\n\
relative error.\n\
\n\
When used in conjunction with @@@var{respFn}, @var{w} is a vector (constrained\n\
as above) that is passed through to @var{respFn}.\n\
\n\
@item class\n\
A string, which may be abbreviated, giving the filter-class:\n\
@itemize\n\
\n\
@item\n\
@qcode{\"symmetric\"} (the default) for type I or II filters,\n\
\n\
@item\n\
@qcode{\"antisymmetric\"} (or @qcode{\"hilbert\"}) for standard type III or IV\n\
filters,\n\
\n\
@item\n\
@qcode{\"differentiator\"} for type III or IV filters with inverted phase and\n\
with error-weighting (further to @var{w}) of 2/f applied in the pass-band(s).\n\
@end itemize\n\
\n\
@item accuracy, @dots{}\n\
Up to three properties contained within a cell-array: @var{accuracy},\n\
@var{persistence}, @var{robustness}, that respectively control how close the\n\
computed filter will be to the ideal minimax solution, the number of\n\
computation iterations over which the required accuracy will be sought, and the\n\
precision of certain internal processing.  Each can each be set to a small\n\
positive number (typically @leq{}3), to increase the relevant item; this may\n\
increase computation time, but the need to do so should be rare.  A value of 0\n\
can be used to leave an item unchanged.\n\
\n\
Alternatively, setting @var{accuracy} @geq{}16 emulates @sc{matlab}'s\n\
@var{lgrid} argument.\n\
\n\
@end table\n\
\n\
@heading Results\n\
\n\
If a problem occurs during the computation, a diagnostic message will normally\n\
be displayed.  If this happens, adjusting @var{accuracy}, @var{persistence}, or\n\
@var{robustness} may provide the solution.  Some filters however, may not be\n\
realizable due to machine-precision limitations.  If a filter can be computed,\n\
returned values are as follows:\n\
\n\
@table @var\n\
\n\
@item b\n\
A length @var{N}+1 row-vector containing the computed filter coefficients.\n\
\n\
@item minimax\n\
The absolute value of the minimized, maximum weighted error, or this number\n\
negated if the required accuracy could not be achieved.\n\
\n\
@item res\n\
A structure of data relating to the filter computation and a partial\n\
response-analysis of the resultant filter; fields are vectors:\n\
@quotation\n\
@multitable @columnfractions .125 .6\n\
@item @code{fgrid}\n\
@tab Analysis frequencies per @var{f}.\n\
@item @code{des}\n\
@tab Desired amplitude response.\n\
@item @code{wt}\n\
@tab Error weighting.\n\
@item @code{H}\n\
@tab Complex frequency response.\n\
@item @code{error}\n\
@tab Desired minus actual amplitude response.\n\
@item @code{iextr}\n\
@tab Indices of local peaks in @code{error}.\n\
@item @code{fextr}\n\
@tab Frequencies of local peaks in @code{error}.\n\
@end multitable\n\
@end quotation\n\
\n\
@end table\n\
\n\
Using @var{res} is not recommended because it can be slow to compute and, since\n\
the analysis excludes transition-bands, any `anomalies'@footnote{ Tapio\n\
Saram@\"aki, `Finite impulse response filter design', Chapter 4 in `Handbook for\n\
Digital Signal Processing', edited by S.  K. Mitra and J. F. Kaiser, John Wiley\n\
and Sons, New York, 1993, pp.@: 155--277.\n\
(@url{http://www.cs.tut.fi/~ts/Mitra_Kaiser.pdf})} therein are not easy to\n\
discern.  In general, @code{freqz} suffices to check that the response of the\n\
computed filter is satisfactory.\n\
\n\
@heading Examples\n\
@example\n\
@group\n\
# Low-pass with frequencies in Hz:\n\
Fs = 96000; Fn = Fs/2; # Sampling & Nyquist frequencies.\n\
b = firpm (50, [0 20000 28000 48000] / Fn, [1 0]);\n\
@end group\n\
@end example\n\
\n\
@example\n\
@group\n\
# Type IV high-pass:\n\
b = firpm (31, [0 0.5 0.7 1], [0 1], \"antisym\");\n\
@end group\n\
@end example\n\
\n\
@example\n\
@group\n\
# Inverse-sinc (arbitrary response):\n\
b = firpm (20, [0 0.5 0.9 1], @@(n,f,g) ...\n\
    deal ((g<=f(2))./sinc (g), (g>=f(3))*9+1));\n\
@end group\n\
@end example\n\
\n\
@example\n\
@group\n\
# Band-pass with filter-response check:\n\
freqz (firpm (40, [0 3 4 6 8 10]/10, [0 1 0]))\n\
@end group\n\
@end example\n\
\n\
Further examples can be found in the @code{firpm} and @code{firpmord}\n\
demonstration scripts.\n\
\n\
@heading Compatibility\n\
Given invalid filter specifications, Octave emits an error and does not produce\n\
a filter; @sc{matlab} in such circumstances may still produce filter\n\
coefficients.\n\
\n\
Unlike with @sc{matlab}, with Octave @var{minimax} can be negative; for\n\
compatibility, take the absolute value.\n\
\n\
@xseealso{firpmord}\n\
\n\
@end deftypefn\n\
")
{
  int i, arg (0), nargin((int)args.length ()), N;
  octave_value_list respFnArgs;

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
  respFnArgs (RESP_FN_ARG_N) = v;

  // F[]:
  ColumnVector freqs;
  if (!args(arg).is_string () && args(arg).is_real_matrix ())
    freqs = args(arg++).vector_value ();
  if (freqs.numel () < 2 || (freqs.numel () & 1))
    returnError ("firpm parameter F (band-edge frequencies) "
        "must be a real, even-lengthed vector");
  int numBands((int)freqs.numel () >> 1);
  OCTAVE_LOCAL_BUFFER (MmfirBandSpec, bands, numBands);
  for (i = 0; i < numBands; ++i)
    bands[i].freqL = freqs(2*i), bands[i].freqR = freqs(2*i+1);
  respFnArgs (RESP_FN_ARG_F) = freqs;
  respFnArgs (RESP_FN_ARG_G) = ColumnVector();            // Overwritten later.
  respFnArgs (RESP_FN_ARG_W) = ColumnVector(numBands, 1); // ditto

  // @RESP_FN or A[]:
  octave_fcn_handle * respFnHandle(0);
  if (args(arg).is_function_handle())
    respFnHandle = args(arg++).fcn_handle_value ();
  else if (octave::signal::iscell(args(arg)))
    {
      Cell c(args(arg).cell_value ());
      int k(0);
      if (c.numel () >= 1 && c(k).is_function_handle ())
        {
          respFnHandle = c(k++).fcn_handle_value ();
          for (; k<c.numel (); ++k) respFnArgs(RESP_FN_ARG_VAR+k-1)=c(k);
          ++arg;
        }
      else returnError ("firpm response function handle is missing");
    }
  else // A[]
    {
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
    }

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
      respFnArgs (RESP_FN_ARG_W) = weights;
    }
  else for (i = 0; i < numBands; ++i)
    bands[i].weightL = bands[i].weightR = 1;

  // CLASS[]:
  int Class(-1);
  if (arg < nargin && args(arg).is_string ())
  {
    char const * names[] =
      {
        "SYMMETRIC", "BANDPASS", // bandpass is historical
        "ANTISYMMETRIC", "HILBERT",
        "DIFFERENTIATOR"
      };
    std::string s(args(arg++).string_value ());
    std::transform(s.begin(), s.end(),s.begin(), ::toupper);
    for (++Class; Class < AL(names)
        && std::string(names[Class]).substr (0, s.size ()) != s; ++Class);
    if (!(Class < AL(names)))
      returnError ("firpm filter-class must be in "
          "{'%s', '%s' (or '%s'), '%s'}",
          names[0], names[2], names[3], names[4]);
    Class >>= 1; // Shift away alternative names.
  }
  if (Class<0 && respFnHandle &&
      !respFnHandle->function_value ()->is_anonymous_function ())
    {
      octave_value_list args;
      args(0) = respFnHandle->fcn_name ();
      args(1) = Cell(respFnArgs);
      octave_value_list result(octave::feval ("__firpm_probe__", args, 1));
      Class = std::min ((int)result(0).scalar_value (), 2); // For safety.
    }
  Class=std::max (Class, 0); // Default is 'symmetric'.

  // PROPERTIES:
  static char const * const propertyNames[] =
    { "ACCURACY", "PERSISTENCE", "ROBUSTNESS", "TARGET", "FLAGS" };
  double realProperties[] = { 0, 0, 0, 0, 0 };
  if (arg < nargin && octave::signal::iscell(args(arg)) )
    {
      Cell c(args(arg).cell_value ());
      if (c.numel ())
        {
          for (i=0; i<AL(realProperties) && i<c.numel (); ++i)
            {
              if (!c(i).is_real_scalar ())
                returnError ("firpm property %s must be a real scalar",
                    propertyNames[i]);
              double const d(c(i).double_value ());
              realProperties[i] = i || d<16? d : lgrid (d);
            }
          ++arg;
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

  // Attempt to generate the filter:
  OCTAVE_LOCAL_BUFFER (double, h, N+1);
  MmfirState state;
  MmfirReport report(mmfir (h, (MmfirFilterClass)Class, N+1, numBands, bands,
        realProperties[0], realProperties[1], realProperties[2],
        realProperties[3], octave::math::nint (realProperties[4]),
        nargout>2? &state : 0,
        respFnHandle? mmfirRespFn:0, respFnHandle, &respFnArgs));

  // Warn if any controls were clamped:
  for (i = 0; i < AL(report.controls); ++i)
    if (report.controls[i] != realProperties[i])
      warning ("firpm property %s was clamped to %g",
          propertyNames[i], report.controls[i]);

  // Check if a filter was generated:
  if (report.result >= MmfirInvocationError)
    returnError ("firpm invocation error: %s", report.text);
  else if (report.result >= MmfirError)
    returnError ("firpm failed to make a filter (result=%i)", report.result);

  // Missed-target is handled silently:
  if (report.result == MmfirMissedTarget)
    N = -1; // Return empty B.
  else // Check if a warning should be issued:
    if (report.result >= MmfirWarning)
      warning ("firpm %s (result=%i)", report.text, report.result);

  // Copy filter coefficients to an Octave row-vector:
  RowVector b(N+1);
  for (int i=N+1; i--;) b(i) = h[i];

  // Return [B, MINIMAX, RES]:
  octave_value_list ret;
  ret(0) = octave_value(b);

  if (nargout>1) // MINIMAX:
    ret(1) = octave_value(report.minimax * (report.result? -1 : +1));

  if (nargout>2) // RES:
    {
      int const S(state.spaceLength);
      int const P(state.peaksLength);
      ColumnVector fgrid(S), FP(S), des(S), wt(S), err(S);
      ColumnVector iextr(P), fextr(P);
      ComplexColumnVector H(S);
      double const mulA(Class==2? -1:1);
      double const mulW(Class==2? .5:1);
      for (int i=0; i<S; ++i)
        {
          fgrid(i)=(state.space)[i].f;
          FP   (i)=(state.space)[i].f*M_PI;
          des  (i)=(state.space)[i].a*mulA;
          wt   (i)=(state.space)[i].w*mulW;
        }
      octave_value_list args;
      octave_scalar one(1);
      args(0) = ret(0);
      args(1) = one.as_double ();
      args(2) = FP;
      octave_value_list result(octave::feval ("freqz", args, 1));
      H=result(0).complex_vector_value ();
      double const offset(Class? +M_PI/2 : 0);
      for (int i=0; i<S; ++i)
        {
          double const a(offset+N/2.*FP(i));
          double const ampResp(H(i).real ()*cos (a) - H(i).imag ()*sin (a));
          err(i) = (state.space)[i].a-ampResp; // Negated error.
        }
      for (int i=0, j=0; i<P; ++i)
        {
          double const f=(state.peaks)[i].f;
          while (fgrid(j)<f) ++j;
          int idx=j-(fgrid(j)!=f && fabs (err(j)) < fabs (err(j-1)));
          iextr(i)=idx+1;
          fextr(i)=fgrid(idx);
        }
      free(state.space);
      free(state.peaks);

      octave_map m;
      m.assign ("fgrid", Cell(1,1,fgrid));
      m.assign ("des"  , Cell(1,1,des  ));
      m.assign ("wt"   , Cell(1,1,wt   ));
      m.assign ("H"    , Cell(1,1,H    ));
      m.assign ("error", Cell(1,1,err  ));
      m.assign ("iextr", Cell(1,1,iextr));
      m.assign ("fextr", Cell(1,1,fextr));
      ret(2) = m;
    }
  return ret;
}



/*
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

%!error <firpm filter-class must be in {'SYMMETRIC', 'ANTISYMMETRIC' \(or 'HILBERT'\), 'DIFFERENTIATOR'}> firpm (1, [1 2], 1, [1 2], 'diffi');
%!error <firpm filter-class must be in {'SYMMETRIC', 'ANTISYMMETRIC' \(or 'HILBERT'\), 'DIFFERENTIATOR'}> firpm (1, [1 2], 1, [1 2], 'hilberts');

%!error <firpm property ACCURACY must be a real scalar> firpm (1, [1 2], 1, [1 2], {'antisymmetric'});
%!error <firpm property PERSISTENCE must be a real scalar> firpm (1, [1 2], 1, [1 2], {0, [1 1]});

%!error <firpm argument # 4 is invalid: \(0,1\)> firpm (1, [1 2], 1, i);
%!error <firpm argument # 4 is invalid: {}\(0x0\)> firpm (2, [0 1], [1 0], {}, 1);

%!warning <firpm property ROBUSTNESS was clamped to 0> firpm (1, [.1 .9], 1, [1 2], {0,0,-1});
%!error <firpm failed to make a filter \(result=[456]\)> firpm (2, [.1 .9], 1);

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
%! ]';
%! [b m] = firpm (20, [0 .2 .3 .4 .5 .7 .9 1], [0 .2 0 0 .5 .7 0 0], [1 4 16 64], 'b', {256});
%! assert (b0, b, 1e-5); assert (m, 0.21493, -5e-5);

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
%! ]';
%! [b m] = firpm (20, [0 .2 .3 .4 .5 .7 .9 1], [0 .2 0 0 .5 .7 0 0], [1 4 16 64], 'h', {256});
%! assert (b0, b, 1e-5); assert (m, 0.19499, -5e-5);

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
%! ]';
%! [b m] = firpm (20, [0 .2 .3 .4 .5 .7 .9 1], [0 .2 0 0 .5 .7 0 0], [1 4 16 64], 'd', {256});
%! assert (b0, b, 1e-5); assert (m, 0.49129, -5e-5);

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
%! ]';
%! [b m] = firpm (21, [0 .2 .3 .4 .5 .7 .9 1], [0 .2 0 0 .5 .7 0 0], [1 4 16 64], 'b', {256});
%! assert (b0, b, 1e-5); assert (m, 0.19215, -5e-5);

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
%! ]';
%! [b m] = firpm (21, [0 .2 .3 .4 .5 .7 .9 1], [0 .2 0 0 .5 .7 0 0], [1 4 16 64], 'h', {256});
%! assert (b0, b, 1e-5); assert (m, 0.20726, -5e-5);

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
%! ]';
%! [b m] = firpm (21, [0 .2 .3 .4 .5 .7 .9 1], [0 .2 0 0 .5 .7 0 0], [1 4 16 64], 'd', {256});
%! assert (b0, b, 1e-5); assert (m, 0.47868, -5e-5);



%!test b0=[
%!  -0.01402452049012097
%!   0.001876620211412957
%!   0.03037229727821556
%!  -0.01238680025691372
%!  -0.0170173995332925
%!  -0.001299983105532321
%!  -0.01887047540094186
%!   0.0478657090945251
%!   0.02646457824791903
%!  -0.05579347345500663
%!  -0.001118815789852797
%!  -0.05887946612620026
%!   0.03589780658038378
%!   0.229839817358415
%!  -0.1717538614573135
%!  -0.2842595261696291 ]';
%! [b m] = firpm (31 , [0 .3 .4 .7 .8 1], [0 1 0], [10 1 10], 'a', {1});
%! assert (b, [b0 fliplr(-b0)], 5e-9);
%! assert (m, 0.059734, -5e-5);

%!test b0 = [
%!  -8.876086291046802e-04
%!   2.355569104748801e-02
%!  -8.241671888096303e-04
%!  -4.470074798008300e-02
%!  -2.808154545387648e-03
%!   8.170132813894931e-02
%!  -1.058582827015804e-03
%!  -1.777420298924492e-01
%!  -2.265334116571183e-02
%!   5.239577857603830e-01
%!   8.489449590726375e-01
%!   5.239577857603830e-01
%!  -2.265334116571183e-02
%!  -1.777420298924492e-01
%!  -1.058582827015804e-03
%!   8.170132813894931e-02
%!  -2.808154545387648e-03
%!  -4.470074798008300e-02
%!  -8.241671888096303e-04
%!   2.355569104748801e-02
%!  -8.876086291046802e-04
%! ]';
%! [b m] = firpm (N=20, [0 .4 .6 1], {@(n,f,g,w,v1) deal ((log2 (v1/n+w(2)+g)).*(g<=f(2)), ones (size(g))),2*N});
%! assert (b0, b, 1e-5); assert (m, .0210628, -5e-5);



%!test [b m] = firpm (40, [0 .5 .6 1], [1 0]);
%! assert (m, 0.010304, -5e-5);

%!test [b m] = firpm (40, [0 .25 .3 .6 .65 1], [0 1 0]);
%! assert (m, 0.055834, -5e-5);

%!test [b m] = firpm (30, [0 .2 .4 .6 .8 1], [1 .5 0]);
%! assert (m, 5.6277e-04, -5e-5);

%!test
%! [b m] = firpm (40, [0 .2 .3 .4 .5 .6 .7 .8 .9 1], [1 0 1 0 1], [11 100 7 10 5]);
%! assert (m, 0.25723, -5e-5);

%!test [b m] = firpm (80, [0 .2 .3 1], [1 -1]);
%! assert (m, 6.6123e-04, -5e-5);

%!test [b m] = firpm (40, [0 2.5/pi], [0 2.5], [.5], 'differentiator');
%! assert (m, 2.5226e-06, -5e-5);

%!test [b m] = firpm (59, [0 .2 .3 1], [0 1 0 0], 'd');
%! assert (m, 0.0073785, -5e-5);

%!test [b m] = firpm (31, [0 .5 .7 1], [0 1], 'antisymmetric');
%! assert (m, 0.0015660, -5e-5);

%!test assert (firpm (31, [0 .5 .7 1], [0 1], 'antisymmetric'), firpm (31, [0 .5 .7 1], [0 1], 'hilbert'))

%!test [b m] = firpm (30, [.1 .9], 1, 'antisymmetric');
%! assert (m, 0.0027064, -5e-5);

%!test [b m] = firpm (1000, [0 .4 .41 1], [1 0]);
%! assert (m, 5.2892e-05, -5e-5);

%!test [b m] = firpm (120, [0 .5 .55 .75 .75 1], [1 0 0], [1 1 4 64 64 64]);
%! assert (m, 0.0048543, -5e-5);

%!test [b m] = firpm (11, [0 2*.45], .5, 'symmetric');
%! assert (m, 0.045066, -5e-5);

%!warning <firpm not-converged \(result=1\)> firpm (298, [0 .28 .33 .48 .53 1], [0 1 0], [93 68 89], {50,-1});

%!test [b m] = firpm (298, [0 .28 .33 .48 .53 1], [0 1 0], [93 68 89], {50});
%! assert (m, 6.86583e-05, -5e-5);

%!test assert (firpm (11, [0 2*.45], .5, 'symmetric'), firpm (11, [0 2*.45], .5, 'bandpass'))
%!test assert (firpm (11, [0 2*.45], .5, 'symmetric'), firpm (11, [0 2*.45], .5))

%!assert (firpm (20, [0 .3 .5 1], [1 1 0 0]), firpm (20, [0 .3 .5 1], [1 0]))



%!test assert (
%!  firpm (30, [0.1 0.9], 1, "antisymmetric"),
%!  firpm (30, [0.1 0.9], 1, "hilbert"))
%!test assert (
%!  firpm (11, [0 0.9], 1, {1}),
%!  firpm (11, [0 0.9], 1, {64}))



%!test
%! [b1 m1] = firpm (20, [0 0.4 0.5 1], [1 0], [1 1/8]);
%! [b2 m2] = firpm (20, [0 0.4 0.5 1], [1 0], [8   1]);
%! assert (b1, b2)
%! assert (m1 * 8, m2)



%!
%!demo
%!
%! N=38; F=[0 .47 .53 1]; A=[1 1 0 0]; W=[1 1]; ant=0;
%! [b m r] = firpm (N, F, A, W, 'sa'(1+ant));
%!
%! mul=[1 i](1+ant);
%! clf; [h f] = freqz (b); plot (f/pi, real (mul*h.*exp (i*f*N/2)),
%!     f=F(1:2),(a=A(1:2))-(M=m/W(1)),'r', f, a+M,'r',
%!     f=F(3:4),(a=A(3:4))-(M=m/W(2)),'r', f, a+M,'r',
%!     r.fextr, real ((mul*r.H.*exp (i*r.fgrid*pi*N/2))(r.iextr)),'ko')
%! grid on; axis ([0 1 -.1 1.1]); set (gca, 'xtick', [0:.1:1], 'ytick', [0:.1:1])
%! title (sprintf ('firpm type-I low-pass filter (order=%i)', length (b) - 1));
%! ylabel ('Amplitude response'); xlabel ('Frequency (normalized)')
%! axes ('position', [.58 .35 .3 .5])
%! stem (b); grid off
%! title ('Impulse response')
%! axis ([1 length(b) -.15 .55])
%! %--------------------------------------------------
%! % Figure shows transfer and impulse-response of
%! % half-band filter design.
%!
%!demo
%!
%! N=41; F=[0 .1 .16 .34 .4 1]; A=[0 0 1 1 0 0]; W=[1 3 2]; ant=1;
%! [b m r] = firpm (N, F, A, W, 'sa'(1+ant));
%!
%! mul=[1 i](1+ant);
%! clf; [h f] = freqz (b); plot (f/pi, real (mul*h.*exp (i*f*N/2)),
%!     f=F(1:2),(a=A(1:2))-(M=m/W(1)),'r', f, a+M,'r',
%!     f=F(3:4),(a=A(3:4))-(M=m/W(2)),'r', f, a+M,'r',
%!     f=F(5:6),(a=A(5:6))-(M=m/W(3)),'r', f, a+M,'r',
%!     r.fextr, real ((mul*r.H.*exp (i*r.fgrid*pi*N/2))(r.iextr)),'ko')
%! grid on; axis ([0 1 -.1 1.1]); set (gca, 'xtick', [0:.1:1], 'ytick', [0:.1:1])
%! title (sprintf ('firpm type-IV weighted band-pass filter (order=%i)', length (b) - 1));
%! ylabel ('Amplitude response'); xlabel ('Frequency (normalized)')
%! axes ('position', [.55 .4 .3 .4])
%! stem (b); grid off
%! title ('Impulse response')
%! axis ([1 length(b) -.3 .3])
%! %--------------------------------------------------
%! % Figure shows transfer and impulse-response of
%! % band-pass filter design.
%!
%!demo
%!
%! curve = @(a,b,y,z,x) z*(b-a)./((x-a)*z/y+b-x);
%! respFn = @(n,f,g,w,curve) deal (g>=f(3) & g<=f(4), ...
%!   (g<=f(2)).*curve (f(2),f(1),w(1),w(3),g) + ...
%!   (g>=f(3) & g<=f(4))*w(2) + ...
%!   (g>=f(5) & g<=f(6)).*curve (f(5),f(6),w(1),w(3),g) + ...
%!   (g>f(7))*w(4)); % NB contiguous bands so > not >=.
%! b=firpm (127, [0 .2 .24 .26 .3 .5 .5 1], {respFn, curve}, [10 1 100 10]);
%!
%! clf; [h f]=freqz (b); plot (f/pi, 20*log10 (abs (h)))
%! grid on; axis ([0 1 -90 5]); set (gca, 'xtick', [0:.1:1], 'ytick', [-80:10:0])
%! title (sprintf ('firpm type-II band-pass filter with shaped stop-bands (order=%i)', length (b) - 1));
%! ylabel ('Magnitude response (dB)'); xlabel ('Frequency (normalized)')
%! %--------------------------------------------------
%! % Figure shows transfer of band-pass filter design
%! % with shaped error-weight in the stop-bands.
%!
%!demo
%!
%! b = firpm (40, [0 .1 .3 1], [-1 1]);
%!
%! clf; [h f] = freqz (b,1,2^14); plot (f/pi, 20*log10 (abs (h)))
%! grid on; axis ([0 1 -60 5]); set (gca, 'xtick', [0:.1:1])
%! title (sprintf ('firpm type-I notch filter (order=%i)', length (b) - 1));
%! ylabel ('Magnitude response (dB)'); xlabel ('Frequency (normalized)')
%! axes ('position', [.42 .55 .45 .2])
%! plot (f/pi, 20*log10 (abs (h))); grid on
%! axis ([0 1 -(e=1e-2) e])
%! title ('Pass-bands detail')
%! axes ('position', [.42 .2 .45 .2])
%! stem (b); grid off
%! title ('Impulse response')
%! axis ([1 length(b) -.45 .65])
%! %--------------------------------------------------
%! % Figure shows transfer and impulse-response of
%! % notch filter design.
%!
%!demo
%!
%! b = firpm (1000, [0 .4 .41 1], [1 0], {1});
%!
%! clf; [h f] = freqz (b, 1, 2^17); plot (f/pi, 20*log10 (abs (h)))
%! title (sprintf ('firpm type-I brick-wall low-pass filter (order=%i)', length (b) - 1));
%! ylabel ('Magnitude response (dB)'); xlabel ('Frequency (normalized)')
%! grid on; axis ([0 1 -100 5]); set (gca, 'xtick', [0:.1:1])
%! axes ('position', [.55 .6 .3 .2])
%! plot (f/pi, 20*log10 (abs (h))); grid on
%! title ('Details')
%! axis ([.38 .401 -(e=1e-3) e])
%! axes ('position', [.55 .3 .3 .2])
%! plot (f/pi, 20*log10 (abs (h))); grid on
%! axis ([.409 .43 -86 -85])
%! axes ('position', [.2 .35 .2 .3])
%! semilogy (abs (b)); grid off
%! title ('Impulse response magnitude')
%! axis ([0 length(b)+1 1e-6 1])
%! %--------------------------------------------------
%! % Figure shows transfer and impulse-response of
%! % brick-wall low-pass filter design.
%!
%!demo
%!
%! b = firpm (20, [0 2.5]/pi, [0 2.5], 'differentiator');
%!
%! clf
%! [h f] = freqz (b,1,2^12);
%! subplot (2, 1, 1)
%! plot (f, abs (h)); grid on
%! title (sprintf ('firpm type-III differentiator filter (order=%i)', length (b) - 1));
%! ylabel ('Magnitude response'); xlabel ('Frequency (radians/sample)')
%! axis ([0 pi 0 pi])
%! subplot (2, 1, 2)
%! plot (f, abs (abs (h)./f-1)); grid on
%! axis ([0 2.5 0 1e-3])
%! title ('Pass-band error (inverse-f weighted)')
%! %--------------------------------------------------
%! % Figure shows transfer of differentiator filter design.
%! % above: full-band
%! % below: detail of pass-band error (inverse-f weighted)
%!
%!demo
%!
%! b = firpm (30, [.05 .95], 1, 'antisymmetric');
%!
%! clf; [h f] = freqz (b); plot (f/pi, abs (h))
%! grid on; axis ([0 1 0 1.1]); set (gca, 'xtick', [0:.1:1], 'ytick', [0:.1:1])
%! title (sprintf ('firpm type-III hilbert transformer filter (order=%i)', length (b) - 1));
%! ylabel ('Magnitude response'); xlabel ('Frequency (normalized)')
%! axes ('position', [.3 .25 .45 .4])
%! stem (b); grid off
%! title ('Impulse response')
%! axis ([1 length(b) -.7 .7])
%! %--------------------------------------------------
%! % Figure shows transfer and impulse-response of
%! % hilbert filter design.
%!
%!demo
%! cic = @(f) (sin (pi*(f+eps*!f)/2)./sin (pi*(f+eps*!f)/2/10)/10).^4;
%!
%! if compare_versions(OCTAVE_VERSION, '6', '<')
%!   eval('b = firpm (30, [0 .5 .7 1], @(n,f,g, w) deal (a=(g<=f(2))./cic (g), 1./(a+!a)));')
%! else
%!   function [ag wg] = resp (n,f,g,w) ag = (g<=f(2))./cic (g); wg = 1./(ag+!ag); endfunction
%!   b = firpm (30, [0 .5 .7 1], @resp);
%! endif
%!
%! clf; [h f]=freqz (b); plot (f/=pi, 20*log10 (abs (h)))
%! grid on; axis ([0 1 -60 6]); set (gca, 'xtick', [0:.1:1])
%! title (sprintf ('firpm type-I CIC-compensation filter (order=%i)', length (b) - 1));
%! ylabel ('Magnitude response (dB)'); xlabel ('Frequency (normalized)')
%! axes ('position', [2 3 4 3]/10)
%! plot (f, 20*log10 (abs (h).*cic (f))); axis ([0 .55 -.04 .04]); grid on
%! title ('Compensated filter response')
%! %--------------------------------------------------
%! % Figure shows transfer details of CIC-compensation
%! % filter design.
%!
%!demo
%! clf; n=30; Fp=.8; for d=linspace (-.5, .5, 10)
%!
%! b = firpm (n, [0 Fp], {@(n,f,g,w,d,Fp) (g<=Fp).*cos (g*pi*d),d,Fp})...
%!   + firpm (n, [0 Fp], {@(n,f,g,w,d,Fp) (g<=Fp).*sin (g*pi*d),d,Fp}, 'a');
%!
%! [g f]=grpdelay (b);
%! set (gca,'ColorOrderIndex',1); plot (f/pi, g-n/2); hold ('on'); end;
%! hold ('off'); grid on; axis ([0 1 -.6 .6]); set (gca, 'xtick', [0 Fp 1], 'ytick', [-.5:.5:.5])
%! title (sprintf ('firpm type-I fractional-delay filters (order=%i)', length (b) - 1));
%! ylabel ('Fractional-delay (samples)'); xlabel ('Frequency (normalized)')
%! %--------------------------------------------------
%! % Figure shows delay response of (non-linear-phase)
%! % filter designs with progressive fractional-delay.

*/
