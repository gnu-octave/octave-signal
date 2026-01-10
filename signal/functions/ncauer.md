---
layout: "default"
permalink: "/functions/6_ncauer/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - ncauer"
category: "Utility"
func_name: "ncauer"
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
<dt class="deftypefn def-line" id="index-cauer_0028Rp_002c"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">cauer(<var class="var">Rp</var>,</strong> <code class="def-code-arguments"><var class="var">Rs</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-cauer_0028Rp_002c"></a></span></dt>
<dd><p>Analog prototype for Cauer filter.
</p>
<dl class="table">
<dt>Rp</dt>
<dd><p>Passband ripple
 </p></dd>
<dt>Rs</dt>
<dd><p>Stopband ripple
 </p></dd>
<dt>n</dt>
<dd><p>Desired order
 </p></dd>
<dt>z</dt>
<dd><p>complex vector of zeros for the model.
 </p></dd>
<dt>p</dt>
<dd><p>complex vector of poles for the model.
 </p></dd>
<dt>g</dt>
<dd><p>gain value.
 </p></dd>
</dl>

<p>References:
</p>
<p>- Serra, Celso Penteado, Teoria e Projeto de Filtros, Campinas: CARTGRAF,
   1983.
</p>
<p>- Lamar, Marcus Vinicius, Notas de aula da disciplina TE 456 - Circuitos
   Analogicos II, UFPR, 2001/2002.
 </p></dd></dl>