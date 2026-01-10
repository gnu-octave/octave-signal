---
layout: "default"
permalink: "/functions/10_ismaxphase/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - ismaxphase"
category: "Utility"
func_name: "ismaxphase"
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
<dt class="deftypefn def-line" id="index-ismaxphase"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">ismaxphase</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-ismaxphase"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ismaxphase-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">ismaxphase</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code><a class="copiable-link" href="#index-ismaxphase-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ismaxphase-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">ismaxphase</strong> <code class="def-code-arguments">(&hellip;, <var class="var">tol</var>)</code><a class="copiable-link" href="#index-ismaxphase-2"></a></span></dt>
<dd>
<p>Determine whether a digital filter is maximum phase (maximum energy-delay).
 The filter might be defined by the numerator coefficients, <var class="var">b</var>, and the
 denominator coefficients, <var class="var">a</var>, or, alternatively, by a matrix of
 second-order sections, <var class="var">sos</var>. A tolerance <var class="var">tol</var> might be given to
 define when two numbers are close enough to be considered equal.
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> b = [1 2 4 4 2 1];
 zplane (b);
 ismaxphase (b)
 </pre></div>

<p>Ref [1] Oppenheim, Alan, and Ronald Schafer. Discrete-Time Signal Processing.
 3rd edition, Pearson, 2009.
 </p></dd></dl>