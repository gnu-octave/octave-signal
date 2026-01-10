---
layout: "default"
permalink: "/functions/8_data2fun/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - data2fun"
category: "Utility"
func_name: "data2fun"
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
<dt class="deftypefn def-line" id="index-data2fun"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">fhandle</var>, <var class="var">fullname</var>] =</code> <strong class="def-name">data2fun</strong> <code class="def-code-arguments">(<var class="var">ti</var>, <var class="var">yi</var>)</code><a class="copiable-link" href="#index-data2fun"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-data2fun-1"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">data2fun</strong> <code class="def-code-arguments">(&hellip;, <var class="var">property</var>, <var class="var">value</var>)</code><a class="copiable-link" href="#index-data2fun-1"></a></span></dt>
<dd><p>Create a vectorized function based on data samples using interpolation.
</p>
<p>The values given in <var class="var">yi</var> (N-by-k matrix) correspond to evaluations of the
 function y(t) at the points <var class="var">ti</var> (N-by-1 matrix).
 The data is interpolated and the function handle to the generated interpolant
 is returned.
</p>
<p>The function accepts <var class="var">property</var>-<var class="var">value</var> pairs described below.
</p>
<dl class="table">
<dt>&lsquo;<samp class="samp">file</samp>&rsquo;</dt>
<dd><p>Code is generated and .m file is created. The <var class="var">value</var> contains the name
 of the function. The returned function handle is a handle to that file. If
 <var class="var">value</var> is empty, then a name is automatically generated using
 <code class="code">tempname</code> and the file is created in the current directory. <var class="var">value</var>
 must not have an extension, since .m will be appended.
 Numerical values used in the function are stored in a .mat file with the same
 name as the function.
</p>
</dd>
<dt>&lsquo;<samp class="samp">interp</samp>&rsquo;</dt>
<dd><p>Type of interpolation. See <code class="code">interp1</code>.
 </p></dd>
</dl>


<p><strong class="strong">See also:</strong> interp1.
 </p></dd></dl>