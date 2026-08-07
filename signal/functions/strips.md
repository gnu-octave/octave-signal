---
layout: "default"
permalink: "/functions/6_strips/"
pkg_name: "signal"
pkg_version: "1.4.8"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - strips"
category: "Utility"
func_name: "strips"
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
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-strips"><span class="category-def">Function File: </span><span><strong class="def-name">strips</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-strips-1"><span class="category-def">Function File: </span><span><strong class="def-name">strips</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-strips-2"><span class="category-def">Function File: </span><span><strong class="def-name">strips</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">sd</var>, <var class="var">fs</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-strips-3"><span class="category-def">Function File: </span><span><strong class="def-name">strips</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">sd</var>, <var class="var">fs</var>, <var class="var">scale</var>)</code></span></dt>
<dd><p>Cut signal data into horizontal strips and plot for visualization.
</p>
<p><code class="code">strips (<var class="var">x</var>)</code> plots the input signal <var class="var">x</var> in horizontal strips
 of length 250 samples each.
</p>
<p><code class="code">strips (<var class="var">x</var>, <var class="var">n</var>)</code> uses strips of length <var class="var">n</var> samples.
</p>
<p><code class="code">strips (<var class="var">x</var>, <var class="var">sd</var>, <var class="var">fs</var>)</code> uses strips of duration
 <var class="var">sd</var> seconds given the sample rate <var class="var">fs</var> (in Hz). The strip length
 in samples is calculated as <code class="code">ceil (<var class="var">sd</var> * <var class="var">fs</var>)</code>.
</p>
<p><code class="code">strips (<var class="var">x</var>, <var class="var">sd</var>, <var class="var">fs</var>, <var class="var">scale</var>)</code> scales the
 vertical axis of each strip by the factor <var class="var">scale</var>.
</p>
<p>If <var class="var">x</var> is a matrix, each column is plotted as a separate strip.
</p>
</dd></dl>