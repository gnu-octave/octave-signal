---
layout: "default"
permalink: "/functions/11_gaussdesign/"
pkg_name: "signal"
pkg_version: "1.4.8"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - gaussdesign"
category: "Utility"
func_name: "gaussdesign"
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
<dt class="deftypefn def-line" id="index-gaussdesign"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">h</var> =</code> <strong class="def-name">gaussdesign</strong> <code class="def-code-arguments">(<var class="var">bt</var>, <var class="var">span</var>, <var class="var">sps</var>)</code></span></dt>
<dd> 
<p>Design a Gaussian FIR pulse-shaping filter.
</p>
<p>The function returns the coefficients <var class="var">h</var> of a Gaussian finite impulse
 response (FIR) filter. The filter is designed to have a normalized bandwidth-symbol 
 time product <var class="var">bt</var>, a specified duration <var class="var">span</var> in symbol intervals, and
 a given number of samples per symbol <var class="var">sps</var>.
</p>
<p><strong class="strong">Inputs</strong>
</p>
<dl class="table">
<dt><var class="var">bt</var></dt>
<dd><p>Bandwidth-symbol time product. A smaller <var class="var">bt</var> yields a narrower
 frequency response but longer impulse response.
</p>
</dd>
<dt><var class="var">span</var></dt>
<dd><p>Filter duration in symbol intervals. Default is 3.
</p>
</dd>
<dt><var class="var">sps</var></dt>
<dd><p>Number of samples per symbol. It defines the oversampling factor.
 Default is 2.
 </p></dd>
</dl>

<p><strong class="strong">Outputs</strong>
</p>
<dl class="table">
<dt><var class="var">h</var></dt>
<dd><p>Normalized FIR filter coefficients.
 </p></dd>
</dl>


<p><strong class="strong">See also:</strong> gaussian, rcosdesign.
 </p></dd></dl>{% endraw %}