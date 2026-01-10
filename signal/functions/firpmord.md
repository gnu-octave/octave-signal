---
layout: "default"
permalink: "/functions/8_firpmord/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - firpmord"
category: "Utility"
func_name: "firpmord"
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
<dt class="deftypefn def-line" id="index-firpmord"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">n</var>, <var class="var">Fout</var>, <var class="var">a</var>, <var class="var">w</var>] =</code> <strong class="def-name">firpmord</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">a</var>, <var class="var">d</var>)</code><a class="copiable-link" href="#index-firpmord"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpmord-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">n</var>, <var class="var">Fout</var>, <var class="var">a</var>, <var class="var">w</var>] =</code> <strong class="def-name">firpmord</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">a</var>, <var class="var">d</var>, <var class="var">fs</var>)</code><a class="copiable-link" href="#index-firpmord-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpmord-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">c</var> =</code> <strong class="def-name">firpmord</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">a</var>, <var class="var">d</var>, &quot;cell&quot;)</code><a class="copiable-link" href="#index-firpmord-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpmord-3"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">c</var> =</code> <strong class="def-name">firpmord</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">a</var>, <var class="var">d</var>, <var class="var">fs</var>, &quot;cell&quot;)</code><a class="copiable-link" href="#index-firpmord-3"></a></span></dt>
<dd><a class="index-entry-id" id="index-signal-processing"></a>

<p>Estimate the filter-order needed for <code class="code">firpm</code> to design a type-I or
 type-II linear-phase FIR filter according to the given specifications.
</p>
<h3 class="heading" id="Arguments"><span>Arguments<a class="copiable-link" href="#Arguments"></a></span></h3>

<dl class="table">
<dt><var class="var">f</var></dt>
<dd><p>A vector of real-numbers, increasing in the range (0, <var class="var">fs</var>/2), giving the
 frequencies of the left and right edges of each band for which a specific
 amplitude response is desired (omitting 0 and <var class="var">fs</var>/2, which are implied):
 [r1 l2 r2 &hellip;].  Transition-bands are defined implicitly as the regions
 between the given bands.
</p>
</dd>
<dt><var class="var">a</var></dt>
<dd><p>A vector of real-numbers giving the ideal amplitude response.  An amplitude
 value is given for each band specified by <var class="var">f</var>: [a1 a2 &hellip;].  1
 represents unity-gain, 0 represents infinite attenuation, and &minus;1
 represents a phase change of pi radians.
</p>
</dd>
<dt><var class="var">d</var></dt>
<dd><p>A vector of positive real-numbers giving the maximum allowable linear
 deviation from the amplitudes given in <var class="var">a</var>, thus constraining the actual
 amplitude response (where defined by <var class="var">f</var>) to be within <var class="var">a</var> +/&minus;
 <var class="var">d</var>.  Note that, though related, <var class="var">d</var> does not equate to
 <code class="code">firpm</code>&rsquo;s <var class="var">w</var> argument.
</p>
</dd>
<dt><var class="var">fs</var></dt>
<dd>
<p>The sampling-frequency, which defaults to 2.
</p>
</dd>
</dl>

<h3 class="heading" id="Usage"><span>Usage<a class="copiable-link" href="#Usage"></a></span></h3>

<p>The function returns the estimated filter-order, together with the other
 design specification values, in one of two forms suitable for use with
 <code class="code">firpm</code>.  By default, multiple return values are used; alternatively, by
 giving <code class="code">&quot;cell&quot;</code> (or <code class="code">&quot;c&quot;</code>) as the last argument to <code class="code">firpmord</code>,
 the returned values are contained within a cell-array that can, if desired,
 be passed directly to <code class="code">firpm</code>.
</p>
<p>The following examples illustrate the use of both mechanisms, as well as
 aspects of <code class="code">firpmord</code> usage in general:
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> # Low-pass; frequencies in kHz:
 [n f a w] = firpmord ([2.5 3], [1 0], [0.01 db2mag(-60)], 8);
 b = firpm (n, f, a, w);
 </pre></div><pre class="example-preformatted"> </pre></div>

<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> # Band-pass:
 c = firpmord ([3 4 8 9], [0 1 0], [1e-3 1e-2 1e-3], 20, &quot;cell&quot;);
 b = firpm (c{:});
 </pre></div><pre class="example-preformatted"> </pre></div>

<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> # High-pass:
 b = firpm (firpmord ([6.4 8]/16, [0 1], [1e-4 0.01], &quot;c&quot;){:});
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>In cases where elements of <var class="var">d</var> follow a repeating pattern (e.g. all the
 elements are equal, or elements corresponding to pass-bands are equal and
 elements corresponding to stop-bands are equal), only as many elements as are
 needed to establish the pattern need be given.
</p>
<p>For example, the following <code class="code">firpmord</code> invocation pairs are equivalent:
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> # Low-pass:
 firpmord ([0.4 0.5], [0 1], [db2mag(-72) db2mag(-72)]);
 firpmord ([0.4 0.5], [0 1], [db2mag(-72)]);
 </pre></div><pre class="example-preformatted"> </pre></div>

<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> # Multi-band-pass:
 ds = db2mag(-80); dp = 0.01;
 firpmord ([1 2 3 4 5 6 7 8]/10, [0 1 0 1 0], [ds dp ds dp ds]);
 firpmord ([1 2 3 4 5 6 7 8]/10, [0 1 0 1 0], [ds dp]);
 </pre></div><pre class="example-preformatted"> </pre></div>

<h3 class="heading" id="Notes"><span>Notes<a class="copiable-link" href="#Notes"></a></span></h3>

<p>The estimation algorithm used is per Ichige et al.<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a> Accuracy tends to decrease as
 the number of bands increases.  Even with two bands (i.e. high-pass or
 low-pass), the algorithm may under- or over-estimate.  See the
 <code class="code">firpmord</code> demonstrations for some examples.
</p>
<p>In order to precisely determine the minimum order needed for a particular
 design, <code class="code">firpmord</code> could be used to seed an algorithm iterating
 invocations of <code class="code">firpm</code> (as exemplified in demonstration number five).
</p>
<h3 class="heading" id="Related-documentation"><span>Related documentation<a class="copiable-link" href="#Related-documentation"></a></span></h3>


<p><strong class="strong">See also:</strong> firpm, kaiserord.
</p>
</dd></dl>