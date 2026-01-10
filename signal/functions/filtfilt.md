---
layout: "default"
permalink: "/functions/8_filtfilt/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - filtfilt"
category: "Utility"
func_name: "filtfilt"
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
<dt class="deftypefn def-line" id="index-filtfilt"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">filtfilt</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">x</var>)</code><a class="copiable-link" href="#index-filtfilt"></a></span></dt>
<dd>
<p>Forward and reverse filter the signal. This corrects for phase
 distortion introduced by a one-pass filter, though it does square the
 magnitude response in the process. That&rsquo;s the theory at least.  In
 practice the phase correction is not perfect, and magnitude response
 is distorted, particularly in the stop band.
</p>
<p>Example
 </p><div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> [b, a]=butter(3, 0.1);                  # 5 Hz low-pass filter
 t = 0:0.01:1.0;                         # 1 second sample
 x=sin(2*pi*t*2.3)+0.25*randn(size(t));  # 2.3 Hz sinusoid+noise
 y = filtfilt(b,a,x); z = filter(b,a,x); # apply filter
 plot(t,x,';data;',t,y,';filtfilt;',t,z,';filter;')
 </pre></div><pre class="example-preformatted"> </pre></div>
</dd></dl>