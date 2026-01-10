---
layout: "default"
permalink: "/functions/10_sgolayfilt/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - sgolayfilt"
category: "Utility"
func_name: "sgolayfilt"
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
<dt class="deftypefn def-line" id="index-sgolayfilt"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code><a class="copiable-link" href="#index-sgolayfilt"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolayfilt-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>)</code><a class="copiable-link" href="#index-sgolayfilt-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolayfilt-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-sgolayfilt-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolayfilt-3"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>, <var class="var">n</var>, <var class="var">m</var>)</code><a class="copiable-link" href="#index-sgolayfilt-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolayfilt-4"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>, <var class="var">n</var>, <var class="var">m</var>, <var class="var">ts</var>)</code><a class="copiable-link" href="#index-sgolayfilt-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolayfilt-5"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>, <var class="var">n</var>, <var class="var">m</var>, <var class="var">ts</var>)</code><a class="copiable-link" href="#index-sgolayfilt-5"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolayfilt-6"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">f</var>)</code><a class="copiable-link" href="#index-sgolayfilt-6"></a></span></dt>
<dd><p>Smooth the data in x with a Savitsky-Golay smoothing filter of
 polynomial order p and length n, n odd, n &gt; p.  By default, p=3
 and n=p+2 or n=p+3 if p is even.
</p>
<p>If <var class="var">f</var> is given as a matrix, it is expected to be a filter as
 computed by <code class="code">sgolay</code>.
</p>
<p>These filters are particularly good at preserving lineshape while
 removing high frequency squiggles. Particularly, compare a 5 sample
 averager, an order 5 butterworth lowpass filter (cutoff 1/3) and
 sgolayfilt(x, 3, 5), the best cubic estimated from 5 points:
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> [b, a] = butter (5, 1/3);
 x = [zeros(1,15), 10*ones(1,10), zeros(1,15)];
 plot (sgolayfilt (x), &quot;r;sgolayfilt;&quot;, ...
       filtfilt (ones (1,5)/5, 1, x), &quot;g;5 sample average;&quot;, ...
       filtfilt (b, a, x), &quot;c;order 5 butterworth;&quot;, ...
       x, &quot;+b;original data;&quot;);
 </pre></div><pre class="example-preformatted"> </pre></div>


<p><strong class="strong">See also:</strong> sgolay.
 </p></dd></dl>