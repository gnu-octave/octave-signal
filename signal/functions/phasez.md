---
layout: "default"
permalink: "/functions/6_phasez/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - phasez"
category: "Utility"
func_name: "phasez"
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
<dt class="deftypefn def-line" id="index-phasez"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">phi</var>, <var class="var">w</var>] =</code> <strong class="def-name">phasez</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-phasez"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phasez-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">phi</var>, <var class="var">w</var>] =</code> <strong class="def-name">phasez</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-phasez-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phasez-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">phi</var>, <var class="var">w</var>] =</code> <strong class="def-name">phasez</strong> <code class="def-code-arguments">(<var class="var">sos</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-phasez-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phasez-3"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">phi</var>, <var class="var">w</var>] =</code> <strong class="def-name">phasez</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code><a class="copiable-link" href="#index-phasez-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phasez-4"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">phi</var>, <var class="var">w</var>] =</code> <strong class="def-name">phasez</strong> <code class="def-code-arguments">(&hellip;, <var class="var">n</var>, &quot;whole&quot;)</code><a class="copiable-link" href="#index-phasez-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phasez-5"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">phi</var>, <var class="var">w</var>] =</code> <strong class="def-name">phasez</strong> <code class="def-code-arguments">(&hellip;, <var class="var">n</var>, Fs)</code><a class="copiable-link" href="#index-phasez-5"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phasez-6"><span class="category-def">Function File: </span><span><strong class="def-name">phasez</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-phasez-6"></a></span></dt>
<dd>
<p>Compute the phase response of digital filter defined either by its
 coefficients (<var class="var">b</var> and <var class="var">a</var> are the numerator and denominator
 coefficients respectively) or by its second-order sections representation,
 given by the matrix <var class="var">sos</var>. The output <var class="var">phi</var> is the phase response
 computed in a vector the vector of frequencies <var class="var">w</var>.
</p>
<p>The phase response is evaluated at <var class="var">n</var> angular frequencies between
 0 and
  pi.
  </p>
<p>If <var class="var">a</var> is omitted, the denominator is assumed to be 1 (this
 corresponds to a simple FIR filter).
</p>
<p>If <var class="var">n</var> is omitted, a value of 512 is assumed.
</p>
<p>If the third/forth argument, <code class="code">&quot;whole&quot;</code>, is given, the response is
 evaluated at <var class="var">n</var> angular frequencies between 0 and
  2*pi.
   It is possible also to pass the value <code class="code">&quot;half&quot;</code>, which will lead to
 the default behaviour.
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> [b, a] = butter (2, [.15,.3]);
 phasez (b, a);
 </pre></div>

<p>Ref [1] Oppenheim, Alan, and Ronald Schafer. Discrete-Time Signal Processing.
 3rd edition, Pearson, 2009.
</p>

<p><strong class="strong">See also:</strong> freqz, phasedelay.
 </p></dd></dl>