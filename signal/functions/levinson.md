---
layout: "default"
permalink: "/functions/8_levinson/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - levinson"
category: "System Identification"
func_name: "levinson"
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
<dt class="deftypefn" id="index-levinson"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">a</var>, <var class="var">v</var>, <var class="var">ref</var>] =</code> <strong class="def-name">levinson</strong> <code class="def-code-arguments">(<var class="var">acf</var>)</code><a class="copiable-link" href="#index-levinson"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-levinson-1"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">levinson</strong> <code class="def-code-arguments">(<var class="var">acf</var>, <var class="var">p</var>)</code><a class="copiable-link" href="#index-levinson-1"></a></span></dt>
<dd>
<p>Use the Durbin-Levinson algorithm to solve:
    toeplitz(acf(1:p)) * x = -acf(2:p+1).
 The solution [1, x&rsquo;] is the denominator of an all pole filter
 approximation to the signal x which generated the autocorrelation
 function acf.
</p>
<p>acf is the autocorrelation function for lags 0 to p.
 p defaults to length(acf)-1.
 Returns
   a=[1, x&rsquo;] the denominator filter coefficients.
   v= variance of the white noise = square of the numerator constant
   ref = reflection coefficients = coefficients of the lattice
         implementation of the filter
 Use freqz(sqrt(v),a) to plot the power spectrum.
</p>
<p>REFERENCE
 [1] Steven M. Kay and Stanley Lawrence Marple Jr.:
   &quot;Spectrum analysis &ndash; a modern perspective&quot;,
   Proceedings of the IEEE, Vol 69, pp 1380-1419, Nov., 1981
 </p></dd></dl>