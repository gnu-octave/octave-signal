---
layout: "default"
permalink: "/functions/6_square/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - square"
category: "Signals"
func_name: "square"
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
<dt class="deftypefn" id="index-square"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">s</var> =</code> <strong class="def-name">square</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">duty</var>)</code><a class="copiable-link" href="#index-square"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-square-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">s</var> =</code> <strong class="def-name">square</strong> <code class="def-code-arguments">(<var class="var">t</var>)</code><a class="copiable-link" href="#index-square-1"></a></span></dt>
<dd><p>Generate a square wave of period 2 pi with limits +1/-1.
</p>
<p>If <var class="var">duty</var> is specified, it is the percentage of time the square
 wave is &quot;on&quot;.  The square wave is +1 for that portion of the time.
</p>
<pre class="verbatim">                   on time * 100
    duty cycle = ------------------
                 on time + off time
 </pre>

<p><strong class="strong">See also:</strong> cos, sawtooth, sin, tripuls.
 </p></dd></dl>