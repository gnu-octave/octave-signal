---
layout: "default"
permalink: "/functions/9_primitive/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - primitive"
category: "Utility"
func_name: "primitive"
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
<dt class="deftypefn" id="index-primitive"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">F</var> =</code> <strong class="def-name">primitive</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">t</var>, <var class="var">F0</var>)</code><a class="copiable-link" href="#index-primitive"></a></span></dt>
<dd><p>Calculate the primitive of a function.
</p>
<p>The function approximates the primitive (indefinite integral) of the
 univariate function handle <var class="var">f</var> with constant of integration <var class="var">F0</var>.
 The output is the primitive evaluated at the points <var class="var">t</var>.  The vector
 <var class="var">t</var> must be ordered and ascending.
</p>
<p>This function is a fancy way of calculating the cumulative sum,
</p>
<p><code class="command">F = cumsum (f(t).*diff (t)([1 1:end]))</code>.
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> f = @(t) sin (2 * pi * 3 * t);
 t = [0; sort(rand (100, 1))];
 F = primitive (f, t, 0);
 t_true = linspace (0, 1, 1e3).';
 F_true = (1 - cos (2 * pi * 3 * t_true)) / (2 * pi * 3);
 plot (t, F, 'o', t_true, F_true);
 </pre></div><pre class="example-preformatted"> </pre></div>


<p><strong class="strong">See also:</strong> quadgk, cumsum.
 </p></dd></dl>