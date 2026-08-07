---
layout: "default"
permalink: "/functions/2_db/"
pkg_name: "signal"
pkg_version: "1.4.8"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - db"
category: "Utility"
func_name: "db"
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
<dt class="deftypefn def-line" id="index-db"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">dbout</var> =</code> <strong class="def-name">db</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-db-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">dbout</var> =</code> <strong class="def-name">db</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">signaltype</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-db-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">dbout</var> =</code> <strong class="def-name">db</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">R</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-db-3"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">dbout</var> =</code> <strong class="def-name">db</strong> <code class="def-code-arguments">(<var class="var">x</var>, &quot;voltage&quot;, <var class="var">R</var>)</code></span></dt>
<dd>
<p>Convert signal values to decibels (dB).
</p>
<p>If <var class="var">x</var> represents voltage (default):
 </p><div class="display">
<pre class="display-preformatted"> dbout = 10 * log10 (abs(<var class="var">x</var>).^2 / <var class="var">R</var>)
 </pre></div>
<p>where <var class="var">R</var> is the resistance in ohms (default = 1).
</p>
<p>If <var class="var">x</var> represents power:
 </p><div class="display">
<pre class="display-preformatted"> dbout = 10 * log10 (<var class="var">x</var>)
 </pre></div>

<p>Usage forms:
</p>
<dl class="table">
<dt><code class="code">db(<var class="var">x</var>)</code></dt>
<dd><p>Voltage conversion with <var class="var">R</var> = 1.
</p>
</dd>
<dt><code class="code">db(<var class="var">x</var>, <var class="var">signaltype</var>)</code></dt>
<dd><p><var class="var">signaltype</var> is <code class="code">&quot;voltage&quot;</code> (default) or <code class="code">&quot;power&quot;</code>.
</p>
</dd>
<dt><code class="code">db(<var class="var">x</var>, <var class="var">R</var>)</code></dt>
<dd><p>Voltage conversion with resistance <var class="var">R</var>.  <var class="var">R</var> can be a scalar,
 vector, matrix, or N-D array with a size compatible with <var class="var">x</var>.
</p>
</dd>
<dt><code class="code">db(<var class="var">x</var>, &quot;voltage&quot;, <var class="var">R</var>)</code></dt>
<dd><p>Same as <code class="code">db(<var class="var">x</var>, <var class="var">R</var>)</code>.
 </p></dd>
</dl>


<p><strong class="strong">See also:</strong> pow2db, db2pow.
 </p></dd></dl>{% endraw %}