---
layout: "default"
permalink: "/functions/6_pwelch/"
pkg_name: "signal"
pkg_version: "1.4.6"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - pwelch"
category: "Power Spectrum Analysis"
func_name: "pwelch"
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
<dt class="deftypefn" id="index-pwelch_0028x_002c"><span class="category-def">Function File: </span><span><code class="def-type">[<var class="var">spectra</var>,<var class="var">freq</var>] =</code> <strong class="def-name">pwelch(<var class="var">x</var>,</strong> <code class="def-code-arguments"><var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>, <var class="var">Fs</var>, <var class="var">range</var>, <var class="var">plot_type</var>, <var class="var">detrend</var>, <var class="var">sloppy</var>)</code><a class="copiable-link" href="#index-pwelch_0028x_002c"></a></span></dt>
<dd><p>Estimate power spectral density of data &quot;x&quot; by the Welch (1967) periodogram/FFT method.
</p>
<p>All arguments except &quot;x&quot; are optional.
</p>
<p>The data is divided into segments.  If &quot;window&quot; is a vector, each
 segment has the same length as &quot;window&quot; and is multiplied by &quot;window&quot;
 before (optional) zero-padding and calculation of its periodogram. If
 &quot;window&quot; is a scalar, each segment has a length of &quot;window&quot; and a
 Hamming window is used.
</p>
<p>The spectral density is the mean of the periodograms, scaled so that
 area under the spectrum is the same as the mean square of the
 data.  This equivalence is supposed to be exact, but in practice there
 is a mismatch of up to 0.5% when comparing area under a periodogram
 with the mean square of the data.
</p>
<p>[spectra,freq] = pwelch(x,y,window,overlap,Nfft,Fs,
                          range,plot_type,detrend,sloppy,results)
</p>
<p>Two-channel spectrum analyser.  Estimate power spectral density, cross-
 spectral density, transfer function and/or coherence functions of time-
 series input data &quot;x&quot; and output data &quot;y&quot; by the Welch (1967)
 periodogram/FFT method.
</p>
<p>pwelch treats the second argument as &quot;y&quot; if there is a control-string
 argument &quot;cross&quot;, &quot;trans&quot;, &quot;coher&quot; or &quot;ypower&quot;; &quot;power&quot; does not force
 the 2nd argument to be treated as &quot;y&quot;.  All other arguments are
 optional.  All spectra are returned in matrix &quot;spectra&quot;.
</p>
<p>[spectra,Pxx_ci,freq] = pwelch(x,window,overlap,Nfft,Fs,conf,
                                range,plot_type,detrend,sloppy)
</p>
<p>[spectra,Pxx_ci,freq] = pwelch(x,y,window,overlap,Nfft,Fs,conf,
                                range,plot_type,detrend,sloppy,results)
</p>
<p>Estimates confidence intervals for the spectral density.
</p>
<p>See Hint (7) below for compatibility options.
</p>
<p>Confidence level &quot;conf&quot; is the 6th or 7th numeric argument.  If &quot;results&quot; control-string
 arguments are used, one of them must be &quot;power&quot; when the &quot;conf&quot;
 argument is present; pwelch can estimate confidence intervals only for
 the power spectrum of the &quot;x&quot; data.  It does not know how to estimate
 confidence intervals of the cross-power spectrum, transfer function or
 coherence; if you can suggest a good method, please send a bug report.
</p>
<p>ARGUMENTS
</p>
<p>All but the first argument are optional and may be empty, except that
 the &quot;results&quot; argument may require the second argument to be &quot;y&quot;.
 </p><dl class="table">
<dt>x</dt>
<dd><p>[non-empty vector] system-input time-series data
 </p></dd>
<dt>y</dt>
<dd><p>[non-empty vector] system-output time-series data
 </p></dd>
<dt>window</dt>
<dd><p>[real vector] of window-function values; the
             data segment has the same length as the window.
             Default window shape is Hamming.
</p>
<p>[integer scalar] length of each data segment.  The default
             value is window=sqrt(length(x)) rounded up to the
             nearest integer power of 2; see &rsquo;sloppy&rsquo; argument.
