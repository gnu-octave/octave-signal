---
layout: "default"
permalink: "/functions/8_residued/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - residued"
category: "Filter Conversion"
func_name: "residued"
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
<dt class="deftypefn" id="index-residued"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">r</var>, <var class="var">p</var>, <var class="var">f</var>, <var class="var">m</var>] =</code> <strong class="def-name">residued</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code><a class="copiable-link" href="#index-residued"></a></span></dt>
<dd><p>Compute the partial fraction expansion (PFE) of filter
 <em class="math">H(z) = B(z)/A(z)</em>.  In the usual PFE function <code class="code">residuez</code>, the
 IIR part (poles <var class="var">p</var> and residues <var class="var">r</var>) is driven <em class="emph">in parallel</em>
 with the FIR part (<var class="var">f</var>).  In this variant, the IIR part is driven by
 the <em class="emph">output</em> of the FIR part.  This structure can be more accurate in
 signal modeling applications.
</p>
<p>INPUTS:
 <var class="var">b</var> and <var class="var">a</var> are vectors specifying the digital filter
 <em class="math">H(z) = B(z)/A(z)</em>.  See <code class="code">help filter</code> for documentation of the
 <var class="var">b</var> and <var class="var">a</var> filter coefficients.
</p>
<p>RETURNED:
 </p><ul class="itemize mark-bullet">
<li><var class="var">r</var> = column vector containing the filter-pole residues
 </li><li><var class="var">p</var> = column vector containing the filter poles
 </li><li><var class="var">f</var> = row vector containing the FIR part, if any
 </li><li><var class="var">m</var> = column vector of pole multiplicities
 </li></ul>

<p>EXAMPLES:
 </p><div class="example">
<pre class="example-preformatted"> See <code class="code">test residued verbose</code> to see a number of examples.
 </pre></div>

<p>For the theory of operation, see
 &lsquo;<code class="indicateurl">http://ccrma.stanford.edu/~jos/filters/residued.html</code>&rsquo;
</p>

<p><strong class="strong">See also:</strong> residue, residued.
 </p></dd></dl>