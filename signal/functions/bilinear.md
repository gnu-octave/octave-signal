---
layout: "default"
permalink: "/functions/8_bilinear/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - bilinear"
category: "Utility"
func_name: "bilinear"
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
<dt class="deftypefn def-line" id="index-bilinear"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">Zb</var>, <var class="var">Za</var>] =</code> <strong class="def-name">bilinear</strong> <code class="def-code-arguments">(<var class="var">Sb</var>, <var class="var">Sa</var>, <var class="var">T</var>)</code><a class="copiable-link" href="#index-bilinear"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-bilinear-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">Zb</var>, <var class="var">Za</var>] =</code> <strong class="def-name">bilinear</strong> <code class="def-code-arguments">(<var class="var">Sz</var>, <var class="var">Sp</var>, <var class="var">Sg</var>, <var class="var">T</var>)</code><a class="copiable-link" href="#index-bilinear-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-bilinear-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">Zz</var>, <var class="var">Zp</var>, <var class="var">Zg</var>] =</code> <strong class="def-name">bilinear</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-bilinear-2"></a></span></dt>
<dd><p>Transform a s-plane filter specification into a z-plane
 specification. Filters can be specified in either zero-pole-gain or
 transfer function form. The input form does not have to match the
 output form. 1/T is the sampling frequency represented in the z plane.
</p>
<p>Note: this differs from the bilinear function in the signal processing
 toolbox, which uses 1/T rather than T.
</p>
<p>Theory: Given a piecewise flat filter design, you can transform it
 from the s-plane to the z-plane while maintaining the band edges by
 means of the bilinear transform.  This maps the left hand side of the
 s-plane into the interior of the unit circle.  The mapping is highly
 non-linear, so you must design your filter with band edges in the
 s-plane positioned at 2/T tan(w*T/2) so that they will be positioned
 at w after the bilinear transform is complete.
</p>
<p>The following table summarizes the transformation:
</p>
<div class="example">
<pre class="example-preformatted"> +---------------+-----------------------+----------------------+
 | Transform     | Zero at x             | Pole at x            |
 |    H(S)       |   H(S) = S-x          |    H(S)=1/(S-x)      |
 +---------------+-----------------------+----------------------+
 |       2 z-1   | zero: (2+xT)/(2-xT)   | zero: -1             |
 |  S -&gt; - ---   | pole: -1              | pole: (2+xT)/(2-xT)  |
 |       T z+1   | gain: (2-xT)/T        | gain: (2-xT)/T       |
 +---------------+-----------------------+----------------------+
 </pre></div>

<p>With tedious algebra, you can derive the above formulae yourself by
 substituting the transform for S into H(S)=S-x for a zero at x or
 H(S)=1/(S-x) for a pole at x, and converting the result into the
 form:
</p>
<div class="example">
<pre class="example-preformatted">    H(Z)=g prod(Z-Xi)/prod(Z-Xj)
 </pre></div>

<p>Please note that a pole and a zero at the same place exactly cancel.
 This is significant since the bilinear transform creates numerous
 extra poles and zeros, most of which cancel. Those which do not
 cancel have a &quot;fill-in&quot; effect, extending the shorter of the sets to
 have the same number of as the longer of the sets of poles and zeros
 (or at least split the difference in the case of the band pass
 filter). There may be other opportunistic cancellations but I will
 not check for them.
</p>
<p>Also note that any pole on the unit circle or beyond will result in
 an unstable filter.  Because of cancellation, this will only happen
 if the number of poles is smaller than the number of zeros.  The
 analytic design methods all yield more poles than zeros, so this will
 not be a problem.
</p>
<p>References:
</p>
<p>Proakis &amp; Manolakis (1992). Digital Signal Processing. New York:
 Macmillan Publishing Company.
 </p></dd></dl>