</p>
</dd>
<dt>overlap</dt>
<dd><p>[real scalar] segment overlap expressed as a multiple of
             window or segment length.   0 &lt;= overlap &lt; 1,
             The default is overlap=0.5 .
</p>
</dd>
<dt>Nfft</dt>
<dd><p>[integer scalar] Length of FFT.  The default is the length
             of the &quot;window&quot; vector or has the same value as the
             scalar &quot;window&quot; argument.  If Nfft is larger than the
             segment length, &quot;seg_len&quot;, the data segment is padded
             with &quot;Nfft-seg_len&quot; zeros.  The default is no padding.
             Nfft values smaller than the length of the data
             segment (or window) are ignored silently.
</p>
</dd>
<dt>Fs</dt>
<dd><p>[real scalar] sampling frequency (Hertz); default=1.0
</p>
</dd>
<dt>conf</dt>
<dd><p>[real scalar] confidence level between 0 and 1.  Confidence
             intervals of the spectral density are estimated from
             scatter in the periodograms and are returned as Pxx_ci.
             Pxx_ci(:,1) is the lower bound of the confidence
             interval and Pxx_ci(:,2) is the upper bound.  If there
             are three return values, or conf is an empty matrix,
             confidence intervals are calculated for conf=0.95 .
             If conf is zero or is not given, confidence intervals
             are not calculated. Confidence intervals can be
             obtained only for the power spectral density of x;
             nothing else.
 </p></dd>
</dl>

<p>CONTROL-STRING ARGUMENTS &ndash; each of these arguments is a character string.
   Control-string arguments must be after the other arguments but can be in
   any order.
</p>
<dl class="table">
<dt>range</dt>
<dd><p>&rsquo;half&rsquo;,  &rsquo;onesided&rsquo; : frequency range of the spectrum is
           zero up to but not including Fs/2.  Power from
           negative frequencies is added to the positive side of
           the spectrum, but not at zero or Nyquist (Fs/2)
           frequencies.  This keeps power equal in time and
           spectral domains.  See reference [2].
</p>
<p>&rsquo;whole&rsquo;, &rsquo;twosided&rsquo; : frequency range of the spectrum is
           -Fs/2 to Fs/2, with negative frequencies
           stored in &quot;wrap around&quot; order after the positive
           frequencies; e.g. frequencies for a 10-point &rsquo;twosided&rsquo;
           spectrum are 0 0.1 0.2 0.3 0.4 0.5 -0.4 -0.3 -0.2 -0.1
