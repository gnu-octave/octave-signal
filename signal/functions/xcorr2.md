---
layout: "default"
permalink: "/functions/6_xcorr2/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - xcorr2"
category: "Utility"
func_name: "xcorr2"
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
<dt class="deftypefn def-line" id="index-xcorr2"><span class="category-def">Function File: </span><span><strong class="def-name">xcorr2</strong> <code class="def-code-arguments">(<var class="var">a</var>)</code><a class="copiable-link" href="#index-xcorr2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcorr2-1"><span class="category-def">Function File: </span><span><strong class="def-name">xcorr2</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>)</code><a class="copiable-link" href="#index-xcorr2-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcorr2-2"><span class="category-def">Function File: </span><span><strong class="def-name">xcorr2</strong> <code class="def-code-arguments">(&hellip;, <var class="var">scale</var>)</code><a class="copiable-link" href="#index-xcorr2-2"></a></span></dt>
<dd><p>Compute the 2D cross-correlation of matrices <var class="var">a</var> and <var class="var">b</var>.
</p>
<p>If <var class="var">b</var> is not specified, computes autocorrelation of <var class="var">a</var>, i.e.,
 same as <code class="code">xcorr (<var class="var">a</var>, <var class="var">a</var>)</code>.
</p>
<p>The optional argument <var class="var">scale</var>, defines the type of scaling applied to the
 cross-correlation matrix. Possible values are:
</p>
<dl class="table">
<dt>&quot;none&quot; (default)</dt>
<dd><p>No scaling.
</p>
</dd>
<dt>&quot;biased&quot;</dt>
<dd><p>Scales the raw cross-correlation by the maximum number of elements of <var class="var">a</var>
 and <var class="var">b</var> involved in the generation of any element of <var class="var">c</var>.
</p>
</dd>
<dt>&quot;unbiased&quot;</dt>
<dd><p>Scales the raw correlation by dividing each element in the cross-correlation
 matrix by the number of products <var class="var">a</var> and <var class="var">b</var> used to generate that
 element.
</p>
</dd>
<dt>&quot;coeff&quot;</dt>
<dd><p>Scales the normalized cross-correlation on the range of [0 1] so that a value
 of 1 corresponds to a correlation coefficient of 1.
 </p></dd>
</dl>


<p><strong class="strong">See also:</strong> conv2, corr2, xcorr.
 </p></dd></dl>