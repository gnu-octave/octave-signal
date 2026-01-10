---
layout: "default"
permalink: "/functions/7_marcumq/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - marcumq"
category: "Utility"
func_name: "marcumq"
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
<dt class="deftypefn def-line" id="index-marcumq"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">q</var> =</code> <strong class="def-name">marcumq</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>)</code><a class="copiable-link" href="#index-marcumq"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-marcumq-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">q</var> =</code> <strong class="def-name">marcumq</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>, <var class="var">m</var>)</code><a class="copiable-link" href="#index-marcumq-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-marcumq-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">q</var> =</code> <strong class="def-name">marcumq</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>, <var class="var">m</var>, <var class="var">tol</var>)</code><a class="copiable-link" href="#index-marcumq-2"></a></span></dt>
<dd>
<p>Compute the generalized Marcum Q function of order <var class="var">m</var> with
 noncentrality parameter <var class="var">a</var> and argument <var class="var">b</var>.  If the order
 <var class="var">m</var> is omitted it defaults to 1.  An optional relative tolerance
 <var class="var">tol</var> may be included, the default is <code class="code">eps</code>.
</p>
<p>If the input arguments are commensurate vectors, this function
 will produce a table of values.
</p>
<p>This function computes Marcum&rsquo;s Q function using the infinite
 Bessel series, truncated when the relative error is less than
 the specified tolerance.  The accuracy is limited by that of
 the Bessel functions, so reducing the tolerance is probably
 not useful.
</p>
<p>Reference: Marcum, &quot;Tables of Q Functions&quot;, Rand Corporation.
</p>
<p>Reference: R.T. Short, &quot;Computation of Noncentral Chi-squared
 and Rice Random Variables&quot;, www.phaselockedsystems.com/publications
</p>
</dd></dl>