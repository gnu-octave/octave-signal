---
layout: "default"
permalink: "/functions/5_xcorr/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - xcorr"
category: "Utility"
func_name: "xcorr"
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
<dt class="deftypefn def-line" id="index-xcorr"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">R</var>, <var class="var">lag</var>] =</code> <strong class="def-name">xcorr</strong> <code class="def-code-arguments">( <var class="var">X</var> )</code><a class="copiable-link" href="#index-xcorr"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcorr-1"><span class="category-def">Function File: </span><span><code class="def-type">&hellip; =</code> <strong class="def-name">xcorr</strong> <code class="def-code-arguments">( <var class="var">X</var>, <var class="var">Y</var> )</code><a class="copiable-link" href="#index-xcorr-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcorr-2"><span class="category-def">Function File: </span><span><code class="def-type">&hellip; =</code> <strong class="def-name">xcorr</strong> <code class="def-code-arguments">( &hellip;, <var class="var">maxlag</var>)</code><a class="copiable-link" href="#index-xcorr-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcorr-3"><span class="category-def">Function File: </span><span><code class="def-type">&hellip; =</code> <strong class="def-name">xcorr</strong> <code class="def-code-arguments">( &hellip;, <var class="var">scale</var>)</code><a class="copiable-link" href="#index-xcorr-3"></a></span></dt>
<dd><p>Estimates the cross-correlation.
</p>
<p>Estimate the cross correlation R_xy(k) of vector arguments <var class="var">X</var> and <var class="var">Y</var>
 or, if <var class="var">Y</var> is omitted, estimate autocorrelation R_xx(k) of vector <var class="var">X</var>,
 for a range of lags k specified by  argument &quot;maxlag&quot;.  If <var class="var">X</var> is a
 matrix, each column of <var class="var">X</var> is correlated with itself and every other
 column.
</p>
<p>The cross-correlation estimate between vectors &quot;x&quot; and &quot;y&quot; (of
 length N) for lag &quot;k&quot; is given by
</p>
<div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted">            N
 R_xy(k) = sum x_{i+k} conj(y_i),
           i=1
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>where data not provided (for example x(-1), y(N+1)) is zero. Note the
 definition of cross-correlation given above. To compute a
 cross-correlation consistent with the field of statistics, see <code class="command">xcov</code>.
</p>
<p><strong class="strong">ARGUMENTS</strong>
 </p><dl class="table">
<dt><var class="var">X</var></dt>
<dd><p>[non-empty; real or complex; vector or matrix] data
</p>
</dd>
<dt><var class="var">Y</var></dt>
<dd><p>[real or complex vector] data
</p>
<p>If <var class="var">X</var> is a matrix (not a vector), <var class="var">Y</var> must be omitted.
 <var class="var">Y</var> may be omitted if <var class="var">X</var> is a vector; in this case xcorr
 estimates the autocorrelation of <var class="var">X</var>.
</p>
</dd>
<dt><var class="var">maxlag</var></dt>
<dd><p>[integer scalar] maximum correlation lag
 If omitted, the default value is N-1, where N is the
 greater of the lengths of <var class="var">X</var> and <var class="var">Y</var> or, if <var class="var">X</var> is a matrix,
 the number of rows in <var class="var">X</var>.
</p>
</dd>
<dt><var class="var">scale</var></dt>
<dd><p>[character string] specifies the type of scaling applied
 to the correlation vector (or matrix). is one of:
 </p><dl class="table">
<dt>&lsquo;<samp class="samp">none</samp>&rsquo;</dt>
<dd><p>return the unscaled correlation, R,
 </p></dd>
<dt>&lsquo;<samp class="samp">biased</samp>&rsquo;</dt>
<dd><p>return the biased average, R/N,
 </p></dd>
<dt>&lsquo;<samp class="samp">unbiased</samp>&rsquo;</dt>
<dd><p>return the unbiased average, R(k)/(N-|k|),
 </p></dd>
<dt>&lsquo;<samp class="samp">coeff or normalized</samp>&rsquo;</dt>
<dd><p>return the correlation coefficient, R/(rms(x).rms(y)),
 where &quot;k&quot; is the lag, and &quot;N&quot; is the length of <var class="var">X</var>.
 If omitted, the default value is &quot;none&quot;.
 If <var class="var">Y</var> is supplied but does not have the same length as <var class="var">X</var>,
 scale must be &quot;none&quot;.
 </p></dd>
</dl>
</dd>
</dl>

<p><strong class="strong">RETURNED VARIABLES</strong>
 </p><dl class="table">
<dt><var class="var">R</var></dt>
<dd><p>array of correlation estimates
 </p></dd>
<dt><var class="var">lag</var></dt>
<dd><p>row vector of correlation lags [-maxlag:maxlag]
 </p></dd>
</dl>

<p>The array of correlation estimates has one of the following forms:
 (1) Cross-correlation estimate if <var class="var">X</var> and <var class="var">Y</var> are vectors.
</p>
<p>(2) Autocorrelation estimate if is a vector and <var class="var">Y</var> is omitted.
</p>
<p>(3) If <var class="var">X</var> is a matrix, R is an matrix containing the cross-correlation
 estimate of each column with every other column. Lag varies with the first
 index so that R has 2*maxlag+1 rows and P^2 columns where P is the number of
 columns in <var class="var">X</var>.
</p>
<p>If Rij(k) is the correlation between columns i and j of <var class="var">X</var>
</p>
<p><code class="code">R(k+maxlag+1,P*(i-1)+j) == Rij(k)</code>
</p>
<p>for lag k in [-maxlag:maxlag], or
</p>
<p><code class="code">R(:,P*(i-1)+j) == xcorr(X(:,i),X(:,j))</code>.
</p>
<p><code class="code">reshape(R(k,:),P,P)</code> is the cross-correlation matrix for <code class="code">X(k,:)</code>.
</p>

<p><strong class="strong">See also:</strong> xcov.
 </p></dd></dl>