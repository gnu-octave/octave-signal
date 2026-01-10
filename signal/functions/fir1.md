---
layout: "default"
permalink: "/functions/4_fir1/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - fir1"
category: "Utility"
func_name: "fir1"
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
<dt class="deftypefn def-line" id="index-fir1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir1</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">w</var>)</code><a class="copiable-link" href="#index-fir1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fir1-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir1</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">w</var>, <var class="var">type</var>)</code><a class="copiable-link" href="#index-fir1-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fir1-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir1</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">w</var>, <var class="var">type</var>, <var class="var">window</var>)</code><a class="copiable-link" href="#index-fir1-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fir1-3"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir1</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">w</var>, <var class="var">type</var>, <var class="var">window</var>, <var class="var">noscale</var>)</code><a class="copiable-link" href="#index-fir1-3"></a></span></dt>
<dd>
<p>Produce an order <var class="var">n</var> FIR filter with the given frequency cutoff <var class="var">w</var>,
 returning the <var class="var">n</var>+1 filter coefficients in <var class="var">b</var>.  If <var class="var">w</var> is a
 scalar, it specifies the frequency cutoff for a lowpass or highpass filter.
 If <var class="var">w</var> is a two-element vector, the two values specify the edges of a
 bandpass or bandstop filter.  If <var class="var">w</var> is an N-element vector, each
 value specifies a band edge of a multiband pass/stop filter.
</p>
<p>The filter <var class="var">type</var> can be specified with one of the following strings:
 &quot;low&quot;, &quot;high&quot;, &quot;stop&quot;, &quot;pass&quot;, &quot;bandpass&quot;, &quot;DC-0&quot;, or &quot;DC-1&quot;.  The default
 is &quot;low&quot; is <var class="var">w</var> is a scalar, &quot;pass&quot; if <var class="var">w</var> is a pair, or &quot;DC-0&quot; if
 <var class="var">w</var> is a vector with more than 2 elements.
</p>
<p>An optional shaping <var class="var">window</var> can be given as a vector with length
 <var class="var">n</var>+1.  If not specified, a Hamming window of length <var class="var">n</var>+1 is used.
</p>
<p>With the option &quot;noscale&quot;, the filter coefficients are not normalized. The
 default is to normalize the filter such that the magnitude response of the
 center of the first passband is 1.
</p>
<p>To apply the filter, use the return vector <var class="var">b</var> with the <code class="code">filter</code>
 function, for example <code class="code">y = filter (b, 1, x)</code>.
</p>
<p>Examples:
 </p><div class="example">
<pre class="example-preformatted"> freqz (fir1 (40, 0.3));
 freqz (fir1 (15, [0.2, 0.5], &quot;stop&quot;));  # note the zero-crossing at 0.1
 freqz (fir1 (15, [0.2, 0.5], &quot;stop&quot;, &quot;noscale&quot;));
 </pre></div>

<p><strong class="strong">See also:</strong> filter, fir2.
 </p></dd></dl>