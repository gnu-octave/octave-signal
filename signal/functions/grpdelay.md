---
layout: "default"
permalink: "/functions/8_grpdelay/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - grpdelay"
category: "Filter Analysis"
func_name: "grpdelay"
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
<dt class="deftypefn" id="index-grpdelay"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">g</var>, <var class="var">w</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(<var class="var">b</var>)</code><a class="copiable-link" href="#index-grpdelay"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-grpdelay-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">g</var>, <var class="var">w</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-grpdelay-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-grpdelay-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">g</var>, <var class="var">w</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;, <var class="var">n</var>)</code><a class="copiable-link" href="#index-grpdelay-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-grpdelay-3"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">g</var>, <var class="var">w</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;, <var class="var">n</var>, &quot;whole&quot;)</code><a class="copiable-link" href="#index-grpdelay-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-grpdelay-4"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">g</var>, <var class="var">f</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;, <var class="var">n</var>, <var class="var">Fs</var>)</code><a class="copiable-link" href="#index-grpdelay-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-grpdelay-5"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">g</var>, <var class="var">f</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;, <var class="var">n</var>, &quot;whole&quot;, <var class="var">Fs</var>)</code><a class="copiable-link" href="#index-grpdelay-5"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-grpdelay-6"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">g</var>, <var class="var">w</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;, <var class="var">w</var>)</code><a class="copiable-link" href="#index-grpdelay-6"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-grpdelay-7"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">g</var>, <var class="var">f</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;, <var class="var">f</var>, <var class="var">Fs</var>)</code><a class="copiable-link" href="#index-grpdelay-7"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-grpdelay-8"><span class="category-def">Function File: </span><span><strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-grpdelay-8"></a></span></dt>
<dd><p>Compute the group delay of a filter.
</p>
<p>[g, w] = grpdelay(b)
   returns the group delay g of the FIR filter with coefficients b.
   The response is evaluated at 512 angular frequencies between 0 and
   pi. w is a vector containing the 512 frequencies.
   The group delay is in units of samples.  It can be converted
   to seconds by multiplying by the sampling period (or dividing by
   the sampling rate fs).
</p>
<p>[g, w] = grpdelay(b,a)
   returns the group delay of the rational IIR filter whose numerator
   has coefficients b and denominator coefficients a.
</p>
<p>[g, w] = grpdelay(b,a,n)
   returns the group delay evaluated at n angular frequencies.  For fastest
   computation n should factor into a small number of small primes.
</p>
<p>[g, w] = grpdelay(b,a,n,&rsquo;whole&rsquo;)
   evaluates the group delay at n frequencies between 0 and 2*pi.
</p>
<p>[g, f] = grpdelay(b,a,n,Fs)
   evaluates the group delay at n frequencies between 0 and Fs/2.
</p>
<p>[g, f] = grpdelay(b,a,n,&rsquo;whole&rsquo;,Fs)
   evaluates the group delay at n frequencies between 0 and Fs.
</p>
<p>[g, w] = grpdelay(b,a,w)
   evaluates the group delay at frequencies w (radians per sample).
</p>
<p>[g, f] = grpdelay(b,a,f,Fs)
   evaluates the group delay at frequencies f (in Hz).
</p>
<p>grpdelay(...)
   plots the group delay vs. frequency.
</p>
<p>If the denominator of the computation becomes too small, the group delay
 is set to zero.  (The group delay approaches infinity when
 there are poles or zeros very close to the unit circle in the z plane.)
</p>
<p>Theory: group delay, g(w) = -d/dw [arg{H(e^jw)}],  is the rate of change of
 phase with respect to frequency.  It can be computed as:
</p>
<div class="example">
<pre class="example-preformatted">               d/dw H(e^-jw)
        g(w) = -------------
                 H(e^-jw)
 </pre></div>

<p>where
</p>
<div class="example">
<pre class="example-preformatted">         H(z) = B(z)/A(z) = sum(b_k z^k)/sum(a_k z^k).
 </pre></div>

<p>By the quotient rule,
</p>
<div class="example">
<pre class="example-preformatted">                    A(z) d/dw B(z) - B(z) d/dw A(z)
        d/dw H(z) = -------------------------------
                               A(z) A(z)
 </pre></div>

<p>Substituting into the expression above yields:
</p>
<div class="example">
<pre class="example-preformatted">                A dB - B dA
        g(w) =  ----------- = dB/B - dA/A
                    A B
 </pre></div>

<p>Note that,
</p>
<div class="example">
<pre class="example-preformatted">        d/dw B(e^-jw) = sum(k b_k e^-jwk)
        d/dw A(e^-jw) = sum(k a_k e^-jwk)
 </pre></div>

<p>which is just the FFT of the coefficients multiplied by a ramp.
</p>
<p>As a further optimization when nfft&gt;&gt;length(a), the IIR filter (b,a)
 is converted to the FIR filter conv(b,fliplr(conj(a))).
 For further details, see
 http://ccrma.stanford.edu/~jos/filters/Numerical_Computation_Group_Delay.html
 </p></dd></dl>