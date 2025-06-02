---
layout: "default"
permalink: "/functions/8_sawtooth/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - sawtooth"
category: "Signals"
func_name: "sawtooth"
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
<dt class="deftypefn" id="index-sawtooth"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sawtooth</strong> <code class="def-code-arguments">(<var class="var">t</var>)</code><a class="copiable-link" href="#index-sawtooth"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-sawtooth-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sawtooth</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">width</var>)</code><a class="copiable-link" href="#index-sawtooth-1"></a></span></dt>
<dd><p>Generates a sawtooth wave of period <code class="code">2 * pi</code> with limits <code class="code">+1/-1</code>
  for the elements of <var class="var">t</var>.
</p>
<p><var class="var">width</var> is a real number between <code class="code">0</code> and <code class="code">1</code> which specifies
 the point between <code class="code">0</code> and <code class="code">2 * pi</code> where the maximum is. The
 function increases linearly from <code class="code">-1</code> to <code class="code">1</code> in  <code class="code">[0, 2 *
 pi * <var class="var">width</var>]</code> interval, and decreases linearly from <code class="code">1</code> to
 <code class="code">-1</code> in the interval <code class="code">[2 * pi * <var class="var">width</var>, 2 * pi]</code>.
</p>
<p>If <var class="var">width</var> is 0.5, the function generates a standard triangular wave.
</p>
<p>If <var class="var">width</var> is not specified, it takes a value of 1, which is a standard
 sawtooth function.
 </p></dd></dl>