</p>
<p>&rsquo;shift&rsquo;, &rsquo;centerdc&rsquo; : same as &rsquo;whole&rsquo; but with the first half
           of the spectrum swapped with second half to put the
           zero-frequency value in the middle. (See &quot;help
           fftshift&quot;.
</p>
<p>If data (x and y) are real, the default range is &rsquo;half&rsquo;,
           otherwise default range is &rsquo;whole&rsquo;.
</p>
</dd>
<dt>plot_type</dt>
<dd><p>&rsquo;plot&rsquo;, &rsquo;semilogx&rsquo;, &rsquo;semilogy&rsquo;, &rsquo;loglog&rsquo;, &rsquo;squared&rsquo; or &rsquo;db&rsquo;:
           specifies the type of plot.  The default is &rsquo;plot&rsquo;, which
           means linear-linear axes. &rsquo;squared&rsquo; is the same as &rsquo;plot&rsquo;.
           &rsquo;dB&rsquo; plots &quot;10*log10(psd)&quot;.  This argument is ignored and a
           spectrum is not plotted if the caller requires a returned
           value.
</p>
</dd>
<dt>detrend</dt>
<dd><p>&rsquo;no-strip&rsquo;, &rsquo;none&rsquo; &ndash; do NOT remove mean value from the data
</p>
<p>&rsquo;short&rsquo;, &rsquo;mean&rsquo; &ndash; remove the mean value of each segment from
           each segment of the data.
</p>
<p>&rsquo;linear&rsquo;,       &ndash; remove linear trend from each segment of
           the data.
</p>
<p>&rsquo;long-mean&rsquo;     &ndash; remove the mean value from the data before
           splitting it into segments.  This is the default.
</p>
</dd>
<dt>sloppy</dt>
<dd><p>&rsquo;sloppy&rsquo;: FFT length is rounded up to the nearest integer
           power of 2 by zero padding.  FFT length is adjusted
           after addition of padding by explicit Nfft argument.
           The default is to use exactly the FFT and window/
           segment lengths specified in argument list.
</p>
</dd>
<dt>results</dt>
<dd><p>specifies what results to return (in the order specified
           and as many as desired).
</p>
<p>&rsquo;power&rsquo; calculate power spectral density of &quot;x&quot;
</p>
<p>&rsquo;cross&rsquo; calculate cross spectral density of &quot;x&quot; and &quot;y&quot;
</p>
<p>&rsquo;trans&rsquo; calculate transfer function of a system with
           input &quot;x&quot; and output &quot;y&quot;
</p>
<p>&rsquo;coher&rsquo; calculate coherence function of &quot;x&quot; and &quot;y&quot;
</p>
<p>&rsquo;ypower&rsquo; calculate power spectral density of &quot;y&quot;
</p>
<p>The default is &rsquo;power&rsquo;, with argument &quot;y&quot; omitted.
 </p></dd>
</dl>

<p>RETURNED VALUES:
</p>
<p>If return values are not required by the caller, the results are
     plotted and nothing is returned.
</p>
<dl class="table">
<dt>spectra</dt>
<dd><p>[real-or-complex matrix] columns of the matrix contain results
           in the same order as specified by &quot;results&quot; arguments.
           Each column contains one of the result vectors.
</p>
</dd>
<dt>Pxx_ci</dt>
<dd><p>[real matrix] estimate of confidence interval for power
           spectral density of x.  First column is the lower
           bound.  Second column is the upper bound.
</p>
</dd>
<dt>freq</dt>
<dd><p>[real column vector] frequency values
 </p></dd>
</dl>

<p>HINTS
 </p><ol class="enumerate">
<li> EMPTY ARGS:
    if you don&rsquo;t want to use an optional argument you can leave it empty
    by writing its value as [].

</li><li> FOR BEGINNERS:
    The profusion of arguments may make pwelch difficult to use, and an
    unskilled user can easily produce a meaningless result or can easily
    mis-interpret the result.  With real data &quot;x&quot; and sampling frequency
    &quot;Fs&quot;, the easiest and best way for a beginner to use pwelch is
    probably &quot;pwelch(x,[],[],[],Fs)&quot;.  Use the &quot;window&quot; argument to
    control the length of the spectrum vector.  For real data and integer
    scalar M, &quot;pwelch(x,2*M,[],[],Fs)&quot; gives an M+1 point spectrum.
    Run &quot;demo pwelch&quot; (octave only).

</li><li> WINDOWING FUNCTIONS:
    Without a window function, sharp spectral peaks can have strong
    sidelobes because the FFT of a data in a segment is in effect convolved
    with a rectangular window.  A window function which tapers off
    (gradually) at the ends produces much weaker sidelobes in the FFT.
    Hann (hanning), hamming, bartlett, blackman, flattopwin etc are
    available as separate Matlab/sigproc or Octave functions.  The sidelobes
    of the Hann window have a roll-off rate of 60dB/decade of frequency.
    The first sidelobe of the Hamming window is suppressed and is about 12dB
    lower than the first Hann sidelobe, but the roll-off rate is only
    20dB/decade.  You can inspect the FFT of a Hann window by plotting
    &quot;abs(fft(postpad(hanning(256),4096,0)))&quot;.
    The default window is Hamming.

</li><li> ZERO PADDING:
    Zero-padding reduces the frequency step in the
    spectrum, and produces an artificially smoothed spectrum.  For example,
    &quot;Nfft=2*length(window)&quot; gives twice as many frequency values, but
    adjacent PSD (power spectral density) values are not independent;
    adjacent PSD values are independent if &quot;Nfft=length(window)&quot;, which is
    the default value of Nfft.

</li><li> REMOVING MEAN FROM SIGNAL:
    If the mean is not removed from the signal there is a large spectral
    peak at zero frequency and the sidelobes of this peak are likely to
    swamp the rest of the spectrum.  For this reason, the default behavior
    is to remove the mean.  However, the matlab pwelch does not do this.

</li><li> WARNING ON CONFIDENCE INTERVALS
    Confidence intervals are obtained by measuring the sample variance of
    the periodograms and assuming that the periodograms have a Gaussian
    probability distribution.  This assumption is not accurate.  If, for
    example, the data (x) is Gaussian, the periodogram has a Rayleigh
    distribution.  However, the confidence intervals may still be  useful.

</li><li> COMPATIBILITY WITH Matlab R11, R12, etc
    When used without the second data (y) argument, arguments are compatible
    with the pwelch of Matlab R12, R13, R14, 2006a and 2006b except that

<p>1) overlap is expressed as a multiple of window length &mdash;
        effect of overlap scales with window length
