---
layout: "default"
permalink: "/functions/8_resample/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - resample"
category: "Utility"
func_name: "resample"
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
<dt class="deftypefn def-line" id="index-resample"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">y</var>, <var class="var">h</var>] =</code> <strong class="def-name">resample</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>, <var class="var">q</var>)</code><a class="copiable-link" href="#index-resample"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-resample-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">resample</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>, <var class="var">q</var>, <var class="var">h</var>)</code><a class="copiable-link" href="#index-resample-1"></a></span></dt>
<dd><p>Change the sample rate of <var class="var">x</var> by a factor of <var class="var">p</var>/<var class="var">q</var>.  This is
 performed using a polyphase algorithm.  The impulse response <var class="var">h</var> of
 the antialiasing filter is either specified or either designed with a
 Kaiser-windowed sinecard.
</p>
<p>Ref [1] J. G. Proakis and D. G. Manolakis,
 Digital Signal Processing: Principles, Algorithms, and Applications,
 4th ed., Prentice Hall, 2007. Chap. 6
</p>
<p>Ref [2] A. V. Oppenheim, R. W. Schafer and J. R. Buck,
 Discrete-time signal processing, Signal processing series,
 Prentice-Hall, 1999
 </p></dd></dl>