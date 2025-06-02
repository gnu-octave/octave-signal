---
layout: "default"
permalink: "/functions/8_pulstran/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - pulstran"
category: "Signals"
func_name: "pulstran"
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
<dt class="deftypefn" id="index-pulstran"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">pulstran</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">d</var>, <var class="var">func</var>, &hellip;)</code><a class="copiable-link" href="#index-pulstran"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-pulstran-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">pulstran</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">d</var>, <var class="var">p</var>)</code><a class="copiable-link" href="#index-pulstran-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-pulstran-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">pulstran</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">d</var>, <var class="var">p</var>, <var class="var">Fs</var>)</code><a class="copiable-link" href="#index-pulstran-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-pulstran-3"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">pulstran</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">d</var>, <var class="var">p</var>, <var class="var">Fs</var>, <var class="var">method</var>)</code><a class="copiable-link" href="#index-pulstran-3"></a></span></dt>
<dd>
<p>Generate the signal y=sum(func(t+d,...)) for each d.  If d is a
 matrix of two columns, the first column is the delay d and the second
 column is the amplitude a, and y=sum(a*func(t+d)) for each d,a.
 Clearly, func must be a function which accepts a vector of times.
 Any extra arguments needed for the function must be tagged on the end.
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> fs = 11025;  # arbitrary sample rate
 f0 = 100;    # pulse train sample rate
 w = 0.001;   # pulse width of 1 millisecond
 auplot (pulstran (0:1/fs:0.1, 0:1/f0:0.1, &quot;rectpuls&quot;, w), fs);
 </pre></div>

<p>If instead of a function name you supply a pulse shape sampled at
 frequency Fs (default 1 Hz),  an interpolated version of the pulse
 is added at each delay d.  The interpolation stays within the the
 time range of the delayed pulse.  The interpolation method defaults
 to linear, but it can be any interpolation method accepted by the
 function interp1.
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> fs = 11025;      # arbitrary sample rate
 f0 = 100;        # pulse train sample rate
 w = boxcar(10);  # pulse width of 1 millisecond at 10 kHz
 auplot (pulstran (0:1/fs:0.1, 0:1/f0:0.1, w, 10000), fs);
 </pre></div>
</dd></dl>