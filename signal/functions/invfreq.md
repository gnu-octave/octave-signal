---
layout: "default"
permalink: "/functions/7_invfreq/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - invfreq"
category: "System Identification"
func_name: "invfreq"
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
<dt class="deftypefn" id="index-invfreq_0028H_002cF_002cnB_002cnA_0029"><span class="category-def">Function File: </span><span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreq(H,F,nB,nA)</strong><a class="copiable-link" href="#index-invfreq_0028H_002cF_002cnB_002cnA_0029"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-invfreq_0028H_002cF_002cnB_002cnA_002cW_0029"><span class="category-def">: </span><span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreq(H,F,nB,nA,W)</strong><a class="copiable-link" href="#index-invfreq_0028H_002cF_002cnB_002cnA_002cW_0029"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-invfreq_0028H_002cF_002cnB_002cnA_002cW_002c_005b_005d_002c_005b_005d_002cplane_0029"><span class="category-def">: </span><span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreq(H,F,nB,nA,W,[],[],plane)</strong><a class="copiable-link" href="#index-invfreq_0028H_002cF_002cnB_002cnA_002cW_002c_005b_005d_002c_005b_005d_002cplane_0029"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-invfreq_0028H_002cF_002cnB_002cnA_002cW_002citer_002ctol_002cplane_0029"><span class="category-def">: </span><span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreq(H,F,nB,nA,W,iter,tol,plane)</strong><a class="copiable-link" href="#index-invfreq_0028H_002cF_002cnB_002cnA_002cW_002citer_002ctol_002cplane_0029"></a></span></dt>
<dd><p>Fit filter B(z)/A(z) or B(s)/A(s) to complex frequency response at
 frequency points F.
</p>
<p>A and B are real polynomial coefficients of order
 nA and nB respectively.  Optionally, the fit-errors can be weighted vs
 frequency according to the weights W. Also, the transform plane can be
 specified as either &rsquo;s&rsquo; for continuous time or &rsquo;z&rsquo; for discrete time. &rsquo;z&rsquo;
 is chosen by default.  Eventually, Steiglitz-McBride iterations will be
 specified by iter and tol.
</p>
<p>H: desired complex frequency response
     It is assumed that A and B are real polynomials, hence H is one-sided.
</p>
<p>F: vector of frequency samples in radians
</p>
<p>nA: order of denominator polynomial A
</p>
<p>nB: order of numerator polynomial B
</p>
<p>plane=&rsquo;z&rsquo;: F on unit circle (discrete-time spectra, z-plane design)
</p>
<p>plane=&rsquo;s&rsquo;: F on jw axis     (continuous-time spectra, s-plane design)
</p>
<p>H(k) = spectral samples of filter frequency response at points zk,
  where zk=exp(sqrt(-1)*F(k)) when plane=&rsquo;z&rsquo; (F(k) in [0,.5])
     and zk=(sqrt(-1)*F(k)) when plane=&rsquo;s&rsquo; (F(k) nonnegative)
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted">     [B,A] = butter(12,1/4);
     [H,w] = freqz(B,A,128);
     [Bh,Ah] = invfreq(H,F,4,4);
     Hh = freqz(Bh,Ah);
     disp(sprintf('||frequency response error|| = %f',norm(H-Hh)));
 </pre></div>

<p>References:
</p>
<p>J. O. Smith, &quot;Techniques for Digital Filter Design and System
      Identification with Application to the Violin, Ph.D. Dissertation,
      Elec. Eng. Dept., Stanford University, June 1983, page 50; or,
</p>
<p>http://ccrma.stanford.edu/~jos/filters/FFT_Based_Equation_Error_Method.html
 </p></dd></dl>