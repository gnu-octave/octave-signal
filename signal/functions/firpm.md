---
layout: "default"
permalink: "/functions/5_firpm/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - firpm"
category: "Utility"
func_name: "firpm"
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
<dt class="deftypefn def-line" id="index-firpm"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-firpm"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-1"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, @<var class="var">respFn</var>)</code><a class="copiable-link" href="#index-firpm-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-2"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, {@<var class="var">respFn</var>, &hellip;})</code><a class="copiable-link" href="#index-firpm-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-3"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(&hellip;, <var class="var">w</var>)</code><a class="copiable-link" href="#index-firpm-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-4"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(&hellip;, <var class="var">class</var>)</code><a class="copiable-link" href="#index-firpm-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-5"><span class="category-def">Loadable Function: </span><span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(&hellip;, {<var class="var">accuracy, &hellip;}</var>)</code><a class="copiable-link" href="#index-firpm-5"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-6"><span class="category-def">Loadable Function: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">minimax</var>] =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-firpm-6"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-7"><span class="category-def">Loadable Function: </span><span><code class="def-type">[<var class="var">b</var>, <var class="var">minimax</var>, <var class="var">res</var>] =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-firpm-7"></a></span></dt>
<dd><a class="index-entry-id" id="index-signal-processing"></a>

<p>Designs a linear-phase FIR filter according to given specifications and the
&lsquo;minimax&rsquo; criterion.  The method (per McClellan et al.<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>) uses successive approximation to minimize
the maximum weighted error between the desired and actual frequency response of
the filter.  Such filters are variably described as being &lsquo;minimax&rsquo;,
&lsquo;equiripple&rsquo;, or &lsquo;optimal (in the Chebyshev sense)&rsquo;.
</p>
<h3 class="heading" id="Arguments"><span>Arguments<a class="copiable-link" href="#Arguments"></a></span></h3>

<dl class="table">
<dt><var class="var">&hellip;</var></dt>
<dd><p>Where shown as the first argument to <code class="code">firpm</code>, indicates that any
previously-indicated list of arguments may substitute for the ellipsis.
</p>
</dd>
<dt><var class="var">n</var></dt>
<dd><p>A positive integer giving the filter order.
</p>
</dd>
<dt><var class="var">f</var></dt>
<dd><p>A vector of real-numbers, increasing in the range [0,1], giving the frequencies
of the left and right edges of each band for which a specific amplitude
response is desired: [l1 r1 l2 r2 &hellip;].  1 represents the
Nyquist-frequency.  Transition-bands are defined implicitly as the regions
between or outside the given bands.
</p>
</dd>
<dt><var class="var">a</var></dt>
<dd><p>A vector of real-numbers giving the desired amplitude response.  An amplitude
value is given either for each band edge: [a(l1) a(r1) a(l2) a(r2) &hellip;], or
for each band: [a1 a2 &hellip;].  In the former case, in-band amplitude is
determined by linear interpolation between the given band-edge values.  1
represents unity-gain, 0 represents infinite attenuation, and &minus;1
represents a phase change of pi radians.
</p>
<p>Note that amplitude response is necessarily zero at <var class="var">f</var>=0 for type III and
IV filters, and at <var class="var">f</var>=1 for type II and III filters.
</p>
</dd>
<dt><var class="var">@respFn</var></dt>
<dd><p>A handle to a &lsquo;response function&rsquo; that supplies the desired amplitude response
and error-weighting.  This, unlike <var class="var">a</var> above, allows the response to be
arbitrary (subject to the note above).  <code class="code">firpm</code> invokes the response
function according to the following syntax:
</p>
<div class="example">
<pre class="example-preformatted"><var class="var">ag</var> = <code class="code">respFn</code> (<var class="var">n</var>,<var class="var">f</var>,<var class="var">g</var>,<var class="var">w</var>, ...)
[<var class="var">ag</var> <var class="var">wg</var>] = <code class="code">respFn</code> (<var class="var">n</var>,<var class="var">f</var>,<var class="var">g</var>,<var class="var">w</var>, ...)
<var class="var">symmetry</var> = <code class="code">respFn</code> (&quot;defaults&quot;, {<var class="var">n</var>,<var class="var">f</var>,<var class="var">g</var>,<var class="var">w</var>, ...})
</pre></div>

