---
layout: "default"
permalink: "/functions/6_interp/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - interp"
category: "Utility"
func_name: "interp"
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
<dt class="deftypefn def-line" id="index-interp"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">interp</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">q</var>)</code><a class="copiable-link" href="#index-interp"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-interp-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">interp</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">q</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-interp-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-interp-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">interp</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">q</var>, <var class="var">n</var>, <var class="var">Wc</var>)</code><a class="copiable-link" href="#index-interp-2"></a></span></dt>
<dd>
<p>Upsample the signal x by a factor of q, using an order 2*q*n+1 FIR
 filter. Note that q must be an integer for this rate change method.
 n defaults to 4 and Wc defaults to 0.5.
</p>
<p>Example
 </p><div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> # Generate a signal.
 t=0:0.01:2; x=chirp(t,2,.5,10,'quadratic')+sin(2*pi*t*0.4);
 y = interp(x(1:4:length(x)),4,4,1);   # interpolate a sub-sample
 stem(t(1:121)*1000,x(1:121),&quot;-g;Original;&quot;); hold on;
 stem(t(1:121)*1000,y(1:121),&quot;-r;Interpolated;&quot;);
 stem(t(1:4:121)*1000,x(1:4:121),&quot;-b;Subsampled;&quot;); hold off;
 </pre></div><pre class="example-preformatted"> </pre></div>


<p><strong class="strong">See also:</strong> decimate, resample.
 </p></dd></dl>