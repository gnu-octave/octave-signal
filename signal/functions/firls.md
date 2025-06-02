---
layout: "default"
permalink: "/functions/5_firls/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - firls"
category: "FIR Filter Design"
func_name: "firls"
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
<dt class="deftypefn" id="index-firls"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firls</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-firls"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-firls-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firls</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>, <var class="var">w</var>)</code><a class="copiable-link" href="#index-firls-1"></a></span></dt>
<dd>
<p>FIR filter design using least squares method. Returns a length <var class="var">n</var>+1
 linear phase filter such that the integral of the weighted mean
 squared error in the specified bands is minimized.
</p>
<p>The vector <var class="var">f</var> specifies the frequencies of the band edges, normalized
 so that half the sample frequency is equal to 1.  Each band is specified by
 two frequencies, to the vector must have an even length.
</p>
<p>The vector <var class="var">a</var> specifies the amplitude of the desired response at each
 band edge.
</p>
<p>The optional argument <var class="var">w</var> is a weighting function that contains one
 value for each band that weights the mean squared error in that band.
</p>
<p><var class="var">a</var> must be the same length as <var class="var">f</var>, and <var class="var">w</var> must be half the
 length of <var class="var">f</var>.  <var class="var">n</var> must be even.  If given an odd value,
 <code class="code">firls</code> increments it by 1.
</p>
<p>The least squares optimization algorithm for computing FIR filter
 coefficients is derived in detail in:
</p>
<p>I. Selesnick, &quot;Linear-Phase FIR Filter Design by Least Squares,&quot;
 http://cnx.org/content/m10577
 </p></dd></dl>