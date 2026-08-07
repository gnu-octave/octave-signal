---
layout: "default"
permalink: "/functions/5_stepz/"
pkg_name: "signal"
pkg_version: "1.4.8"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - stepz"
category: "Utility"
func_name: "stepz"
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
<dt class="deftypefn def-line" id="index-stepz"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">x</var>, <var class="var">t</var>] =</code> <strong class="def-name">stepz</strong> <code class="def-code-arguments">(<var class="var">b</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-stepz-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">x</var>, <var class="var">t</var>] =</code> <strong class="def-name">stepz</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-stepz-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">x</var>, <var class="var">t</var>] =</code> <strong class="def-name">stepz</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">n</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-stepz-3"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">x</var>, <var class="var">t</var>] =</code> <strong class="def-name">stepz</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">n</var>, <var class="var">fs</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-stepz-4"><span class="category-def">Function File: </span><span><strong class="def-name">stepz</strong> <code class="def-code-arguments">(&hellip;)</code></span></dt>
<dd>
<p>Generate step-response characteristics of the filter.
</p>
<p>The filter coefficients correspond to the z-plane rational function
 with numerator b and denominator a.  If a is not specified, it
 defaults to 1.  When <var class="var">n</var> is a scalar, it specifies the number of
 points to compute (default: determined by <code class="code">impzlength</code>).  When
 <var class="var">n</var> is a vector of non-negative integers, the response is
 computed only at those sample indices.  The sampling frequency
 <var class="var">fs</var> (default: 1) controls the time spacing in the output
 <var class="var">t</var>.  With no output arguments, the result is plotted.
</p>

<p><strong class="strong">See also:</strong> freqz, zplane, impz, impzlength.
 </p></dd></dl>{% endraw %}