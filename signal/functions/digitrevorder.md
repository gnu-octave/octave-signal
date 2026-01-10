---
layout: "default"
permalink: "/functions/13_digitrevorder/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - digitrevorder"
category: "Utility"
func_name: "digitrevorder"
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
<dt class="deftypefn def-line" id="index-digitrevorder"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">digitrevorder</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">r</var>)</code><a class="copiable-link" href="#index-digitrevorder"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-digitrevorder-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">y</var>, <var class="var">i</var>] =</code> <strong class="def-name">digitrevorder</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">r</var>)</code><a class="copiable-link" href="#index-digitrevorder-1"></a></span></dt>
<dd><p>Reorder the elements of the vector <var class="var">x</var> in digit-reversed order.
 The elements of <var class="var">x</var> are converted to radix <var class="var">r</var> and reversed.
 The reordered indices of the elements of <var class="var">x</var> are returned in <var class="var">i</var>.
 </p>
<p><strong class="strong">See also:</strong> bitrevorder, fft, ifft.
 </p></dd></dl>