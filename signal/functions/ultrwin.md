---
layout: "default"
permalink: "/functions/7_ultrwin/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - ultrwin"
category: "Utility"
func_name: "ultrwin"
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
<dt class="deftypefn def-line" id="index-ultrwin"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">w</var>, <var class="var">xmu</var>] =</code> <strong class="def-name">ultrwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">mu</var>, <var class="var">beta</var>)</code><a class="copiable-link" href="#index-ultrwin"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ultrwin-1"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">w</var>, <var class="var">xmu</var>] =</code> <strong class="def-name">ultrwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">mu</var>, <var class="var">att</var>, &quot;att&quot;)</code><a class="copiable-link" href="#index-ultrwin-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ultrwin-2"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">w</var>, <var class="var">xmu</var>] =</code> <strong class="def-name">ultrwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">mu</var>, <var class="var">latt</var>, &quot;latt&quot;)</code><a class="copiable-link" href="#index-ultrwin-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ultrwin-3"><span class="category-def">Function File: </span><span><code class="def-type"><var class="var">w</var> =</code> <strong class="def-name">ultrwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">mu</var>, <var class="var">xmu</var>, &quot;xmu&quot;)</code><a class="copiable-link" href="#index-ultrwin-3"></a></span></dt>
<dd><p>Return the coefficients of an Ultraspherical window of length <var class="var">m</var>.
 The parameter <var class="var">mu</var> controls the window&rsquo;s Fourier transform&rsquo;s side-lobe
 to side-lobe ratio, and the third given parameter controls the transform&rsquo;s
 main-lobe width/side-lobe-ratio; normalize <var class="var">w</var> such that the central
 coefficient(s) value is unitary.
</p>
<p>By default, the third parameter is <var class="var">beta</var>, which sets the main lobe width
 to <var class="var">beta</var> times that of a rectangular window.  Alternatively, giving
 <var class="var">att</var> or <var class="var">latt</var> sets the ripple ratio at the first or last side-lobe
 respectively, or giving <var class="var">xmu</var> sets the (un-normalized) window&rsquo;s Fourier
 transform according to its canonical definition:
</p>
<pre class="verbatim">              (MU)
      W(k) = C   [ XMU cos(pi k/M) ],  k = 0, 1, ..., M-1,
              M-1
 </pre>
<p>where C is the Ultraspherical (a.k.a. Gegenbauer) polynomial, which can be
 defined using the recurrence relationship:
</p>
<pre class="verbatim">       (l)    1                  (l)                    (l)
      C (x) = - [ 2x(m + l - 1) C   (x) - (m + 2l - 2) C   (x) ]
       m      m                  m-1                    m-2

                                 (l)        (l)
      for m an integer &gt; 1, and C (x) = 1, C (x) = 2lx.
                                 0          1
 </pre>
<p>For given <var class="var">beta</var>, <var class="var">att</var>, or <var class="var">latt</var>, the corresponding
 (determined) value of <var class="var">xmu</var> is also returned.
</p>
<p>The Dolph-Chebyshev and Saramaki windows are special cases of the
 Ultraspherical window, with <var class="var">mu</var> set to 0 and 1 respectively.  Note that
 when not giving <var class="var">xmu</var>, stability issues may occur with <var class="var">mu</var> &lt;= -1.5.
 For further information about the window, see
</p>
<ul class="itemize mark-bullet">
<li>Kabal, P., 2009: Time Windows for Linear Prediction of Speech.
 Technical Report, Dept. Elec. &amp; Comp. Eng., McGill University.
 </li><li>Bergen, S., Antoniou, A., 2004: Design of Ultraspherical Window
 Functions with Prescribed Spectral Characteristics. Proc. JASP, 13/13,
 pp. 2053-2065.
 </li><li>Streit, R., 1984: A two-parameter family of weights for nonrecursive
 digital filters and antennas. Trans. ASSP, 32, pp. 108-118.
 </li></ul>

<p><strong class="strong">See also:</strong> chebwin, kaiser.
 </p></dd></dl>