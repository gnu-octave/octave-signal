---
layout: "default"
permalink: "/functions/6_sos2zp/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - sos2zp"
category: "Filter Conversion"
func_name: "sos2zp"
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
<dt class="deftypefn" id="index-sos2zp"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">k</var>] =</code> <strong class="def-name">sos2zp</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code><a class="copiable-link" href="#index-sos2zp"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-sos2zp-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">k</var>] =</code> <strong class="def-name">sos2zp</strong> <code class="def-code-arguments">(<var class="var">sos</var>, <var class="var">g</var>)</code><a class="copiable-link" href="#index-sos2zp-1"></a></span></dt>
<dd><p>Convert series second-order sections to zeros, poles, and gains
 (pole residues).
</p>
<p>INPUTS:
 </p><ul class="itemize mark-bullet">
<li><var class="var">sos</var> = matrix of series second-order sections, one per row:
 <div class="example">
<pre class="example-preformatted"> <var class="var">sos</var> = [<var class="var">B1</var>.' <var class="var">A1</var>.'; ...; <var class="var">BN</var>.' <var class="var">AN</var>.']
 </pre></div>
<p>where
 <code class="code"><var class="var">B1</var>.' = [b0 b1 b2] and <var class="var">A1</var>.' = [a0 a1 a2]</code> for
 section 1, etc.
</p>
<p>a0 is usually equal to 1 because all 2nd order transfer functions can
 be scaled so that a0 = 1.
 However, this is not mandatory for this implementation, which supports
 all kinds of transfer functions, including first order transfer functions.
 See <code class="code">filter</code> for documentation of the second-order direct-form filter
 coefficients <var class="var">B</var>i and <var class="var">A</var>i.
</p>
</li><li><var class="var">g</var> is an overall gain factor that effectively scales
 any one of the input <var class="var">B</var>i vectors.
 If not given the gain is assumed to be 1.
 </li></ul>

<p>RETURNED:
 </p><ul class="itemize mark-bullet">
<li><var class="var">z</var> = column-vector containing all zeros (roots of B(z))
 </li><li><var class="var">p</var> = column-vector containing all poles (roots of A(z))
 </li><li><var class="var">k</var> = overall gain = <var class="var">B</var>(Inf)
 </li></ul>

<p>EXAMPLE:
 </p><div class="example">
<pre class="example-preformatted"> [z, p, k] = sos2zp ([1 0 1, 1 0 -0.81; 1 0 0, 1 0 0.49])
   &rArr; z =
      0 + 1i
      0 - 1i
      0 + 0i
      0 + 0i
   &rArr; p =
     -0.9000 + 0i
      0.9000 + 0i
      0 + 0.7000i
      0 - 0.7000i
   &rArr; k =  1
 </pre></div>


<p><strong class="strong">See also:</strong> zp2sos, sos2tf, tf2sos, zp2tf, tf2zp.
 </p></dd></dl>