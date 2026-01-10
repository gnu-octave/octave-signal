---
layout: "default"
permalink: "/functions/10_flattopwin/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - flattopwin"
category: "Utility"
func_name: "flattopwin"
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
<dt class="deftypefn def-line" id="index-flattopwin"><span class="category-def">Function File: </span><span><strong class="def-name">flattopwin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code><a class="copiable-link" href="#index-flattopwin"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-flattopwin-1"><span class="category-def">Function File: </span><span><strong class="def-name">flattopwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;periodic&quot;)</code><a class="copiable-link" href="#index-flattopwin-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-flattopwin-2"><span class="category-def">Function File: </span><span><strong class="def-name">flattopwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;symmetric&quot;)</code><a class="copiable-link" href="#index-flattopwin-2"></a></span></dt>
<dd>
<p>Return the filter coefficients of a Flat Top window of length <var class="var">m</var>.
 The Flat Top window is defined by the function f(w):
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted">   f(w) = 1 - 1.93 cos(2 pi w) + 1.29 cos(4 pi w)
            - 0.388 cos(6 pi w) + 0.0322cos(8 pi w)
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>where w = i/(m-1) for i=0:m-1 for a symmetric window, or
 w = i/m for i=0:m-1 for a periodic window.  The default
 is symmetric.  The returned window is normalized to a peak
 of 1 at w = 0.5.
</p>
<p>This window has low pass-band ripple, but high bandwidth.
</p>
<p>According to [1]:
</p>
<p>The main use for the Flat Top window is for calibration, due
    to its negligible amplitude errors.
</p>
<p>[1] Gade, S; Herlufsen, H; (1987) &quot;Use of weighting functions in DFT/FFT
 analysis (Part I)&quot;, Bruel &amp; Kjaer Technical Review No.3.
 </p></dd></dl>