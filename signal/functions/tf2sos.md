---
layout: "default"
permalink: "/functions/6_tf2sos/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - tf2sos"
category: "Utility"
func_name: "tf2sos"
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
<dt class="deftypefn def-line" id="index-tf2sos"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">sos</var>, <var class="var">g</var>] =</code> <strong class="def-name">tf2sos</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-tf2sos"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-tf2sos-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">sos</var> =</code> <strong class="def-name">tf2sos</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-tf2sos-1"></a></span></dt>
<dd><p>Convert direct-form filter coefficients to series second-order sections.
</p>
<p>INPUTS:
</p>
<p><var class="var">b</var> and <var class="var">a</var> are vectors specifying the digital filter
 <em class="math">H(z) = B(z)/A(z)</em>.  See <code class="code">filter</code> for documentation of the <var class="var">b</var>
 and <var class="var">a</var> filter coefficients.
</p>
<p>RETURNED:
 </p><ul class="itemize mark-bullet">
<li><var class="var">sos</var> = matrix of series second-order sections, one per row:
 <div class="example">
<pre class="example-preformatted"> <var class="var">sos</var> = [<var class="var">b1</var>.' <var class="var">a1</var>.'; ...; <var class="var">bn</var>.' <var class="var">an</var>.']
 </pre></div>
<p>where
 <code class="code"><var class="var">B1</var>.' = [b0 b1 b2] and <var class="var">A1</var>.' = [1 a1 a2]</code> for
 section 1, etc.  The b0 entry must be nonzero for each section (zeros at
 infinity not supported).
 </p></li><li><var class="var">g</var> is an overall gain factor that effectively scales
 any one of the <var class="var">B</var>i vectors.
 </li></ul>

<p>If called with only one output argument, the overall filter gain is
 applied to the first second-order section in the matrix <var class="var">sos</var>.
</p>
<p>EXAMPLE:
 </p><div class="example">
<pre class="example-preformatted"> B = [1 0 0 0 0 1];
 A = [1 0 0 0 0 .9];
 [sos, g] = tf2sos (B, A)

 sos =

    1.00000   0.61803   1.00000   1.00000   0.60515   0.95873
    1.00000  -1.61803   1.00000   1.00000  -1.58430   0.95873
    1.00000   1.00000  -0.00000   1.00000   0.97915  -0.00000

 g = 1
 </pre></div>


<p><strong class="strong">See also:</strong> sos2tf, zp2sos, sos2pz, zp2tf, tf2zp.
 </p></dd></dl>