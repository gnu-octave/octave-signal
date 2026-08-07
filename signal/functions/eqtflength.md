---
layout: "default"
permalink: "/functions/10_eqtflength/"
pkg_name: "signal"
pkg_version: "1.4.8"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - eqtflength"
category: "Utility"
func_name: "eqtflength"
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
- id: "8_Plotting"
  name: "&nbsp;&nbsp;Plotting"
  url: "/functions/#8_Plotting"
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
{% raw %}<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-eqtflength"><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">eqtflength</strong> <code class="def-code-arguments">(<var class="var">num</var>, <var class="var">den</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-eqtflength-1"><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>, <var class="var">n</var>, <var class="var">m</var>] =</code> <strong class="def-name">eqtflength</strong> <code class="def-code-arguments">(<var class="var">num</var>, <var class="var">den</var>)</code></span></dt>
<dd><p>Equalize numerator and denominator polynomial lengths.
</p>
<p>Pads the shorter polynomial with trailing zeros so that the returned
 numerator <var class="var">b</var> and denominator <var class="var">a</var> have equal length while
 representing the same discrete-time transfer function.
</p>
<p>Outputs <var class="var">n</var> and <var class="var">m</var> are the numerator and
 denominator orders, respectively, excluding trailing zeros.
</p>
<p>Example:
</p>
<div class="example">
<pre class="example-preformatted"> [b, a] = eqtflength ([1 2], [1 0.5 0.25])
      b = [1 2 0]
      a = [1 0.5 0.25]
 </pre></div>


<p><strong class="strong">See also:</strong> tf2ss, tf2zp.
 </p></dd></dl>{% endraw %}