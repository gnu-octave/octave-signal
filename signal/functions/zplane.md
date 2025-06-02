---
layout: "default"
permalink: "/functions/6_zplane/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - zplane"
category: "Filter Analysis"
func_name: "zplane"
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
<dt class="deftypefn" id="index-zplane"><span class="category-def">Function File: </span><span><strong class="def-name">zplane</strong> <code class="def-code-arguments">(<var class="var">z</var>, <var class="var">p</var>)</code><a class="copiable-link" href="#index-zplane"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-zplane-1"><span class="category-def">Function File: </span><span><strong class="def-name">zplane</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-zplane-1"></a></span></dt>
<dd><p>Plot the poles and zeros on a complex plane.  If the arguments are column
 vectors <var class="var">z</var> and <var class="var">p</var>, the complex zeros <var class="var">z</var> and poles <var class="var">p</var>
 are displayed. If the arguments are row vectors <var class="var">b</var> and <var class="var">a</var>, the
 zeros and poles of the transfer function represented by these filter
 coefficients are displayed.
</p>
<p>If <var class="var">z</var> and <var class="var">p</var> are matrices, the columns are distinct sets of zeros
 and poles and are displayed together in distinct colors.
</p>
<p>Note that due to the nature of the <code class="code">roots</code> function, poles and zeros
 may be displayed as occurring around a circle rather than at a single
 point.
</p>
<p>The transfer function is
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted">        B(z)   b0 + b1 z^(-1) + b2 z^(-2) + ... + bM z^(-M)
 H(z) = ---- = --------------------------------------------
        A(z)   a0 + a1 z^(-1) + a2 z^(-2) + ... + aN z^(-N)

               b0          (z - z1) (z - z2) ... (z - zM)
             = -- z^(-M+N) ------------------------------
               a0          (z - p1) (z - p2) ... (z - pN)
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>If called with only one argument, the poles <var class="var">p</var> defaults to an empty
 vector, and the denominator coefficient vector <var class="var">a</var> defaults to 1.
 </p></dd></dl>