---
layout: "default"
permalink: "/functions/8_welchwin/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - welchwin"
category: "Utility"
func_name: "welchwin"
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
<dt class="deftypefn def-line" id="index-welchwin"><span class="category-def">Function File: </span><span><strong class="def-name">welchwin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code><a class="copiable-link" href="#index-welchwin"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-welchwin-1"><span class="category-def">Function File: </span><span><strong class="def-name">welchwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;periodic&quot;)</code><a class="copiable-link" href="#index-welchwin-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-welchwin-2"><span class="category-def">Function File: </span><span><strong class="def-name">welchwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;symmetric&quot;)</code><a class="copiable-link" href="#index-welchwin-2"></a></span></dt>
<dd><p>Return the filter coefficients of a Welch window of length <var class="var">m</var>.  The
 Welch window is given by
 <var class="var">w</var>(n)=1-(n/N-1)^2,   n=[0,1, ... <var class="var">m</var>-1].
 The optional argument specifies a &quot;symmetric&quot; window (the default) or a
 &quot;periodic&quot; window.
</p>
<p>A symmetric window has zero at each end and maximum in the middle, and the
 length must be an integer greater than 2.  The variable <var class="var">N</var> in the
 formula above is <code class="code">(<var class="var">m</var>-1)/2</code>.
</p>
<p>A periodic window wraps around the cyclic interval [0,1, ... <var class="var">m</var>-1],
 and is intended for use with the DFT.  The length must be an integer
 greater than 1.  The variable <var class="var">N</var> in the formula above is
 <code class="code"><var class="var">m</var>/2</code>.
</p>

<p><strong class="strong">See also:</strong> blackman, kaiser.
 </p></dd></dl>