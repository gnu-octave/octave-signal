---
layout: "default"
permalink: "/functions/4_idct/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - idct"
category: "Transforms"
func_name: "idct"
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
<dt class="deftypefn" id="index-idct"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">idct</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code><a class="copiable-link" href="#index-idct"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-idct-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">idct</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-idct-1"></a></span></dt>
<dd><p>Compute the inverse discrete cosine transform of <var class="var">x</var>.  If <var class="var">n</var> is
 given, then <var class="var">x</var> is padded or trimmed to length <var class="var">n</var> before computing
 the transform.  If <var class="var">x</var> is a matrix, compute the transform along the
 columns of the the matrix.  The transform is faster if <var class="var">x</var> is
 real-valued and even length.
</p>
<p>The inverse discrete cosine transform <var class="var">x</var> can be defined as follows:
</p>
<div class="example">
<pre class="example-preformatted">          N-1
   x[n] = sum w(k) X[k] cos (pi (2n+1) k / 2N ),  n = 0, ..., N-1
          k=0
 </pre></div>

<p>with w(0) = sqrt(1/N) and w(k) = sqrt(2/N), k = 1, ..., N-1
</p>

<p><strong class="strong">See also:</strong> dct, dct2, idct2, dctmtx.
 </p></dd></dl>