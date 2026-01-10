---
layout: "default"
permalink: "/functions/4_xcov/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - xcov"
category: "Utility"
func_name: "xcov"
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
<dt class="deftypefn def-line" id="index-xcov"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">R</var>, <var class="var">lag</var>] =</code> <strong class="def-name">xcov</strong> <code class="def-code-arguments">( <var class="var">X</var> )</code><a class="copiable-link" href="#index-xcov"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcov-1"><span class="category-def">Function File: </span><span><code class="def-type">&hellip; =</code> <strong class="def-name">xcov</strong> <code class="def-code-arguments">( <var class="var">X</var>, <var class="var">Y</var> )</code><a class="copiable-link" href="#index-xcov-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcov-2"><span class="category-def">Function File: </span><span><code class="def-type">&hellip; =</code> <strong class="def-name">xcov</strong> <code class="def-code-arguments">( &hellip;, <var class="var">maxlag</var>)</code><a class="copiable-link" href="#index-xcov-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcov-3"><span class="category-def">Function File: </span><span><code class="def-type">&hellip; =</code> <strong class="def-name">xcov</strong> <code class="def-code-arguments">( &hellip;, <var class="var">scale</var>)</code><a class="copiable-link" href="#index-xcov-3"></a></span></dt>
<dd><p>Compute covariance at various lags [=correlation(x-mean(x),y-mean(y))].
</p>
<dl class="table">
<dt><var class="var">X</var></dt>
<dd><p>input vector
 </p></dd>
<dt><var class="var">Y</var></dt>
<dd><p>if specified, compute cross-covariance between X and Y,
 otherwise compute autocovariance of X.
 </p></dd>
<dt><var class="var">maxlag</var></dt>
<dd><p>is specified, use lag range [-maxlag:maxlag],
 otherwise use range [-n+1:n-1].
 </p></dd>
<dt><var class="var">scale:</var></dt>
<dd><dl class="table">
<dt>&lsquo;<samp class="samp">biased</samp>&rsquo;</dt>
<dd><p>for covariance=raw/N,
 </p></dd>
<dt>&lsquo;<samp class="samp">unbiased</samp>&rsquo;</dt>
<dd><p>for covariance=raw/(N-|lag|),
 </p></dd>
<dt>&lsquo;<samp class="samp">coeff</samp>&rsquo;</dt>
<dd><p>for covariance=raw/(covariance at lag 0),
 </p></dd>
<dt>&lsquo;<samp class="samp">none</samp>&rsquo;</dt>
<dd><p>for covariance=raw
 </p></dd>
<dt>&lsquo;<samp class="samp">none</samp>&rsquo;</dt>
<dd><p>is the default.
 </p></dd>
</dl>
</dd>
</dl>

<p>Returns the covariance for each lag in the range, plus an
 optional vector of lags.
</p>

<p><strong class="strong">See also:</strong> xcorr.
 </p></dd></dl>