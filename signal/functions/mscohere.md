---
layout: "default"
permalink: "/functions/8_mscohere/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - mscohere"
category: "Utility"
func_name: "mscohere"
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
<dt class="deftypefn def-line" id="index-mscohere"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">Pxx</var>, <var class="var">freq</var>] =</code> <strong class="def-name">mscohere</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>)</code><a class="copiable-link" href="#index-mscohere"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mscohere-1"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">mscohere</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>)</code><a class="copiable-link" href="#index-mscohere-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mscohere-2"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">mscohere</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>)</code><a class="copiable-link" href="#index-mscohere-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mscohere-3"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">mscohere</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>)</code><a class="copiable-link" href="#index-mscohere-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mscohere-4"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">mscohere</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>, <var class="var">Fs</var>)</code><a class="copiable-link" href="#index-mscohere-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mscohere-5"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">mscohere</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>, <var class="var">Fs</var>, <var class="var">range</var>)</code><a class="copiable-link" href="#index-mscohere-5"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mscohere-6"><span class="category-def">Function File: </span><span><strong class="def-name">mscohere</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-mscohere-6"></a></span></dt>
<dd>
<p>Estimate (mean square) coherence of signals <var class="var">x</var> and <var class="var">y</var>.
 Use the Welch (1967) periodogram/FFT method.
 </p>
<p><strong class="strong">See also:</strong> pwelch.
 </p></dd></dl>