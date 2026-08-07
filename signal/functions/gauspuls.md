---
layout: "default"
permalink: "/functions/8_gauspuls/"
pkg_name: "signal"
pkg_version: "1.4.8"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - gauspuls"
category: "Utility"
func_name: "gauspuls"
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
<dt class="deftypefn def-line" id="index-gauspuls"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">yi</var> =</code> <strong class="def-name">gauspuls</strong> <code class="def-code-arguments">(<var class="var">t</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-gauspuls-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">yi</var> =</code> <strong class="def-name">gauspuls</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">fc</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-gauspuls-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">yi</var> =</code> <strong class="def-name">gauspuls</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">fc</var>, <var class="var">bw</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-gauspuls-3"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">yi</var> =</code> <strong class="def-name">gauspuls</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">fc</var>, <var class="var">bw</var>, <var class="var">bwr</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-gauspuls-4"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">yi</var>, <var class="var">yq</var>] =</code> <strong class="def-name">gauspuls</strong> <code class="def-code-arguments">(&hellip;)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-gauspuls-5"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">yi</var>, <var class="var">yq</var>, <var class="var">ye</var>] =</code> <strong class="def-name">gauspuls</strong> <code class="def-code-arguments">(&hellip;)</code></span></dt>
<dd><p>Generate a Gaussian modulated sinusoidal pulse sampled at times <var class="var">t</var>.
</p>
<p>The input arguments are:
 </p><ul class="itemize mark-bullet">
<li><var class="var">t</var> : vector of time values (in seconds) at which the pulse is
 evaluated.
 </li><li><var class="var">fc</var> : center frequency in Hz (default 1000).  Must be a
 non-negative real scalar.
 </li><li><var class="var">bw</var> : fractional bandwidth (default 0.5).  Must be a positive
 real scalar.  The bandwidth is measured at the reference level given by
 <var class="var">bwr</var>.
 </li><li><var class="var">bwr</var> : reference level in dB (default -6).  Must be a negative
 real scalar.  The pulse&rsquo;s envelope amplitude at the band edges is
 <code class="code">10^(<var class="var">bwr</var>/20)</code> times the peak amplitude.
 </li></ul>

<p>The output arguments are:
 </p><ul class="itemize mark-bullet">
<li><var class="var">yi</var> : inphase (cosine) component of the pulse.
 </li><li><var class="var">yq</var> : quadrature (sine) component of the pulse.
 </li><li><var class="var">ye</var> : envelope of the pulse 
 (same as <code class="code">sqrt (<var class="var">yi</var>.^2 + <var class="var">yq</var>.^2)</code>).
 </li></ul>

<p><strong class="strong">See also:</strong> pulstran, rectpuls, tripuls.
 </p></dd></dl>