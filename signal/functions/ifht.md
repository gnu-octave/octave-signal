---
layout: "default"
permalink: "/functions/4_ifht/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - ifht"
category: "Transforms"
func_name: "ifht"
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
<dt class="deftypefn" id="index-ifht"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">m</var> =</code> <strong class="def-name">ifht</strong> <code class="def-code-arguments">(<var class="var">d</var>, <var class="var">n</var>, <var class="var">dim</var>)</code><a class="copiable-link" href="#index-ifht"></a></span></dt>
<dd><p>Calculate the inverse Fast Hartley Transform of real input <var class="var">d</var>.  If
 <var class="var">d</var> is a matrix, the inverse Hartley transform is calculated along the
 columns by default.  The options <var class="var">n</var> and <var class="var">dim</var> are similar to the
 options of FFT function.
</p>
<p>The forward and inverse Hartley transforms are the same (except for a
 scale factor of 1/N for the inverse hartley transform), but
 implemented using different functions.
</p>
<p>The definition of the forward hartley transform for vector d,
 <em class="math"> m[K] = 1/N \sum_{i=0}^{N-1} d[i]*(cos[K*2*pi*i/N] + sin[K*2*pi*i/N]), for  0 &lt;= K &lt; N.
 m[K] = 1/N \sum_{i=0}^{N-1} d[i]*CAS[K*i], for  0 &lt;= K &lt; N. </em>
</p>
<div class="example">
<pre class="example-preformatted"> ifht(1:4)
 </pre></div>

<p><strong class="strong">See also:</strong> fht, fft.
 </p></dd></dl>