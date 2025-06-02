---
layout: "default"
permalink: "/functions/7_besself/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - besself"
category: "IIR Filter Design"
func_name: "besself"
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
<dt class="deftypefn" id="index-besself"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">besself</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">w</var>)</code><a class="copiable-link" href="#index-besself"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-besself-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">besself</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">w</var>, &quot;high&quot;)</code><a class="copiable-link" href="#index-besself-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-besself-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">besself</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-besself-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-besself-3"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>] =</code> <strong class="def-name">besself</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-besself-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-besself-4"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">besself</strong> <code class="def-code-arguments">(&hellip;, &quot;z&quot;)</code><a class="copiable-link" href="#index-besself-4"></a></span></dt>
<dd><p>Generate a Bessel filter.
 Default is a Laplace space (s) filter.
</p>
<p>[b,a] = besself(n, Wc)
    low pass filter with cutoff pi*Wc radians
</p>
<p>[b,a] = besself(n, Wc, &rsquo;high&rsquo;)
    high pass filter with cutoff pi*Wc radians
</p>
<p>[z,p,g] = besself(...)
    return filter as zero-pole-gain rather than coefficients of the
    numerator and denominator polynomials.
</p>
<p>[...] = besself(...,&rsquo;z&rsquo;)
     return a discrete space (Z) filter, W must be less than 1.
</p>
<p>[a,b,c,d] = besself(...)
  return  state-space matrices
</p>
<p>References:
</p>
<p>Proakis &amp; Manolakis (1992). Digital Signal Processing. New York:
 Macmillan Publishing Company.
 </p></dd></dl>