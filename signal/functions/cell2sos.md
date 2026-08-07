---
layout: "default"
permalink: "/functions/8_cell2sos/"
pkg_name: "signal"
pkg_version: "1.4.8"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - cell2sos"
category: "Utility"
func_name: "cell2sos"
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
<dt class="deftypefn def-line" id="index-cell2sos"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">sos</var> =</code> <strong class="def-name">cell2sos</strong> <code class="def-code-arguments">(<var class="var">cll</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cell2sos-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">sos</var>, <var class="var">g</var>] =</code> <strong class="def-name">cell2sos</strong> <code class="def-code-arguments">(<var class="var">cll</var>)</code></span></dt>
<dd><p>Convert a second-order-section cell array to matrix form.
</p>
<p>Given a cell array <var class="var">cll</var> representing second-order sections,
 return the equivalent matrix <var class="var">sos</var> and an optional overall
 gain <var class="var">g</var>.
</p>
<p>A valid <var class="var">cll</var> input is a cell array of 2-element cell arrays.
 Each element consists of a numerator vector <code class="code">[b0, b1, b2]</code> and a
 denominator vector <code class="code">[1, a1, a2]</code>.  If the first element contains
 two scalars <code class="code">{gn, gd}</code>, it is treated as an overall gain.
</p>
<p>Examples:
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> ## Two sections, no gain:
 cll = {{[2 4 2] [6 0 2]}, {[3 3 0] [6 0 0]}};
 sos = cell2sos (cll)
   &rArr; sos =
       2   4   2   6   0   2
       3   3   0   6   0   0
 </pre></div><pre class="example-preformatted"> </pre></div>

<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> ## With gain:
 cll = {{7 5}, {[2 4 2] [6 0 2]}, {[3 3 0] [6 0 0]}};
 [sos, g] = cell2sos (cll)
   &rArr; sos =
       2   4   2   6   0   2
       3   3   0   6   0   0
   &rArr; g = 1.4000
 </pre></div><pre class="example-preformatted"> </pre></div>


<p><strong class="strong">See also:</strong> sos2cell.
 </p></dd></dl>{% endraw %}