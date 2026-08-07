---
layout: "default"
permalink: "/functions/10_impzlength/"
pkg_name: "signal"
pkg_version: "1.4.8"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - impzlength"
category: "Utility"
func_name: "impzlength"
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
- id: "8_Plotting"
  name: "&nbsp;&nbsp;Plotting"
  url: "/functions/#8_Plotting"
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
{% raw %}<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-impzlength"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">len</var> =</code> <strong class="def-name">impzlength</strong> <code class="def-code-arguments">(<var class="var">b</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-impzlength-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">len</var> =</code> <strong class="def-name">impzlength</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-impzlength-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">len</var> =</code> <strong class="def-name">impzlength</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-impzlength-3"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">len</var> =</code> <strong class="def-name">impzlength</strong> <code class="def-code-arguments">(&hellip;, <var class="var">tol</var>)</code></span></dt>
<dd><p>Return the impulse response length of the specified filter.
</p>
<p>For a finite impulse response (FIR) filter specified by the numerator
 coefficients <var class="var">b</var>, the length is simply the number of coefficients
 in <var class="var">b</var>.
</p>
<p>For an infinite impulse response (IIR) filter specified by the numerator
 <var class="var">b</var> and denominator <var class="var">a</var> polynomials in z^-1, the function
 computes an effective impulse response sequence length.
</p>
<p>The filter can also be specified by a <var class="var">K</var>-by-6 second-order sections
 matrix <var class="var">sos</var>, where <var class="var">K</var> is the number of sections.  In this case,
 the matrix is converted to transfer function form <var class="var">b</var> and <var class="var">a</var>
 before computing the length.
</p>
<p>The algorithm proceeds as follows:
</p>
<ol class="enumerate">
<li> If the filter is FIR, the length is simply length (<var class="var">b</var>).

</li><li> The poles of the transfer function are computed as the roots of the
 denominator polynomial <var class="var">a</var>.

</li><li> The multiplicity of the dominant pole (the pole with the largest
 magnitude) is determined by counting poles at the same complex
 coordinate within tolerance.

</li><li> For a stable IIR filter (dominant pole magnitude <em class="math">&lt; 1 - 10^{-5}</em>),
 the effective length is estimated as

<p><code class="code">floor (M * log10 (tol) / log10 (maxpole)) + delay</code>
</p>
<p>where <em class="math">M</em> is the multiplicity of the dominant pole and <em class="math">d</em>
 is the initial delay (number of leading zeros in <var class="var">b</var>).
</p>
</li><li> For an unstable IIR filter (dominant pole magnitude <em class="math">&gt; 1 + 10^{-4}</em>),
 a heuristic formula is used:

<p><code class="code">floor (6 / log10 (maxpole))</code>
</p>
</li><li> For filters with poles near the unit circle (oscillatory behavior), the
 length is the maximum of: five periods of the slowest oscillation,
 and the decay length of damped poles, plus the initial delay.

</li></ol>

<p>The optional argument <var class="var">tol</var> specifies the tolerance used to
 estimate the effective length of an IIR filter&rsquo;s impulse response.
 The default tolerance is 5e-5.  Increasing <var class="var">tol</var> estimates a
 shorter effective length, while decreasing <var class="var">tol</var> produces a longer
 effective length.
</p>
<p>The returned value <var class="var">len</var> is the effective impulse response length
 of the specified filter.  This function is used by <code class="code">impz</code> and
 <code class="code">stepz</code> to determine the number of points to plot.
</p>

<p><strong class="strong">See also:</strong> impz, stepz.
 </p></dd></dl>{% endraw %}