</p>
<p>2) default values of length(window), Nfft and Fs are more sensible, and
</p>
<p>3) Goertzel algorithm is not available so Nfft cannot be an array of
        frequencies as in Matlab 2006b.
</p>
<p>Pwelch has four persistent Matlab-compatibility levels.  Calling pwelch
    with an empty first argument sets the order of arguments and defaults
    specified above in the USAGE and ARGUMENTS section of this documentation.
    </p><div class="example">
<pre class="example-preformatted">          prev_compat=pwelch([]);
          [Pxx,f]=pwelch(x,window,overlap,Nfft,Fs,conf,...);
    </pre></div>
<p>Calling pwelch with a single string argument (as described below) gives
    compatibility with Matlab R11 or R12, or the R14 spectrum.welch
    defaults.  The returned value is the PREVIOUS compatibility string.
</p>
<p>Matlab R11:  For compatibility with the Matlab R11 pwelch:
    </p><div class="example">
<pre class="example-preformatted">          prev_compat=pwelch('R11-');
          [Pxx,f]=pwelch(x,Nfft,Fs,window,overlap,conf,range,units);
          %% units of overlap are &quot;number of samples&quot;
          %% defaults: Nfft=min(length(x),256), Fs=2*pi, length(window)=Nfft,
          %%           window=Hanning, do not detrend,
          %% N.B.  &quot;Sloppy&quot; is not available.
    </pre></div>

<p>Matlab R12:  For compatibility with Matlab R12 to 2006a pwelch:
    </p><div class="example">
<pre class="example-preformatted">          prev_compat=pwelch('R12+');
          [Pxx,f]=pwelch(x,window,overlap,nfft,Fs,...);
          %% units of overlap are &quot;number of samples&quot;
          %% defaults: length(window)==length(x)/8, window=Hamming,
          %%           Nfft=max(256,NextPow2), Fs=2*pi, do not detrend
          %% NextPow2 is the next power of 2 greater than or equal to the
          %% window length. &quot;Sloppy&quot;, &quot;conf&quot; are not available.  Default
          %% window length gives very poor amplitude resolution.
    </pre></div>

<p>To adopt defaults of the Matlab R14 &quot;spectrum.welch&quot; spectrum object
    associated &quot;psd&quot; method.
    </p><div class="example">
<pre class="example-preformatted">          prev_compat=pwelch('psd');
          [Pxx,f] = pwelch(x,window,overlap,Nfft,Fs,conf,...);
          %% overlap is expressed as a percentage of window length,
          %% defaults: length(window)==64, Nfft=max(256,NextPow2), Fs=2*pi
          %%           do not detrend
          %% NextPow2 is the next power of 2 greater than or equal to the
          %% window length. &quot;Sloppy&quot; is not available.
          %% Default window length gives coarse frequency resolution.
    </pre></div>
</li></ol>

<p>REFERENCES
</p>
<p>[1] Peter D. Welch (June 1967):
   &quot;The use of fast Fourier transform for the estimation of power spectra:
   a method based on time averaging over short, modified periodograms.&quot;
   IEEE Transactions on Audio Electroacoustics, Vol AU-15(6), pp 70-73
</p>
<p>[2] William H. Press and Saul A. Teukolsky and William T. Vetterling and
               Brian P. Flannery&quot;,
   &quot;Numerical recipes in C, The art of scientific computing&quot;, 2nd edition,
      Cambridge University Press, 2002 &mdash; Section 13.7.
 </p></dd></dl>