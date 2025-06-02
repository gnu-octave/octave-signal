---
layout: "default"
permalink: "/functions/8_cheb2ord/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - cheb2ord"
category: "IIR Filter Design"
func_name: "cheb2ord"
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
<dt class="deftypefn" id="index-cheb2ord"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">cheb2ord</strong> <code class="def-code-arguments">(<var class="var">wp</var>, <var class="var">ws</var>, <var class="var">rp</var>, <var class="var">rs</var>)</code><a class="copiable-link" href="#index-cheb2ord"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-cheb2ord-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">cheb2ord</strong> <code class="def-code-arguments">([<var class="var">wp1</var>, <var class="var">wp2</var>], [<var class="var">ws1</var>, <var class="var">ws2</var>], <var class="var">rp</var>, <var class="var">rs</var>)</code><a class="copiable-link" href="#index-cheb2ord-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-cheb2ord-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">cheb2ord</strong> <code class="def-code-arguments">([<var class="var">wp1</var>, <var class="var">wp2</var>], [<var class="var">ws1</var>, <var class="var">ws2</var>], <var class="var">rp</var>, <var class="var">rs</var>, &quot;s&quot;)</code><a class="copiable-link" href="#index-cheb2ord-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-cheb2ord-3"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">n</var>, <var class="var">wc_s</var>] =</code> <strong class="def-name">cheb2ord</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-cheb2ord-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-cheb2ord-4"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">n</var>, <var class="var">wc_s</var>, <var class="var">wc_p</var>] =</code> <strong class="def-name">cheb2ord</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-cheb2ord-4"></a></span></dt>
<dd><p>Compute the minimum filter order of a Chebyshev type II filter with the
 desired response characteristics. The filter frequency band edges are
 specified by the passband frequency <var class="var">wp</var> and stopband frequency <var class="var">ws</var>.
 Frequencies are normalized to the Nyquist frequency in the range [0,1].
 <var class="var">rp</var> is the allowable passband ripple measured in decibels, and <var class="var">rs</var>
 is the minimum attenuation in the stop band, also in decibels.
</p>
<p>The output arguments <var class="var">n</var> and <var class="var">wc_p</var> (or <var class="var">n</var> and <var class="var">wc_s</var>) can
 be given as inputs to <code class="code">cheby2</code>.
 Using <var class="var">wc_p</var> makes the filter characteristic touch at least one pass band
 corner and using <var class="var">wc_s</var> makes the characteristic touch at least one
 stop band corner.
</p>
<p>If <var class="var">wp</var> and <var class="var">ws</var> are scalars, then <var class="var">wp</var> is the passband cutoff
 frequency and <var class="var">ws</var> is the stopband edge frequency.  If <var class="var">ws</var> is
 greater than <var class="var">wp</var>, the filter is a low-pass filter.  If <var class="var">wp</var> is
 greater than <var class="var">ws</var>, the filter is a high-pass filter.
</p>
<p>If <var class="var">wp</var> and <var class="var">ws</var> are vectors of length 2, then <var class="var">wp</var> defines the
 passband interval and <var class="var">ws</var> defines the stopband interval.  If <var class="var">wp</var>
 is contained within <var class="var">ws</var> (<var class="var">ws1</var> &lt; <var class="var">wp1</var> &lt; <var class="var">wp2</var> &lt; <var class="var">ws2</var>),
 the filter is a band-pass filter.  If <var class="var">ws</var> is contained within <var class="var">wp</var>
 (<var class="var">wp1</var> &lt; <var class="var">ws1</var> &lt; <var class="var">ws2</var> &lt; <var class="var">wp2</var>), the filter is a band-stop
 or band-reject filter.
</p>
<p>If the optional argument <code class="code">&quot;s&quot;</code> is given, the minimum order for an analog
 elliptic filter is computed.  All frequencies <var class="var">wp</var> and <var class="var">ws</var> are
 specified in radians per second.
 </p>
<p><strong class="strong">See also:</strong> buttord, cheb1ord, cheby2, ellipord.
 </p></dd></dl>