---
layout: "default"
permalink: "/functions/11_statelevels/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - statelevels"
category: "Pulse Metrics"
func_name: "statelevels"
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
<dt class="deftypefn" id="index-statelevels"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">levels</var> =</code> <strong class="def-name">statelevels</strong> <code class="def-code-arguments">(<var class="var">A</var>)</code><a class="copiable-link" href="#index-statelevels"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-statelevels-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">levels</var> =</code> <strong class="def-name">statelevels</strong> <code class="def-code-arguments">(<var class="var">A</var>, <var class="var">nbins</var>)</code><a class="copiable-link" href="#index-statelevels-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-statelevels-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">levels</var> =</code> <strong class="def-name">statelevels</strong> <code class="def-code-arguments">(<var class="var">A</var>, <var class="var">nbins</var>, <var class="var">method</var>)</code><a class="copiable-link" href="#index-statelevels-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-statelevels-3"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">levels</var> =</code> <strong class="def-name">statelevels</strong> <code class="def-code-arguments">(<var class="var">A</var>, <var class="var">nbins</var>, <var class="var">method</var>, <var class="var">bounds</var>)</code><a class="copiable-link" href="#index-statelevels-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-statelevels-4"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">levels</var>, <var class="var">histograms</var>] =</code> <strong class="def-name">statelevels</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-statelevels-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-statelevels-5"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">levels</var>, <var class="var">histograms</var>, <var class="var">binlevels</var>] =</code> <strong class="def-name">statelevels</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-statelevels-5"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-statelevels-6"><span class="category-def">Function File: </span><span><strong class="def-name">statelevels</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-statelevels-6"></a></span></dt>
<dd><p>Estimate state-level for bilevel waveform <var class="var">A</var> using histogram method
</p>
<p>INPUTS:
</p>
<dl class="table">
<dt><var class="var">A</var></dt>
<dd><p>Bylevel waveform
 </p></dd>
<dt><var class="var">nbins</var></dt>
<dd><p>Number of histogram bins (100 default)
 </p></dd>
<dt><var class="var">method</var></dt>
<dd><p>State-level estimation method &rsquo;mode&rsquo; (default) or &rsquo;mean&rsquo;.
 </p></dd>
<dt><var class="var">bounds</var></dt>
<dd><p>2 element vector for histogram lower and upper bounds. Values outside of this will be ignored.
 </p></dd>
</dl>

<p>OUTPUTS:
</p>
<dl class="table">
<dt><var class="var">levels</var></dt>
<dd><p>Levels of high and low states
 </p></dd>
<dt><var class="var">histograms</var></dt>
<dd><p>Histogram counts
 </p></dd>
<dt><var class="var">binlevels</var></dt>
<dd><p>Histogram bincenters
 </p></dd>
</dl>

<p>If no outputs are provided, the signal and histogram will be plotted, and display the levels.
</p>
</dd></dl>