---
layout: "default"
permalink: "/functions/6_buffer/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - buffer"
category: "Utility"
func_name: "buffer"
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
<dt class="deftypefn" id="index-buffer"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">buffer</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">p</var>, <var class="var">opt</var>)</code><a class="copiable-link" href="#index-buffer"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-buffer-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">y</var>, <var class="var">z</var>, <var class="var">opt</var>] =</code> <strong class="def-name">buffer</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-buffer-1"></a></span></dt>
<dd><p>Buffer a signal into a data frame. The arguments to <code class="code">buffer</code> are
</p>
<dl class="table">
<dt><var class="var">x</var></dt>
<dd><p>The data to be buffered.
</p>
</dd>
<dt><var class="var">n</var></dt>
<dd><p>The number of rows in the produced data buffer. This is an positive
 integer value and must be supplied.
</p>
</dd>
<dt><var class="var">p</var></dt>
<dd><p>An integer less than <var class="var">n</var> that specifies the under- or overlap
 between column in the data frame. The default value of <var class="var">p</var> is 0.
</p>
</dd>
<dt><var class="var">opt</var></dt>
<dd><p>In the case of an overlap, <var class="var">opt</var> can be either a vector of length
 <var class="var">p</var> or the string &rsquo;nodelay&rsquo;. If <var class="var">opt</var> is a vector, then the
 first <var class="var">p</var> entries in <var class="var">y</var> will be filled with these values. If
 <var class="var">opt</var> is the string &rsquo;nodelay&rsquo;, then the first value of <var class="var">y</var>
 corresponds to the first value of <var class="var">x</var>.
</p>
<p>In the can of an underlap, <var class="var">opt</var> must be an integer between 0 and
 <code class="code">-<var class="var">p</var></code>. The represents the initial underlap of the first
 column of <var class="var">y</var>.
</p>
<p>The default value for <var class="var">opt</var> the vector <code class="code">zeros (1, <var class="var">p</var>)</code>
 in the case of an overlap, or 0 otherwise.
 </p></dd>
</dl>

<p>In the case of a single output argument, <var class="var">y</var> will be padded with
 zeros to fill the missing values in the data frame. With two output
 arguments <var class="var">z</var> is the remaining data that has not been used in the
 current data frame.
</p>
<p>Likewise, the output <var class="var">opt</var> is the overlap, or underlap that might
 be used for a future call to <code class="code">code</code> to allow continuous buffering.
 </p></dd></dl>