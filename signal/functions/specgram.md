---
layout: "default"
permalink: "/functions/8_specgram/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - specgram"
category: "Signals"
func_name: "specgram"
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
<dt class="deftypefn" id="index-specgram"><span class="category-def">Function File: </span><span><strong class="def-name">specgram</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code><a class="copiable-link" href="#index-specgram"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-specgram-1"><span class="category-def">Function File: </span><span><strong class="def-name">specgram</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code><a class="copiable-link" href="#index-specgram-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-specgram-2"><span class="category-def">Function File: </span><span><strong class="def-name">specgram</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">Fs</var>)</code><a class="copiable-link" href="#index-specgram-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-specgram-3"><span class="category-def">Function File: </span><span><strong class="def-name">specgram</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">Fs</var>, <var class="var">window</var>)</code><a class="copiable-link" href="#index-specgram-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-specgram-4"><span class="category-def">Function File: </span><span><strong class="def-name">specgram</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">Fs</var>, <var class="var">window</var>, <var class="var">overlap</var>)</code><a class="copiable-link" href="#index-specgram-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-specgram-5"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">S</var>, <var class="var">f</var>, <var class="var">t</var>] =</code> <strong class="def-name">specgram</strong> <code class="def-code-arguments">(&hellip;)</code><a class="copiable-link" href="#index-specgram-5"></a></span></dt>
<dd>
<p>Generate a spectrogram for the signal <var class="var">x</var>.  The signal is chopped into
 overlapping segments of length <var class="var">n</var>, and each segment is windowed and
 transformed into the frequency domain using the FFT.  The default segment
 size is 256.  If <var class="var">fs</var> is given, it specifies the sampling rate of the
 input signal.  The argument <var class="var">window</var> specifies an alternate window to
 apply rather than the default of <code class="code">hanning (<var class="var">n</var>)</code>.  The argument
 <var class="var">overlap</var> specifies the number of samples overlap between successive
 segments of the input signal.  The default overlap is
 <code class="code">length (<var class="var">window</var>)/2</code>.
</p>
<p>If no output arguments are given, the spectrogram is displayed.  Otherwise,
 <var class="var">S</var> is the complex output of the FFT, one row per slice, <var class="var">f</var> is the
 frequency indices corresponding to the rows of <var class="var">S</var>, and <var class="var">t</var> is the
 time indices corresponding to the columns of <var class="var">S</var>.
</p>
<p>Example:
 </p><div class="example">
<pre class="example-preformatted"> </pre><div class="group"><pre class="example-preformatted">    x = chirp([0:0.001:2],0,2,500);  # freq. sweep from 0-500 over 2 sec.
    Fs=1000;                  # sampled every 0.001 sec so rate is 1 kHz
    step=ceil(20*Fs/1000);    # one spectral slice every 20 ms
    window=ceil(100*Fs/1000); # 100 ms data window
    specgram(x, 2^nextpow2(window), Fs, window, window-step);

    ## Speech spectrogram
    [x, Fs] = auload(file_in_loadpath(&quot;sample.wav&quot;)); # audio file
    step = fix(5*Fs/1000);     # one spectral slice every 5 ms
    window = fix(40*Fs/1000);  # 40 ms data window
    fftn = 2^nextpow2(window); # next highest power of 2
    [S, f, t] = specgram(x, fftn, Fs, window, window-step);
    S = abs(S(2:fftn*4000/Fs,:)); # magnitude in range 0&lt;f&lt;=4000 Hz.
    S = S/max(S(:));           # normalize magnitude so that max is 0 dB.
    S = max(S, 10^(-40/10));   # clip below -40 dB.
    S = min(S, 10^(-3/10));    # clip above -3 dB.
    imagesc (t, f, log(S));    # display in log scale
    set (gca, &quot;ydir&quot;, &quot;normal&quot;); # put the 'y' direction in the correct direction
 </pre></div><pre class="example-preformatted"> </pre></div>

<p>The choice of window defines the time-frequency resolution.  In
 speech for example, a wide window shows more harmonic detail while a
 narrow window averages over the harmonic detail and shows more
 formant structure. The shape of the window is not so critical so long
 as it goes gradually to zero on the ends.
</p>
<p>Step size (which is window length minus overlap) controls the
 horizontal scale of the spectrogram. Decrease it to stretch, or
 increase it to compress. Increasing step size will reduce time
 resolution, but decreasing it will not improve it much beyond the
 limits imposed by the window size (you do gain a little bit,
 depending on the shape of your window, as the peak of the window
 slides over peaks in the signal energy).  The range 1-5 msec is good
 for speech.
</p>
<p>FFT length controls the vertical scale.  Selecting an FFT length
 greater than the window length does not add any information to the
 spectrum, but it is a good way to interpolate between frequency
 points which can make for prettier spectrograms.
</p>
<p>After you have generated the spectral slices, there are a number of
 decisions for displaying them.  First the phase information is
 discarded and the energy normalized:
</p>
<p>S = abs(S); S = S/max(S(:));
</p>
<p>Then the dynamic range of the signal is chosen.  Since information in
 speech is well above the noise floor, it makes sense to eliminate any
 dynamic range at the bottom end.  This is done by taking the max of
 the magnitude and some minimum energy such as minE=-40dB. Similarly,
 there is not much information in the very top of the range, so
 clipping to a maximum energy such as maxE=-3dB makes sense:
</p>
<p>S = max(S, 10^(minE/10)); S = min(S, 10^(maxE/10));
</p>
<p>The frequency range of the FFT is from 0 to the Nyquist frequency of
 one half the sampling rate.  If the signal of interest is band
 limited, you do not need to display the entire frequency range. In
 speech for example, most of the signal is below 4 kHz, so there is no
 reason to display up to the Nyquist frequency of 10 kHz for a 20 kHz
 sampling rate.  In this case you will want to keep only the first 40%
 of the rows of the returned S and f.  More generally, to display the
 frequency range [minF, maxF], you could use the following row index:
</p>
<p>idx = (f &gt;= minF &amp; f &lt;= maxF);
</p>
<p>Then there is the choice of colormap.  A brightness varying colormap
 such as copper or bone gives good shape to the ridges and valleys. A
 hue varying colormap such as jet or hsv gives an indication of the
 steepness of the slopes.  The final spectrogram is displayed in log
 energy scale and by convention has low frequencies on the bottom of
 the image:
</p>
<p>imagesc(t, f, flipud(log(S(idx,:))));
 </p></dd></dl>