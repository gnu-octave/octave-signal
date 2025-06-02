---
layout: "default"
permalink: "/functions/8_medfilt1/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - medfilt1"
category: "Filtering"
func_name: "medfilt1"
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
<dt class="deftypefn" id="index-medfilt1"><span class="category-def">: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">medfilt1</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-medfilt1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-medfilt1-1"><span class="category-def">: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">medfilt1</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, [], <var class="var">dim</var>)</code><a class="copiable-link" href="#index-medfilt1-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-medfilt1-2"><span class="category-def">: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">medfilt1</strong> <code class="def-code-arguments">(..., <var class="var">NaN_flag</var>, <var class="var">padding</var>)</code><a class="copiable-link" href="#index-medfilt1-2"></a></span></dt>
<dd>
<p>Apply a one dimensional median filter with a window size of <var class="var">n</var> to
the data <var class="var">x</var>, which must be real, double and full.
For <var class="var">n</var> = 2m+1, <var class="var">y</var>(i) is the median of <var class="var">x</var>(i-m:i+m).
For <var class="var">n</var> = 2m,   <var class="var">y</var>(i) is the median of <var class="var">x</var>(i-m:i+m-1).
</p>
<p>The calculation is performed over the first non-singleton dimension, or over
dimension <var class="var">dim</var> if that is specified as the fourth argument.  (The third
argument is ignored; Matlab used to use it to tune its algorithm.)
</p>
<p><var class="var">NaN_flag</var> may be <code class="code">omitnan</code> or <code class="code">includenan</code> (the default).
If it is <code class="code">omitnan</code> then any NaN values are removed from the window
before the median is taken.
Otherwise, any window containing an NaN returns a median of NaN.
</p>
<p><var class="var">padding</var> determines how the partial windows at the start and end of
<var class="var">x</var> are treated.
It may be <code class="code">truncate</code> or <code class="code">zeropad</code> (the default).
If it is <code class="code">truncate</code> then the window for <var class="var">y</var>(i) is
the intersection of the window stated above with 1:length(<var class="var">x</var>).
If it is <code class="code">zeropad</code>, then partial windows have additional zeros
to bring them up to size <var class="var">n</var>.
</p>

<p><strong class="strong">See also:</strong> filter, medfilt2.
</p></dd></dl>