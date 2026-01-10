---
layout: "default"
permalink: "/functions/6_butter/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - butter"
category: "Utility"
func_name: "butter"
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
<dt class="deftypefn def-line" id="index-butter"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">butter</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">wc</var>)</code><a class="copiable-link" href="#index-butter"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-butter-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">butter</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">wc</var>, <var class="var">filter_type</var>)</code><a class="copiable-link" href="#index-butter-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-butter-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">butter</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-butter-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-butter-3"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>] =</code> <strong class="def-name">butter</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-butter-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-butter-4"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">butter</strong> <code class="def-code-arguments">(&hellip;, &quot;s&quot;)</code><a class="copiable-link" href="#index-butter-4"></a></span></dt>
<dd><p>Generate a Butterworth filter.
 Default is a discrete space (Z) filter.
</p>
<p>The cutoff frequency, <var class="var">wc</var> should be specified in radians for
 analog filters.  For digital filters, it must be a value between zero
 and one.  For bandpass filters, <var class="var">wc</var> is a two-element vector
 with <code class="code">w(1) &lt; w(2)</code>.
</p>
<p>The filter type must be one of <code class="code">&quot;low&quot;</code>, <code class="code">&quot;high&quot;</code>,
 <code class="code">&quot;bandpass&quot;</code>, or <code class="code">&quot;stop&quot;</code>.  The default is <code class="code">&quot;low&quot;</code>
 if <var class="var">wc</var> is a scalar and <code class="code">&quot;bandpass&quot;</code> if <var class="var">wc</var> is a
 two-element vector.
</p>
<p>If the final input argument is <code class="code">&quot;s&quot;</code> design an analog Laplace
 space filter.
</p>
<p>Low pass filter with cutoff <code class="code">pi*Wc</code> radians:
</p>
<div class="example">
<pre class="example-preformatted"> [b, a] = butter (n, Wc)
 </pre></div>

<p>High pass filter with cutoff <code class="code">pi*Wc</code> radians:
</p>
<div class="example">
<pre class="example-preformatted"> [b, a] = butter (n, Wc, &quot;high&quot;)
 </pre></div>

<p>Band pass filter with edges <code class="code">pi*Wl</code> and <code class="code">pi*Wh</code> radians:
</p>
<div class="example">
<pre class="example-preformatted"> [b, a] = butter (n, [Wl, Wh])
 </pre></div>

<p>Band reject filter with edges <code class="code">pi*Wl</code> and <code class="code">pi*Wh</code> radians:
</p>
<div class="example">
<pre class="example-preformatted"> [b, a] = butter (n, [Wl, Wh], &quot;stop&quot;)
 </pre></div>

<p>Return filter as zero-pole-gain rather than coefficients of the
 numerator and denominator polynomials:
</p>
<div class="example">
<pre class="example-preformatted"> [z, p, g] = butter (...)
 </pre></div>

<p>Return a Laplace space filter, <var class="var">Wc</var> can be larger than 1:
</p>
<div class="example">
<pre class="example-preformatted"> [...] = butter (..., &quot;s&quot;)
 </pre></div>

<p>Return state-space matrices:
</p>
<div class="example">
<pre class="example-preformatted"> [a, b, c, d] = butter (...)
 </pre></div>

<p>References:
</p>
<p>Proakis &amp; Manolakis (1992). Digital Signal Processing. New York:
 Macmillan Publishing Company.
 </p></dd></dl>