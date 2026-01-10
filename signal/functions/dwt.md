---
layout: "default"
permalink: "/functions/3_dwt/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - dwt"
category: "Utility"
func_name: "dwt"
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
<dt class="deftypefn def-line" id="index-dwt"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">u</var>, <var class="var">v</var>] =</code> <strong class="def-name">dwt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">wname</var>)</code><a class="copiable-link" href="#index-dwt"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-dwt-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">u</var>, <var class="var">v</var>] =</code> <strong class="def-name">dwt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">Hp</var>, <var class="var">Gp</var>)</code><a class="copiable-link" href="#index-dwt-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-dwt-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">u</var>, <var class="var">v</var>] =</code> <strong class="def-name">dwt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">Hp</var>, <var class="var">Gp</var>, &hellip;)</code><a class="copiable-link" href="#index-dwt-2"></a></span></dt>
<dd><p>Discrete wavelet transform (1D).
</p> 
<p><strong class="strong">Inputs</strong>
 </p><dl class="table">
<dt><var class="var">x</var></dt>
<dd><p>Signal vector.
 </p></dd>
<dt><var class="var">wname</var></dt>
<dd><p>Wavelet name.
 </p></dd>
<dt><var class="var">Hp</var></dt>
<dd><p>Coefficients of low-pass decomposition <abbr class="acronym">FIR</abbr> filter.
 </p></dd>
<dt><var class="var">Gp</var></dt>
<dd><p>Coefficients of high-pass decomposition <abbr class="acronym">FIR</abbr> filter.
 </p></dd>
</dl>

<p><strong class="strong">Outputs</strong>
 </p><dl class="table">
<dt><var class="var">u</var></dt>
<dd><p>Signal vector of average, approximation.
 </p></dd>
<dt><var class="var">v</var></dt>
<dd><p>Signal vector of difference, detail.
 </p></dd>
</dl>
</dd></dl>