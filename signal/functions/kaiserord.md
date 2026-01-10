---
layout: "default"
permalink: "/functions/9_kaiserord/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - kaiserord"
category: "Utility"
func_name: "kaiserord"
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
<dt class="deftypefn def-line" id="index-kaiserord"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">n</var>, <var class="var">Wn</var>, <var class="var">beta</var>, <var class="var">ftype</var>] =</code> <strong class="def-name">kaiserord</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">m</var>, <var class="var">dev</var>)</code><a class="copiable-link" href="#index-kaiserord"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-kaiserord-1"><span class="category-def">Function File: </span><span><code class="def-type">[&hellip;] =</code> <strong class="def-name">kaiserord</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">m</var>, <var class="var">dev</var>, <var class="var">fs</var>)</code><a class="copiable-link" href="#index-kaiserord-1"></a></span></dt>
<dd>
<p>Return the parameters needed to produce a filter of the desired
 specification from a Kaiser window.  The vector <var class="var">f</var> contains pairs of
 frequency band edges in the range [0,1].  The vector <var class="var">m</var> specifies the
 magnitude response for each band.  The values of <var class="var">m</var> must be zero for
 all stop bands and must have the same magnitude for all pass bands. The
 deviation of the filter <var class="var">dev</var> can be specified as a scalar or a vector
 of the same length as <var class="var">m</var>.  The optional sampling rate <var class="var">fs</var> can be
 used to indicate that <var class="var">f</var> is in Hz in the range [0,<var class="var">fs</var>/2].
</p>
<p>The returned value <var class="var">n</var> is the required order of the filter (the length
 of the filter minus 1).  The vector <var class="var">Wn</var> contains the band edges of
 the filter suitable for passing to <code class="code">fir1</code>.  The value <var class="var">beta</var> is
 the parameter of the Kaiser window of length <var class="var">n</var>+1 to shape the filter.
 The string <var class="var">ftype</var> contains the type of filter to specify to
 <code class="code">fir1</code>.
</p>
<p>The Kaiser window parameters n and beta are computed from the
 relation between ripple (A=-20*log10(dev)) and transition width
 (dw in radians) discovered empirically by Kaiser:
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted">           / 0.1102(A-8.7)                        A &gt; 50
    beta = | 0.5842(A-21)^0.4 + 0.07886(A-21)     21 &lt;= A &lt;= 50
           \ 0.0                                  A &lt; 21

    n = (A-8)/(2.285 dw)
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted"> [n, w, beta, ftype] = kaiserord ([1000, 1200], [1, 0], [0.05, 0.05], 11025);
 b = fir1 (n, w, kaiser (n+1, beta), ftype, &quot;noscale&quot;);
 freqz (b, 1, [], 11025);
 </pre></div><pre class="example-preformatted"> </pre></div>

<p><strong class="strong">See also:</strong> fir1, kaiser.
 </p></dd></dl>