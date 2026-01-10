---
layout: "default"
permalink: "/functions/8_isstable/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - isstable"
category: "Utility"
func_name: "isstable"
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
<dt class="deftypefn def-line" id="index-isstable"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">FLAG</var> =</code> <strong class="def-name">isstable</strong> <code class="def-code-arguments">(<var class="var">B</var>, <var class="var">A</var>)</code><a class="copiable-link" href="#index-isstable"></a></span></dt>
<dd><p>Returns a logical output equal to TRUE, if the filter is stable.
 This can be done with coeffients of the filer <var class="var">B</var> and <var class="var">A</var>.
 Alternatively by using a second order sections matrix (SOS).
</p>
<p>Inputs:
 </p><ul class="itemize mark-bullet">
<li><var class="var">B</var>: Numerator coefficients of the filter

</li><li><var class="var">A</var>: Denominator coeffients of the filter. Can be an empty vector.
 </li></ul>

<p>Output:
 </p><ul class="itemize mark-bullet">
<li><var class="var">FLAG</var>: Returns a logical output, equal to TRUE if the filter is stable. 
 </li></ul>

<p>Examples:
 </p><div class="example">
<pre class="example-preformatted">   b = [1 2 3 4 5 5 1 2];
   a = [4 5 6 7 9 10 4 6];
   flag = isstable (b, a)
   flag = 0
 </pre></div>

<p>Using SOS
 </p><div class="example">
<pre class="example-preformatted">   [z, p, k] = butter (6, 0.7, 'high');
   sos = zp2sos (z, p, k);
   flag = isstable (sos)
   flag = 1
 </pre></div>
</dd></dl>