---
layout: "default"
permalink: "/functions/7_upfirdn/"
pkg_name: "signal"
pkg_version: "1.4.8"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - upfirdn"
category: "Utility"
func_name: "upfirdn"
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
<dt class="deftypefn def-line" id="index-upfirdn"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">upfirdn</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">h</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-upfirdn-1"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">upfirdn</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">h</var>, <var class="var">p</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-upfirdn-2"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">upfirdn</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">h</var>, <var class="var">p</var>, <var class="var">q</var>)</code></span></dt>
<dd><p>Upsample, FIR filtering, and downsample.
</p>
<p><var class="var">x</var> is the input and <var class="var">y</var> is the output. The function performs three operations:
</p><ol class="enumerate">
<li> Upsample the input <var class="var">x</var> by a factor of <var class="var">p</var> (insert zeros).
</li><li> FIR filter the upsampled signal with the impulse response <var class="var">h</var>.
</li><li> Downsample the result by a factor of <var class="var">q</var> (keep every <var class="var">q</var>-th sample).
</li></ol>

<p>Other input parameters:
</p>
<dl class="table">
<dt><var class="var">h</var></dt>
<dd><p>FIR filter impulse response, specified as a vector.  The filter is applied
after upsampling and before downsampling.
</p>
</dd>
<dt><var class="var">p</var></dt>
<dd><p>Upsampling factor, should be a positive integer.  <code class="code"><var class="var">p</var> = 1</code>
means no upsampling.  Default: 1.
</p>
</dd>
<dt><var class="var">q</var></dt>
<dd><p>Downsampling factor, should be a positive integer.  <code class="code"><var class="var">q</var> = 1</code>
means no downsampling.  Default: 1.
</p></dd>
</dl>

<p>The FIR filter <var class="var">h</var> should typically be a lowpass filter designed to
suppress imaging artifacts (for upsampling) and aliasing (for downsampling).
</p></dd></dl>{% endraw %}