---
layout: "default"
permalink: "/functions/8_tukeywin/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - tukeywin"
category: "Utility"
func_name: "tukeywin"
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
<dt class="deftypefn def-line" id="index-tukeywin"><span class="category-def">Function File: </span><span><strong class="def-name">tukeywin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code><a class="copiable-link" href="#index-tukeywin"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-tukeywin-1"><span class="category-def">Function File: </span><span><strong class="def-name">tukeywin</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">r</var>)</code><a class="copiable-link" href="#index-tukeywin-1"></a></span></dt>
<dd><p>Return the filter coefficients of a Tukey window (also known as the
 cosine-tapered window) of length <var class="var">m</var>.  <var class="var">r</var> defines the ratio
 between the constant section and and the cosine section.  It has to be
 between 0 and 1.  The function returns a Hanning window for <var class="var">r</var>
 equal to 1 and a rectangular window for <var class="var">r</var> equal to 0.
 The default value of <var class="var">r</var> is 1/2.
</p>
<p>For a definition of the Tukey window, see e.g. Fredric J. Harris,
 &quot;On the Use of Windows for Harmonic Analysis with the Discrete Fourier
 Transform, Proceedings of the IEEE&quot;, Vol. 66, No. 1, January 1978,
 Page 67, Equation 38.
 </p>
<p><strong class="strong">See also:</strong> hanning.
 </p></dd></dl>