---
layout: "default"
permalink: "/functions/7_sosfilt/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - sosfilt"
category: "Filtering"
func_name: "sosfilt"
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
<dt class="deftypefn" id="index-sosfilt"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sosfilt</strong> <code class="def-code-arguments">(<var class="var">sos</var>, <var class="var">x</var>)</code><a class="copiable-link" href="#index-sosfilt"></a></span></dt>
<dd><p>Second order section IIR filtering of <var class="var">x</var>.  The second order section
filter is described by the matrix <var class="var">sos</var> with:
</p>
<table class="multitable">
<tbody><tr><td></td><td>[ <var class="var">B1</var> <var class="var">A1</var> ]<br></td></tr>
<tr><td><var class="var">sos</var> =</td><td>[ &hellip; ],<br></td></tr>
<tr><td></td><td>[ <var class="var">BN</var> <var class="var">AN</var> ]<br></td></tr>
</tbody>
</table>

<p>where <code class="code"><var class="var">B1</var> = [b0 b1 b2]</code> and <code class="code"><var class="var">A1</var> = [1 a1 a2]</code> for
section 1, etc.  The b0 entry must be nonzero for each section.
</p></dd></dl>