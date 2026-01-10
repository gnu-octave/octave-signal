---
layout: "default"
permalink: "/functions/6_sos2tf/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - sos2tf"
category: "Utility"
func_name: "sos2tf"
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
<dt class="deftypefn def-line" id="index-sos2tf"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">sos2tf</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code><a class="copiable-link" href="#index-sos2tf"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sos2tf-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">sos2tf</strong> <code class="def-code-arguments">(<var class="var">sos</var>, <var class="var">g</var>)</code><a class="copiable-link" href="#index-sos2tf-1"></a></span></dt>
<dd><p>Convert series second-order sections to transfer function.
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
<p>a0 is usually equal to 1 because all 2nd order transfer functions
 can be scaled so that a0 = 1.
 However, this is not mandatory for this implementation, which supports
 all kinds of transfer functions, including first order transfer functions.
 See <code class="code">filter</code> for documentation of the second-order direct-form filter
 coefficients <var class="var">B</var>i and <var class="var">A</var>i.
</p>
</li><li><var class="var">g</var> is an overall gain factor that effectively scales
 the output <var class="var">b</var> vector (or any one of the input <var class="var">B</var>i vectors).
 If not given the gain is assumed to be 1.
 </li></ul>

<p>RETURNED:
 <var class="var">b</var> and <var class="var">a</var> are vectors specifying the analog or digital filter
 <em class="math">H(s) = B(s)/A(s)</em> or <em class="math">H(z) = B(z)/A(z)</em>.
 See <code class="code">filter</code> for further details.
</p>

<p><strong class="strong">See also:</strong> tf2sos, zp2sos, sos2pz, zp2tf, tf2zp.
 </p></dd></dl>