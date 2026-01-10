---
layout: "default"
permalink: "/functions/7_convmtx/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - convmtx"
category: "Utility"
func_name: "convmtx"
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
  subitems:
- id: "18_SignalMeasurement"
  name: "&nbsp;&nbsp;Signal Measurement"
  url: "/functions/#18_SignalMeasurement"
  subitems:
- id: "27_CorrelationandConvolution"
  name: "&nbsp;&nbsp;Correlation and Convolution"
  url: "/functions/#27_CorrelationandConvolution"
  subitems:
- id: "9_Filtering"
  name: "&nbsp;&nbsp;Filtering"
  url: "/functions/#9_Filtering"
  subitems:
- id: "15_FilterAnalysis"
  name: "&nbsp;&nbsp;Filter Analysis"
  url: "/functions/#15_FilterAnalysis"
  subitems:
- id: "17_FilterConversion"
  name: "&nbsp;&nbsp;Filter Conversion"
  url: "/functions/#17_FilterConversion"
  subitems:
- id: "17_IIRFilterDesign"
  name: "&nbsp;&nbsp;IIR Filter Design"
  url: "/functions/#17_IIRFilterDesign"
  subitems:
- id: "17_FIRFilterDesign"
  name: "&nbsp;&nbsp;FIR Filter Design"
  url: "/functions/#17_FIRFilterDesign"
  subitems:
- id: "10_Transforms"
  name: "&nbsp;&nbsp;Transforms"
  url: "/functions/#10_Transforms"
  subitems:
- id: "23_PowerSpectrumAnalysis"
  name: "&nbsp;&nbsp;Power Spectrum Analysis"
  url: "/functions/#23_PowerSpectrumAnalysis"
  subitems:
- id: "16_WindowFunctions"
  name: "&nbsp;&nbsp;Window Functions"
  url: "/functions/#16_WindowFunctions"
  subitems:
- id: "21_SystemIdentification"
  name: "&nbsp;&nbsp;System Identification"
  url: "/functions/#21_SystemIdentification"
  subitems:
- id: "18_SampleRateChange"
  name: "&nbsp;&nbsp;Sample Rate Change"
  url: "/functions/#18_SampleRateChange"
  subitems:
- id: "13_PulseMetrics"
  name: "&nbsp;&nbsp;Pulse Metrics"
  url: "/functions/#13_PulseMetrics"
  subitems:
- id: "7_Utility"
  name: "&nbsp;&nbsp;Utility"
  url: "/functions/#7_Utility"
  subitems:
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-convmtx"><span class="category-def">Function File: </span><span><strong class="def-name">convmtx</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-convmtx"></a></span></dt>
<dd><p>If <var class="var">a</var> is a column vector and <var class="var">x</var> is a column vector
 of length <var class="var">n</var>, then
</p>
<p><code class="code">convmtx(<var class="var">a</var>, <var class="var">n</var>) * <var class="var">x</var></code>
</p>
<p>gives the convolution of of <var class="var">a</var> and <var class="var">x</var> and is the
 same as <code class="code">conv(<var class="var">a</var>, <var class="var">x</var>)</code>. The difference is if
 many vectors are to be convolved with the same vector, then
 this technique is possibly faster.
</p>
<p>Similarly, if <var class="var">a</var> is a row vector and <var class="var">x</var> is a row
 vector of length <var class="var">n</var>, then
</p>
<p><code class="code"><var class="var">x</var> * convmtx(<var class="var">a</var>, <var class="var">n</var>)</code>
</p>
<p>is the same as <code class="code">conv(<var class="var">x</var>, <var class="var">a</var>)</code>.
 </p></dd></dl>

<p><strong class="strong">See also:</strong> conv.
</p>