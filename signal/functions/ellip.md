---
layout: "default"
permalink: "/functions/5_ellip/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - ellip"
category: "IIR Filter Design"
func_name: "ellip"
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
<dt class="deftypefn" id="index-ellip"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rp</var>, <var class="var">rs</var>, <var class="var">wp</var>)</code><a class="copiable-link" href="#index-ellip"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-ellip-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rp</var>, <var class="var">rs</var>, <var class="var">wp</var>, &quot;high&quot;)</code><a class="copiable-link" href="#index-ellip-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-ellip-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rp</var>, <var class="var">rs</var>, [<var class="var">wl</var>, <var class="var">wh</var>])</code><a class="copiable-link" href="#index-ellip-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-ellip-3"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rp</var>, <var class="var">rs</var>, [<var class="var">wl</var>, <var class="var">wh</var>], &quot;stop&quot;)</code><a class="copiable-link" href="#index-ellip-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-ellip-4"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-ellip-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-ellip-5"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-ellip-5"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-ellip-6"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(&hellip;, &quot;s&quot;)</code><a class="copiable-link" href="#index-ellip-6"></a></span></dt>
<dd>
<p>Generate an elliptic or Cauer filter with <var class="var">rp</var> dB of passband ripple and
 <var class="var">rs</var> dB of stopband attenuation.
</p>
<p>[b,a] = ellip(n, Rp, Rs, Wp)
  low pass filter with order n, cutoff pi*Wp radians, Rp decibels
  of ripple in the passband and a stopband Rs decibels down.
</p>
<p>[b,a] = ellip(n, Rp, Rs, Wp, &rsquo;high&rsquo;)
  high pass filter with cutoff pi*Wp...
</p>
<p>[b,a] = ellip(n, Rp, Rs, [Wl, Wh])
  band pass filter with band pass edges pi*Wl and pi*Wh ...
</p>
<p>[b,a] = ellip(n, Rp, Rs, [Wl, Wh], &rsquo;stop&rsquo;)
  band reject filter with edges pi*Wl and pi*Wh, ...
</p>
<p>[z,p,g] = ellip(...)
  return filter as zero-pole-gain.
</p>
<p>[...] = ellip(...,&rsquo;s&rsquo;)
     return a Laplace space filter, W can be larger than 1.
</p>
<p>[a,b,c,d] = ellip(...)
  return  state-space matrices
</p>
<p>References:
</p>
<p>- Oppenheim, Alan V., Discrete Time Signal Processing, Hardcover, 1999.
 - Parente Ribeiro, E., Notas de aula da disciplina TE498 -  Processamento
   Digital de Sinais, UFPR, 2001/2002.
 </p></dd></dl>