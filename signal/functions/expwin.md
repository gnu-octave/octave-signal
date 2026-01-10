---
layout: "default"
permalink: "/functions/6_expwin/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - expwin"
category: "Utility"
func_name: "expwin"
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
<dt class="deftypefn def-line" id="index-_0028m_002c"><span class="category-def">Function File: </span><span><code class="def-type">expwin</code> <strong class="def-name">(<var class="var">m</var>,</strong> <code class="def-code-arguments"><var class="var">alpha</var>)</code><a class="copiable-link" href="#index-_0028m_002c"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028m_002c-1"><span class="category-def">Function File: </span><span><code class="def-type">expwin</code> <strong class="def-name">(<var class="var">m</var>,</strong> <code class="def-code-arguments"><var class="var">sll</var>)</code><a class="copiable-link" href="#index-_0028m_002c-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028_002e_002e_002e_002c"><span class="category-def">Function File: </span><span><code class="def-type">expwin</code> <strong class="def-name">(&hellip;,</strong> <code class="def-code-arguments">&quot;canonical&quot;)</code><a class="copiable-link" href="#index-_0028_002e_002e_002e_002c"></a></span></dt>
<dd><p>Return the coefficients of an exponential window<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a> of length <var class="var">m</var>.
</p>
<p>The window&rsquo;s adjustable parameter can be set directly as
 <var class="var">alpha</var> (&ge;0) or indirectly with
 <var class="var">sll</var> (&lt;0), the latter being the desired side-lobe level in dBc.
</p>
<p>By default, the returned window is both symmetric and periodic.  With the
 optional argument <code class="code">&quot;canonical&quot;</code>, the canonical form of the window is
 returned, which is symmetric but not periodic.
</p>

<p><strong class="strong">See also:</strong> kaiser, poisswin.
 </p></dd></dl>