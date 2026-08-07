---
layout: "default"
permalink: "/functions/7_chebwin/"
pkg_name: "signal"
pkg_version: "1.4.8"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - chebwin"
category: "Utility"
func_name: "chebwin"
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
- id: "8_Plotting"
  name: "&nbsp;&nbsp;Plotting"
  url: "/functions/#8_Plotting"
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
<dt class="deftypefn def-line" id="index-chebwin"><span class="category-def">Function File: </span><span><strong class="def-name">chebwin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-chebwin-1"><span class="category-def">Function File: </span><span><strong class="def-name">chebwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">at</var>)</code></span></dt>
<dd>
<p>Return the filter coefficients of a Dolph-Chebyshev window of length <var class="var">m</var>.
 The Fourier transform of the window has a stop-band attenuation of <var class="var">at</var>
 dB.  The default attenuation value is 100 dB.
</p>
<p>For the definition of the Chebyshev window, see
</p>
<p>* Peter Lynch, &quot;The Dolph-Chebyshev Window: A Simple Optimal Filter&quot;,
   Monthly Weather Review, Vol. 125, pp. 655-660, April 1997.
   (http://www.maths.tcd.ie/~plynch/Publications/Dolph.pdf)
</p>
<p>* C. Dolph, &quot;A current distribution for broadside arrays which
   optimizes the relationship between beam width and side-lobe level&quot;,
   Proc. IEEE, 34, pp. 335-348.
</p>
<p>The window is described in frequency domain by the expression:
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted">          Cheb(m-1, beta * cos(pi * k/m))
   W(k) = -------------------------------
                 Cheb(m-1, beta)
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>with
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted">   beta = cosh(1/(m-1) * acosh(10^(at/20))
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>and Cheb(m,x) denoting the m-th order Chebyshev polynomial calculated
 at the point x.
</p>
<p>Note that the denominator in W(k) above is not computed, and after
 the inverse Fourier transform the window is scaled by making its
 maximum value unitary.
</p>

<p><strong class="strong">See also:</strong> kaiser.
 </p></dd></dl>