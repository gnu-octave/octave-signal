---
layout: "default"
permalink: "/functions/4_fir2/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - fir2"
category: "FIR Filter Design"
func_name: "fir2"
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
<dt class="deftypefn" id="index-fir2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">m</var>)</code><a class="copiable-link" href="#index-fir2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-fir2-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">m</var>, <var class="var">grid_n</var>)</code><a class="copiable-link" href="#index-fir2-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-fir2-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">m</var>, <var class="var">grid_n</var>, <var class="var">ramp_n</var>)</code><a class="copiable-link" href="#index-fir2-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-fir2-3"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">m</var>, <var class="var">grid_n</var>, <var class="var">ramp_n</var>, <var class="var">window</var>)</code><a class="copiable-link" href="#index-fir2-3"></a></span></dt>
<dd>
<p>Produce an order <var class="var">n</var> FIR filter with arbitrary frequency response
 <var class="var">m</var> over frequency bands <var class="var">f</var>, returning the <var class="var">n</var>+1 filter
 coefficients in <var class="var">b</var>.  The vector <var class="var">f</var> specifies the frequency band
 edges of the filter response and <var class="var">m</var> specifies the magnitude response
 at each frequency.
</p>
<p>The vector <var class="var">f</var> must be nondecreasing over the range [0,1], and the
 first and last elements must be 0 and 1, respectively.  A discontinuous
 jump in the frequency response can be specified by duplicating a band edge
 in <var class="var">f</var> with different values in <var class="var">m</var>.
</p>
<p>The resolution over which the frequency response is evaluated can be
 controlled with the <var class="var">grid_n</var> argument.  The default is 512 or the
 next larger power of 2 greater than the filter length.
</p>
<p>The band transition width for discontinuities can be controlled with the
 <var class="var">ramp_n</var> argument.  The default is <var class="var">grid_n</var>/25.  Larger values
 will result in wider band transitions but better stopband rejection.
</p>
<p>An optional shaping <var class="var">window</var> can be given as a vector with length
 <var class="var">n</var>+1.  If not specified, a Hamming window of length <var class="var">n</var>+1 is used.
</p>
<p>To apply the filter, use the return vector <var class="var">b</var> with the <code class="code">filter</code>
 function, for example <code class="code">y = filter (b, 1, x)</code>.
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> f = [0, 0.3, 0.3, 0.6, 0.6, 1]; m = [0, 0, 1, 1/2, 0, 0];
 [h, w] = freqz (fir2 (100, f, m));
 plot (f, m, &quot;;target response;&quot;, w/pi, abs (h), &quot;;filter response;&quot;);
 </pre></div>

<p><strong class="strong">See also:</strong> filter, fir1.
 </p></dd></dl>