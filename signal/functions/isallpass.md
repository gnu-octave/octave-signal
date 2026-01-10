---
layout: "default"
permalink: "/functions/9_isallpass/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - isallpass"
category: "Utility"
func_name: "isallpass"
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
<dt class="deftypefn def-line" id="index-isallpass"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">isallpass</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-isallpass"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-isallpass-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">isallpass</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code><a class="copiable-link" href="#index-isallpass-1"></a></span></dt>
<dd>
<p>Determine whether a digital filter is allpass. The filter might be defined
 by the numerator coefficients, <var class="var">b</var>, and the denominator coefficients,
 <var class="var">a</var>, or, alternatively, by a matrix of second-order sections, <var class="var">sos</var>.
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> a = [1 2 3];
 b = [3 2 1];
 isallpass (b, a)
 </pre></div>

<p>Ref [1] Shyu, Jong-Jy, &amp; Pei, Soo-Chang,
 A new approach to the design of complex all-pass IIR digital filters,
 Signal Processing, 40(2–3), 207–215, 1994.
 https://doi.org/10.1016/0165-1684(94)90068-x
</p>
<p>Ref [2] Vaidyanathan, P. P. Multirate Systems and Filter Banks.
 1st edition, Pearson College Div, 1992.
 </p></dd></dl>