---
layout: "default"
permalink: "/functions/4_impz/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - impz"
category: "Filter Analysis"
func_name: "impz"
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
<dt class="deftypefn" id="index-impz"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">x</var>, <var class="var">t</var>] =</code> <strong class="def-name">impz</strong> <code class="def-code-arguments">(<var class="var">b</var>)</code><a class="copiable-link" href="#index-impz"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-impz-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">x</var>, <var class="var">t</var>] =</code> <strong class="def-name">impz</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-impz-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-impz-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">x</var>, <var class="var">t</var>] =</code> <strong class="def-name">impz</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-impz-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-impz-3"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">x</var>, <var class="var">t</var>] =</code> <strong class="def-name">impz</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">n</var>, <var class="var">fs</var>)</code><a class="copiable-link" href="#index-impz-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-impz-4"><span class="category-def">Function File: </span><span><strong class="def-name">impz</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-impz-4"></a></span></dt>
<dd>
<p>Generate impulse-response characteristics of the filter. The filter
 coefficients correspond to the the z-plane rational function with
 numerator b and denominator a.  If a is not specified, it defaults to
 1. If n is not specified, or specified as [], it will be chosen such
 that the signal has a chance to die down to -120dB, or to not explode
 beyond 120dB, or to show five periods if there is no significant
 damping. If no return arguments are requested, plot the results.
</p>

<p><strong class="strong">See also:</strong> freqz, zplane.
 </p></dd></dl>