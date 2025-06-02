---
layout: "default"
permalink: "/functions/7_cheb1ap/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - cheb1ap"
category: "IIR Filter Design"
func_name: "cheb1ap"
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
<dt class="deftypefn" id="index-cheb1ap"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">cheb1ap</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">Rp</var>)</code><a class="copiable-link" href="#index-cheb1ap"></a></span></dt>
<dd><p>Design lowpass analog Chebyshev type I filter.
</p>
<p>This function exists for <small class="sc">MATLAB</small> compatibility only, and is equivalent
 to <code class="code">cheby1 (<var class="var">n</var>, <var class="var">Rp</var>, 1, &quot;s&quot;)</code>.
</p>
<p>Input:
 </p><ul class="itemize mark-bullet">
<li><var class="var">N</var> Order of the filter must be a positive integer
 </li><li><var class="var">RP</var> Ripple in the passband in dB
 </li></ul>

<p>Output:
 </p><ul class="itemize mark-bullet">
<li><var class="var">z</var> The zero vector
 </li><li><var class="var">p</var> The pole vectorAngle
 </li><li><var class="var">g</var> The gain factor
 </li></ul>
 
<p>Example
 </p><div class="example">
<pre class="example-preformatted"> [z, p, g] = cheb1ap (2, 1)
 z = [](0x1)
 p =

  -0.54887 - 0.89513i
  -0.54887 + 0.89513i

 g =  0.98261
 </pre></div>

<p><strong class="strong">See also:</strong> buttap, cheby1, cheb2ap, ellipap.
 </p></dd></dl>