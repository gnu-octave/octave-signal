---
layout: "default"
permalink: "/functions/7_hilbert/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - hilbert"
category: "Transforms"
func_name: "hilbert"
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
<dt class="deftypefn" id="index-hilbert"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">h</var> =</code> <strong class="def-name">hilbert</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">N</var>, <var class="var">dim</var>)</code><a class="copiable-link" href="#index-hilbert"></a></span></dt>
<dd><p>Analytic extension of real valued signal.
</p>
<p><code class="code"><var class="var">h</var> = hilbert (<var class="var">f</var>)</code> computes the extension of the real
 valued signal <var class="var">f</var> to an analytic signal. If <var class="var">f</var> is a matrix,
 the transformation is applied to each column. For N-D arrays,
 the transformation is applied to the first non-singleton dimension.
</p>
<p><code class="code">real (<var class="var">h</var>)</code> contains the original signal <var class="var">f</var>.
 <code class="code">imag (<var class="var">h</var>)</code> contains the Hilbert transform of <var class="var">f</var>.
</p>
<p><code class="code">hilbert (<var class="var">f</var>, <var class="var">N</var>)</code> does the same using a length <var class="var">N</var>
 Hilbert transform. The result will also have length <var class="var">N</var>.
</p>
<p><code class="code">hilbert (<var class="var">f</var>, [], <var class="var">dim</var>)</code> or
 <code class="code">hilbert (<var class="var">f</var>, <var class="var">N</var>, <var class="var">dim</var>)</code> does the same along
 dimension <var class="var">dim</var>.
 </p></dd></dl>