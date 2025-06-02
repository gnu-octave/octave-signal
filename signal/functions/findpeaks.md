---
layout: "default"
permalink: "/functions/9_findpeaks/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - findpeaks"
category: "Signal Measurement"
func_name: "findpeaks"
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
<dt class="deftypefn" id="index-findpeaks"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">pks</var>, <var class="var">loc</var>, <var class="var">extra</var>] =</code> <strong class="def-name">findpeaks</strong> <code class="def-code-arguments">(<var class="var">data</var>)</code><a class="copiable-link" href="#index-findpeaks"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-findpeaks-1"><span class="category-def">Function File: </span><span><code class="def-type">&hellip; =</code> <strong class="def-name">findpeaks</strong> <code class="def-code-arguments">(&hellip;, <var class="var">property</var>, <var class="var">value</var>)</code><a class="copiable-link" href="#index-findpeaks-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-findpeaks-2"><span class="category-def">Function File: </span><span><code class="def-type">&hellip; =</code> <strong class="def-name">findpeaks</strong> <code class="def-code-arguments">(&hellip;, &quot;DoubleSided&quot;)</code><a class="copiable-link" href="#index-findpeaks-2"></a></span></dt>
<dd><p>Finds peaks on <var class="var">data</var>.
</p>
<p>Peaks of a positive array of data are defined as local maxima. For
 double-sided data, they are maxima of the positive part and minima of
 the negative part. <var class="var">data</var> is expected to be a single column
 vector.
</p>
<p>The function returns the value of <var class="var">data</var> at the peaks in
 <var class="var">pks</var>. The index indicating their position is returned in
 <var class="var">loc</var>.
</p>
<p>The third output argument is a structure with additional information:
</p>
<dl class="table">
<dt>&quot;parabol&quot;</dt>
<dd><p>A structure containing the parabola fitted to each returned peak. The
 structure has two fields, &quot;x&quot; and &quot;pp&quot;. The field
 &quot;pp&quot; contains the coefficients of the 2nd degree polynomial
 and &quot;x&quot; the extrema of the interval where it was fitted.
</p>
</dd>
<dt>&quot;height&quot;</dt>
<dd><p>The estimated height of the returned peaks (in units of <var class="var">data</var>).
</p>
</dd>
<dt>&quot;baseline&quot;</dt>
<dd><p>The height at which the roots of the returned peaks were calculated
 (in units of <var class="var">data</var>).
</p>
</dd>
<dt>&quot;roots&quot;</dt>
<dd><p>The abscissa values (in index units) at which the parabola fitted to
 each of the returned peaks realizes its width as defined below.
 </p></dd>
</dl>

<p>This function accepts property-value pair given in the list below:
</p>
<dl class="table">
<dt>&quot;MinPeakHeight&quot;</dt>
<dd><p>Minimum peak height (non-negative scalar). Only peaks that exceed this
 value will be returned. For data taking positive and negative values
 use the option &quot;DoubleSided&quot;. Default value <code class="code">eps</code>.
</p>
</dd>
<dt>&quot;MinPeakDistance&quot;</dt>
<dd><p>Minimum separation between (positive integer). Peaks separated by
 less than this distance are considered a single peak. This distance
 is also used to fit a second order polynomial to the peaks to
 estimate their width, therefore it acts as a smoothing parameter.
 The neighborhood size is equal to the value of &quot;MinPeakDistance&quot;.
 Default value 1.
</p>
</dd>
<dt>&quot;MinPeakWidth&quot;</dt>
<dd><p>Minimum width of peaks (positive integer). The width of the peaks is
 estimated using a parabola fitted to the neighborhood of each peak.
 The width is caulculated with the formula 
 </p><pre class="verbatim"> a * (width - x0)^2 = 1
 </pre><p>where a is the the concavity of the parabola and x0 its vertex.
 Default value 1.
</p>
</dd>
<dt>&quot;MaxPeakWidth&quot;</dt>
<dd><p>Maximum width of peaks (positive integer).
 Default value <code class="code">Inf</code>.
</p>
</dd>
<dt>&quot;DoubleSided&quot;</dt>
<dd><p>Tells the function that data takes positive and negative values. The
 base-line for the peaks is taken as the mean value of the function.
 This is equivalent as passing the absolute value of the data after
 removing the mean.
 </p></dd>
</dl>

<p>Run <code class="command">demo findpeaks</code> to see some examples.
 </p></dd></dl>