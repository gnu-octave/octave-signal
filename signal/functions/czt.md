---
layout: "default"
permalink: "/functions/3_czt/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - czt"
category: "Transforms"
func_name: "czt"
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
<dt class="deftypefn" id="index-czt"><span class="category-def">Function File: </span><span><strong class="def-name">czt</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code><a class="copiable-link" href="#index-czt"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-czt-1"><span class="category-def">Function File: </span><span><strong class="def-name">czt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">m</var>)</code><a class="copiable-link" href="#index-czt-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-czt-2"><span class="category-def">Function File: </span><span><strong class="def-name">czt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">m</var>, <var class="var">w</var>)</code><a class="copiable-link" href="#index-czt-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-czt-3"><span class="category-def">Function File: </span><span><strong class="def-name">czt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">m</var>, <var class="var">w</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-czt-3"></a></span></dt>
<dd><p>Chirp z-transform.  Compute the frequency response starting at a and
 stepping by w for m steps.  a is a point in the complex plane, and
 w is the ratio between points in each step (i.e., radius increases
 exponentially, and angle increases linearly).
</p>
<p>To evaluate the frequency response for the range f1 to f2 in a signal
 with sampling frequency Fs, use the following:
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> m = 32;                               ## number of points desired
 w = exp(-j*2*pi*(f2-f1)/((m-1)*Fs));  ## freq. step of f2-f1/m
 a = exp(j*2*pi*f1/Fs);                ## starting at frequency f1
 y = czt(x, m, w, a);
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>If you don&rsquo;t specify them, then the parameters default to a Fourier
 transform:
     m=length(x), w=exp(-j*2*pi/m), a=1
</p>
<p>If x is a matrix, the transform will be performed column-by-column.
 </p></dd></dl>