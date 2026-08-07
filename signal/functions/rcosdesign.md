---
layout: "default"
permalink: "/functions/10_rcosdesign/"
pkg_name: "signal"
pkg_version: "1.4.8"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - rcosdesign"
category: "Utility"
func_name: "rcosdesign"
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
<dt class="deftypefn def-line" id="index-rcosdesign"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">rcosdesign</strong> <code class="def-code-arguments">(<var class="var">beta</var>, <var class="var">span</var>, <var class="var">sps</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-rcosdesign-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">rcosdesign</strong> <code class="def-code-arguments">(<var class="var">beta</var>, <var class="var">span</var>, <var class="var">sps</var>, <var class="var">shape</var>)</code></span></dt>
<dd>
<p>Design a raised cosine FIR filter.
</p>
<p>The filter coefficients <var class="var">b</var> are returned as a row vector of length
 <code class="code"><var class="var">sps</var> * <var class="var">span</var> + 1</code>. The roll-off factor <var class="var">beta</var>
 controls the excess bandwidth and must be in the range [0, 1]. The
 filter is truncated to <var class="var">span</var> symbol periods, with <var class="var">sps</var>
 samples per symbol.
</p>
<p>The optional argument <var class="var">shape</var> selects the raised cosine variant:
</p>
<dl class="table">
<dt><code class="code">&quot;sqrt&quot;</code> (default)</dt>
<dd><p>Square-root raised cosine filter. When two such filters are used in
 cascade (e.g., one at the transmitter and one at the receiver), the
 combined response matches a normal raised cosine filter.
</p>
</dd>
<dt><code class="code">&quot;normal&quot;</code></dt>
<dd><p>Normal (full) raised cosine filter. This filter satisfies the Nyquist
 criterion for zero intersymbol interference, with zero crossings at
 multiples of the symbol period.
 </p></dd>
</dl>


<p><strong class="strong">See also:</strong> gaussdesign.
 </p></dd></dl>{% endraw %}