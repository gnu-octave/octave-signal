---
layout: "default"
permalink: "/functions/7_sftrans/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - sftrans"
category: "Utility"
func_name: "sftrans"
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
<dt class="deftypefn def-line" id="index-sftrans"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">Sz</var>, <var class="var">Sp</var>, <var class="var">Sg</var>] =</code> <strong class="def-name">sftrans</strong> <code class="def-code-arguments">(<var class="var">Sz</var>, <var class="var">Sp</var>, <var class="var">Sg</var>, <var class="var">W</var>, <var class="var">stop</var>)</code><a class="copiable-link" href="#index-sftrans"></a></span></dt>
<dd>
<p>Transform band edges of a generic lowpass filter (cutoff at W=1)
 represented in splane zero-pole-gain form.  W is the edge of the
 target filter (or edges if band pass or band stop). Stop is true for
 high pass and band stop filters or false for low pass and band pass
 filters. Filter edges are specified in radians, from 0 to pi (the
 nyquist frequency).
</p>
<p>Theory: Given a low pass filter represented by poles and zeros in the
 splane, you can convert it to a low pass, high pass, band pass or
 band stop by transforming each of the poles and zeros individually.
 The following table summarizes the transformation:
</p>
<div class="example">
<pre class="example-preformatted"> Transform         Zero at x                  Pole at x
 ----------------  -------------------------  ------------------------
 Low Pass          zero: Fc x/C               pole: Fc x/C
 S -&gt; C S/Fc       gain: C/Fc                 gain: Fc/C
 ----------------  -------------------------  ------------------------
 High Pass         zero: Fc C/x               pole: Fc C/x
 S -&gt; C Fc/S       pole: 0                    zero: 0
                   gain: -x                   gain: -1/x
 ----------------  -------------------------  ------------------------
 Band Pass         zero: b +- sqrt(b^2-FhFl)  pole: b +- sqrt(b^2-FhFl)
        S^2+FhFl   pole: 0                    zero: 0
 S -&gt; C --------   gain: C/(Fh-Fl)            gain: (Fh-Fl)/C
        S(Fh-Fl)   b=x/C (Fh-Fl)/2            b=x/C (Fh-Fl)/2
 ----------------  -------------------------  ------------------------
 Band Stop         zero: b +- sqrt(b^2-FhFl)  pole: b +- sqrt(b^2-FhFl)
        S(Fh-Fl)   pole: +-sqrt(-FhFl)        zero: +-sqrt(-FhFl)
 S -&gt; C --------   gain: -x                   gain: -1/x
        S^2+FhFl   b=C/x (Fh-Fl)/2            b=C/x (Fh-Fl)/2
 ----------------  -------------------------  ------------------------
 Bilinear          zero: (2+xT)/(2-xT)        pole: (2+xT)/(2-xT)
      2 z-1        pole: -1                   zero: -1
 S -&gt; - ---        gain: (2-xT)/T             gain: (2-xT)/T
      T z+1
 ----------------  -------------------------  ------------------------
 </pre></div>

<p>where C is the cutoff frequency of the initial lowpass filter, Fc is
 the edge of the target low/high pass filter and [Fl,Fh] are the edges
 of the target band pass/stop filter.  With abundant tedious algebra,
 you can derive the above formulae yourself by substituting the
 transform for S into H(S)=S-x for a zero at x or H(S)=1/(S-x) for a
 pole at x, and converting the result into the form:
</p>
<div class="example">
<pre class="example-preformatted">    H(S)=g prod(S-Xi)/prod(S-Xj)
 </pre></div>

<p>The transforms are from the references.  The actual pole-zero-gain
 changes I derived myself.
</p>
<p>Please note that a pole and a zero at the same place exactly cancel.
 This is significant for High Pass, Band Pass and Band Stop filters
 which create numerous extra poles and zeros, most of which cancel.
 Those which do not cancel have a &quot;fill-in&quot; effect, extending the
 shorter of the sets to have the same number of as the longer of the
 sets of poles and zeros (or at least split the difference in the case
 of the band pass filter).  There may be other opportunistic
 cancellations but I will not check for them.
</p>
<p>Also note that any pole on the unit circle or beyond will result in
 an unstable filter.  Because of cancellation, this will only happen
 if the number of poles is smaller than the number of zeros and the
 filter is high pass or band pass.  The analytic design methods all
 yield more poles than zeros, so this will not be a problem.
</p>
<p>References:
</p>
<p>Proakis &amp; Manolakis (1992). Digital Signal Processing. New York:
 Macmillan Publishing Company.
 </p></dd></dl>