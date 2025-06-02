---
layout: "default"
permalink: "/functions/8_cplxreal/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - cplxreal"
category: "Transforms"
func_name: "cplxreal"
navigation:
- id: "overview"
  name: "Overview"
  url: "/index"
- id: "Functions"
  name: "Function Reference"
  url: "/functions"
- id: "7_Signals"
  name: "&nbsp;&nbsp;Signals"
  url: "/functions/#7_Signals"
- id: "18_SignalMeasurement"
  name: "&nbsp;&nbsp;Signal Measurement"
  url: "/functions/#18_SignalMeasurement"
- id: "27_CorrelationandConvolution"
  name: "&nbsp;&nbsp;Correlation and Convolution"
  url: "/functions/#27_CorrelationandConvolution"
- id: "9_Filtering"
  name: "&nbsp;&nbsp;Filtering"
  url: "/functions/#9_Filtering"
- id: "15_FilterAnalysis"
  name: "&nbsp;&nbsp;Filter Analysis"
  url: "/functions/#15_FilterAnalysis"
- id: "17_FilterConversion"
  name: "&nbsp;&nbsp;Filter Conversion"
  url: "/functions/#17_FilterConversion"
- id: "17_IIRFilterDesign"
  name: "&nbsp;&nbsp;IIR Filter Design"
  url: "/functions/#17_IIRFilterDesign"
- id: "17_FIRFilterDesign"
  name: "&nbsp;&nbsp;FIR Filter Design"
  url: "/functions/#17_FIRFilterDesign"
- id: "10_Transforms"
  name: "&nbsp;&nbsp;Transforms"
  url: "/functions/#10_Transforms"
- id: "23_PowerSpectrumAnalysis"
  name: "&nbsp;&nbsp;Power Spectrum Analysis"
  url: "/functions/#23_PowerSpectrumAnalysis"
- id: "16_WindowFunctions"
  name: "&nbsp;&nbsp;Window Functions"
  url: "/functions/#16_WindowFunctions"
- id: "21_SystemIdentification"
  name: "&nbsp;&nbsp;System Identification"
  url: "/functions/#21_SystemIdentification"
- id: "18_SampleRateChange"
  name: "&nbsp;&nbsp;Sample Rate Change"
  url: "/functions/#18_SampleRateChange"
- id: "13_PulseMetrics"
  name: "&nbsp;&nbsp;Pulse Metrics"
  url: "/functions/#13_PulseMetrics"
- id: "7_Utility"
  name: "&nbsp;&nbsp;Utility"
  url: "/functions/#7_Utility"
- id: "news"
  name: "News"
  url: "/news"
---
<dl class="first-deftypefn">
<dt class="deftypefn" id="index-cplxreal"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">zc</var>, <var class="var">zr</var>] =</code> <strong class="def-name">cplxreal</strong> <code class="def-code-arguments">(<var class="var">z</var>)</code><a class="copiable-link" href="#index-cplxreal"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-cplxreal-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">zc</var>, <var class="var">zr</var>] =</code> <strong class="def-name">cplxreal</strong> <code class="def-code-arguments">(<var class="var">z</var>, <var class="var">tol</var>)</code><a class="copiable-link" href="#index-cplxreal-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-cplxreal-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">zc</var>, <var class="var">zr</var>] =</code> <strong class="def-name">cplxreal</strong> <code class="def-code-arguments">(<var class="var">z</var>, <var class="var">tol</var>, <var class="var">dim</var>)</code><a class="copiable-link" href="#index-cplxreal-2"></a></span></dt>
<dd><p>Sort the numbers <var class="var">z</var> into complex-conjugate-valued and real-valued
 elements.  The positive imaginary complex numbers of each complex conjugate
 pair are returned in <var class="var">zc</var> and the real numbers are returned in <var class="var">zr</var>.
</p>
<p><var class="var">tol</var> is a weighting factor in the range [0, 1) which determines the
 tolerance of the matching.  The default value is <code class="code">100 * eps</code> and the
 resulting tolerance for a given complex pair is
 <code class="code"><var class="var">tol</var> * abs (<var class="var">z</var>(i)))</code>.
</p>
<p>By default the complex pairs are sorted along the first non-singleton
 dimension of <var class="var">z</var>.  If <var class="var">dim</var> is specified, then the complex pairs are
 sorted along this dimension.
</p>
<p>Signal an error if some complex numbers could not be paired.  Signal an
 error if all complex numbers are not exact conjugates (to within <var class="var">tol</var>).
 Note that there is no defined order for pairs with identical real parts but
 differing imaginary parts.
 </p>
<p><strong class="strong">See also:</strong> cplxpair.
 </p></dd></dl>