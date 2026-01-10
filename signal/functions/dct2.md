---
layout: "default"
permalink: "/functions/4_dct2/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - dct2"
category: "Utility"
func_name: "dct2"
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
<dt class="deftypefn def-line" id="index-dct2"><span class="category-def">Function File: </span><span><strong class="def-name">dct2</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code><a class="copiable-link" href="#index-dct2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-dct2-1"><span class="category-def">Function File: </span><span><strong class="def-name">dct2</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">m</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-dct2-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-dct2-2"><span class="category-def">Function File: </span><span><strong class="def-name">dct2</strong> <code class="def-code-arguments">(<var class="var">x</var>, [<var class="var">m</var>, <var class="var">n</var>])</code><a class="copiable-link" href="#index-dct2-2"></a></span></dt>
<dd><p>Compute the 2-D discrete cosine transform of matrix <var class="var">x</var>.  If
 <var class="var">m</var> and <var class="var">n</var> are specified, the input is padded or trimmed
 to the desired size.
 </p>
<p><strong class="strong">See also:</strong> dct, idct, idct2.
 </p></dd></dl>