<p>where:
</p><ul class="itemize mark-bullet">
<li><var class="var">n</var> and <var class="var">f</var> are as given to <code class="code">firpm</code>.

</li><li><var class="var">w</var> is as given to <code class="code">firpm</code>, or ones if not given.

</li><li><var class="var">ag</var> and <var class="var">wg</var> are the desired amplitude and weighting functions
evaluated at each frequency in vector <var class="var">g</var> (which are frequencies within the
non-transition bands of <var class="var">f</var>).  Returning <var class="var">ag</var> alone gives uniform
weighting.

</li><li><var class="var">symmetry</var> is either <code class="code">&quot;even&quot;</code> or <code class="code">&quot;odd&quot;</code>; this provides an
alternative to using the <var class="var">class</var> values <code class="code">&quot;symmetric&quot;</code>
and <code class="code">&quot;antisymmetric&quot;</code>.

</li><li>Per the ellipses shown here and above, when @<var class="var">respFn</var> is given contained
in a cell-array, any additionally contained values are appended to the
<var class="var">respFn</var> invocation argument-list.

</li></ul>

</dd>
<dt><var class="var">w</var></dt>
<dd><p>When used in conjunction with <var class="var">a</var>, <var class="var">w</var> is a vector of positive
real-numbers giving error-weightings to be applied at each given band-edge
[w(l1) w(r1) w(l2) w(r2) &hellip;], or for each band [w1 w2 &hellip;].  In the
former case, in-band weighting is determined by linear interpolation between
the given band-edge values.  A higher relative error weighting yields a lower
relative error.
</p>
<p>When used in conjunction with @<var class="var">respFn</var>, <var class="var">w</var> is a vector (constrained
as above) that is passed through to <var class="var">respFn</var>.
</p>
</dd>
<dt><var class="var">class</var></dt>
<dd><p>A string, which may be abbreviated, giving the filter-class:
</p><ul class="itemize mark-bullet">
<li><code class="code">&quot;symmetric&quot;</code> (the default) for type I or II filters,

</li><li><code class="code">&quot;antisymmetric&quot;</code> (or <code class="code">&quot;hilbert&quot;</code>) for standard type III or IV
filters,

</li><li><code class="code">&quot;differentiator&quot;</code> for type III or IV filters with inverted phase and
with error-weighting (further to <var class="var">w</var>) of 2/f applied in the pass-band(s).
</li></ul>

</dd>
<dt><var class="var">accuracy, &hellip;</var></dt>
<dd><p>Up to three properties contained within a cell-array: <var class="var">accuracy</var>,
<var class="var">persistence</var>, <var class="var">robustness</var>, that respectively control how close the
computed filter will be to the ideal minimax solution, the number of
computation iterations over which the required accuracy will be sought, and the
precision of certain internal processing.  Each can each be set to a small
positive number (typically &le;3), to increase the relevant item; this may
increase computation time, but the need to do so should be rare.  A value of 0
can be used to leave an item unchanged.
</p>
<p>Alternatively, setting <var class="var">accuracy</var> &ge;16 emulates <small class="sc">MATLAB</small>&rsquo;s
<var class="var">lgrid</var> argument.
</p>
</dd>
</dl>

<h3 class="heading" id="Results"><span>Results<a class="copiable-link" href="#Results"></a></span></h3>

