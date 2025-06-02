---
layout: "default"
permalink: "/functions/5_cconv/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - cconv"
category: "Correlation and Convolution"
func_name: "cconv"
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
<dt class="deftypefn" id="index-cconv"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">c</var> =</code> <strong class="def-name">cconv</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-cconv"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-cconv-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">c</var> =</code> <strong class="def-name">cconv</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>)</code><a class="copiable-link" href="#index-cconv-1"></a></span></dt>
<dd><p>Compute the modulo-N circular convolution.
</p>
<p><var class="var">a</var> and <var class="var">b</var> are input vectors and <var class="var">c</var> is the modolo-<var class="var">n</var>
 convolution of <var class="var">a</var> and <var class="var">b</var>. If <var class="var">n</var> is not provided,
 its assumed default value is <code class="code">length(<var class="var">a</var>) + length(<var class="var">b</var>) - 1</code>,
 which provides the same result as a linear convolution.
</p>
<p>Examples:
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> cconv (1:2, 1:4)
    &rArr;  1   4   7   10   8
 </pre></div><pre class="example-preformatted"> </pre></div>

<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> cconv (1:2, 1:4, 2)
    &rArr;  16   14
 </pre></div><pre class="example-preformatted"> </pre></div>

<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> cconv (1:2, 1:4, 4)
    &rArr;  9   4   7   10
 </pre></div><pre class="example-preformatted"> </pre></div>


<p><strong class="strong">See also:</strong> conv, circshift.
 </p></dd></dl>