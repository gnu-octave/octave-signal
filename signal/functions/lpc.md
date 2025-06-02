---
layout: "default"
permalink: "/functions/3_lpc/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - lpc"
category: "System Identification"
func_name: "lpc"
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
<dt class="deftypefn" id="index-lpc"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">a</var> =</code> <strong class="def-name">lpc</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code><a class="copiable-link" href="#index-lpc"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-lpc-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">a</var> =</code> <strong class="def-name">lpc</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>)</code><a class="copiable-link" href="#index-lpc-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-lpc-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">a</var>, <var class="var">g</var>] =</code> <strong class="def-name">lpc</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-lpc-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-lpc-3"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">a</var>, <var class="var">g</var>] =</code> <strong class="def-name">lpc</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>)</code><a class="copiable-link" href="#index-lpc-3"></a></span></dt>
<dd>
<p>Determines the forward linear predictor by minimizing the prediction error
 in the least squares sense. Use the Durbin-Levinson algorithm to solve
 the Yule-Walker equations obtained by the autocorrelation of the input
 signal.
</p>
<p><var class="var">x</var> is a data vector used to estimate the lpc model of <var class="var">p</var>-th order,
 given by the prediction polynomial <code class="code"><var class="var">a</var> = [1 <var class="var">a</var>(2) &hellip;
 <var class="var">a</var>(<var class="var">p</var>+1)]</code>. If <var class="var">p</var> is not provided, <code class="code">length(<var class="var">p</var>) - 1</code>
 is used as default.
</p>
<p><var class="var">x</var> might also be a matrix, in which case each column is regarded as a
 separate signal. <code class="code">lpc</code> will return a model estimate for each column of
 <var class="var">x</var>.
</p>
<p><var class="var">g</var> is the variance (power) of the prediction error for each signal in
 <var class="var">x</var>.
</p>

<p><strong class="strong">See also:</strong> aryule,levinson.
 </p></dd></dl>