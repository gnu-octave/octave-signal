---
layout: "default"
permalink: "/functions/5_cl2bp/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - cl2bp"
category: "Utility"
func_name: "cl2bp"
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
<dt class="deftypefn def-line" id="index-cl2bp"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">h</var> =</code> <strong class="def-name">cl2bp</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">w1</var>, <var class="var">w2</var>, <var class="var">up</var>, <var class="var">lo</var>)</code><a class="copiable-link" href="#index-cl2bp"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cl2bp-1"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">h</var> =</code> <strong class="def-name">cl2bp</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">w1</var>, <var class="var">w2</var>, <var class="var">up</var>, <var class="var">lo</var>, <var class="var">gridsize</var>)</code><a class="copiable-link" href="#index-cl2bp-1"></a></span></dt>
<dd>
<p>Constrained L2 bandpass FIR filter design.  This is a fast implementation of
the algorithm cited below.  Compared to <em class="dfn">remez</em>, it offers implicit
specification of transition bands, a higher likelihood of convergence, and an
error criterion combining features of both L2 and Chebyshev approaches.
</p>
<p>Inputs:
</p>
<dl class="table">
<dt><var class="var">m</var></dt>
<dd><p>degree of cosine polynomial, i.e. the number of output coefficients will be
<var class="var">m</var>*2+1
</p></dd>
<dt><var class="var">w1</var></dt>
<dt><var class="var">w2</var></dt>
<dd><p>bandpass filter cutoffs in the range 0 &lt;= <var class="var">w1</var> &lt; <var class="var">w2</var> &lt;= pi,
where pi is the Nyquist frequency
</p></dd>
<dt><var class="var">up</var></dt>
<dd><p>vector of 3 upper bounds for [stopband1, passband, stopband2]
</p></dd>
<dt><var class="var">lo</var></dt>
<dd><p>vector of 3 lower bounds for [stopband1, passband, stopband2]
</p></dd>
<dt><var class="var">gridsize</var></dt>
<dd><p>search grid size; larger values may improve accuracy,
but greatly increase calculation time. Default value is 2048, max value is 1e6.
</p></dd>
</dl>

<p>Output:
</p>
<p>A vector of <var class="var">m</var>*2+1 FIR coefficients, or an empty value if the solver
failed to converge.
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted"><code class="code">h = cl2bp(30, 0.3*pi, 0.6*pi, [0.02, 1.02, 0.02], [-0.02, 0.98, -0.02], 2^11);</code>
</pre></div>

<p>Original Paper:  I. W. Selesnick, M. Lang, and C. S. Burrus.  A modified
algorithm for constrained least square design of multiband FIR filters without
specified transition bands.
IEEE Trans. on Signal Processing, 46(2):497-501, February 1998.
</p></dd></dl>

<p><strong class="strong">See also:</strong> remez.
</p>