---
layout: "default"
permalink: "/functions/8_invfreqz/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - invfreqz"
category: "System Identification"
func_name: "invfreqz"
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
<dt class="deftypefn" id="index-invfreqz_0028H_002cF_002cnB_002cnA_0029"><span class="category-def">Function File: </span><span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreqz(H,F,nB,nA)</strong><a class="copiable-link" href="#index-invfreqz_0028H_002cF_002cnB_002cnA_0029"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-invfreqz_0028H_002cF_002cnB_002cnA_002cW_0029"><span class="category-def">: </span><span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreqz(H,F,nB,nA,W)</strong><a class="copiable-link" href="#index-invfreqz_0028H_002cF_002cnB_002cnA_002cW_0029"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-invfreqz_0028H_002cF_002cnB_002cnA_002cW_002citer_002ctol_002c_0027trace_0027_0029"><span class="category-def">: </span><span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreqz(H,F,nB,nA,W,iter,tol,'trace')</strong><a class="copiable-link" href="#index-invfreqz_0028H_002cF_002cnB_002cnA_002cW_002citer_002ctol_002c_0027trace_0027_0029"></a></span></dt>
<dd><p>Fit filter B(z)/A(z)to the complex frequency response H at frequency
 points F.
</p>
<p>A and B are real polynomial coefficients of order nA and nB.
 Optionally, the fit-errors can be weighted vs frequency according to
 the weights W.
</p>
<p>Note: all the guts are in invfreq.m
</p>
<p>H: desired complex frequency response
</p>
<p>F: normalized frequency (0 to pi) (must be same length as H)
</p>
<p>nA: order of the denominator polynomial A
</p>
<p>nB: order of the numerator polynomial B
</p>
<p>W: vector of weights (must be same length as F)
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted">     [B,A] = butter(4,1/4);
     [H,F] = freqz(B,A);
     [Bh,Ah] = invfreq(H,F,4,4);
     Hh = freqz(Bh,Ah);
     disp(sprintf('||frequency response error|| = %f',norm(H-Hh)));
 </pre></div>
</dd></dl>