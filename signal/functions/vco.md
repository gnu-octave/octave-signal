---
layout: "default"
permalink: "/functions/3_vco/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - vco"
category: "Signals"
func_name: "vco"
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
<dt class="deftypefn" id="index-vco"><span class="category-def">: </span><span><code class="def-type">y =</code> <strong class="def-name">vco</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">fc</var>, <var class="var">fs</var>)</code><a class="copiable-link" href="#index-vco"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-vco-1"><span class="category-def">: </span><span><code class="def-type">y =</code> <strong class="def-name">vco</strong> <code class="def-code-arguments">(<var class="var">x</var>, [<var class="var">fmin</var>, <var class="var">fmax</var>], <var class="var">fs</var>)</code><a class="copiable-link" href="#index-vco-1"></a></span></dt>
<dd><p>Creates a signal that oscillates at a frequency determined by input <var class="var">x</var> with a sampling frequency <var class="var">fs</var>.
</p>
<p>Inputs:
 </p><ul class="itemize mark-bullet">
<li><var class="var">x</var> - input data with a range of -1 to 1. A value of -1 means no output, 0 cuoreesponds to <var class="var">fc</var>,
 and 1 corresponds to 2*<var class="var">fc</var>.

</li><li><var class="var">fc</var> - Carrier frequency

</li><li><var class="var">fs</var> - Sampling rate

</li><li><var class="var">fmin</var>, <var class="var">fmax</var> - Frequency modulation range limits.
 </li></ul>

<p>Outputs:
 </p><ul class="itemize mark-bullet">
<li><var class="var">y</var> - output signal
 </li></ul>
</dd></dl>