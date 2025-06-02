---
layout: "default"
permalink: "/functions/6_filtic/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - filtic"
category: "Filtering"
func_name: "filtic"
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
<dt class="deftypefn" id="index-filtic"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">zf</var> =</code> <strong class="def-name">filtic</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">y</var>)</code><a class="copiable-link" href="#index-filtic"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-filtic-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">zf</var> =</code> <strong class="def-name">filtic</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">y</var>, <var class="var">x</var>)</code><a class="copiable-link" href="#index-filtic-1"></a></span></dt>
<dd>
<p>Set initial condition vector for filter function
 The vector zf has the same values that would be obtained
 from function filter given past inputs x and outputs y
</p>
<p>The vectors x and y contain the most recent inputs and outputs
 respectively, with the newest values first:
</p>
<p>x = [x(-1) x(-2) ... x(-nb)], nb = length(b)-1
 y = [y(-1) y(-2) ... y(-na)], na = length(a)-a
</p>
<p>If length(x)&lt;nb then it is zero padded
 If length(y)&lt;na then it is zero padded
</p>
<p>zf = filtic(b, a, y)
    Initial conditions for filter with coefficients a and b
    and output vector y, assuming input vector x is zero
</p>
<p>zf = filtic(b, a, y, x)
    Initial conditions for filter with coefficients a and b
    input vector x and output vector y
 </p></dd></dl>