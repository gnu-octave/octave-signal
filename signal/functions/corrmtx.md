---
layout: "default"
permalink: "/functions/7_corrmtx/"
pkg_name: "signal"
pkg_version: "1.4.8"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - corrmtx"
category: "Utility"
func_name: "corrmtx"
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
- id: "8_Plotting"
  name: "&nbsp;&nbsp;Plotting"
  url: "/functions/#8_Plotting"
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
<dt class="deftypefn def-line" id="index-corrmtx"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">H</var> =</code> <strong class="def-name">corrmtx</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">m</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-corrmtx-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">H</var> =</code> <strong class="def-name">corrmtx</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">m</var>, <var class="var">method</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-corrmtx-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">H</var>, <var class="var">R</var>] =</code> <strong class="def-name">corrmtx</strong> <code class="def-code-arguments">(&hellip;)</code></span></dt>
<dd><p>Build a data matrix for autocorrelation matrix estimation.
</p>
<p>Given a vector <var class="var">x</var> of length <em class="math">N</em> and a model order <var class="var">m</var>,
 compute the rectangular Toeplitz matrix <var class="var">H</var> such that <var class="var">H</var>&rsquo;*<var class="var">H</var>
 is a biased estimate of the autocorrelation matrix. The size of <var class="var">H</var>
 depends on the selected <var class="var">method</var>:
</p>
<dl class="table">
<dt>&rsquo;autocorrelation&rsquo; (default)</dt>
<dd><p>Uses both prewindowed and postwindowed data.
</p>
</dd>
<dt>&rsquo;prewindowed&rsquo;</dt>
<dd><p>Uses prewindowed data only.
</p>
</dd>
<dt>&rsquo;postwindowed&rsquo;</dt>
<dd><p>Uses postwindowed data only.
</p>
</dd>
<dt>&rsquo;covariance&rsquo;</dt>
<dd><p>Uses nonwindowed data.
</p>
</dd>
<dt>&rsquo;modified&rsquo;</dt>
<dd><p>Uses forward and backward prediction error estimates.
 </p></dd>
</dl>

<p>The optional second output <var class="var">R</var> is the biased autocorrelation matrix
 estimate <var class="var">H</var>&rsquo;*<var class="var">H</var>.
</p>

<p><strong class="strong">See also:</strong> aryule.
 </p></dd></dl>