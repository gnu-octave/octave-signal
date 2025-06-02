---
layout: "default"
permalink: "/functions/10_isminphase/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - isminphase"
category: "Filter Analysis"
func_name: "isminphase"
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
<dt class="deftypefn" id="index-isminphase"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">isminphase</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-isminphase"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-isminphase-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">isminphase</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code><a class="copiable-link" href="#index-isminphase-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-isminphase-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">isminphase</strong> <code class="def-code-arguments">(&hellip;, <var class="var">tol</var>)</code><a class="copiable-link" href="#index-isminphase-2"></a></span></dt>
<dd>
<p>Determine whether a digital filter is minimum phase. The filter might be defined
 by the numerator coefficients, <var class="var">b</var>, and the denominator coefficients,
 <var class="var">a</var>, or, alternatively, by a matrix of second-order sections, <var class="var">sos</var>.
 A toleranve <var class="var">tol</var> might be given to define when two numbers are close enough
 to be considered equal.
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> a = [1 0.5]; b = [3 1];
 isminphase (b, a)
 </pre></div>

<p>Ref [1] Oppenheim, Alan, and Ronald Schafer. Discrete-Time Signal Processing.
 3rd edition, Pearson, 2009.
 </p></dd></dl>