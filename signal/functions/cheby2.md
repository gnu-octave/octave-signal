---
layout: "default"
permalink: "/functions/6_cheby2/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - cheby2"
category: "IIR Filter Design"
func_name: "cheby2"
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
<dt class="deftypefn" id="index-cheby2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rs</var>, <var class="var">wc</var>)</code><a class="copiable-link" href="#index-cheby2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-cheby2-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rs</var>, <var class="var">wc</var>, &quot;high&quot;)</code><a class="copiable-link" href="#index-cheby2-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-cheby2-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rs</var>, [<var class="var">wl</var>, <var class="var">wh</var>])</code><a class="copiable-link" href="#index-cheby2-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-cheby2-3"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rs</var>, [<var class="var">wl</var>, <var class="var">wh</var>], &quot;stop&quot;)</code><a class="copiable-link" href="#index-cheby2-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-cheby2-4"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-cheby2-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-cheby2-5"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-cheby2-5"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-cheby2-6"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(&hellip;, &quot;s&quot;)</code><a class="copiable-link" href="#index-cheby2-6"></a></span></dt>
<dd><p>Generate a Chebyshev type II filter with <var class="var">rs</var> dB of stopband attenuation.
</p>
<p>[b, a] = cheby2(n, Rs, Wc)
    low pass filter with cutoff pi*Wc radians
</p>
<p>[b, a] = cheby2(n, Rs, Wc, &rsquo;high&rsquo;)
    high pass filter with cutoff pi*Wc radians
</p>
<p>[b, a] = cheby2(n, Rs, [Wl, Wh])
    band pass filter with edges pi*Wl and pi*Wh radians
</p>
<p>[b, a] = cheby2(n, Rs, [Wl, Wh], &rsquo;stop&rsquo;)
    band reject filter with edges pi*Wl and pi*Wh radians
</p>
<p>[z, p, g] = cheby2(...)
    return filter as zero-pole-gain rather than coefficients of the
    numerator and denominator polynomials.
</p>
<p>[...] = cheby2(...,&rsquo;s&rsquo;)
     return a Laplace space filter, W can be larger than 1.
</p>
<p>[a,b,c,d] = cheby2(...)
  return  state-space matrices
</p>
<p>References:
</p>
<p>Parks &amp; Burrus (1987). Digital Filter Design. New York:
 John Wiley &amp; Sons, Inc.
 </p></dd></dl>