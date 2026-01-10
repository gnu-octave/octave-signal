---
layout: "default"
permalink: "/functions/5_pburg/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - pburg"
category: "Utility"
func_name: "pburg"
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
<dt class="deftypefn def-line" id="index-pburg_0028x_002c"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">psd</var>,<var class="var">f_out</var>] =</code> <strong class="def-name">pburg(<var class="var">x</var>,</strong> <code class="def-code-arguments"><var class="var">poles</var>, <var class="var">freq</var>, <var class="var">Fs</var>, <var class="var">range</var>, <var class="var">method</var>, <var class="var">plot_type</var>, <var class="var">criterion</var>)</code><a class="copiable-link" href="#index-pburg_0028x_002c"></a></span></dt>
<dd><p>Calculate Burg maximum-entropy power spectral density.
</p>
<p>The functions &quot;arburg&quot; and &quot;ar_psd&quot; do all the work.
 See &quot;help arburg&quot; and &quot;help ar_psd&quot; for further details.
</p>
<p>ARGUMENTS:
</p>
<p>All but the first two arguments are optional and may be empty.
</p>
<dl class="table">
<dt>x</dt>
<dd><p>[vector] sampled data
   </p></dd>
<dt>poles</dt>
<dd><p>[integer scalar] required number of poles of the AR model
   </p></dd>
<dt>freq</dt>
<dd><p>[real vector] frequencies at which power spectral density is calculated.
</p>
<p>[integer scalar] number of uniformly distributed frequency
      values at which spectral density is calculated.
      [default=256]
   </p></dd>
<dt>Fs</dt>
<dd><p>[real scalar] sampling frequency (Hertz) [default=1]
 </p></dd>
</dl>

<p>CONTROL-STRING ARGUMENTS &ndash; each of these arguments is a character string.
</p>
<p>Control-string arguments can be in any order after the other arguments.
</p>

<dl class="table">
<dt>range</dt>
<dd><p>&rsquo;half&rsquo;,  &rsquo;onesided&rsquo; : frequency range of the spectrum is
           from zero up to but not including sample_f/2.  Power
           from negative frequencies is added to the positive
           side of the spectrum.
</p>
<p>&rsquo;whole&rsquo;, &rsquo;twosided&rsquo; : frequency range of the spectrum is
           -sample_f/2 to sample_f/2, with negative frequencies
           stored in &quot;wrap around&quot; order after the positive
           frequencies; e.g. frequencies for a 10-point &rsquo;twosided&rsquo;
           spectrum are 0 0.1 0.2 0.3 0.4 0.5 -0.4 -0.3 -0.2 -0.1
</p>
<p>&rsquo;shift&rsquo;, &rsquo;centerdc&rsquo; : same as &rsquo;whole&rsquo; but with the first half
           of the spectrum swapped with second half to put the
           zero-frequency value in the middle. (See &quot;help
           fftshift&quot;. If &quot;freq&quot; is vector, &rsquo;shift&rsquo; is ignored.
           If model coefficients &quot;ar_coeffs&quot; are real, the default
           range is &rsquo;half&rsquo;, otherwise default range is &rsquo;whole&rsquo;.
</p>
</dd>
<dt>method</dt>
<dd><p>&rsquo;fft&rsquo;:  use FFT to calculate power spectral density.
</p>
<p>&rsquo;poly&rsquo;: calculate spectral density as a polynomial of 1/z
           N.B. this argument is ignored if the &quot;freq&quot; argument is a
           vector.  The default is &rsquo;poly&rsquo; unless the &quot;freq&quot;
           argument is an integer power of 2.
</p>
</dd>
<dt>plot_type</dt>
<dd><p>&rsquo;plot&rsquo;, &rsquo;semilogx&rsquo;, &rsquo;semilogy&rsquo;, &rsquo;loglog&rsquo;, &rsquo;squared&rsquo; or &rsquo;db&rsquo;:
           specifies the type of plot.  The default is &rsquo;plot&rsquo;, which
           means linear-linear axes. &rsquo;squared&rsquo; is the same as &rsquo;plot&rsquo;.
           &rsquo;dB&rsquo; plots &quot;10*log10(psd)&quot;.  This argument is ignored and a
           spectrum is not plotted if the caller requires a returned
           value.
</p>
</dd>
<dt>criterion</dt>
<dd><p>[optional string arg]  model-selection criterion.  Limits
           the number of poles so that spurious poles are not
           added when the whitened data has no more information
           in it (see Kay &amp; Marple, 1981). Recognized values are
</p>
<p>&rsquo;AKICc&rsquo; &ndash; approximate corrected Kullback information
                     criterion (recommended),
</p>
<p>&rsquo;KIC&rsquo;  &ndash; Kullback information criterion
</p>
<p>&rsquo;AICc&rsquo; &ndash; corrected Akaike information criterion
</p>
<p>&rsquo;AIC&rsquo;  &ndash; Akaike information criterion
</p>
<p>&rsquo;FPE&rsquo;  &ndash; final prediction error&quot; criterion
</p>
<p>The default is to NOT use a model-selection criterion
 </p></dd>
</dl>

<p>RETURNED VALUES:
</p>
<p>If return values are not required by the caller, the spectrum
     is plotted and nothing is returned.
</p>
<dl class="table">
<dt>psd</dt>
<dd><p>[real vector] power-spectral density estimate
   </p></dd>
<dt>f_out</dt>
<dd><p>[real vector] frequency values
 </p></dd>
</dl>

<p>HINTS
</p>
<p>This function is a wrapper for arburg and ar_psd.
</p>
<p>See &quot;help arburg&quot;, &quot;help ar_psd&quot;.
 </p></dd></dl>