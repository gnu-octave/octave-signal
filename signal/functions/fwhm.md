---
layout: "default"
permalink: "/functions/4_fwhm/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - fwhm"
category: "Utility"
func_name: "fwhm"
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
<dt class="deftypefn def-line" id="index-fwhm"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">fwhm</strong> <code class="def-code-arguments">(<var class="var">y</var>)</code><a class="copiable-link" href="#index-fwhm"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fwhm-1"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">fwhm</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>)</code><a class="copiable-link" href="#index-fwhm-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fwhm-2"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">fwhm</strong> <code class="def-code-arguments">(&hellip;, &quot;zero&quot;)</code><a class="copiable-link" href="#index-fwhm-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fwhm-3"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">fwhm</strong> <code class="def-code-arguments">(&hellip;, &quot;min&quot;)</code><a class="copiable-link" href="#index-fwhm-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fwhm-4"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">fwhm</strong> <code class="def-code-arguments">(&hellip;, &quot;alevel&quot;, <var class="var">level</var>)</code><a class="copiable-link" href="#index-fwhm-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fwhm-5"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">fwhm</strong> <code class="def-code-arguments">(&hellip;, &quot;rlevel&quot;, <var class="var">level</var>)</code><a class="copiable-link" href="#index-fwhm-5"></a></span></dt>
<dd>
<p>Compute peak full-width at half maximum (FWHM) or at another level of peak
 maximum for vector or matrix data <var class="var">y</var>, optionally sampled as <em class="math">y(x)</em>.
 If <var class="var">y</var> is a matrix, return FWHM for each column as a row vector.
</p>
<p>The default option &quot;zero&quot; computes fwhm at half maximum, i.e.
 <em class="math">0.5*max(y)</em>.  The option &quot;min&quot; computes fwhm at the middle curve, i.e.
 <em class="math">0.5*(min(y)+max(y))</em>.
</p>
<p>The option &quot;rlevel&quot; computes full-width at the given relative level of peak
 profile, i.e. at <em class="math">rlevel*max(y)</em> or <em class="math">rlevel*(min(y)+max(y))</em>,
 respectively.  For example, <code class="code">fwhm (&hellip;, &quot;rlevel&quot;, 0.1)</code> computes
 full width at 10 % of peak maximum with respect to zero or minimum; FWHM is
 equivalent to <code class="code">fwhm(&hellip;, &quot;rlevel&quot;, 0.5)</code>.
</p>
<p>The option &quot;alevel&quot; computes full-width at the given absolute level of
 <var class="var">y</var>.
</p>
<p>Return 0 if FWHM does not exist (e.g. monotonous function or the function
 does not cut horizontal line at <em class="math">rlevel*max(y)</em> or
 <em class="math">rlevel*(max(y)+min(y))</em> or alevel, respectively).
</p>
</dd></dl>