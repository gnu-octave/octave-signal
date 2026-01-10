---
layout: "default"
permalink: "/functions/6_aryule/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - aryule"
category: "Utility"
func_name: "aryule"
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
<dt class="deftypefn def-line" id="index-aryule"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">a</var> =</code> <strong class="def-name">aryule</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>)</code><a class="copiable-link" href="#index-aryule"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-aryule-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">a</var>, <var class="var">v</var>, <var class="var">k</var>] =</code> <strong class="def-name">aryule</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>)</code><a class="copiable-link" href="#index-aryule-1"></a></span></dt>
<dd><p>Fit an AR (<var class="var">p</var>)-model with Yule-Walker estimates.
 </p><dl class="table">
<dt><var class="var">x</var></dt>
<dd><p>data vector to estimate
 </p></dd>
<dt><var class="var">a</var></dt>
<dd><p>AR coefficients
 </p></dd>
<dt><var class="var">v</var></dt>
<dd><p>variance of white noise
 </p></dd>
<dt><var class="var">k</var></dt>
<dd><p>reflection coefficients for use in lattice filter
 </p></dd>
</dl>

<p>The power spectrum of the resulting filter can be plotted with
 pyulear(x, p), or you can plot it directly with ar_psd(a,v,...).
</p>
<p>See also:
 pyulear, power, freqz, impz &ndash; for observing characteristics of the model
 arburg &ndash; for alternative spectral estimators
</p>
<p>Example: Use example from arburg, but substitute aryule for arburg.
</p>
<p>Note: Orphanidis &rsquo;85 claims lattice filters are more tolerant of
 truncation errors, which is why you might want to use them.  However,
 lacking a lattice filter processor, I haven&rsquo;t tested that the lattice
 filter coefficients are reasonable.
 </p></dd></dl>