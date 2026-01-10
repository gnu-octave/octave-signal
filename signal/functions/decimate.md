---
layout: "default"
permalink: "/functions/8_decimate/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - decimate"
category: "Utility"
func_name: "decimate"
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
<dt class="deftypefn def-line" id="index-decimate"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">decimate</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">q</var>)</code><a class="copiable-link" href="#index-decimate"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-decimate-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">decimate</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">q</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-decimate-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-decimate-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">decimate</strong> <code class="def-code-arguments">(&hellip;, &quot;fir&quot;)</code><a class="copiable-link" href="#index-decimate-2"></a></span></dt>
<dd>
<p>Downsample the signal <var class="var">x</var> by a reduction factor of <var class="var">q</var>. A lowpass
 antialiasing filter is applied to the signal prior to reducing the input
 sequence. By default, an order <var class="var">n</var> Chebyshev type I filter is used.
 If <var class="var">n</var> is not specified, the default is 8.
</p>
<p>If the optional argument <code class="code">&quot;fir&quot;</code> is given, an order <var class="var">n</var> FIR filter
 is used, with a default order of 30 if <var class="var">n</var> is not given.
</p>
<p>Note that <var class="var">q</var> must be an integer for this rate change method.
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> ## Generate a signal that starts away from zero, is slowly varying
 ## at the start and quickly varying at the end, decimate and plot.
 ## Since it starts away from zero, you will see the boundary
 ## effects of the antialiasing filter clearly.  Next you will see
 ## how it follows the curve nicely in the slowly varying early
 ## part of the signal, but averages the curve in the quickly
 ## varying late part of the signal.
 t = 0:0.01:2;
 x = chirp (t, 2, .5, 10, &quot;quadratic&quot;) + sin (2*pi*t*0.4);
 y = decimate (x, 4);
 stem (t(1:121) * 1000, x(1:121), &quot;-g;Original;&quot;); hold on; # original
 stem (t(1:4:121) * 1000, y(1:31), &quot;-r;Decimated;&quot;); hold off; # decimated
 </pre></div>
</dd></dl>