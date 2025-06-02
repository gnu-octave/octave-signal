---
layout: "default"
permalink: "/functions/5_ifwht/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - ifwht"
category: "Transforms"
func_name: "ifwht"
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
<dt class="deftypefn" id="index-ifwht"><span class="category-def">Function File: </span><span><strong class="def-name">ifwht</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code><a class="copiable-link" href="#index-ifwht"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-ifwht-1"><span class="category-def">Function File: </span><span><strong class="def-name">ifwht</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-ifwht-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-ifwht-2"><span class="category-def">Function File: </span><span><strong class="def-name">ifwht</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">order</var>)</code><a class="copiable-link" href="#index-ifwht-2"></a></span></dt>
<dd><p>Compute the inverse Walsh-Hadamard transform of <var class="var">x</var> using the
 Fast Walsh-Hadamard Transform (FWHT) algorithm.  If the input is a
 matrix, the inverse FWHT is calculated along the columns of <var class="var">x</var>.
</p>
<p>The number of elements of <var class="var">x</var> must be a power of 2; if not, the
 input will be extended and filled with zeros.  If a second argument
 is given, the input is truncated or extended to have length <var class="var">n</var>.
</p>
<p>The third argument specifies the <var class="var">order</var> in which the returned
 inverse Walsh-Hadamard transform coefficients should be arranged.
 The <var class="var">order</var> may be any of the following strings:
</p>
<dl class="table">
<dt>&quot;sequency&quot;</dt>
<dd><p>The coefficients are returned in sequency order.  This is the default
 if <var class="var">order</var> is not given.
</p>
</dd>
<dt>&quot;hadamard&quot;</dt>
<dd><p>The coefficients are returned in Hadamard order.
</p>
</dd>
<dt>&quot;dyadic&quot;</dt>
<dd><p>The coefficients are returned in Gray code order.
 </p></dd>
</dl>


<p><strong class="strong">See also:</strong> fwht.
 </p></dd></dl>