<p>If a problem occurs during the computation, a diagnostic message will normally
be displayed.  If this happens, adjusting <var class="var">accuracy</var>, <var class="var">persistence</var>, or
<var class="var">robustness</var> may provide the solution.  Some filters however, may not be
realizable due to machine-precision limitations.  If a filter can be computed,
returned values are as follows:
</p>
<dl class="table">
<dt><var class="var">b</var></dt>
<dd><p>A length <var class="var">N</var>+1 row-vector containing the computed filter coefficients.
</p>
</dd>
<dt><var class="var">minimax</var></dt>
<dd><p>The absolute value of the minimized, maximum weighted error, or this number
negated if the required accuracy could not be achieved.
</p>
</dd>
<dt><var class="var">res</var></dt>
<dd><p>A structure of data relating to the filter computation and a partial
response-analysis of the resultant filter; fields are vectors:
</p><blockquote class="quotation">
<table class="multitable">
<tbody><tr><td width="12%"><code class="code">fgrid</code></td><td width="60%">Analysis frequencies per <var class="var">f</var>.</td></tr>
<tr><td width="12%"><code class="code">des</code></td><td width="60%">Desired amplitude response.</td></tr>
<tr><td width="12%"><code class="code">wt</code></td><td width="60%">Error weighting.</td></tr>
<tr><td width="12%"><code class="code">H</code></td><td width="60%">Complex frequency response.</td></tr>
<tr><td width="12%"><code class="code">error</code></td><td width="60%">Desired minus actual amplitude response.</td></tr>
<tr><td width="12%"><code class="code">iextr</code></td><td width="60%">Indices of local peaks in <code class="code">error</code>.</td></tr>
<tr><td width="12%"><code class="code">fextr</code></td><td width="60%">Frequencies of local peaks in <code class="code">error</code>.</td></tr>
</tbody>
</table>
</blockquote>

</dd>
</dl>

<p>Using <var class="var">res</var> is not recommended because it can be slow to compute and, since
the analysis excludes transition-bands, any &lsquo;anomalies&rsquo;<a class="footnote" id="DOCF2" href="#FOOT2"><sup>2</sup></a> therein are not easy to
discern.  In general, <code class="code">freqz</code> suffices to check that the response of the
computed filter is satisfactory.
</p>
<h3 class="heading" id="Examples"><span>Examples<a class="copiable-link" href="#Examples"></a></span></h3>
<div class="example">
<div class="group"><pre class="example-preformatted"># Low-pass with frequencies in Hz:
Fs = 96000; Fn = Fs/2; # Sampling &amp; Nyquist frequencies.
b = firpm (50, [0 20000 28000 48000] / Fn, [1 0]);
</pre></div></div>

<div class="example">
<div class="group"><pre class="example-preformatted"># Type IV high-pass:
b = firpm (31, [0 0.5 0.7 1], [0 1], &quot;antisym&quot;);
</pre></div></div>

<div class="example">
<div class="group"><pre class="example-preformatted"># Inverse-sinc (arbitrary response):
b = firpm (20, [0 0.5 0.9 1], @(n,f,g) ...
    deal ((g&lt;=f(2))./sinc (g), (g&gt;=f(3))*9+1));
</pre></div></div>

<div class="example">
<div class="group"><pre class="example-preformatted"># Band-pass with filter-response check:
freqz (firpm (40, [0 3 4 6 8 10]/10, [0 1 0]))
</pre></div></div>

<p>Further examples can be found in the <code class="code">firpm</code> and <code class="code">firpmord</code>
demonstration scripts.
</p>
<h3 class="heading" id="Compatibility"><span>Compatibility<a class="copiable-link" href="#Compatibility"></a></span></h3>
<p>Given invalid filter specifications, Octave emits an error and does not produce
a filter; <small class="sc">MATLAB</small> in such circumstances may still produce filter
coefficients.
</p>
<p>Unlike with <small class="sc">MATLAB</small>, with Octave <var class="var">minimax</var> can be negative; for
compatibility, take the absolute value.
</p>

<p><strong class="strong">See also:</strong> firpmord.
</p>
</dd></dl>