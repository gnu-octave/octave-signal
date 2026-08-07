---
layout: "default"
permalink: "/functions/5_lp2bp/"
pkg_name: "signal"
pkg_version: "1.4.8"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - lp2bp"
category: "Utility"
func_name: "lp2bp"
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
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-lp2bp"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">bt</var>, <var class="var">at</var>] =</code> <strong class="def-name">lp2bp</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">Wo</var>, <var class="var">Bw</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-lp2bp-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">At</var>, <var class="var">Bt</var>, <var class="var">Ct</var>, <var class="var">Dt</var>] =</code> <strong class="def-name">lp2bp</strong> <code class="def-code-arguments">(<var class="var">A</var>, <var class="var">B</var>, <var class="var">C</var>, <var class="var">D</var>, <var class="var">Wo</var>, <var class="var">Bw</var>)</code></span></dt>
<dd>
<p>Transform an analog lowpass filter prototype to a bandpass filter with a
 given center frequency and bandwidth.
</p>
<p>Two calling forms are available:
</p>
<dl class="table">
<dt>Transfer function form</dt>
<dd><p>[bt, at] = lp2bp (b, a, Wo, Bw)
</p>
<p>Given a lowpass filter with numerator coefficients <var class="var">b</var> and denominator
 coefficients <var class="var">a</var>, returns the bandpass filter coefficients <var class="var">bt</var>
 and <var class="var">at</var> with center frequency <var class="var">Wo</var> and bandwidth <var class="var">Bw</var>
 (both in rad/s).
</p>
</dd>
<dt>State-space form</dt>
<dd><p>[At, Bt, Ct, Dt] = lp2bp (A, B, C, D, Wo, Bw)
</p>
<p>Given a lowpass filter in state-space form (<var class="var">A</var>, <var class="var">B</var>, <var class="var">C</var>,
 <var class="var">D</var>), returns the transformed state-space matrices (<var class="var">At</var>, <var class="var">Bt</var>,
 <var class="var">Ct</var>, <var class="var">Dt</var>) for the bandpass filter with center frequency <var class="var">Wo</var>
 and bandwidth <var class="var">Bw</var> (both in rad/s).
 </p></dd>
</dl>


<p><strong class="strong">See also:</strong> lp2lp, lp2hp, lp2bs.
 </p></dd></dl>