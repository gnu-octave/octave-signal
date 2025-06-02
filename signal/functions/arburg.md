---
layout: "default"
permalink: "/functions/6_arburg/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - arburg"
category: "System Identification"
func_name: "arburg"
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
<dt class="deftypefn" id="index-arburg"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">a</var>, <var class="var">v</var>, <var class="var">k</var>] =</code> <strong class="def-name">arburg</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">poles</var>)</code><a class="copiable-link" href="#index-arburg"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-arburg-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">a</var>, <var class="var">v</var>, <var class="var">k</var>] =</code> <strong class="def-name">arburg</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">poles</var>, <var class="var">criterion</var>)</code><a class="copiable-link" href="#index-arburg-1"></a></span></dt>
<dd>
<p>Calculate coefficients of an autoregressive (AR) model of complex data
 <var class="var">x</var> using the whitening lattice-filter method of Burg (1968).  The
 inverse of the model is a moving-average filter which reduces <var class="var">x</var> to
 white noise.  The power spectrum of the AR model is an estimate of the
 maximum entropy power spectrum of the data.  The function <code class="code">ar_psd</code>
 calculates the power spectrum of the AR model.
</p>
<p>ARGUMENTS:
 </p><ul class="itemize mark-bullet">
<li><var class="var">x</var>
 sampled data
 </li><li><var class="var">poles</var>
 number of poles in the AR model or limit to the number of poles if a
 valid <var class="var">criterion</var> is provided.
 </li><li><var class="var">criterion</var>
 model-selection criterion.  Limits the number of poles so that spurious
 poles are not added when the whitened data has no more information
 in it (see Kay &amp; Marple, 1981). Recognized values are
 &rsquo;AKICc&rsquo; &ndash; approximate corrected Kullback information criterion (recommended),
 &rsquo;KIC&rsquo;  &ndash; Kullback information criterion
 &rsquo;AICc&rsquo; &ndash; corrected Akaike information criterion
 &rsquo;AIC&rsquo;  &ndash; Akaike information criterion
 &rsquo;FPE&rsquo;  &ndash; final prediction error&quot; criterion
 The default is to NOT use a model-selection criterion
 </li></ul>

<p>RETURNED VALUES:
 </p><ul class="itemize mark-bullet">
<li><var class="var">a</var>
 list of (P+1) autoregression coefficients; for data input <em class="math">x(n)</em> and
 white noise <em class="math">e(n)</em>, the model is

<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted">                       P+1
 x(n) = sqrt(v).e(n) + SUM a(k).x(n-k)
                       k=1
 </pre></div><pre class="example-preformatted"> </pre></div>

<p><var class="var">v</var>
 mean square of residual noise from the whitening operation of the Burg
 lattice filter.
 </p></li><li><var class="var">k</var>
 reflection coefficients defining the lattice-filter embodiment of the model
 </li></ul>

<p>HINTS:
</p>
<p>(1) arburg does not remove the mean from the data.  You should remove
      the mean from the data if you want a power spectrum.  A non-zero mean
      can produce large errors in a power-spectrum estimate.  See
      &quot;help detrend&quot;.
  (2) If you don&rsquo;t know what the value of &quot;poles&quot; should be, choose the
      largest (reasonable) value you could want and use the recommended
      value, criterion=&rsquo;AKICc&rsquo;, so that arburg can find it.
      E.g. arburg(x,64,&rsquo;AKICc&rsquo;)
      The AKICc has the least bias and best resolution of the available
      model-selection criteria.
  (3) Autoregressive and moving-average filters are stored as polynomials
      which, in matlab, are row vectors.
</p>
<p>NOTE ON SELECTION CRITERION:
</p>
<p>AIC, AICc, KIC and AKICc are based on information theory.  They  attempt
   to balance the complexity (or length) of the model against how well the
   model fits the data.  AIC and KIC are biased estimates of the asymmetric
   and the symmetric Kullback-Leibler divergence respectively.  AICc and
   AKICc attempt to correct the bias. See reference [4].
</p>

<p>REFERENCES:
</p>
<p>[1] John Parker Burg (1968)
   &quot;A new analysis technique for time series data&quot;,
   NATO advanced study Institute on Signal Processing with Emphasis on
   Underwater Acoustics, Enschede, Netherlands, Aug. 12-23, 1968.
</p>
<p>[2] Steven M. Kay and Stanley Lawrence Marple Jr.:
   &quot;Spectrum analysis &ndash; a modern perspective&quot;,
   Proceedings of the IEEE, Vol 69, pp 1380-1419, Nov., 1981
</p>
<p>[3] William H. Press and Saul A. Teukolsky and William T. Vetterling and
               Brian P. Flannery
   &quot;Numerical recipes in C, The art of scientific computing&quot;, 2nd edition,
   Cambridge University Press, 2002 &mdash; Section 13.7.
</p>
<p>[4] Abd-Krim Seghouane and Maiza Bekara
   &quot;A small sample model selection criterion based on Kullback&rsquo;s symmetric
   divergence&quot;, IEEE Transactions on Signal Processing,
   Vol. 52(12), pp 3314-3323, Dec. 2004
</p>

<p><strong class="strong">See also:</strong> ar_psd.
 </p></dd></dl>