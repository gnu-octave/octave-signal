---
layout: "default"
permalink: "/functions/5_remez/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - remez"
category: "Utility"
func_name: "remez"
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
<dt class="deftypefn def-line" id="index-remez"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">remez</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-remez"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-remez-1"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">remez</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>, <var class="var">w</var>)</code><a class="copiable-link" href="#index-remez-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-remez-2"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">remez</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>, <var class="var">w</var>, <var class="var">ftype</var>)</code><a class="copiable-link" href="#index-remez-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-remez-3"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">remez</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>, <var class="var">w</var>, <var class="var">ftype</var>, <var class="var">griddensity</var>)</code><a class="copiable-link" href="#index-remez-3"></a></span></dt>
<dd><p>Parks-McClellan optimal FIR filter design.
</p><dl class="table">
<dt><var class="var">n</var></dt>
<dd><p>gives the filter order, where the generated filter length taps is n+1
</p></dd>
<dt><var class="var">f</var></dt>
<dd><p>gives frequency at the band edges [b1 e1 b2 e2 b3 e3 &hellip;]
</p></dd>
<dt><var class="var">a</var></dt>
<dd><p>gives amplitude at the band edges [a(b1) a(e1) a(b2) a(e2) &hellip;]
</p></dd>
<dt><var class="var">w</var></dt>
<dd><p>gives weighting applied to each band
</p></dd>
<dt><var class="var">ftype</var></dt>
<dd><p>is &quot;bandpass&quot;, &quot;hilbert&quot; or &quot;differentiator&quot;
</p></dd>
<dt><var class="var">griddensity</var></dt>
<dd><p>determines how accurately the filter will be
constructed. The minimum value is 16, but higher numbers are
slower to compute.
</p></dd>
</dl>

<p>Frequency is in the range (0, 1), with 1 being the Nyquist frequency.
</p></dd></dl>