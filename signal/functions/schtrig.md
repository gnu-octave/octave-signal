---
layout: "default"
permalink: "/functions/7_schtrig/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - schtrig"
category: "Utility"
func_name: "schtrig"
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
<dt class="deftypefn def-line" id="index-_0028x_002clvl_002crst_003d1_0029"><span class="category-def"><var class="var">v</var> =: </span><span><code class="def-type">schtrig</code> <strong class="def-name">(<var class="var">x</var>,<var class="var">lvl</var>,<var class="var">rst</var>=1)</strong><a class="copiable-link" href="#index-_0028x_002clvl_002crst_003d1_0029"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028_002e_002e_002e_0029"><span class="category-def">[<var class="var">v</var>,<var class="var">rng</var>] =: </span><span><code class="def-type">schtrig</code> <strong class="def-name">(&hellip;)</strong><a class="copiable-link" href="#index-_0028_002e_002e_002e_0029"></a></span></dt>
<dd><p>Implements a multisignal Schmitt trigger with levels <var class="var">lvl</var>.
</p>
<p>The triger works along the first dimension of the 2-dimensional array <var class="var">x</var>.
 It compares each column in <var class="var">x</var> to the levels in <var class="var">lvl</var>, when the
 value is higher <code class="code">max (<var class="var">lvl</var>)</code> the output <var class="var">v</var> is high (i.e. 1); when the
 value is below <code class="code">min (<var class="var">lvl</var>)</code> the output is low (i.e. 0); and when
 the value is between the two levels the output retains its value.
</p>
<p>The threshold levels are passed in the array <var class="var">lvl</var>. If this is a scalar,
 the thresholds are symmetric around 0, i.e. <code class="code">[-lvl lvl]</code>.
</p>
<p>The second output argument stores the ranges in which the output is high, so
 the indexes <var class="var">rng(1,i):rng(2,i)</var> point to the i-th segment of 1s in <var class="var">v</var>.
 See <code class="code">clustersegment</code> for a detailed explanation.
</p>
<p>The function conserves the state of the trigger across calls (persistent variable).
 If the reset flag is active, i.e. <code class="code"><var class="var">rst</var>== true</code>, then the state of
 the trigger for all signals is set to the low state (i.e. 0).
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> x = [0 0.5 1 1.5 2 1.5 1.5 1.2 1 0 0].';
 y = schtrig (x, [1.3 1.6]);
 disp ([x y]);
   0.0   0
   0.5   0
   1.0   0
   1.5   0
   2.0   1
   1.5   1
   1.5   1
   1.2   0
   1.0   0
   0.0   0
   0.0   0
 </pre></div>

<p>Run <code class="code">demo schtrig</code> to see further examples.
</p>

<p><strong class="strong">See also:</strong> clustersegment.
 </p></dd></dl>