---
layout: "default"
permalink: "/functions/6_wvtool/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - wvtool"
category: "Utility"
func_name: "wvtool"
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
<dt class="deftypefn def-line" id="index-_0028w_002c"><span class="category-def">Function File: </span><span><code class="def-type">wvtool</code> <strong class="def-name">(<var class="var">w</var>,</strong> <code class="def-code-arguments">&hellip;)</code><a class="copiable-link" href="#index-_0028w_002c"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028_002e_002e_002e_002c"><span class="category-def">Function File: </span><span><code class="def-type">wvtool</code> <strong class="def-name">(&hellip;,</strong> <code class="def-code-arguments"><var class="var">options</var>)</code><a class="copiable-link" href="#index-_0028_002e_002e_002e_002c"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028title_002c"><span class="category-def">Function File: </span><span><code class="def-type">wvtool</code> <strong class="def-name">(<var class="var">title</var>,</strong> <code class="def-code-arguments">&hellip;)</code><a class="copiable-link" href="#index-_0028title_002c"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_003d"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">h</var></code> <strong class="def-name">=</strong> <code class="def-code-arguments">wvtool (&hellip;)</code><a class="copiable-link" href="#index-_003d"></a></span></dt>
<dd><p>Plot time and frequency domain graphs of each vector of window function
 coefficients given in <var class="var">w</var> and any following arguments.  Given vectors
 must have the same length.
</p>
<p>The graphs are: (1) Time domain, (2) Frequency domain (initial
 bins), and (3) Frequency domain (all bins).  A subset of these can be selected
 by including their numbers as above as characters within the string
 argument <var class="var">options</var>; for example, &lsquo;13&rsquo; selects only graphs (1) and (3).
</p>
<p>By default, the x-axis of graph (3) is logarithmic, to facilitate assessment of
 side-lobe roll-off (SLR) rate.  Including an &lsquo;l&rsquo; character in <var class="var">options</var>
 changes to a linear x-axis.
</p>
<p>The layout of the graphs is set to horizontal if <var class="var">options</var> contains an
 &lsquo;h&rsquo; character.
</p>
<p>Any other characters in <var class="var">options</var> are passed to the plot command for
 graph (1) as its <var class="var">fmt</var> argument (for an example, see demo number 3).
</p>
<p>A figure title can be supplied as the first given argument; alternatively
 the returned handle <var class="var">h</var> provides a more general means to modify the figure.
</p>
<p>Measurements made on the window(s) are reported in the graph legends (subject
 to graph selection per above) and in the console output.
</p>
<p>To convert reported bin positions to bandwidth (in bins), multiply by 2.
 To convert bandwidth in bins to normalized bandwidth, divide by the
 window-length.
 </p></dd></dl>