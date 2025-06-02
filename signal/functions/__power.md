---
layout: "default"
permalink: "/functions/7_power/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - __power"
category: "Power Spectrum Analysis"
func_name: "__power"
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
<dt class="deftypefn" id="index-_005f_005fpower"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">P</var>, <var class="var">w</var>] =</code> <strong class="def-name">__power</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-_005f_005fpower"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-_005f_005fpower-1"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">__power</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">nfft</var>)</code><a class="copiable-link" href="#index-_005f_005fpower-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-_005f_005fpower-2"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">__power</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">nfft</var>, <var class="var">Fs</var>)</code><a class="copiable-link" href="#index-_005f_005fpower-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-_005f_005fpower-3"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">__power</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">nfft</var>, <var class="var">Fs</var>, <var class="var">range</var>)</code><a class="copiable-link" href="#index-_005f_005fpower-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-_005f_005fpower-4"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">__power</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">nfft</var>, <var class="var">Fs</var>, <var class="var">range</var>, <var class="var">units</var>)</code><a class="copiable-link" href="#index-_005f_005fpower-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-_005f_005fpower-5"><span class="category-def">Function File: </span><span><strong class="def-name">__power</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-_005f_005fpower-5"></a></span></dt>
<dd>
<p>Plot the power spectrum of the given ARMA model.
</p>
<p>b, a: filter coefficients (b=numerator, a=denominator)
 nfft is number of points at which to sample the power spectrum
 Fs is the sampling frequency of x
 range is &rsquo;half&rsquo; (default) or &rsquo;whole&rsquo;
 units is  &rsquo;squared&rsquo; or &rsquo;db&rsquo; (default)
 range and units may be specified any time after the filter, in either
 order
</p>
<p>Returns P, the magnitude vector, and w, the frequencies at which it
 is sampled.  If there are no return values requested, then plot the power
 spectrum and don&rsquo;t return anything.
 </p></dd></dl>