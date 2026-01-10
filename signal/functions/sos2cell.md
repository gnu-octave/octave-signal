---
layout: "default"
permalink: "/functions/8_sos2cell/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - sos2cell"
category: "Utility"
func_name: "sos2cell"
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
<dt class="deftypefn def-line" id="index-sos2cell"><span class="category-def">Function File: </span><span><code class="def-type">C =</code> <strong class="def-name">sos2cell</strong> <code class="def-code-arguments">(<var class="var">S</var>)</code><a class="copiable-link" href="#index-sos2cell"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sos2cell-1"><span class="category-def">Function File: </span><span><code class="def-type">C =</code> <strong class="def-name">sos2cell</strong> <code class="def-code-arguments">(<var class="var">S</var>, <var class="var">G</var>)</code><a class="copiable-link" href="#index-sos2cell-1"></a></span></dt>
<dd><p>Convert a second-order-section matrix to a cell array.
</p>
<p><var class="var">S</var> is an L-by-6 matrix, where each row represents a second-order section in the form:
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> S = [B1 A1;
      B2 A2;
      ...
      BL AL]
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>where <var class="var">Bi</var> and <var class="var">Ai</var> are the numerator and denominator coefficients of a linear
 or quadratic polynomial. The function converts this matrix into a cell array <var class="var">C</var>
 with the following format:
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> C = { {B1, A1}, {B2, A2}, ..., {BL, AL} }
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>Each element of the cell array is a cell containing a pair of vectors: <var class="var">Bi</var> and <var class="var">Ai</var>.
</p>
<p>If an additional gain term <var class="var">G</var> is provided, the function returns:
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> C = { {G, 1}, {B1, A1}, {B2, A2}, ..., {BL, AL} }
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>where {G, 1} represents the constant gain term applied to the filter.
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> S = [ [1, 2, 3, 4, 5, 6];
       [7, 8, 9, 10, 11, 12] ];
 C = sos2cell(S);
 </pre></div><pre class="example-preformatted"> </pre></div>
</dd></dl>