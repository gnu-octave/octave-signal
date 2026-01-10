---
layout: "default"
permalink: "/functions/5_chirp/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - chirp"
category: "Utility"
func_name: "chirp"
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
<dt class="deftypefn def-line" id="index-chirp"><span class="category-def">Function File: </span><span><strong class="def-name">chirp</strong> <code class="def-code-arguments">(<var class="var">t</var>)</code><a class="copiable-link" href="#index-chirp"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-chirp-1"><span class="category-def">Function File: </span><span><strong class="def-name">chirp</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">f0</var>)</code><a class="copiable-link" href="#index-chirp-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-chirp-2"><span class="category-def">Function File: </span><span><strong class="def-name">chirp</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">f0</var>, <var class="var">t1</var>)</code><a class="copiable-link" href="#index-chirp-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-chirp-3"><span class="category-def">Function File: </span><span><strong class="def-name">chirp</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">f0</var>, <var class="var">t1</var>, <var class="var">f1</var>)</code><a class="copiable-link" href="#index-chirp-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-chirp-4"><span class="category-def">Function File: </span><span><strong class="def-name">chirp</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">f0</var>, <var class="var">t1</var>, <var class="var">f1</var>, <var class="var">shape</var>)</code><a class="copiable-link" href="#index-chirp-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-chirp-5"><span class="category-def">Function File: </span><span><strong class="def-name">chirp</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">f0</var>, <var class="var">t1</var>, <var class="var">f1</var>, <var class="var">shape</var>, <var class="var">phase</var>)</code><a class="copiable-link" href="#index-chirp-5"></a></span></dt>
<dd>
<p>Evaluate a chirp signal at time <var class="var">t</var>.  A chirp signal is a frequency
 swept cosine wave.
</p>
<dl class="table">
<dt><var class="var">t</var></dt>
<dd><p>vector of times to evaluate the chirp signal
 </p></dd>
<dt><var class="var">f0</var></dt>
<dd><p>frequency at time t=0 [ 0 Hz ]
 </p></dd>
<dt><var class="var">t1</var></dt>
<dd><p>time t1 [ 1 sec ]
 </p></dd>
<dt><var class="var">f1</var></dt>
<dd><p>frequency at time t=t1 [ 100 Hz ]
 </p></dd>
<dt><var class="var">shape</var></dt>
<dd><p>shape of frequency sweep
    &rsquo;linear&rsquo;      f(t) = (f1-f0)*(t/t1) + f0
    &rsquo;quadratic&rsquo;   f(t) = (f1-f0)*(t/t1)^2 + f0
    &rsquo;logarithmic&rsquo; f(t) = (f1/f0)^(t/t1) * f0
 </p></dd>
<dt><var class="var">phase</var></dt>
<dd><p>phase shift at t=0
 </p></dd>
</dl>

<p>For example:
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted">  specgram (chirp ([0:0.001:5]));  # default linear chirp of 0-100Hz in 1 sec
 specgram (chirp ([-2:0.001:15], 400, 10, 100, &quot;quadratic&quot;));
 soundsc (chirp ([0:1/8000:5], 200, 2, 500, &quot;logarithmic&quot;), 8000);
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>If you want a different sweep shape f(t), use the following:
</p>
<pre class="verbatim"> y = cos (2 * pi * integral (f(t)) + phase);
 </pre></dd></dl>