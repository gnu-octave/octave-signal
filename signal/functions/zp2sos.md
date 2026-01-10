---
layout: "default"
permalink: "/functions/6_zp2sos/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - zp2sos"
category: "Utility"
func_name: "zp2sos"
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
<dt class="deftypefn def-line" id="index-zp2sos"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">sos</var>, <var class="var">g</var>] =</code> <strong class="def-name">zp2sos</strong> <code class="def-code-arguments">(<var class="var">z</var>)</code><a class="copiable-link" href="#index-zp2sos"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-zp2sos-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">sos</var>, <var class="var">g</var>] =</code> <strong class="def-name">zp2sos</strong> <code class="def-code-arguments">(<var class="var">z</var>, <var class="var">p</var>)</code><a class="copiable-link" href="#index-zp2sos-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-zp2sos-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">sos</var>, <var class="var">g</var>] =</code> <strong class="def-name">zp2sos</strong> <code class="def-code-arguments">(<var class="var">z</var>, <var class="var">p</var>, <var class="var">k</var>)</code><a class="copiable-link" href="#index-zp2sos-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-zp2sos-3"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">sos</var> =</code> <strong class="def-name">zp2sos</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-zp2sos-3"></a></span></dt>
<dd><p>Convert filter poles and zeros to second-order sections.
</p>
<p>INPUTS:
 </p><ul class="itemize mark-bullet">
<li><var class="var">z</var> = column-vector containing the filter zeros
 </li><li><var class="var">p</var> = column-vector containing the filter poles
 </li><li><var class="var">k</var> = overall filter gain factor. If not given the gain is assumed to be 1.
 </li></ul>

<p>RETURNED:
 </p><ul class="itemize mark-bullet">
<li><var class="var">sos</var> = matrix of series second-order sections, one per row:
 <div class="example">
<pre class="example-preformatted"> <var class="var">sos</var> = [<var class="var">B1</var>.' <var class="var">A1</var>.'; ...; <var class="var">BN</var>.' <var class="var">AN</var>.']
 </pre></div>
<p>where
 <code class="code"><var class="var">B1</var>.' = [b0 b1 b2] and <var class="var">A1</var>.' = [a0 a1 a2]</code> for
 section 1, etc.
 See <code class="code">filter</code> for documentation of the second-order direct-form filter
 coefficients <var class="var">B</var>i and %<var class="var">A</var>i, i=1:N.
</p>
</li><li><var class="var">g</var> is the overall gain factor that effectively scales
 any one of the <var class="var">B</var>i vectors.
 </li></ul>

<p>If called with only one output argument, the overall filter gain is
 applied to the first second-order section in the matrix <var class="var">sos</var>.
</p>
<p>EXAMPLE:
 </p><div class="example">
<pre class="example-preformatted">   [z, p, k] = tf2zp ([1 0 0 0 0 1], [1 0 0 0 0 .9]);
   [sos, g] = zp2sos (z, p, k)

 sos =
    1.0000    0.6180    1.0000    1.0000    0.6051    0.9587
    1.0000   -1.6180    1.0000    1.0000   -1.5843    0.9587
    1.0000    1.0000         0    1.0000    0.9791         0

 g =
     1
 </pre></div>


<p><strong class="strong">See also:</strong> sos2zp, sos2tf, tf2sos, zp2tf, tf2zp.
 </p></dd></dl>