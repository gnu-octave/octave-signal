---
layout: "default"
permalink: "/functions/6_sgolay/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - sgolay"
category: "Utility"
func_name: "sgolay"
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
<dt class="deftypefn def-line" id="index-sgolay"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">sgolay</strong> <code class="def-code-arguments">(<var class="var">p</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-sgolay"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolay-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">sgolay</strong> <code class="def-code-arguments">(<var class="var">p</var>, <var class="var">n</var>, <var class="var">m</var>)</code><a class="copiable-link" href="#index-sgolay-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolay-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">sgolay</strong> <code class="def-code-arguments">(<var class="var">p</var>, <var class="var">n</var>, <var class="var">m</var>, <var class="var">ts</var>)</code><a class="copiable-link" href="#index-sgolay-2"></a></span></dt>
<dd><p>Computes the filter coefficients for all Savitzsky-Golay smoothing
 filters of order p for length n (odd). m can be used in order to
 get directly the mth derivative. In this case, ts is a scaling factor.
</p>
<p>The early rows of F smooth based on future values and later rows
 smooth based on past values, with the middle row using half future
 and half past.  In particular, you can use row i to estimate x(k)
 based on the i-1 preceding values and the n-i following values of x
 values as y(k) = F(i,:) * x(k-i+1:k+n-i).
</p>
<p>Normally, you would apply the first (n-1)/2 rows to the first k
 points of the vector, the last k rows to the last k points of the
 vector and middle row to the remainder, but for example if you were
 running on a realtime system where you wanted to smooth based on the
 all the data collected up to the current time, with a lag of five
 samples, you could apply just the filter on row n-5 to your window
 of length n each time you added a new sample.
</p>
<p>Reference: Numerical recipes in C. p 650
</p>

<p><strong class="strong">See also:</strong> sgolayfilt.
 </p></dd></dl>