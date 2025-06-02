---
layout: "default"
permalink: "/functions/8_rectpuls/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - rectpuls"
category: "Signals"
func_name: "rectpuls"
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
<dt class="deftypefn" id="index-rectpuls"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">rectpuls</strong> <code class="def-code-arguments">(<var class="var">t</var>)</code><a class="copiable-link" href="#index-rectpuls"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-rectpuls-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">rectpuls</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">w</var>)</code><a class="copiable-link" href="#index-rectpuls-1"></a></span></dt>
<dd><p>Generate a rectangular pulse over the interval [-<var class="var">w</var>/2,<var class="var">w</var>/2),
 sampled at times <var class="var">t</var>.  This is useful with the function <code class="code">pulstran</code>
 for generating a series of pulses.
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> fs = 11025;  # arbitrary sample rate
 f0 = 100;    # pulse train sample rate
 w = 0.3/f0;  # pulse width 3/10th the distance between pulses
 plot (pulstran (0:1/fs:4/f0, 0:1/f0:4/f0, &quot;rectpuls&quot;, w));
 </pre></div><pre class="example-preformatted"> </pre></div>


<p><strong class="strong">See also:</strong> gauspuls, pulstran, tripuls.
 </p></dd></dl>