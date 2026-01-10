---
layout: "default"
permalink: "/functions/12_upsamplefill/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - upsamplefill"
category: "Utility"
func_name: "upsamplefill"
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
<dt class="deftypefn def-line" id="index-upsamplefill"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">upsamplefill</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">v</var>)</code><a class="copiable-link" href="#index-upsamplefill"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-upsamplefill-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">upsamplefill</strong> <code class="def-code-arguments">(&hellip;, <var class="var">copy</var>)</code><a class="copiable-link" href="#index-upsamplefill-1"></a></span></dt>
<dd><p>Upsamples a vector interleaving given values or copies of the vector elements.
</p>
<p>The values in the vector <var class="var">v</var> are placed between the elements of <var class="var">x</var>.
</p>
<p>If the optional argument <var class="var">copy</var> is <var class="var">true</var> then <var class="var">v</var> should be a
 scalar and each value in <var class="var">x</var> are repeat <var class="var">v</var> times.
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> upsamplefill (eye (2), 2, true)
 &rArr;  1   0
     1   0
     1   0
     0   1
     0   1
     0   1
 upsamplefill (eye (2), [-1 -1 -1])
 &rArr;  1   0
    -1  -1
    -1  -1
    -1  -1
     0   1
    -1  -1
    -1  -1
    -1  -1
 </pre></div><pre class="example-preformatted"> </pre></div>


<p><strong class="strong">See also:</strong> upsample.
 </p></dd></dl>