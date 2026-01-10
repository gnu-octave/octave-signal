---
layout: "default"
permalink: "/functions/9_qpkaiser/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - qp_kaiser"
category: "Utility"
func_name: "qp_kaiser"
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
<dt class="deftypefn def-line" id="index-qp_005fkaiser"><span class="category-def">Function File: </span><span><strong class="def-name">qp_kaiser</strong> <code class="def-code-arguments">(<var class="var">nb</var>, <var class="var">at</var>)</code><a class="copiable-link" href="#index-qp_005fkaiser"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-qp_005fkaiser-1"><span class="category-def">Function File: </span><span><strong class="def-name">qp_kaiser</strong> <code class="def-code-arguments">(<var class="var">nb</var>, <var class="var">at</var>, <var class="var">linear</var>)</code><a class="copiable-link" href="#index-qp_005fkaiser-1"></a></span></dt>
<dd>
<p>Computes a finite impulse response (FIR) filter for use with a
 quasi-perfect reconstruction polyphase-network filter bank. This
 version utilizes a Kaiser window to shape the frequency response of
 the designed filter. Tha number nb of bands and the desired
 attenuation at in the stop-band are given as parameters.
</p>
<p>The Kaiser window is multiplied by the ideal impulse response
 h(n)=a.sinc(a.n) and converted to its minimum-phase version by means
 of a Hilbert transform.
</p>
<p>By using a third non-null argument, the minimum-phase calculation is
 omitted at all.
 </p></dd></dl>