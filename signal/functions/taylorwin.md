---
layout: "default"
permalink: "/functions/9_taylorwin/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - taylorwin"
category: "Utility"
func_name: "taylorwin"
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
<dt class="deftypefn def-line" id="index-_0028m_0029"><span class="category-def">Function File: </span><span><code class="def-type">taylorwin</code> <strong class="def-name">(<var class="var">m</var>)</strong><a class="copiable-link" href="#index-_0028m_0029"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028m_002c"><span class="category-def">Function File: </span><span><code class="def-type">taylorwin</code> <strong class="def-name">(<var class="var">m</var>,</strong> <code class="def-code-arguments"><var class="var">nbar</var>)</code><a class="copiable-link" href="#index-_0028m_002c"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028m_002c-1"><span class="category-def">Function File: </span><span><code class="def-type">taylorwin</code> <strong class="def-name">(<var class="var">m</var>,</strong> <code class="def-code-arguments"><var class="var">nbar</var>, <var class="var">sll</var>)</code><a class="copiable-link" href="#index-_0028m_002c-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028m_002c-2"><span class="category-def">Function File: </span><span><code class="def-type">taylorwin</code> <strong class="def-name">(<var class="var">m</var>,</strong> <code class="def-code-arguments"><var class="var">nbar</var>, <var class="var">sll</var>, <var class="var">plots</var>)</code><a class="copiable-link" href="#index-_0028m_002c-2"></a></span></dt>
<dd><p>Return the coefficients of a Taylor window of length <var class="var">m</var>, whose
 Fourier transform has <var class="var">nbar</var> (default 4) quasi-equiripple side-lobes
 adjacent to the main-lobe, at a nominal level of <var class="var">sll</var> (default
 &minus;30) dBc.
</p>
<p>If <var class="var">plots</var> is non-zero then time and frequency domains plots of the
 resultant window are shown.
</p>
<p>Reference:
 Doerry, &lsquo;Catalog of Window Taper Functions for Sidelobe Control&rsquo;, 2017.
 </p>
<p><strong class="strong">See also:</strong> chebwin.
 </p></dd></dl>