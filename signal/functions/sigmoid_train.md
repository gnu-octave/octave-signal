---
layout: "default"
permalink: "/functions/13_sigmoidtrain/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - sigmoid_train"
category: "Utility"
func_name: "sigmoid_train"
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
<dt class="deftypefn def-line" id="index-sigmoid_005ftrain"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">y</var> <var class="var">s</var>] =</code> <strong class="def-name">sigmoid_train</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">ranges</var>, <var class="var">rc</var>)</code><a class="copiable-link" href="#index-sigmoid_005ftrain"></a></span></dt>
<dd>
<p>Evaluate a train of sigmoid functions at <var class="var">t</var>.
</p>
<p>The number and duration of each sigmoid is determined from <var class="var">ranges</var>.
 Each row of <var class="var">ranges</var> represents a real interval, e.g. if sigmoid
 <code class="code">i</code> starts at <code class="code">t=0.1</code> and ends at <code class="code">t=0.5</code>, then
 <code class="code"><var class="var">ranges</var>(i,:) = [0.1 0.5]</code>.
 The input <var class="var">rc</var> is an array that defines the rising and falling time
 constants of each sigmoid.  Its size must equal the size of <var class="var">ranges</var>.
</p>
<p>The individual sigmoids are returned in <var class="var">s</var>. The combined sigmoid train
 is returned in the vector <var class="var">y</var> of length equal to <var class="var">t</var>, and such that
 <code class="code">Y = max (S)</code>.
</p>
<p>Run <code class="code">demo sigmoid_train</code> to some examples of the use of this function.
</p>
</dd></dl>