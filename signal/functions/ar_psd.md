---
layout: "default"
permalink: "/functions/6_arpsd/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - ar_psd"
category: "Utility"
func_name: "ar_psd"
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
<dt class="deftypefn def-line" id="index-ar_005fpsd"><span class="category-def">Function File: </span><span><strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">v</var>)</code><a class="copiable-link" href="#index-ar_005fpsd"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ar_005fpsd-1"><span class="category-def">Function File: </span><span><strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">v</var>, <var class="var">freq</var>)</code><a class="copiable-link" href="#index-ar_005fpsd-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ar_005fpsd-2"><span class="category-def">Function File: </span><span><strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">v</var>, <var class="var">freq</var>, <var class="var">Fs</var>)</code><a class="copiable-link" href="#index-ar_005fpsd-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ar_005fpsd-3"><span class="category-def">Function File: </span><span><strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(&hellip;, <var class="var">range</var>)</code><a class="copiable-link" href="#index-ar_005fpsd-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ar_005fpsd-4"><span class="category-def">Function File: </span><span><strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(&hellip;, <var class="var">method</var>)</code><a class="copiable-link" href="#index-ar_005fpsd-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ar_005fpsd-5"><span class="category-def">Function File: </span><span><strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(&hellip;, <var class="var">plottype</var>)</code><a class="copiable-link" href="#index-ar_005fpsd-5"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ar_005fpsd-6"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">psd</var>, <var class="var">f_out</var>] =</code> <strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-ar_005fpsd-6"></a></span></dt>
<dd>
<p>Calculate the power spectrum of the autoregressive model
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted">                        M
 x(n) = sqrt(v).e(n) + SUM a(k).x(n-k)
                       k=1
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>where <em class="math">x(n)</em> is the output of the model and <em class="math">e(n)</em> is white noise.
 This function is intended for use with
 <code class="code">[a, v, k] = arburg (x, poles, criterion)</code>
 which use the Burg (1968) method to calculate a &quot;maximum entropy&quot;
 autoregressive model of <var class="var">x</var>.
</p>
<p>If the <var class="var">freq</var> argument is a vector (of frequencies) the spectrum is
 calculated using the polynomial method and the <var class="var">method</var> argument is
 ignored.  For scalar <var class="var">freq</var>, an integer power of 2, or <var class="var">method</var> =
 &quot;FFT&quot;, causes the spectrum to be calculated by FFT.  Otherwise, the spectrum
 is calculated as a polynomial.  It may be computationally more
 efficient to use the FFT method if length of the model is not much
 smaller than the number of frequency values.  The spectrum is scaled so
 that spectral energy (area under spectrum) is the same as the time-domain
 energy (mean square of the signal).
</p>
<p>ARGUMENTS:
 All but the first two arguments are optional and may be empty.
 </p><ul class="itemize mark-bullet">
<li><var class="var">a</var>
 list of M=(order+1) autoregressive model
 coefficients.  The first element of &quot;ar_coeffs&quot; is the
 zero-lag coefficient, which always has a value of 1.
 </li><li><var class="var">v</var>
 square of the moving-average coefficient of the AR model.
 </li><li><var class="var">freq</var>
 frequencies at which power spectral density is calculated, or a scalar
 indicating the number of uniformly distributed frequency
 values at which spectral density is calculated.
 (default = 256)
 </li><li><var class="var">Fs</var>
 sampling frequency (Hertz) (default=1)
 </li></ul>

<p>CONTROL-STRING ARGUMENTS &ndash; each of these arguments is a character string.
 Control-string arguments can be in any order after the other arguments.
</p>
<p>Range:
</p>
<p>&rsquo;half&rsquo;,  &rsquo;onesided&rsquo; : frequency range of the spectrum is
 from zero up to but not including sample_f/2.  Power
 from negative frequencies is added to the positive
 side of the spectrum.
 &rsquo;whole&rsquo;, &rsquo;twosided&rsquo; : frequency range of the spectrum is
 -sample_f/2 to sample_f/2, with negative frequencies
 stored in &quot;wrap around&quot; order after the positive
 frequencies; e.g. frequencies for a 10-point &rsquo;twosided&rsquo;
 spectrum are 0 0.1 0.2 0.3 0.4 0.5 -0.4 -0.3 -0.2 -0.1
 &rsquo;shift&rsquo;, &rsquo;centerdc&rsquo; : same as &rsquo;whole&rsquo; but with the first half
 of the spectrum swapped with second half to put the
 zero-frequency value in the middle. (See &quot;help
 fftshift&quot;. If &quot;freq&quot; is vector, &rsquo;shift&rsquo; is ignored.
 If model coefficients &quot;ar_coeffs&quot; are real, the default
 range is &rsquo;half&rsquo;, otherwise default range is &rsquo;whole&rsquo;.
</p>
<p>Method:
</p>
<p>&rsquo;fft&rsquo;:  use FFT to calculate power spectrum.
 &rsquo;poly&rsquo;: calculate power spectrum as a polynomial of 1/z
 N.B. this argument is ignored if the &quot;freq&quot; argument is a
 vector.  The default is &rsquo;poly&rsquo; unless the &quot;freq&quot;
 argument is an integer power of 2.
</p>
<p>Plot type:
</p>
<p>&rsquo;plot&rsquo;, &rsquo;semilogx&rsquo;, &rsquo;semilogy&rsquo;, &rsquo;loglog&rsquo;, &rsquo;squared&rsquo; or &rsquo;db&rsquo;:
 specifies the type of plot.  The default is &rsquo;plot&rsquo;, which
 means linear-linear axes. &rsquo;squared&rsquo; is the same as &rsquo;plot&rsquo;.
 &rsquo;dB&rsquo; plots &quot;10*log10(psd)&quot;.  This argument is ignored and a
 spectrum is not plotted if the caller requires a returned
 value.
</p>
<p>RETURNED VALUES:
 If returned values are not required by the caller, the spectrum
 is plotted and nothing is returned.
 </p><ul class="itemize mark-bullet">
<li><var class="var">psd</var>
 estimate of power-spectral density
 </li><li><var class="var">f_out</var>
 frequency values
 </li></ul>

<p>REFERENCE
 [1] Equation 2.28 from Steven M. Kay and Stanley Lawrence Marple Jr.:
   &quot;Spectrum analysis &ndash; a modern perspective&quot;,
   Proceedings of the IEEE, Vol 69, pp 1380-1419, Nov., 1981
</p>
</dd></dl>