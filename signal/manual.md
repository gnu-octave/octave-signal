---
layout: "default"
permalink: "/manual/"
title: "Signal Toolkit - Manual"
pkg_name: "signal"
version: "1.4.7"
description: "Signal processing tools, including filtering, windowing and display functions."
navigation:
- id: "overview"
  name: "Overview"
  url: "/index"
- id: "Functions"
  name: "Function Reference"
  url: "/functions"
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
- id: "Overview-1"
  name: "&nbsp;&nbsp; Overview"
  url: "/manual/#Overview-1"
- id: "Installing-and-loading-1"
  name: "&nbsp;&nbsp; Installing and loading"
  url: "/manual/#Installing-and-loading-1"
- id: "Function-Reference-1"
  name: "&nbsp;&nbsp; Function Reference"
  url: "/manual/#Function-Reference-1"
---
<div class="top-level-extent" id="Top">
<h1 class="top" id="Octave-Signal-Toolkit">Octave Signal Toolkit</h1>
<p>Copyright © The Octave Project Developers 
</p>
<p>Permission is granted to make and distribute verbatim copies of this manual provided the copyright notice
and this permission notice are preserved on all copies. 
</p>
<p>Permission is granted to copy and distribute modified versions of this manual under the conditions for
verbatim copying, provided that the entire resulting derived work is distributed under the terms of a
permission notice identical to this one. 
</p>
<p>Permission is granted to copy and distribute translations of this manual into another language, under the
above conditions for modified versions. 
</p><hr>
<div class="chapter-level-extent" id="Overview">
<h2 class="chapter" id="Overview-1">1 Overview</h2>
<a class="index-entry-id" id="index-Overview"></a>
<p>The Signal Toolkit contains signal processing tools, including filtering, windowing and display functions.
</p>
<hr>
</div>
<div class="chapter-level-extent" id="Installing-and-loading">
<h2 class="chapter" id="Installing-and-loading-1">2 Installing and loading</h2>
<a class="index-entry-id" id="index-Installing-and-loading"></a>
<p>The Signal Toolkit must be installed and then loaded to be used.
</p>
<p>It can be installed in <abbr class="acronym">GNU</abbr> Octave directly from octave-forge,
</p>
<div class="section-level-extent" id="Windows-install">
<h3 class="section">2.1 Windows install</h3>
<a class="index-entry-id" id="index-Windows-install"></a>
<p>If running in Windows, the package may already be installed, to check run:
</p>
<div class="example">
<pre class="example-preformatted">pkg list signal
</pre></div>
</div>
<div class="section-level-extent" id="Installing">
<h3 class="section">2.2 Installing</h3>
<a class="index-entry-id" id="index-Installing"></a>
<p>With an internet connection available, the Signal package can be installed from
octave-forge using the following command within <abbr class="acronym">GNU</abbr> Octave:
</p>
<div class="example">
<pre class="example-preformatted">pkg install -forge signal
</pre></div>
<p>The latest released version of the toolkit will be downloaded and installed.
</p>
<p>Otherwise, if the package file has already been downloaded it can be installed
using the follwoing command in <abbr class="acronym">GNU</abbr> Octave:
</p>
<div class="example">
<pre class="example-preformatted">pkg install signal-1.4.7.tar.gz
</pre></div>
</div>
<div class="section-level-extent" id="Loading">
<h3 class="section">2.3 Loading</h3>
<a class="index-entry-id" id="index-Loading"></a>
<p>Regardless of the method of installing the toolkit, in order to use its functions,
the toolkit must be loaded using the pkg load command:
</p>
<div class="example">
<pre class="example-preformatted">pkg load signal
</pre></div>
<p>The toolkit must be loaded on each <abbr class="acronym">GNU</abbr> Octave session.
</p>
<hr>
</div>
</div>
<div class="chapter-level-extent" id="Function-Reference">
<h2 class="chapter" id="Function-Reference-1">3 Function Reference</h2>
<a class="index-entry-id" id="index-Function-Reference"></a>
<hr>
<div class="section-level-extent" id="Signals">
<h3 class="section" id="Signals-1">3.1 Signals</h3>
<a class="index-entry-id" id="index-Signals"></a>
<div class="subsection-level-extent" id="buffer">
<h4 class="subsection">3.1.1 buffer</h4>
<a class="index-entry-id" id="index-buffer"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-buffer-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">buffer</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">p</var>, <var class="var">opt</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-buffer-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">y</var>, <var class="var">z</var>, <var class="var">opt</var>] =</code> <strong class="def-name">buffer</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd><p>Buffer a signal into a data frame. The arguments to <code class="code">buffer</code> are
</p>
<dl class="table">
<dt><var class="var">x</var></dt>
<dd><p>The data to be buffered.
</p>
</dd>
<dt><var class="var">n</var></dt>
<dd><p>The number of rows in the produced data buffer. This is an positive
 integer value and must be supplied.
</p>
</dd>
<dt><var class="var">p</var></dt>
<dd><p>An integer less than <var class="var">n</var> that specifies the under- or overlap
 between column in the data frame. The default value of <var class="var">p</var> is 0.
</p>
</dd>
<dt><var class="var">opt</var></dt>
<dd><p>In the case of an overlap, <var class="var">opt</var> can be either a vector of length
<var class="var">p</var> or the string &rsquo;nodelay&rsquo;. If <var class="var">opt</var> is a vector, then the
 first <var class="var">p</var> entries in <var class="var">y</var> will be filled with these values. If
<var class="var">opt</var> is the string &rsquo;nodelay&rsquo;, then the first value of <var class="var">y</var>
 corresponds to the first value of <var class="var">x</var>.
</p>
<p>In the can of an underlap, <var class="var">opt</var> must be an integer between 0 and
<code class="code">-<var class="var">p</var></code>. The represents the initial underlap of the first
 column of <var class="var">y</var>.
</p>
<p>The default value for <var class="var">opt</var> the vector <code class="code">zeros (1, <var class="var">p</var>)</code>
 in the case of an overlap, or 0 otherwise.
</p></dd>
</dl>
<p>In the case of a single output argument, <var class="var">y</var> will be padded with
 zeros to fill the missing values in the data frame. With two output
 arguments <var class="var">z</var> is the remaining data that has not been used in the
 current data frame.
</p>
<p>Likewise, the output <var class="var">opt</var> is the overlap, or underlap that might
 be used for a future call to <code class="code">code</code> to allow continuous buffering.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="chirp">
<h4 class="subsection">3.1.2 chirp</h4>
<a class="index-entry-id" id="index-chirp"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-chirp-1"><span class="category-def">Function File: </span><strong class="def-name">chirp</strong> <code class="def-code-arguments">(<var class="var">t</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-chirp-2"><span class="category-def">Function File: </span><strong class="def-name">chirp</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">f0</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-chirp-3"><span class="category-def">Function File: </span><strong class="def-name">chirp</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">f0</var>, <var class="var">t1</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-chirp-4"><span class="category-def">Function File: </span><strong class="def-name">chirp</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">f0</var>, <var class="var">t1</var>, <var class="var">f1</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-chirp-5"><span class="category-def">Function File: </span><strong class="def-name">chirp</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">f0</var>, <var class="var">t1</var>, <var class="var">f1</var>, <var class="var">shape</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-chirp-6"><span class="category-def">Function File: </span><strong class="def-name">chirp</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">f0</var>, <var class="var">t1</var>, <var class="var">f1</var>, <var class="var">shape</var>, <var class="var">phase</var>)</code></dt>
<dd>
<p>Evaluate a chirp signal at time <var class="var">t</var>.  A chirp signal is a frequency
 swept cosine wave.
</p>
<dl class="table">
<dt><var class="var">t</var></dt>
<dd><p>vector of times to evaluate the chirp signal
</p></dd>
<dt><var class="var">f0</var></dt>
<dd><p>frequency at time t=0 [ 0 Hz ]
</p></dd>
<dt><var class="var">t1</var></dt>
<dd><p>time t1 [ 1 sec ]
</p></dd>
<dt><var class="var">f1</var></dt>
<dd><p>frequency at time t=t1 [ 100 Hz ]
</p></dd>
<dt><var class="var">shape</var></dt>
<dd><p>shape of frequency sweep
    &rsquo;linear&rsquo;      f(t) = (f1-f0)*(t/t1) + f0
    &rsquo;quadratic&rsquo;   f(t) = (f1-f0)*(t/t1)^2 + f0
    &rsquo;logarithmic&rsquo; f(t) = (f1/f0)^(t/t1) * f0
</p></dd>
<dt><var class="var">phase</var></dt>
<dd><p>phase shift at t=0
</p></dd>
</dl>
<p>For example:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted"> specgram (chirp ([0:0.001:5]));  # default linear chirp of 0-100Hz in 1 sec
 specgram (chirp ([-2:0.001:15], 400, 10, 100, &quot;quadratic&quot;));
 soundsc (chirp ([0:1/8000:5], 200, 2, 500, &quot;logarithmic&quot;), 8000);
</pre></div></div>
<p>If you want a different sweep shape f(t), use the following:
</p>
<pre class="verbatim"> y = cos (2 * pi * integral (f(t)) + phase);
</pre></dd></dl>
</div>
<div class="subsection-level-extent" id="cmorwavf">
<h4 class="subsection">3.1.3 cmorwavf</h4>
<a class="index-entry-id" id="index-cmorwavf"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cmorwavf-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">psi</var>, <var class="var">x</var>] =</code> <strong class="def-name">cmorwavf</strong> <code class="def-code-arguments">(<var class="var">lb</var>, <var class="var">ub</var>, <var class="var">n</var>, <var class="var">fb</var>, <var class="var">fc</var>)</code></dt>
<dd><p>Compute the Complex Morlet wavelet.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="diric">
<h4 class="subsection">3.1.4 diric</h4>
<a class="index-entry-id" id="index-diric"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-diric-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">diric</strong> <code class="def-code-arguments">(<var class="var">x</var>,<var class="var">n</var>)</code></dt>
<dd><p>Compute the dirichlet function.
</p>
<p><strong class="strong">See also:</strong> sinc, gauspuls, sawtooth.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="gauspuls">
<h4 class="subsection">3.1.5 gauspuls</h4>
<a class="index-entry-id" id="index-gauspuls"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-gauspuls-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">gauspuls</strong> <code class="def-code-arguments">(<var class="var">t</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-gauspuls-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">gauspuls</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">fc</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-gauspuls-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">gauspuls</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">fc</var>, <var class="var">bw</var>)</code></dt>
<dd><p>Generate a Gaussian modulated sinusoidal pulse sampled at times <var class="var">t</var>.
</p>
<p><strong class="strong">See also:</strong> pulstran, rectpuls, tripuls.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="gmonopuls">
<h4 class="subsection">3.1.6 gmonopuls</h4>
<a class="index-entry-id" id="index-gmonopuls"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-gmonopuls-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">gmonopuls</strong> <code class="def-code-arguments">(<var class="var">t</var>,<var class="var">fc</var>)</code></dt>
<dd><p>Return the gaussian monopulse.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="mexihat">
<h4 class="subsection">3.1.7 mexihat</h4>
<a class="index-entry-id" id="index-mexihat"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-mexihat-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">psi</var>, <var class="var">x</var>] =</code> <strong class="def-name">mexihat</strong> <code class="def-code-arguments">(<var class="var">lb</var>, <var class="var">ub</var>, <var class="var">n</var>)</code></dt>
<dd><p>Compute the Mexican hat wavelet.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="meyeraux">
<h4 class="subsection">3.1.8 meyeraux</h4>
<a class="index-entry-id" id="index-meyeraux"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-meyeraux-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">meyeraux</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dd><p>Compute the Meyer wavelet auxiliary function.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="morlet">
<h4 class="subsection">3.1.9 morlet</h4>
<a class="index-entry-id" id="index-morlet"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-morlet-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">psi</var>, <var class="var">x</var>] =</code> <strong class="def-name">morlet</strong> <code class="def-code-arguments">(<var class="var">lb</var>, <var class="var">ub</var>, <var class="var">n</var>)</code></dt>
<dd><p>Compute the Morlet wavelet.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="pulstran">
<h4 class="subsection">3.1.10 pulstran</h4>
<a class="index-entry-id" id="index-pulstran"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-pulstran-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">pulstran</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">d</var>, <var class="var">func</var>, &hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-pulstran-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">pulstran</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">d</var>, <var class="var">p</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-pulstran-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">pulstran</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">d</var>, <var class="var">p</var>, <var class="var">Fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-pulstran-4"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">pulstran</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">d</var>, <var class="var">p</var>, <var class="var">Fs</var>, <var class="var">method</var>)</code></dt>
<dd>
<p>Generate the signal y=sum(func(t+d,...)) for each d.  If d is a
 matrix of two columns, the first column is the delay d and the second
 column is the amplitude a, and y=sum(a*func(t+d)) for each d,a.
 Clearly, func must be a function which accepts a vector of times.
 Any extra arguments needed for the function must be tagged on the end.
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted"> fs = 11025;  # arbitrary sample rate
 f0 = 100;    # pulse train sample rate
 w = 0.001;   # pulse width of 1 millisecond
 auplot (pulstran (0:1/fs:0.1, 0:1/f0:0.1, &quot;rectpuls&quot;, w), fs);
</pre></div>
<p>If instead of a function name you supply a pulse shape sampled at
 frequency Fs (default 1 Hz),  an interpolated version of the pulse
 is added at each delay d.  The interpolation stays within the the
 time range of the delayed pulse.  The interpolation method defaults
 to linear, but it can be any interpolation method accepted by the
 function interp1.
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted"> fs = 11025;      # arbitrary sample rate
 f0 = 100;        # pulse train sample rate
 w = boxcar(10);  # pulse width of 1 millisecond at 10 kHz
 auplot (pulstran (0:1/fs:0.1, 0:1/f0:0.1, w, 10000), fs);
</pre></div>
</dd></dl>
</div>
<div class="subsection-level-extent" id="rectpuls">
<h4 class="subsection">3.1.11 rectpuls</h4>
<a class="index-entry-id" id="index-rectpuls"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-rectpuls-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">rectpuls</strong> <code class="def-code-arguments">(<var class="var">t</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-rectpuls-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">rectpuls</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">w</var>)</code></dt>
<dd><p>Generate a rectangular pulse over the interval [-<var class="var">w</var>/2,<var class="var">w</var>/2),
 sampled at times <var class="var">t</var>.  This is useful with the function <code class="code">pulstran</code>
 for generating a series of pulses.
</p>
<p>Example:
</p><div class="example">
<div class="group"><pre class="example-preformatted"> fs = 11025;  # arbitrary sample rate
 f0 = 100;    # pulse train sample rate
 w = 0.3/f0;  # pulse width 3/10th the distance between pulses
 plot (pulstran (0:1/fs:4/f0, 0:1/f0:4/f0, &quot;rectpuls&quot;, w));
</pre></div></div>
<p><strong class="strong">See also:</strong> gauspuls, pulstran, tripuls.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="sawtooth">
<h4 class="subsection">3.1.12 sawtooth</h4>
<a class="index-entry-id" id="index-sawtooth"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sawtooth-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sawtooth</strong> <code class="def-code-arguments">(<var class="var">t</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sawtooth-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sawtooth</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">width</var>)</code></dt>
<dd><p>Generates a sawtooth wave of period <code class="code">2 * pi</code> with limits <code class="code">+1/-1</code>
  for the elements of <var class="var">t</var>.
</p>
<p><var class="var">width</var> is a real number between <code class="code">0</code> and <code class="code">1</code> which specifies
 the point between <code class="code">0</code> and <code class="code">2 * pi</code> where the maximum is. The
 function increases linearly from <code class="code">-1</code> to <code class="code">1</code> in  <code class="code">[0, 2 *
 pi * <var class="var">width</var>]</code> interval, and decreases linearly from <code class="code">1</code> to
<code class="code">-1</code> in the interval <code class="code">[2 * pi * <var class="var">width</var>, 2 * pi]</code>.
</p>
<p>If <var class="var">width</var> is 0.5, the function generates a standard triangular wave.
</p>
<p>If <var class="var">width</var> is not specified, it takes a value of 1, which is a standard
 sawtooth function.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="shanwavf">
<h4 class="subsection">3.1.13 shanwavf</h4>
<a class="index-entry-id" id="index-shanwavf"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-shanwavf-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">psi</var>, <var class="var">x</var>] =</code> <strong class="def-name">shanwavf</strong> <code class="def-code-arguments">(<var class="var">lb</var>, <var class="var">ub</var>, <var class="var">n</var>, <var class="var">fb</var>, <var class="var">fc</var>)</code></dt>
<dd><p>Compute the Complex Shannon wavelet.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="shiftdata">
<h4 class="subsection">3.1.14 shiftdata</h4>
<a class="index-entry-id" id="index-shiftdata"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-shiftdata-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">out perm shifts</var>] =</code> <strong class="def-name">shiftdata</strong> <code class="def-code-arguments">(<var class="var">in</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-shiftdata-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">out perm shifts</var>] =</code> <strong class="def-name">shiftdata</strong> <code class="def-code-arguments">(<var class="var">in</var>, <var class="var">dim</var>)</code></dt>
<dd><p>Shift data <var class="var">in</var> to permute the dimension <var class="var">dim</var> to the first column.
</p>
<p><strong class="strong">See also:</strong> unshiftdata.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="sigmoid_005ftrain">
<h4 class="subsection">3.1.15 sigmoid_train</h4>
<a class="index-entry-id" id="index-sigmoid_005ftrain"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sigmoid_005ftrain-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">y</var> <var class="var">s</var>] =</code> <strong class="def-name">sigmoid_train</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">ranges</var>, <var class="var">rc</var>)</code></dt>
<dd>
<p>Evaluate a train of sigmoid functions at <var class="var">t</var>.
</p>
<p>The number and duration of each sigmoid is determined from <var class="var">ranges</var>.
 Each row of <var class="var">ranges</var> represents a real interval, e.g. if sigmoid
<code class="code">i</code> starts at <code class="code">t=0.1</code> and ends at <code class="code">t=0.5</code>, then
<code class="code"><var class="var">ranges</var>(i,:) = [0.1 0.5]</code>.
 The input <var class="var">rc</var> is an array that defines the rising and falling time
 constants of each sigmoid.  Its size must equal the size of <var class="var">ranges</var>.
</p>
<p>The individual sigmoids are returned in <var class="var">s</var>. The combined sigmoid train
 is returned in the vector <var class="var">y</var> of length equal to <var class="var">t</var>, and such that
<code class="code">Y = max (S)</code>.
</p>
<p>Run <code class="code">demo sigmoid_train</code> to some examples of the use of this function.
</p>
</dd></dl>
</div>
<div class="subsection-level-extent" id="specgram">
<h4 class="subsection">3.1.16 specgram</h4>
<a class="index-entry-id" id="index-specgram"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-specgram-1"><span class="category-def">Function File: </span><strong class="def-name">specgram</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-specgram-2"><span class="category-def">Function File: </span><strong class="def-name">specgram</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-specgram-3"><span class="category-def">Function File: </span><strong class="def-name">specgram</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">Fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-specgram-4"><span class="category-def">Function File: </span><strong class="def-name">specgram</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">Fs</var>, <var class="var">window</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-specgram-5"><span class="category-def">Function File: </span><strong class="def-name">specgram</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">Fs</var>, <var class="var">window</var>, <var class="var">overlap</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-specgram-6"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">S</var>, <var class="var">f</var>, <var class="var">t</var>] =</code> <strong class="def-name">specgram</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
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
<div class="group"><pre class="example-preformatted">    x = chirp([0:0.001:2],0,2,500);  # freq. sweep from 0-500 over 2 sec.
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
</pre></div></div>
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
</div>
<div class="subsection-level-extent" id="square">
<h4 class="subsection">3.1.17 square</h4>
<a class="index-entry-id" id="index-square"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-square-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">s</var> =</code> <strong class="def-name">square</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">duty</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-square-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">s</var> =</code> <strong class="def-name">square</strong> <code class="def-code-arguments">(<var class="var">t</var>)</code></dt>
<dd><p>Generate a square wave of period 2 pi with limits +1/-1.
</p>
<p>If <var class="var">duty</var> is specified, it is the percentage of time the square
 wave is &quot;on&quot;.  The square wave is +1 for that portion of the time.
</p>
<pre class="verbatim">                   on time * 100
    duty cycle = ------------------
                 on time + off time
</pre>
<p><strong class="strong">See also:</strong> cos, sawtooth, sin, tripuls.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="tripuls">
<h4 class="subsection">3.1.18 tripuls</h4>
<a class="index-entry-id" id="index-tripuls"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-tripuls-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">tripuls</strong> <code class="def-code-arguments">(<var class="var">t</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-tripuls-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">tripuls</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">w</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-tripuls-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">tripuls</strong> <code class="def-code-arguments">(<var class="var">t</var>, <var class="var">w</var>, <var class="var">skew</var>)</code></dt>
<dd><p>Generate a triangular pulse over the interval [-<var class="var">w</var>/2,<var class="var">w</var>/2),
 sampled at times <var class="var">t</var>.  This is useful with the function <code class="code">pulstran</code>
 for generating a series of pulses.
</p>
<p><var class="var">skew</var> is a value between -1 and 1, indicating the relative placement
 of the peak within the width.  -1 indicates that the peak should be
 at -<var class="var">w</var>/2, and 1 indicates that the peak should be at <var class="var">w</var>/2.  The
 default value is 0.
</p>
<p>Example:
</p><div class="example">
<div class="group"><pre class="example-preformatted"> fs = 11025;  # arbitrary sample rate
 f0 = 100;    # pulse train sample rate
 w = 0.3/f0;  # pulse width 3/10th the distance between pulses
 plot (pulstran (0:1/fs:4/f0, 0:1/f0:4/f0, &quot;tripuls&quot;, w));
</pre></div></div>
<p><strong class="strong">See also:</strong> gauspuls, pulstran, rectpuls.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="udecode">
<h4 class="subsection">3.1.19 udecode</h4>
<a class="index-entry-id" id="index-udecode"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-udecode-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">out</var> =</code> <strong class="def-name">udecode</strong> <code class="def-code-arguments">(<var class="var">in</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-udecode-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">out</var> =</code> <strong class="def-name">udecode</strong> <code class="def-code-arguments">(<var class="var">in</var>, <var class="var">n</var>, <var class="var">v</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-udecode-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">out</var> =</code> <strong class="def-name">udecode</strong> <code class="def-code-arguments">(<var class="var">in</var>, <var class="var">n</var>, <var class="var">v</var>, <var class="var">overflows</var>)</code></dt>
<dd><p>Invert the operation of uencode.
</p>
<p><strong class="strong">See also:</strong> uencode.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="uencode">
<h4 class="subsection">3.1.20 uencode</h4>
<a class="index-entry-id" id="index-uencode"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-uencode-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">out</var> =</code> <strong class="def-name">uencode</strong> <code class="def-code-arguments">(<var class="var">in</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-uencode-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">out</var> =</code> <strong class="def-name">uencode</strong> <code class="def-code-arguments">(<var class="var">in</var>, <var class="var">n</var>, <var class="var">v</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-uencode-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">out</var> =</code> <strong class="def-name">uencode</strong> <code class="def-code-arguments">(<var class="var">in</var>, <var class="var">n</var>, <var class="var">v</var>, <var class="var">signed</var>)</code></dt>
<dd><p>Quantize the entries of the array <var class="var">in</var> using 2^<var class="var">n</var> quantization levels.
</p>
<p><strong class="strong">See also:</strong> udecode.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="unshiftdata">
<h4 class="subsection">3.1.21 unshiftdata</h4>
<a class="index-entry-id" id="index-unshiftdata"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-unshiftdata-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">out</var>] =</code> <strong class="def-name">unshiftdata</strong> <code class="def-code-arguments">(<var class="var">in</var>, <var class="var">perm</var>, <var class="var">shifts</var>)</code></dt>
<dd><p>Reverse what is done by shiftdata.
</p>
<p><strong class="strong">See also:</strong> shiftdata.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="vco">
<h4 class="subsection">3.1.22 vco</h4>
<a class="index-entry-id" id="index-vco"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-vco-1"><span class="category-def">: </span><code class="def-type">y =</code> <strong class="def-name">vco</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">fc</var>, <var class="var">fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-vco-2"><span class="category-def">: </span><code class="def-type">y =</code> <strong class="def-name">vco</strong> <code class="def-code-arguments">(<var class="var">x</var>, [<var class="var">fmin</var>, <var class="var">fmax</var>], <var class="var">fs</var>)</code></dt>
<dd><p>Creates a signal that oscillates at a frequency determined by input <var class="var">x</var> with a sampling frequency <var class="var">fs</var>.
</p>
<p>Inputs:
</p><ul class="itemize mark-bullet">
<li><var class="var">x</var> - input data with a range of -1 to 1. A value of -1 means no output, 0 cuoreesponds to <var class="var">fc</var>,
 and 1 corresponds to 2*<var class="var">fc</var>.
</li><li><var class="var">fc</var> - Carrier frequency
</li><li><var class="var">fs</var> - Sampling rate
</li><li><var class="var">fmin</var>, <var class="var">fmax</var> - Frequency modulation range limits.
</li></ul>
<p>Outputs:
</p><ul class="itemize mark-bullet">
<li><var class="var">y</var> - output signal
</li></ul>
</dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Signal-Measurement">
<h3 class="section" id="Signal-Measurement-1">3.2 Signal Measurement</h3>
<a class="index-entry-id" id="index-Signal-Measurement"></a>
<div class="subsection-level-extent" id="findpeaks">
<h4 class="subsection">3.2.1 findpeaks</h4>
<a class="index-entry-id" id="index-findpeaks"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-findpeaks-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">pks</var>, <var class="var">loc</var>, <var class="var">extra</var>] =</code> <strong class="def-name">findpeaks</strong> <code class="def-code-arguments">(<var class="var">data</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-findpeaks-2"><span class="category-def">Function File: </span><code class="def-type">&hellip; =</code> <strong class="def-name">findpeaks</strong> <code class="def-code-arguments">(&hellip;, <var class="var">property</var>, <var class="var">value</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-findpeaks-3"><span class="category-def">Function File: </span><code class="def-type">&hellip; =</code> <strong class="def-name">findpeaks</strong> <code class="def-code-arguments">(&hellip;, &quot;DoubleSided&quot;)</code></dt>
<dd><p>Finds peaks on <var class="var">data</var>.
</p>
<p>Peaks of a positive array of data are defined as local maxima. For
 double-sided data, they are maxima of the positive part and minima of
 the negative part. <var class="var">data</var> is expected to be a single column
 vector.
</p>
<p>The function returns the value of <var class="var">data</var> at the peaks in
<var class="var">pks</var>. The index indicating their position is returned in
<var class="var">loc</var>.
</p>
<p>The third output argument is a structure with additional information:
</p>
<dl class="table">
<dt>&quot;parabol&quot;</dt>
<dd><p>A structure containing the parabola fitted to each returned peak. The
 structure has two fields, &quot;x&quot; and &quot;pp&quot;. The field
&quot;pp&quot; contains the coefficients of the 2nd degree polynomial
 and &quot;x&quot; the extrema of the interval where it was fitted.
</p>
</dd>
<dt>&quot;height&quot;</dt>
<dd><p>The estimated height of the returned peaks (in units of <var class="var">data</var>).
</p>
</dd>
<dt>&quot;baseline&quot;</dt>
<dd><p>The height at which the roots of the returned peaks were calculated
 (in units of <var class="var">data</var>).
</p>
</dd>
<dt>&quot;roots&quot;</dt>
<dd><p>The abscissa values (in index units) at which the parabola fitted to
 each of the returned peaks realizes its width as defined below.
</p></dd>
</dl>
<p>This function accepts property-value pair given in the list below:
</p>
<dl class="table">
<dt>&quot;MinPeakHeight&quot;</dt>
<dd><p>Minimum peak height (non-negative scalar). Only peaks that exceed this
 value will be returned. For data taking positive and negative values
 use the option &quot;DoubleSided&quot;. Default value <code class="code">eps</code>.
</p>
</dd>
<dt>&quot;MinPeakDistance&quot;</dt>
<dd><p>Minimum separation between (positive integer). Peaks separated by
 less than this distance are considered a single peak. This distance
 is also used to fit a second order polynomial to the peaks to
 estimate their width, therefore it acts as a smoothing parameter.
 The neighborhood size is equal to the value of &quot;MinPeakDistance&quot;.
 Default value 1.
</p>
</dd>
<dt>&quot;MinPeakWidth&quot;</dt>
<dd><p>Minimum width of peaks (non-negative scalar). The width of the peaks is
 estimated using a parabola fitted to the neighborhood of each peak.
 The width is calculated with the formula
</p><pre class="verbatim"> a * width^2 = 1
</pre><p>where a is the the concavity of the parabola.
 Default value <code class="code">eps</code>.
</p>
</dd>
<dt>&quot;MaxPeakWidth&quot;</dt>
<dd><p>Maximum width of peaks (positive integer).
 Default value <code class="code">Inf</code>.
</p>
</dd>
<dt>&quot;DoubleSided&quot;</dt>
<dd><p>Tells the function that data takes positive and negative values. The
 base-line for the peaks is taken as the mean value of the function.
 This is equivalent as passing the absolute value of the data after
 removing the mean.
</p></dd>
</dl>
<p>Run <code class="command">demo findpeaks</code> to see some examples.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="peak2peak">
<h4 class="subsection">3.2.2 peak2peak</h4>
<a class="index-entry-id" id="index-peak2peak"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-peak2peak-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">peak2peak</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-peak2peak-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">peak2peak</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">dim</var>)</code></dt>
<dd><p>Compute the difference between the maximum and minimum values in the vector
<var class="var">x</var>.
</p>
<p>If <var class="var">x</var> is a matrix, compute the difference for each column and return
 them in a row vector.
</p>
<p>If the optional argument <var class="var">dim</var> is given, operate along this dimension.
</p>
<p><strong class="strong">See also:</strong> max, min, peak2rms, rms, rssq.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="peak2rms">
<h4 class="subsection">3.2.3 peak2rms</h4>
<a class="index-entry-id" id="index-peak2rms"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-peak2rms-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">peak2rms</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-peak2rms-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">peak2rms</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">dim</var>)</code></dt>
<dd><p>Compute the ratio of the largest absolute value to the root-mean-square
 (RMS) value of the vector <var class="var">x</var>.
</p>
<p>If <var class="var">x</var> is a matrix, compute the peak-magnitude-to-RMS ratio for each
 column and return them in a row vector.
</p>
<p>If the optional argument <var class="var">dim</var> is given, operate along this dimension.
</p>
<p><strong class="strong">See also:</strong> max, min, peak2peak, rms, rssq.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="rms">
<h4 class="subsection">3.2.4 rms</h4>
<a class="index-entry-id" id="index-rms"></a>
<p>rms has moved to the octave core from v11.0.0 onwards
</p></div>
<div class="subsection-level-extent" id="rssq">
<h4 class="subsection">3.2.5 rssq</h4>
<a class="index-entry-id" id="index-rssq"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-rssq-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">rssq</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-rssq-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">rssq</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">dim</var>)</code></dt>
<dd><p>Compute the root-sum-of-squares (RSS) of the vector <var class="var">x</var>.
</p>
<p>The root-sum-of-squares is defined as
</p>
<div class="example">
<pre class="example-preformatted"> rssq (<var class="var">x</var>) = SQRT (SUM_i <var class="var">x</var>(i)^2)
</pre></div>
<p>If <var class="var">x</var> is a matrix, compute the root-sum-of-squares for each column and
 return them in a row vector.
</p>
<p>If the optional argument <var class="var">dim</var> is given, operate along this dimension.
</p>
<p><strong class="strong">See also:</strong> mean, meansq, sumsq, rms.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Correlation-and-Convolution">
<h3 class="section" id="Correlation-and-Convolution-1">3.3 Correlation and Convolution</h3>
<a class="index-entry-id" id="index-Correlation-and-Convolution"></a>
<div class="subsection-level-extent" id="cconv">
<h4 class="subsection">3.3.1 cconv</h4>
<a class="index-entry-id" id="index-cconv"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cconv-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">c</var> =</code> <strong class="def-name">cconv</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cconv-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">c</var> =</code> <strong class="def-name">cconv</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>)</code></dt>
<dd><p>Compute the modulo-N circular convolution.
</p>
<p><var class="var">a</var> and <var class="var">b</var> are input vectors and <var class="var">c</var> is the modolo-<var class="var">n</var>
 convolution of <var class="var">a</var> and <var class="var">b</var>. If <var class="var">n</var> is not provided,
 its assumed default value is <code class="code">length(<var class="var">a</var>) + length(<var class="var">b</var>) - 1</code>,
 which provides the same result as a linear convolution.
</p>
<p>Examples:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted"> cconv (1:2, 1:4)
    &rArr;  1   4   7   10   8
</pre></div></div>
<div class="example">
<div class="group"><pre class="example-preformatted"> cconv (1:2, 1:4, 2)
    &rArr;  16   14
</pre></div></div>
<div class="example">
<div class="group"><pre class="example-preformatted"> cconv (1:2, 1:4, 4)
    &rArr;  9   4   7   10
</pre></div></div>
<p><strong class="strong">See also:</strong> conv, circshift.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="convmtx">
<h4 class="subsection">3.3.2 convmtx</h4>
<a class="index-entry-id" id="index-convmtx"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-convmtx-1"><span class="category-def">Function File: </span><strong class="def-name">convmtx</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">n</var>)</code></dt>
<dd><p>If <var class="var">a</var> is a column vector and <var class="var">x</var> is a column vector
 of length <var class="var">n</var>, then
</p>
<p><code class="code">convmtx(<var class="var">a</var>, <var class="var">n</var>) * <var class="var">x</var></code>
</p>
<p>gives the convolution of of <var class="var">a</var> and <var class="var">x</var> and is the
 same as <code class="code">conv(<var class="var">a</var>, <var class="var">x</var>)</code>. The difference is if
 many vectors are to be convolved with the same vector, then
 this technique is possibly faster.
</p>
<p>Similarly, if <var class="var">a</var> is a row vector and <var class="var">x</var> is a row
 vector of length <var class="var">n</var>, then
</p>
<p><code class="code"><var class="var">x</var> * convmtx(<var class="var">a</var>, <var class="var">n</var>)</code>
</p>
<p>is the same as <code class="code">conv(<var class="var">x</var>, <var class="var">a</var>)</code>.
</p></dd></dl>
<p><strong class="strong">See also:</strong> conv.
</p></div>
<div class="subsection-level-extent" id="wconv">
<h4 class="subsection">3.3.3 wconv</h4>
<a class="index-entry-id" id="index-wconv"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-wconv-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">wconv</strong> <code class="def-code-arguments">(<var class="var">type</var>, <var class="var">x</var>, <var class="var">f</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-wconv-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">wconv</strong> <code class="def-code-arguments">(<var class="var">type</var>, <var class="var">x</var>, <var class="var">f</var>, <var class="var">shape</var>)</code></dt>
<dd><p>1-D or 2-D convolution.
</p>
<p><strong class="strong">Inputs</strong>
</p><dl class="table">
<dt><var class="var">type</var></dt>
<dd><p>Type of convolution.
</p></dd>
<dt><var class="var">x</var></dt>
<dd><p>Signal vector or matrix.
</p></dd>
<dt><var class="var">f</var></dt>
<dd><p>Coefficients of <abbr class="acronym">FIR</abbr> filter.
</p></dd>
<dt><var class="var">shape</var></dt>
<dd><p>Shape.
</p></dd>
</dl>
<p><strong class="strong">Outputs</strong>
</p><dl class="table">
<dt><var class="var">y</var></dt>
<dd><p>Convoluted signal.
</p></dd>
</dl>
</dd></dl>
</div>
<div class="subsection-level-extent" id="xcorr">
<h4 class="subsection">3.3.4 xcorr</h4>
<a class="index-entry-id" id="index-xcorr"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-xcorr-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">R</var>, <var class="var">lag</var>] =</code> <strong class="def-name">xcorr</strong> <code class="def-code-arguments">( <var class="var">X</var> )</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcorr-2"><span class="category-def">Function File: </span><code class="def-type">&hellip; =</code> <strong class="def-name">xcorr</strong> <code class="def-code-arguments">( <var class="var">X</var>, <var class="var">Y</var> )</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcorr-3"><span class="category-def">Function File: </span><code class="def-type">&hellip; =</code> <strong class="def-name">xcorr</strong> <code class="def-code-arguments">( &hellip;, <var class="var">maxlag</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcorr-4"><span class="category-def">Function File: </span><code class="def-type">&hellip; =</code> <strong class="def-name">xcorr</strong> <code class="def-code-arguments">( &hellip;, <var class="var">scale</var>)</code></dt>
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
<div class="group"><pre class="example-preformatted">            N
 R_xy(k) = sum x_{i+k} conj(y_i),
           i=1
</pre></div></div>
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
</div>
<div class="subsection-level-extent" id="xcorr2">
<h4 class="subsection">3.3.5 xcorr2</h4>
<a class="index-entry-id" id="index-xcorr2"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-xcorr2-1"><span class="category-def">Function File: </span><strong class="def-name">xcorr2</strong> <code class="def-code-arguments">(<var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcorr2-2"><span class="category-def">Function File: </span><strong class="def-name">xcorr2</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcorr2-3"><span class="category-def">Function File: </span><strong class="def-name">xcorr2</strong> <code class="def-code-arguments">(&hellip;, <var class="var">scale</var>)</code></dt>
<dd><p>Compute the 2D cross-correlation of matrices <var class="var">a</var> and <var class="var">b</var>.
</p>
<p>If <var class="var">b</var> is not specified, computes autocorrelation of <var class="var">a</var>, i.e.,
 same as <code class="code">xcorr (<var class="var">a</var>, <var class="var">a</var>)</code>.
</p>
<p>The optional argument <var class="var">scale</var>, defines the type of scaling applied to the
 cross-correlation matrix. Possible values are:
</p>
<dl class="table">
<dt>&quot;none&quot; (default)</dt>
<dd><p>No scaling.
</p>
</dd>
<dt>&quot;biased&quot;</dt>
<dd><p>Scales the raw cross-correlation by the maximum number of elements of <var class="var">a</var>
 and <var class="var">b</var> involved in the generation of any element of <var class="var">c</var>.
</p>
</dd>
<dt>&quot;unbiased&quot;</dt>
<dd><p>Scales the raw correlation by dividing each element in the cross-correlation
 matrix by the number of products <var class="var">a</var> and <var class="var">b</var> used to generate that
 element.
</p>
</dd>
<dt>&quot;coeff&quot;</dt>
<dd><p>Scales the normalized cross-correlation on the range of [0 1] so that a value
 of 1 corresponds to a correlation coefficient of 1.
</p></dd>
</dl>
<p><strong class="strong">See also:</strong> conv2, corr2, xcorr.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="xcov">
<h4 class="subsection">3.3.6 xcov</h4>
<a class="index-entry-id" id="index-xcov"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-xcov-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">R</var>, <var class="var">lag</var>] =</code> <strong class="def-name">xcov</strong> <code class="def-code-arguments">( <var class="var">X</var> )</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcov-2"><span class="category-def">Function File: </span><code class="def-type">&hellip; =</code> <strong class="def-name">xcov</strong> <code class="def-code-arguments">( <var class="var">X</var>, <var class="var">Y</var> )</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcov-3"><span class="category-def">Function File: </span><code class="def-type">&hellip; =</code> <strong class="def-name">xcov</strong> <code class="def-code-arguments">( &hellip;, <var class="var">maxlag</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-xcov-4"><span class="category-def">Function File: </span><code class="def-type">&hellip; =</code> <strong class="def-name">xcov</strong> <code class="def-code-arguments">( &hellip;, <var class="var">scale</var>)</code></dt>
<dd><p>Compute covariance at various lags [=correlation(x-mean(x),y-mean(y))].
</p>
<dl class="table">
<dt><var class="var">X</var></dt>
<dd><p>input vector
</p></dd>
<dt><var class="var">Y</var></dt>
<dd><p>if specified, compute cross-covariance between X and Y,
 otherwise compute autocovariance of X.
</p></dd>
<dt><var class="var">maxlag</var></dt>
<dd><p>is specified, use lag range [-maxlag:maxlag],
 otherwise use range [-n+1:n-1].
</p></dd>
<dt><var class="var">scale:</var></dt>
<dd><dl class="table">
<dt>&lsquo;<samp class="samp">biased</samp>&rsquo;</dt>
<dd><p>for covariance=raw/N,
</p></dd>
<dt>&lsquo;<samp class="samp">unbiased</samp>&rsquo;</dt>
<dd><p>for covariance=raw/(N-|lag|),
</p></dd>
<dt>&lsquo;<samp class="samp">coeff</samp>&rsquo;</dt>
<dd><p>for covariance=raw/(covariance at lag 0),
</p></dd>
<dt>&lsquo;<samp class="samp">none</samp>&rsquo;</dt>
<dd><p>for covariance=raw
</p></dd>
<dt>&lsquo;<samp class="samp">none</samp>&rsquo;</dt>
<dd><p>is the default.
</p></dd>
</dl>
</dd>
</dl>
<p>Returns the covariance for each lag in the range, plus an
 optional vector of lags.
</p>
<p><strong class="strong">See also:</strong> xcorr.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Filtering">
<h3 class="section" id="Filtering-1">3.4 Filtering</h3>
<a class="index-entry-id" id="index-Filtering"></a>
<div class="subsection-level-extent" id="filtfilt">
<h4 class="subsection">3.4.1 filtfilt</h4>
<a class="index-entry-id" id="index-filtfilt"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-filtfilt-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">filtfilt</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">x</var>)</code></dt>
<dd>
<p>Forward and reverse filter the signal. This corrects for phase
 distortion introduced by a one-pass filter, though it does square the
 magnitude response in the process. That&rsquo;s the theory at least.  In
 practice the phase correction is not perfect, and magnitude response
 is distorted, particularly in the stop band.
</p>
<p>Example
</p><div class="example">
<div class="group"><pre class="example-preformatted"> [b, a]=butter(3, 0.1);                  # 5 Hz low-pass filter
 t = 0:0.01:1.0;                         # 1 second sample
 x=sin(2*pi*t*2.3)+0.25*randn(size(t));  # 2.3 Hz sinusoid+noise
 y = filtfilt(b,a,x); z = filter(b,a,x); # apply filter
 plot(t,x,';data;',t,y,';filtfilt;',t,z,';filter;')
</pre></div></div>
</dd></dl>
</div>
<div class="subsection-level-extent" id="filtic">
<h4 class="subsection">3.4.2 filtic</h4>
<a class="index-entry-id" id="index-filtic"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-filtic-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">zf</var> =</code> <strong class="def-name">filtic</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">y</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-filtic-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">zf</var> =</code> <strong class="def-name">filtic</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">y</var>, <var class="var">x</var>)</code></dt>
<dd>
<p>Set initial condition vector for filter function
 The vector zf has the same values that would be obtained
 from function filter given past inputs x and outputs y
</p>
<p>The vectors x and y contain the most recent inputs and outputs
 respectively, with the newest values first:
</p>
<p>x = [x(-1) x(-2) ... x(-nb)], nb = length(b)-1
 y = [y(-1) y(-2) ... y(-na)], na = length(a)-a
</p>
<p>If length(x)&lt;nb then it is zero padded
 If length(y)&lt;na then it is zero padded
</p>
<p>zf = filtic(b, a, y)
    Initial conditions for filter with coefficients a and b
    and output vector y, assuming input vector x is zero
</p>
<p>zf = filtic(b, a, y, x)
    Initial conditions for filter with coefficients a and b
    input vector x and output vector y
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="medfilt1">
<h4 class="subsection">3.4.3 medfilt1</h4>
<a class="index-entry-id" id="index-medfilt1"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-medfilt1-1"><span class="category-def">: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">medfilt1</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-medfilt1-2"><span class="category-def">: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">medfilt1</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, [], <var class="var">dim</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-medfilt1-3"><span class="category-def">: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">medfilt1</strong> <code class="def-code-arguments">(..., <var class="var">NaN_flag</var>, <var class="var">padding</var>)</code></dt>
<dd>
<p>Apply a one dimensional median filter with a window size of <var class="var">n</var> to
the data <var class="var">x</var>, which must be real, double and full.
For <var class="var">n</var> = 2m+1, <var class="var">y</var>(i) is the median of <var class="var">x</var>(i-m:i+m).
For <var class="var">n</var> = 2m,   <var class="var">y</var>(i) is the median of <var class="var">x</var>(i-m:i+m-1).
</p>
<p>The calculation is performed over the first non-singleton dimension, or over
dimension <var class="var">dim</var> if that is specified as the fourth argument.  (The third
argument is ignored; Matlab used to use it to tune its algorithm.)
</p>
<p><var class="var">NaN_flag</var> may be <code class="code">omitnan</code> or <code class="code">includenan</code> (the default).
If it is <code class="code">omitnan</code> then any NaN values are removed from the window
before the median is taken.
Otherwise, any window containing an NaN returns a median of NaN.
</p>
<p><var class="var">padding</var> determines how the partial windows at the start and end of
<var class="var">x</var> are treated.
It may be <code class="code">truncate</code> or <code class="code">zeropad</code> (the default).
If it is <code class="code">truncate</code> then the window for <var class="var">y</var>(i) is
the intersection of the window stated above with 1:length(<var class="var">x</var>).
If it is <code class="code">zeropad</code>, then partial windows have additional zeros
to bring them up to size <var class="var">n</var>.
</p>
<p><strong class="strong">See also:</strong> filter, medfilt2.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="movingrms">
<h4 class="subsection">3.4.4 movingrms</h4>
<a class="index-entry-id" id="index-movingrms"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-movingrms-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">rmsx</var>,<var class="var">w</var>] =</code> <strong class="def-name">movingrms</strong> <code class="def-code-arguments">(<var class="var">x</var>,<var class="var">w</var>,<var class="var">rc</var>,<var class="var">Fs</var>=1)</code></dt>
<dd><p>Calculate moving RMS value of the signal in <var class="var">x</var>.
</p>
<p>The signal is convoluted against a sigmoid window of width <var class="var">w</var> and
 risetime <var class="var">rc</var>. The units of these parameters are relative to the value
 of the sampling frequency given in <var class="var">Fs</var> (Default value = 1).
</p>
<p>Run <code class="code">demo movingrms</code> to see an example.
</p>
<p><strong class="strong">See also:</strong> sigmoid_train.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="sgolayfilt">
<h4 class="subsection">3.4.5 sgolayfilt</h4>
<a class="index-entry-id" id="index-sgolayfilt"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sgolayfilt-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolayfilt-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolayfilt-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolayfilt-4"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>, <var class="var">n</var>, <var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolayfilt-5"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>, <var class="var">n</var>, <var class="var">m</var>, <var class="var">ts</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolayfilt-6"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>, <var class="var">n</var>, <var class="var">m</var>, <var class="var">ts</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolayfilt-7"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sgolayfilt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">f</var>)</code></dt>
<dd><p>Smooth the data in x with a Savitsky-Golay smoothing filter of
 polynomial order p and length n, n odd, n &gt; p.  By default, p=3
 and n=p+2 or n=p+3 if p is even.
</p>
<p>If <var class="var">f</var> is given as a matrix, it is expected to be a filter as
 computed by <code class="code">sgolay</code>.
</p>
<p>These filters are particularly good at preserving lineshape while
 removing high frequency squiggles. Particularly, compare a 5 sample
 averager, an order 5 butterworth lowpass filter (cutoff 1/3) and
 sgolayfilt(x, 3, 5), the best cubic estimated from 5 points:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted"> [b, a] = butter (5, 1/3);
 x = [zeros(1,15), 10*ones(1,10), zeros(1,15)];
 plot (sgolayfilt (x), &quot;r;sgolayfilt;&quot;, ...
       filtfilt (ones (1,5)/5, 1, x), &quot;g;5 sample average;&quot;, ...
       filtfilt (b, a, x), &quot;c;order 5 butterworth;&quot;, ...
       x, &quot;+b;original data;&quot;);
</pre></div></div>
<p><strong class="strong">See also:</strong> sgolay.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="sosfilt">
<h4 class="subsection">3.4.6 sosfilt</h4>
<a class="index-entry-id" id="index-sosfilt"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sosfilt-1"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">sosfilt</strong> <code class="def-code-arguments">(<var class="var">sos</var>, <var class="var">x</var>)</code></dt>
<dd><p>Second order section IIR filtering of <var class="var">x</var>.  The second order section
filter is described by the matrix <var class="var">sos</var> with:
</p>
<table class="multitable">
<tbody><tr><td></td><td>[ <var class="var">B1</var> <var class="var">A1</var> ]<br></td></tr>
<tr><td><var class="var">sos</var> =</td><td>[ &hellip; ],<br></td></tr>
<tr><td></td><td>[ <var class="var">BN</var> <var class="var">AN</var> ]<br></td></tr>
</tbody>
</table>
<p>where <code class="code"><var class="var">B1</var> = [b0 b1 b2]</code> and <code class="code"><var class="var">A1</var> = [1 a1 a2]</code> for
section 1, etc.  The b0 entry must be nonzero for each section.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Filter-Analysis">
<h3 class="section" id="Filter-Analysis-1">3.5 Filter Analysis</h3>
<a class="index-entry-id" id="index-Filter-Analysis"></a>
<div class="subsection-level-extent" id="filternorm">
<h4 class="subsection">3.5.1 filternorm</h4>
<a class="index-entry-id" id="index-filternorm"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-filternorm-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">filternorm</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-filternorm-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">filternorm</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">pnorm</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-filternorm-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">filternorm</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, 2, <var class="var">tol</var>)</code></dt>
<dd>
<p>Compute the 2-norm of a digital filter defined by the numerator coefficients,
<var class="var">b</var>, and the denominator coefficients, <var class="var">a</var>. It is also possible to
 compute the infinity-norm by passing inf in the <var class="var">pnorm</var> parameter.
<var class="var">pnorm</var> only accepts 2 or inf.
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted"> [b, a] = butter (8, 0.5);
 filternorm (b, a)
</pre></div>
</dd></dl>
</div>
<div class="subsection-level-extent" id="filtord">
<h4 class="subsection">3.5.2 filtord</h4>
<a class="index-entry-id" id="index-filtord"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-filtord-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">filtord</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-filtord-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">filtord</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code></dt>
<dd>
<p>Returns the filter order <var class="var">n</var> for a filter defined by the numerator
 coefficients, <var class="var">b</var>, and the denominator coefficients, <var class="var">a</var>.
 It also accepts a filter defined by a matrix of second-order sections,
<var class="var">sos</var>.
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted"> [b, a] = butter (8, 0.5);
 filtord (b, a)
</pre></div>
</dd></dl>
</div>
<div class="subsection-level-extent" id="freqs">
<h4 class="subsection">3.5.3 freqs</h4>
<a class="index-entry-id" id="index-freqs"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-freqs-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">h</var> =</code> <strong class="def-name">freqs</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">w</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-freqs-2"><span class="category-def">Function File: </span><strong class="def-name">freqs</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">w</var>)</code></dt>
<dd>
<p>Compute the s-plane frequency response of the IIR filter B(s)/A(s) as
 H = polyval(B,j*W)./polyval(A,j*W).  If called with no output
 argument, a plot of magnitude and phase are displayed.
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted"> b = [1 2]; a = [1 1];
 w = linspace (0, 4, 128);
 freqs (b, a, w);
</pre></div>
</dd></dl>
</div>
<div class="subsection-level-extent" id="freqs_005fplot">
<h4 class="subsection">3.5.4 freqs_plot</h4>
<a class="index-entry-id" id="index-freqs_005fplot"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-freqs_005fplot-1"><span class="category-def">Function File: </span><strong class="def-name">freqs_plot</strong> <code class="def-code-arguments">(<var class="var">w</var>, <var class="var">h</var>)</code></dt>
<dd><p>Plot the amplitude and phase of the vector <var class="var">h</var>.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="fwhm">
<h4 class="subsection">3.5.5 fwhm</h4>
<a class="index-entry-id" id="index-fwhm"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-fwhm-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">fwhm</strong> <code class="def-code-arguments">(<var class="var">y</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fwhm-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">fwhm</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fwhm-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">fwhm</strong> <code class="def-code-arguments">(&hellip;, &quot;zero&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fwhm-4"><span class="category-def">Function File: </span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">fwhm</strong> <code class="def-code-arguments">(&hellip;, &quot;min&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fwhm-5"><span class="category-def">Function File: </span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">fwhm</strong> <code class="def-code-arguments">(&hellip;, &quot;alevel&quot;, <var class="var">level</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fwhm-6"><span class="category-def">Function File: </span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">fwhm</strong> <code class="def-code-arguments">(&hellip;, &quot;rlevel&quot;, <var class="var">level</var>)</code></dt>
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
</div>
<div class="subsection-level-extent" id="grpdelay">
<h4 class="subsection">3.5.6 grpdelay</h4>
<a class="index-entry-id" id="index-grpdelay"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-grpdelay-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">g</var>, <var class="var">w</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(<var class="var">b</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-grpdelay-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">g</var>, <var class="var">w</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-grpdelay-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">g</var>, <var class="var">w</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-grpdelay-4"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">g</var>, <var class="var">w</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;, <var class="var">n</var>, &quot;whole&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-grpdelay-5"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">g</var>, <var class="var">f</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;, <var class="var">n</var>, <var class="var">Fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-grpdelay-6"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">g</var>, <var class="var">f</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;, <var class="var">n</var>, &quot;whole&quot;, <var class="var">Fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-grpdelay-7"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">g</var>, <var class="var">w</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;, <var class="var">w</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-grpdelay-8"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">g</var>, <var class="var">f</var>] =</code> <strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;, <var class="var">f</var>, <var class="var">Fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-grpdelay-9"><span class="category-def">Function File: </span><strong class="def-name">grpdelay</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd><p>Compute the group delay of a filter.
</p>
<p>[g, w] = grpdelay(b)
   returns the group delay g of the FIR filter with coefficients b.
   The response is evaluated at 512 angular frequencies between 0 and
   pi. w is a vector containing the 512 frequencies.
   The group delay is in units of samples.  It can be converted
   to seconds by multiplying by the sampling period (or dividing by
   the sampling rate fs).
</p>
<p>[g, w] = grpdelay(b,a)
   returns the group delay of the rational IIR filter whose numerator
   has coefficients b and denominator coefficients a.
</p>
<p>[g, w] = grpdelay(b,a,n)
   returns the group delay evaluated at n angular frequencies.  For fastest
   computation n should factor into a small number of small primes.
</p>
<p>[g, w] = grpdelay(b,a,n,&rsquo;whole&rsquo;)
   evaluates the group delay at n frequencies between 0 and 2*pi.
</p>
<p>[g, f] = grpdelay(b,a,n,Fs)
   evaluates the group delay at n frequencies between 0 and Fs/2.
</p>
<p>[g, f] = grpdelay(b,a,n,&rsquo;whole&rsquo;,Fs)
   evaluates the group delay at n frequencies between 0 and Fs.
</p>
<p>[g, w] = grpdelay(b,a,w)
   evaluates the group delay at frequencies w (radians per sample).
</p>
<p>[g, f] = grpdelay(b,a,f,Fs)
   evaluates the group delay at frequencies f (in Hz).
</p>
<p>grpdelay(...)
   plots the group delay vs. frequency.
</p>
<p>If the denominator of the computation becomes too small, the group delay
 is set to zero.  (The group delay approaches infinity when
 there are poles or zeros very close to the unit circle in the z plane.)
</p>
<p>Theory: group delay, g(w) = -d/dw [arg{H(e^jw)}],  is the rate of change of
 phase with respect to frequency.  It can be computed as:
</p>
<div class="example">
<pre class="example-preformatted">               d/dw H(e^-jw)
        g(w) = -------------
                 H(e^-jw)
</pre></div>
<p>where
</p>
<div class="example">
<pre class="example-preformatted">         H(z) = B(z)/A(z) = sum(b_k z^k)/sum(a_k z^k).
</pre></div>
<p>By the quotient rule,
</p>
<div class="example">
<pre class="example-preformatted">                    A(z) d/dw B(z) - B(z) d/dw A(z)
        d/dw H(z) = -------------------------------
                               A(z) A(z)
</pre></div>
<p>Substituting into the expression above yields:
</p>
<div class="example">
<pre class="example-preformatted">                A dB - B dA
        g(w) =  ----------- = dB/B - dA/A
                    A B
</pre></div>
<p>Note that,
</p>
<div class="example">
<pre class="example-preformatted">        d/dw B(e^-jw) = sum(k b_k e^-jwk)
        d/dw A(e^-jw) = sum(k a_k e^-jwk)
</pre></div>
<p>which is just the FFT of the coefficients multiplied by a ramp.
</p>
<p>As a further optimization when nfft&gt;&gt;length(a), the IIR filter (b,a)
 is converted to the FIR filter conv(b,fliplr(conj(a))).
 For further details, see
 http://ccrma.stanford.edu/~jos/filters/Numerical_Computation_Group_Delay.html
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="impz">
<h4 class="subsection">3.5.7 impz</h4>
<a class="index-entry-id" id="index-impz"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-impz-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">x</var>, <var class="var">t</var>] =</code> <strong class="def-name">impz</strong> <code class="def-code-arguments">(<var class="var">b</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-impz-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">x</var>, <var class="var">t</var>] =</code> <strong class="def-name">impz</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-impz-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">x</var>, <var class="var">t</var>] =</code> <strong class="def-name">impz</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-impz-4"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">x</var>, <var class="var">t</var>] =</code> <strong class="def-name">impz</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">n</var>, <var class="var">fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-impz-5"><span class="category-def">Function File: </span><strong class="def-name">impz</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd>
<p>Generate impulse-response characteristics of the filter. The filter
 coefficients correspond to the the z-plane rational function with
 numerator b and denominator a.  If a is not specified, it defaults to
 1. If n is not specified, or specified as [], it will be chosen such
 that the signal has a chance to die down to -120dB, or to not explode
 beyond 120dB, or to show five periods if there is no significant
 damping. If no return arguments are requested, plot the results.
</p>
<p><strong class="strong">See also:</strong> freqz, zplane.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="isallpass">
<h4 class="subsection">3.5.8 isallpass</h4>
<a class="index-entry-id" id="index-isallpass"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-isallpass-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">isallpass</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-isallpass-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">isallpass</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code></dt>
<dd>
<p>Determine whether a digital filter is allpass. The filter might be defined
 by the numerator coefficients, <var class="var">b</var>, and the denominator coefficients,
<var class="var">a</var>, or, alternatively, by a matrix of second-order sections, <var class="var">sos</var>.
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted"> a = [1 2 3];
 b = [3 2 1];
 isallpass (b, a)
</pre></div>
<p>Ref [1] Shyu, Jong-Jy, &amp; Pei, Soo-Chang,
 A new approach to the design of complex all-pass IIR digital filters,
 Signal Processing, 40(2–3), 207–215, 1994.
 https://doi.org/10.1016/0165-1684(94)90068-x
</p>
<p>Ref [2] Vaidyanathan, P. P. Multirate Systems and Filter Banks.
 1st edition, Pearson College Div, 1992.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="ismaxphase">
<h4 class="subsection">3.5.9 ismaxphase</h4>
<a class="index-entry-id" id="index-ismaxphase"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-ismaxphase-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">ismaxphase</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ismaxphase-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">ismaxphase</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ismaxphase-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">ismaxphase</strong> <code class="def-code-arguments">(&hellip;, <var class="var">tol</var>)</code></dt>
<dd>
<p>Determine whether a digital filter is maximum phase (maximum energy-delay).
 The filter might be defined by the numerator coefficients, <var class="var">b</var>, and the
 denominator coefficients, <var class="var">a</var>, or, alternatively, by a matrix of
 second-order sections, <var class="var">sos</var>. A tolerance <var class="var">tol</var> might be given to
 define when two numbers are close enough to be considered equal.
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted"> b = [1 2 4 4 2 1];
 zplane (b);
 ismaxphase (b)
</pre></div>
<p>Ref [1] Oppenheim, Alan, and Ronald Schafer. Discrete-Time Signal Processing.
 3rd edition, Pearson, 2009.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="isminphase">
<h4 class="subsection">3.5.10 isminphase</h4>
<a class="index-entry-id" id="index-isminphase"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-isminphase-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">isminphase</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-isminphase-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">isminphase</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-isminphase-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">L</var> =</code> <strong class="def-name">isminphase</strong> <code class="def-code-arguments">(&hellip;, <var class="var">tol</var>)</code></dt>
<dd>
<p>Determine whether a digital filter is minimum phase. The filter might be defined
 by the numerator coefficients, <var class="var">b</var>, and the denominator coefficients,
<var class="var">a</var>, or, alternatively, by a matrix of second-order sections, <var class="var">sos</var>.
 A toleranve <var class="var">tol</var> might be given to define when two numbers are close enough
 to be considered equal.
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted"> a = [1 0.5]; b = [3 1];
 isminphase (b, a)
</pre></div>
<p>Ref [1] Oppenheim, Alan, and Ronald Schafer. Discrete-Time Signal Processing.
 3rd edition, Pearson, 2009.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="isstable">
<h4 class="subsection">3.5.11 isstable</h4>
<a class="index-entry-id" id="index-isstable"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-isstable-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">FLAG</var> =</code> <strong class="def-name">isstable</strong> <code class="def-code-arguments">(<var class="var">B</var>, <var class="var">A</var>)</code></dt>
<dd><p>Returns a logical output equal to TRUE, if the filter is stable.
 This can be done with coeffients of the filer <var class="var">B</var> and <var class="var">A</var>.
 Alternatively by using a second order sections matrix (SOS).
</p>
<p>Inputs:
</p><ul class="itemize mark-bullet">
<li><var class="var">B</var>: Numerator coefficients of the filter
</li><li><var class="var">A</var>: Denominator coeffients of the filter. Can be an empty vector.
</li></ul>
<p>Output:
</p><ul class="itemize mark-bullet">
<li><var class="var">FLAG</var>: Returns a logical output, equal to TRUE if the filter is stable.
</li></ul>
<p>Examples:
</p><div class="example">
<pre class="example-preformatted">   b = [1 2 3 4 5 5 1 2];
   a = [4 5 6 7 9 10 4 6];
   flag = isstable (b, a)
   flag = 0
</pre></div>
<p>Using SOS
</p><div class="example">
<pre class="example-preformatted">   [z, p, k] = butter (6, 0.7, 'high');
   sos = zp2sos (z, p, k);
   flag = isstable (sos)
   flag = 1
</pre></div>
</dd></dl>
</div>
<div class="subsection-level-extent" id="phasez">
<h4 class="subsection">3.5.12 phasez</h4>
<a class="index-entry-id" id="index-phasez"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-phasez-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">phi</var>, <var class="var">w</var>] =</code> <strong class="def-name">phasez</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phasez-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">phi</var>, <var class="var">w</var>] =</code> <strong class="def-name">phasez</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phasez-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">phi</var>, <var class="var">w</var>] =</code> <strong class="def-name">phasez</strong> <code class="def-code-arguments">(<var class="var">sos</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phasez-4"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">phi</var>, <var class="var">w</var>] =</code> <strong class="def-name">phasez</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phasez-5"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">phi</var>, <var class="var">w</var>] =</code> <strong class="def-name">phasez</strong> <code class="def-code-arguments">(&hellip;, <var class="var">n</var>, &quot;whole&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phasez-6"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">phi</var>, <var class="var">w</var>] =</code> <strong class="def-name">phasez</strong> <code class="def-code-arguments">(&hellip;, <var class="var">n</var>, Fs)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phasez-7"><span class="category-def">Function File: </span><strong class="def-name">phasez</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd>
<p>Compute the phase response of digital filter defined either by its
 coefficients (<var class="var">b</var> and <var class="var">a</var> are the numerator and denominator
 coefficients respectively) or by its second-order sections representation,
 given by the matrix <var class="var">sos</var>. The output <var class="var">phi</var> is the phase response
 computed in a vector the vector of frequencies <var class="var">w</var>.
</p>
<p>The phase response is evaluated at <var class="var">n</var> angular frequencies between
 0 and
 pi.
</p>
<p>If <var class="var">a</var> is omitted, the denominator is assumed to be 1 (this
 corresponds to a simple FIR filter).
</p>
<p>If <var class="var">n</var> is omitted, a value of 512 is assumed.
</p>
<p>If the third/forth argument, <code class="code">&quot;whole&quot;</code>, is given, the response is
 evaluated at <var class="var">n</var> angular frequencies between 0 and
 2*pi.
 It is possible also to pass the value <code class="code">&quot;half&quot;</code>, which will lead to
 the default behaviour.
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted"> [b, a] = butter (2, [.15,.3]);
 phasez (b, a);
</pre></div>
<p>Ref [1] Oppenheim, Alan, and Ronald Schafer. Discrete-Time Signal Processing.
 3rd edition, Pearson, 2009.
</p>
<p><strong class="strong">See also:</strong> freqz, phasedelay.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="zplane">
<h4 class="subsection">3.5.13 zplane</h4>
<a class="index-entry-id" id="index-zplane"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-zplane-1"><span class="category-def">Function File: </span><strong class="def-name">zplane</strong> <code class="def-code-arguments">(<var class="var">z</var>, <var class="var">p</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-zplane-2"><span class="category-def">Function File: </span><strong class="def-name">zplane</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dd><p>Plot the poles and zeros on a complex plane.  If the arguments are column
 vectors <var class="var">z</var> and <var class="var">p</var>, the complex zeros <var class="var">z</var> and poles <var class="var">p</var>
 are displayed. If the arguments are row vectors <var class="var">b</var> and <var class="var">a</var>, the
 zeros and poles of the transfer function represented by these filter
 coefficients are displayed.
</p>
<p>If <var class="var">z</var> and <var class="var">p</var> are matrices, the columns are distinct sets of zeros
 and poles and are displayed together in distinct colors.
</p>
<p>Note that due to the nature of the <code class="code">roots</code> function, poles and zeros
 may be displayed as occurring around a circle rather than at a single
 point.
</p>
<p>The transfer function is
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">        B(z)   b0 + b1 z^(-1) + b2 z^(-2) + ... + bM z^(-M)
 H(z) = ---- = --------------------------------------------
        A(z)   a0 + a1 z^(-1) + a2 z^(-2) + ... + aN z^(-N)
               b0          (z - z1) (z - z2) ... (z - zM)
             = -- z^(-M+N) ------------------------------
               a0          (z - p1) (z - p2) ... (z - pN)
</pre></div></div>
<p>If called with only one argument, the poles <var class="var">p</var> defaults to an empty
 vector, and the denominator coefficient vector <var class="var">a</var> defaults to 1.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Filter-Conversion">
<h3 class="section" id="Filter-Conversion-1">3.6 Filter Conversion</h3>
<a class="index-entry-id" id="index-Filter-Conversion"></a>
<div class="subsection-level-extent" id="residued">
<h4 class="subsection">3.6.1 residued</h4>
<a class="index-entry-id" id="index-residued"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-residued-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">r</var>, <var class="var">p</var>, <var class="var">f</var>, <var class="var">m</var>] =</code> <strong class="def-name">residued</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
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
</div>
<div class="subsection-level-extent" id="residuez">
<h4 class="subsection">3.6.2 residuez</h4>
<a class="index-entry-id" id="index-residuez"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-residuez-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">r</var>, <var class="var">p</var>, <var class="var">f</var>, <var class="var">m</var>] =</code> <strong class="def-name">residuez</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dd><p>Compute the partial fraction expansion of filter <em class="math">H(z) = B(z)/A(z)</em>.
</p>
<p>INPUTS:
<var class="var">b</var> and <var class="var">a</var> are vectors specifying the digital filter
<em class="math">H(z) = B(z)/A(z)</em>. See <code class="code">help filter</code> for documentation of the
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
<pre class="example-preformatted"> See <code class="code">test residuez verbose</code> to see a number of examples.
</pre></div>
<p>For the theory of operation, see
&lsquo;<code class="indicateurl">http://ccrma.stanford.edu/~jos/filters/residuez.html</code>&rsquo;
</p>
<p><strong class="strong">See also:</strong> residue, residued.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="sos2cell">
<h4 class="subsection">3.6.3 sos2cell</h4>
<a class="index-entry-id" id="index-sos2cell"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sos2cell-1"><span class="category-def">Function File: </span><code class="def-type">C =</code> <strong class="def-name">sos2cell</strong> <code class="def-code-arguments">(<var class="var">S</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sos2cell-2"><span class="category-def">Function File: </span><code class="def-type">C =</code> <strong class="def-name">sos2cell</strong> <code class="def-code-arguments">(<var class="var">S</var>, <var class="var">G</var>)</code></dt>
<dd><p>Convert a second-order-section matrix to a cell array.
</p>
<p><var class="var">S</var> is an L-by-6 matrix, where each row represents a second-order section in the form:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted"> S = [B1 A1;
      B2 A2;
      ...
      BL AL]
</pre></div></div>
<p>where <var class="var">Bi</var> and <var class="var">Ai</var> are the numerator and denominator coefficients of a linear
 or quadratic polynomial. The function converts this matrix into a cell array <var class="var">C</var>
 with the following format:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted"> C = { {B1, A1}, {B2, A2}, ..., {BL, AL} }
</pre></div></div>
<p>Each element of the cell array is a cell containing a pair of vectors: <var class="var">Bi</var> and <var class="var">Ai</var>.
</p>
<p>If an additional gain term <var class="var">G</var> is provided, the function returns:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted"> C = { {G, 1}, {B1, A1}, {B2, A2}, ..., {BL, AL} }
</pre></div></div>
<p>where {G, 1} represents the constant gain term applied to the filter.
</p>
<div class="example">
<div class="group"><pre class="example-preformatted"> S = [ [1, 2, 3, 4, 5, 6];
       [7, 8, 9, 10, 11, 12] ];
 C = sos2cell(S);
</pre></div></div>
</dd></dl>
</div>
<div class="subsection-level-extent" id="sos2ss">
<h4 class="subsection">3.6.4 sos2ss</h4>
<a class="index-entry-id" id="index-sos2ss"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sos2ss-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>] =</code> <strong class="def-name">sos2ss</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code></dt>
<dd><p>Convert series second-order sections to state-space.
</p>
<p><strong class="strong">See also:</strong> sos2ss, ss2tf.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="sos2tf">
<h4 class="subsection">3.6.5 sos2tf</h4>
<a class="index-entry-id" id="index-sos2tf"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sos2tf-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">sos2tf</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sos2tf-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">sos2tf</strong> <code class="def-code-arguments">(<var class="var">sos</var>, <var class="var">g</var>)</code></dt>
<dd><p>Convert series second-order sections to transfer function.
</p>
<p>INPUTS:
</p><ul class="itemize mark-bullet">
<li><var class="var">sos</var> = matrix of series second-order sections, one per row:
<div class="example">
<pre class="example-preformatted"><var class="var">sos</var> = [<var class="var">B1</var>.' <var class="var">A1</var>.'; ...; <var class="var">BN</var>.' <var class="var">AN</var>.']
</pre></div>
<p>where
<code class="code"><var class="var">B1</var>.' = [b0 b1 b2] and <var class="var">A1</var>.' = [a0 a1 a2]</code> for
 section 1, etc.
</p>
<p>a0 is usually equal to 1 because all 2nd order transfer functions
 can be scaled so that a0 = 1.
 However, this is not mandatory for this implementation, which supports
 all kinds of transfer functions, including first order transfer functions.
 See <code class="code">filter</code> for documentation of the second-order direct-form filter
 coefficients <var class="var">B</var>i and <var class="var">A</var>i.
</p>
</li><li><var class="var">g</var> is an overall gain factor that effectively scales
 the output <var class="var">b</var> vector (or any one of the input <var class="var">B</var>i vectors).
 If not given the gain is assumed to be 1.
</li></ul>
<p>RETURNED:
<var class="var">b</var> and <var class="var">a</var> are vectors specifying the analog or digital filter
<em class="math">H(s) = B(s)/A(s)</em> or <em class="math">H(z) = B(z)/A(z)</em>.
 See <code class="code">filter</code> for further details.
</p>
<p><strong class="strong">See also:</strong> tf2sos, zp2sos, sos2pz, zp2tf, tf2zp.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="sos2zp">
<h4 class="subsection">3.6.6 sos2zp</h4>
<a class="index-entry-id" id="index-sos2zp"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sos2zp-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">k</var>] =</code> <strong class="def-name">sos2zp</strong> <code class="def-code-arguments">(<var class="var">sos</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sos2zp-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">k</var>] =</code> <strong class="def-name">sos2zp</strong> <code class="def-code-arguments">(<var class="var">sos</var>, <var class="var">g</var>)</code></dt>
<dd><p>Convert series second-order sections to zeros, poles, and gains
 (pole residues).
</p>
<p>INPUTS:
</p><ul class="itemize mark-bullet">
<li><var class="var">sos</var> = matrix of series second-order sections, one per row:
<div class="example">
<pre class="example-preformatted"><var class="var">sos</var> = [<var class="var">B1</var>.' <var class="var">A1</var>.'; ...; <var class="var">BN</var>.' <var class="var">AN</var>.']
</pre></div>
<p>where
<code class="code"><var class="var">B1</var>.' = [b0 b1 b2] and <var class="var">A1</var>.' = [a0 a1 a2]</code> for
 section 1, etc.
</p>
<p>a0 is usually equal to 1 because all 2nd order transfer functions can
 be scaled so that a0 = 1.
 However, this is not mandatory for this implementation, which supports
 all kinds of transfer functions, including first order transfer functions.
 See <code class="code">filter</code> for documentation of the second-order direct-form filter
 coefficients <var class="var">B</var>i and <var class="var">A</var>i.
</p>
</li><li><var class="var">g</var> is an overall gain factor that effectively scales
 any one of the input <var class="var">B</var>i vectors.
 If not given the gain is assumed to be 1.
</li></ul>
<p>RETURNED:
</p><ul class="itemize mark-bullet">
<li><var class="var">z</var> = column-vector containing all zeros (roots of B(z))
</li><li><var class="var">p</var> = column-vector containing all poles (roots of A(z))
</li><li><var class="var">k</var> = overall gain = <var class="var">B</var>(Inf)
</li></ul>
<p>EXAMPLE:
</p><div class="example">
<pre class="example-preformatted"> [z, p, k] = sos2zp ([1 0 1, 1 0 -0.81; 1 0 0, 1 0 0.49])
   &rArr; z =
      0 + 1i
      0 - 1i
      0 + 0i
      0 + 0i
   &rArr; p =
     -0.9000 + 0i
      0.9000 + 0i
      0 + 0.7000i
      0 - 0.7000i
   &rArr; k =  1
</pre></div>
<p><strong class="strong">See also:</strong> zp2sos, sos2tf, tf2sos, zp2tf, tf2zp.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="ss2tf">
<h4 class="subsection">3.6.7 ss2tf</h4>
<a class="index-entry-id" id="index-ss2tf"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-ss2tf-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">num</var>, <var class="var">den</var>] =</code> <strong class="def-name">ss2tf</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>)</code></dt>
<dd><p>Conversion from state-space to transfer function representation.
 The state space system:
</p><div class="example">
<div class="group"><pre class="example-preformatted">       .
       x = Ax + Bu
       y = Cx + Du
</pre></div></div>
<p>is converted to a transfer function:
</p><div class="example">
<div class="group"><pre class="example-preformatted">                 num(s)
           G(s)=-------
                 den(s)
</pre></div></div>
</dd></dl>
</div>
<div class="subsection-level-extent" id="ss2zp">
<h4 class="subsection">3.6.8 ss2zp</h4>
<a class="index-entry-id" id="index-ss2zp"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-ss2zp-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">k</var>] =</code> <strong class="def-name">ss2zp</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>)</code></dt>
<dd><p>Converts a state space representation to a set of poles and zeros;
<var class="var">k</var> is a gain associated with the zeros.
</p>
</dd></dl>
</div>
<div class="subsection-level-extent" id="tf2sos">
<h4 class="subsection">3.6.9 tf2sos</h4>
<a class="index-entry-id" id="index-tf2sos"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-tf2sos-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">sos</var>, <var class="var">g</var>] =</code> <strong class="def-name">tf2sos</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-tf2sos-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">sos</var> =</code> <strong class="def-name">tf2sos</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dd><p>Convert direct-form filter coefficients to series second-order sections.
</p>
<p>INPUTS:
</p>
<p><var class="var">b</var> and <var class="var">a</var> are vectors specifying the digital filter
<em class="math">H(z) = B(z)/A(z)</em>.  See <code class="code">filter</code> for documentation of the <var class="var">b</var>
 and <var class="var">a</var> filter coefficients.
</p>
<p>RETURNED:
</p><ul class="itemize mark-bullet">
<li><var class="var">sos</var> = matrix of series second-order sections, one per row:
<div class="example">
<pre class="example-preformatted"><var class="var">sos</var> = [<var class="var">b1</var>.' <var class="var">a1</var>.'; ...; <var class="var">bn</var>.' <var class="var">an</var>.']
</pre></div>
<p>where
<code class="code"><var class="var">B1</var>.' = [b0 b1 b2] and <var class="var">A1</var>.' = [1 a1 a2]</code> for
 section 1, etc.  The b0 entry must be nonzero for each section (zeros at
 infinity not supported).
</p></li><li><var class="var">g</var> is an overall gain factor that effectively scales
 any one of the <var class="var">B</var>i vectors.
</li></ul>
<p>If called with only one output argument, the overall filter gain is
 applied to the first second-order section in the matrix <var class="var">sos</var>.
</p>
<p>EXAMPLE:
</p><div class="example">
<pre class="example-preformatted"> B = [1 0 0 0 0 1];
 A = [1 0 0 0 0 .9];
 [sos, g] = tf2sos (B, A)
 sos =
    1.00000   0.61803   1.00000   1.00000   0.60515   0.95873
    1.00000  -1.61803   1.00000   1.00000  -1.58430   0.95873
    1.00000   1.00000  -0.00000   1.00000   0.97915  -0.00000
 g = 1
</pre></div>
<p><strong class="strong">See also:</strong> sos2tf, zp2sos, sos2pz, zp2tf, tf2zp.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="tf2ss">
<h4 class="subsection">3.6.10 tf2ss</h4>
<a class="index-entry-id" id="index-tf2ss"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-tf2ss-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>] =</code> <strong class="def-name">tf2ss</strong> <code class="def-code-arguments">(<var class="var">num</var>, <var class="var">den</var>)</code></dt>
<dd><p>Conversion from transfer function to state-space.
 The state space system:
</p><div class="example">
<div class="group"><pre class="example-preformatted">       .
       x = Ax + Bu
       y = Cx + Du
</pre></div></div>
<p>is obtained from a transfer function:
</p><div class="example">
<div class="group"><pre class="example-preformatted">                 num(s)
           G(s)=-------
                 den(s)
</pre></div></div>
<p>The state space system matrices obtained from this function
 will be in observable companion form as Wolovich&rsquo;s Observable
 Structure Theorem is used.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="tf2zp">
<h4 class="subsection">3.6.11 tf2zp</h4>
<a class="index-entry-id" id="index-tf2zp"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-tf2zp-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">k</var>] =</code> <strong class="def-name">tf2zp</strong> <code class="def-code-arguments">(<var class="var">num</var>, <var class="var">den</var>)</code></dt>
<dd><p>Convert transfer functions to poles-and-zero representations.
</p>
<p>Returns the zeros and poles of the system defined
 by <var class="var">num</var>/<var class="var">den</var>.
<var class="var">k</var> is a gain associated with the system zeros.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="zp2sos">
<h4 class="subsection">3.6.12 zp2sos</h4>
<a class="index-entry-id" id="index-zp2sos"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-zp2sos-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">sos</var>, <var class="var">g</var>] =</code> <strong class="def-name">zp2sos</strong> <code class="def-code-arguments">(<var class="var">z</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-zp2sos-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">sos</var>, <var class="var">g</var>] =</code> <strong class="def-name">zp2sos</strong> <code class="def-code-arguments">(<var class="var">z</var>, <var class="var">p</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-zp2sos-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">sos</var>, <var class="var">g</var>] =</code> <strong class="def-name">zp2sos</strong> <code class="def-code-arguments">(<var class="var">z</var>, <var class="var">p</var>, <var class="var">k</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-zp2sos-4"><span class="category-def">Function File: </span><code class="def-type"><var class="var">sos</var> =</code> <strong class="def-name">zp2sos</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd><p>Convert filter poles and zeros to second-order sections.
</p>
<p>INPUTS:
</p><ul class="itemize mark-bullet">
<li><var class="var">z</var> = column-vector containing the filter zeros
</li><li><var class="var">p</var> = column-vector containing the filter poles
</li><li><var class="var">k</var> = overall filter gain factor. If not given the gain is assumed to be 1.
</li></ul>
<p>RETURNED:
</p><ul class="itemize mark-bullet">
<li><var class="var">sos</var> = matrix of series second-order sections, one per row:
<div class="example">
<pre class="example-preformatted"><var class="var">sos</var> = [<var class="var">B1</var>.' <var class="var">A1</var>.'; ...; <var class="var">BN</var>.' <var class="var">AN</var>.']
</pre></div>
<p>where
<code class="code"><var class="var">B1</var>.' = [b0 b1 b2] and <var class="var">A1</var>.' = [a0 a1 a2]</code> for
 section 1, etc.
 See <code class="code">filter</code> for documentation of the second-order direct-form filter
 coefficients <var class="var">B</var>i and %<var class="var">A</var>i, i=1:N.
</p>
</li><li><var class="var">g</var> is the overall gain factor that effectively scales
 any one of the <var class="var">B</var>i vectors.
</li></ul>
<p>If called with only one output argument, the overall filter gain is
 applied to the first second-order section in the matrix <var class="var">sos</var>.
</p>
<p>EXAMPLE:
</p><div class="example">
<pre class="example-preformatted">   [z, p, k] = tf2zp ([1 0 0 0 0 1], [1 0 0 0 0 .9]);
   [sos, g] = zp2sos (z, p, k)
 sos =
    1.0000    0.6180    1.0000    1.0000    0.6051    0.9587
    1.0000   -1.6180    1.0000    1.0000   -1.5843    0.9587
    1.0000    1.0000         0    1.0000    0.9791         0
 g =
     1
</pre></div>
<p><strong class="strong">See also:</strong> sos2zp, sos2tf, tf2sos, zp2tf, tf2zp.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="zp2ss">
<h4 class="subsection">3.6.13 zp2ss</h4>
<a class="index-entry-id" id="index-zp2ss"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-zp2ss-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>] =</code> <strong class="def-name">zp2ss</strong> <code class="def-code-arguments">(<var class="var">z</var>, <var class="var">p</var>, <var class="var">k</var>)</code></dt>
<dd><p>Conversion from zero / pole to state space.
</p>
<p><strong class="strong">Inputs</strong>
</p><dl class="table">
<dt><var class="var">z</var></dt>
<dt><var class="var">p</var></dt>
<dd><p>Vectors of (possibly) complex poles and zeros of a transfer
 function. Complex values must come in conjugate pairs
 (i.e., <em class="math">x+jy</em> in <var class="var">z</var> means that <em class="math">x-jy</em> is also in <var class="var">z</var>).
</p></dd>
<dt><var class="var">k</var></dt>
<dd><p>Real scalar (leading coefficient).
</p></dd>
</dl>
<p><strong class="strong">Outputs</strong>
</p><dl class="table">
<dt><var class="var"><var class="var">a</var></var></dt>
<dt><var class="var"><var class="var">b</var></var></dt>
<dt><var class="var"><var class="var">c</var></var></dt>
<dt><var class="var"><var class="var">d</var></var></dt>
<dd><p>The state space system, in the form:
</p><div class="example">
<div class="group"><pre class="example-preformatted">      .
      x = Ax + Bu
      y = Cx + Du
</pre></div></div>
</dd>
</dl>
</dd></dl>
</div>
<div class="subsection-level-extent" id="zp2tf">
<h4 class="subsection">3.6.14 zp2tf</h4>
<a class="index-entry-id" id="index-zp2tf"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-zp2tf-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">num</var>, <var class="var">den</var>] =</code> <strong class="def-name">zp2tf</strong> <code class="def-code-arguments">(<var class="var">z</var>, <var class="var">p</var>, <var class="var">k</var>)</code></dt>
<dd><p>Converts zeros / poles to a transfer function.
</p>
<p><strong class="strong">Inputs</strong>
</p><dl class="table">
<dt><var class="var">z</var></dt>
<dt><var class="var">p</var></dt>
<dd><p>Vectors of (possibly complex) poles and zeros of a transfer
 function.  Complex values must appear in conjugate pairs.
</p></dd>
<dt><var class="var">k</var></dt>
<dd><p>Real scalar (leading coefficient).
</p></dd>
</dl>
</dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="IIR-Filter-Design">
<h3 class="section" id="IIR-Filter-Design-1">3.7 IIR Filter Design</h3>
<a class="index-entry-id" id="index-IIR-Filter-Design"></a>
<div class="subsection-level-extent" id="besselap">
<h4 class="subsection">3.7.1 besselap</h4>
<a class="index-entry-id" id="index-besselap"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-besselap-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">zero</var>, <var class="var">pole</var>, <var class="var">gain</var>] =</code> <strong class="def-name">besselap</strong> <code class="def-code-arguments">(<var class="var">n</var>)</code></dt>
<dd><p>Return bessel analog filter prototype.
</p>
<p>References:
</p>
<p>http://en.wikipedia.org/wiki/Bessel_polynomials
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="besself">
<h4 class="subsection">3.7.2 besself</h4>
<a class="index-entry-id" id="index-besself"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-besself-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">besself</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">w</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-besself-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">besself</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">w</var>, &quot;high&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-besself-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">besself</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-besself-4"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>] =</code> <strong class="def-name">besself</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-besself-5"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">besself</strong> <code class="def-code-arguments">(&hellip;, &quot;z&quot;)</code></dt>
<dd><p>Generate a Bessel filter.
 Default is a Laplace space (s) filter.
</p>
<p>[b,a] = besself(n, Wc)
    low pass filter with cutoff pi*Wc radians
</p>
<p>[b,a] = besself(n, Wc, &rsquo;high&rsquo;)
    high pass filter with cutoff pi*Wc radians
</p>
<p>[z,p,g] = besself(...)
    return filter as zero-pole-gain rather than coefficients of the
    numerator and denominator polynomials.
</p>
<p>[...] = besself(...,&rsquo;z&rsquo;)
     return a discrete space (Z) filter, W must be less than 1.
</p>
<p>[a,b,c,d] = besself(...)
  return  state-space matrices
</p>
<p>References:
</p>
<p>Proakis &amp; Manolakis (1992). Digital Signal Processing. New York:
 Macmillan Publishing Company.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="bilinear">
<h4 class="subsection">3.7.3 bilinear</h4>
<a class="index-entry-id" id="index-bilinear"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-bilinear-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">Zb</var>, <var class="var">Za</var>] =</code> <strong class="def-name">bilinear</strong> <code class="def-code-arguments">(<var class="var">Sb</var>, <var class="var">Sa</var>, <var class="var">T</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-bilinear-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">Zb</var>, <var class="var">Za</var>] =</code> <strong class="def-name">bilinear</strong> <code class="def-code-arguments">(<var class="var">Sz</var>, <var class="var">Sp</var>, <var class="var">Sg</var>, <var class="var">T</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-bilinear-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">Zz</var>, <var class="var">Zp</var>, <var class="var">Zg</var>] =</code> <strong class="def-name">bilinear</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
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
</div>
<div class="subsection-level-extent" id="buttap">
<h4 class="subsection">3.7.4 buttap</h4>
<a class="index-entry-id" id="index-buttap"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-buttap-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">buttap</strong> <code class="def-code-arguments">(<var class="var">n</var>)</code></dt>
<dd><p>Design lowpass analog Butterworth filter.
</p>
<p>This function exists for <small class="sc">MATLAB</small> compatibility only, and is equivalent
 to <code class="code">butter (<var class="var">n</var>, 1, &quot;s&quot;)</code>.
</p>
<p><strong class="strong">See also:</strong> butter.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="butter">
<h4 class="subsection">3.7.5 butter</h4>
<a class="index-entry-id" id="index-butter"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-butter-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">butter</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">wc</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-butter-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">butter</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">wc</var>, <var class="var">filter_type</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-butter-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">butter</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-butter-4"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>] =</code> <strong class="def-name">butter</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-butter-5"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">butter</strong> <code class="def-code-arguments">(&hellip;, &quot;s&quot;)</code></dt>
<dd><p>Generate a Butterworth filter.
 Default is a discrete space (Z) filter.
</p>
<p>The cutoff frequency, <var class="var">wc</var> should be specified in radians for
 analog filters.  For digital filters, it must be a value between zero
 and one.  For bandpass filters, <var class="var">wc</var> is a two-element vector
 with <code class="code">w(1) &lt; w(2)</code>.
</p>
<p>The filter type must be one of <code class="code">&quot;low&quot;</code>, <code class="code">&quot;high&quot;</code>,
<code class="code">&quot;bandpass&quot;</code>, or <code class="code">&quot;stop&quot;</code>.  The default is <code class="code">&quot;low&quot;</code>
 if <var class="var">wc</var> is a scalar and <code class="code">&quot;bandpass&quot;</code> if <var class="var">wc</var> is a
 two-element vector.
</p>
<p>If the final input argument is <code class="code">&quot;s&quot;</code> design an analog Laplace
 space filter.
</p>
<p>Low pass filter with cutoff <code class="code">pi*Wc</code> radians:
</p>
<div class="example">
<pre class="example-preformatted"> [b, a] = butter (n, Wc)
</pre></div>
<p>High pass filter with cutoff <code class="code">pi*Wc</code> radians:
</p>
<div class="example">
<pre class="example-preformatted"> [b, a] = butter (n, Wc, &quot;high&quot;)
</pre></div>
<p>Band pass filter with edges <code class="code">pi*Wl</code> and <code class="code">pi*Wh</code> radians:
</p>
<div class="example">
<pre class="example-preformatted"> [b, a] = butter (n, [Wl, Wh])
</pre></div>
<p>Band reject filter with edges <code class="code">pi*Wl</code> and <code class="code">pi*Wh</code> radians:
</p>
<div class="example">
<pre class="example-preformatted"> [b, a] = butter (n, [Wl, Wh], &quot;stop&quot;)
</pre></div>
<p>Return filter as zero-pole-gain rather than coefficients of the
 numerator and denominator polynomials:
</p>
<div class="example">
<pre class="example-preformatted"> [z, p, g] = butter (...)
</pre></div>
<p>Return a Laplace space filter, <var class="var">Wc</var> can be larger than 1:
</p>
<div class="example">
<pre class="example-preformatted"> [...] = butter (..., &quot;s&quot;)
</pre></div>
<p>Return state-space matrices:
</p>
<div class="example">
<pre class="example-preformatted"> [a, b, c, d] = butter (...)
</pre></div>
<p>References:
</p>
<p>Proakis &amp; Manolakis (1992). Digital Signal Processing. New York:
 Macmillan Publishing Company.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="buttord">
<h4 class="subsection">3.7.6 buttord</h4>
<a class="index-entry-id" id="index-buttord"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-buttord-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">buttord</strong> <code class="def-code-arguments">(<var class="var">wp</var>, <var class="var">ws</var>, <var class="var">rp</var>, <var class="var">rs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-buttord-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">buttord</strong> <code class="def-code-arguments">([<var class="var">wp1</var>, <var class="var">wp2</var>], [<var class="var">ws1</var>, <var class="var">ws2</var>], <var class="var">rp</var>, <var class="var">rs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-buttord-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">buttord</strong> <code class="def-code-arguments">([<var class="var">wp1</var>, <var class="var">wp2</var>], [<var class="var">ws1</var>, <var class="var">ws2</var>], <var class="var">rp</var>, <var class="var">rs</var>, &quot;s&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-buttord-4"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">n</var>, <var class="var">wc_p</var>] =</code> <strong class="def-name">buttord</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-buttord-5"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">n</var>, <var class="var">wc_p</var>, <var class="var">wc_s</var>] =</code> <strong class="def-name">buttord</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd><p>Compute the minimum filter order of a Butterworth filter with the desired
 response characteristics.  The filter frequency band edges are specified by
 the passband frequency <var class="var">wp</var> and stopband frequency <var class="var">ws</var>.  Frequencies
 are normalized to the Nyquist frequency in the range [0,1].  <var class="var">rp</var> is the
 allowable passband ripple measured in decibels, and <var class="var">rs</var> is the minimum
 attenuation in the stop band, also in decibels.
</p>
<p>The output arguments <var class="var">n</var> and <var class="var">wc_p</var> (or <var class="var">n</var> and <var class="var">wc_n</var>) can
 be given as inputs to <code class="code">butter</code>.
 Using <var class="var">wc_p</var> makes the filter characteristic touch at least one pass band
 corner and using <var class="var">wc_s</var> makes the characteristic touch at least one
 stop band corner.
</p>
<p>If <var class="var">wp</var> and <var class="var">ws</var> are scalars, then <var class="var">wp</var> is the passband cutoff
 frequency and <var class="var">ws</var> is the stopband edge frequency.  If <var class="var">ws</var> is
 greater than <var class="var">wp</var>, the filter is a low-pass filter.  If <var class="var">wp</var> is
 greater than <var class="var">ws</var>, the filter is a high-pass filter.
</p>
<p>If <var class="var">wp</var> and <var class="var">ws</var> are vectors of length 2, then <var class="var">wp</var> defines the
 passband interval and <var class="var">ws</var> defines the stopband interval.  If <var class="var">wp</var>
 is contained within <var class="var">ws</var> (<var class="var">ws1</var> &lt; <var class="var">wp1</var> &lt; <var class="var">wp2</var> &lt; <var class="var">ws2</var>),
 the filter is a band-pass filter.  If <var class="var">ws</var> is contained within <var class="var">wp</var>
 (<var class="var">wp1</var> &lt; <var class="var">ws1</var> &lt; <var class="var">ws2</var> &lt; <var class="var">wp2</var>), the filter is a band-stop
 or band-reject filter.
</p>
<p>If the optional argument <code class="code">&quot;s&quot;</code> is given, the minimum order for an analog
 elliptic filter is computed.  All frequencies <var class="var">wp</var> and <var class="var">ws</var> are
 specified in radians per second.
</p>
<p>Theory: For Low pass filters, |H(W)|^2 = 1/[1+(W/Wc)^(2N)] = 10^(-R/10).
 With some algebra, you can solve simultaneously for Wc and N given
 Ws,Rs and Wp,Rp. Rounding N to the next greater integer, one can recalculate
 the allowable range for Wc (filter caracteristic touching the pass band edge
 or the stop band edge).
</p>
<p>For other types of filter, before making the above calculation, the
 requirements must be transformed to LP requirements. After calculation, Wc
 must be transformed back to original filter type.
</p>
<p><strong class="strong">See also:</strong> butter, cheb1ord, cheb2ord, ellipord.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="cheb">
<h4 class="subsection">3.7.7 cheb</h4>
<a class="index-entry-id" id="index-cheb"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cheb-1"><span class="category-def">Function File: </span><strong class="def-name">cheb</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">x</var>)</code></dt>
<dd><p>Returns the value of the nth-order Chebyshev polynomial calculated at
 the point x. The Chebyshev polynomials are defined by the equations:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">           / cos(n acos(x),    |x| &lt;= 1
   Tn(x) = |
           \ cosh(n acosh(x),  |x| &gt; 1
</pre></div></div>
<p>If x is a vector, the output is a vector of the same size, where each
 element is calculated as y(i) = Tn(x(i)).
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="cheb1ap">
<h4 class="subsection">3.7.8 cheb1ap</h4>
<a class="index-entry-id" id="index-cheb1ap"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cheb1ap-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">cheb1ap</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">Rp</var>)</code></dt>
<dd><p>Design lowpass analog Chebyshev type I filter.
</p>
<p>This function exists for <small class="sc">MATLAB</small> compatibility only, and is equivalent
 to <code class="code">cheby1 (<var class="var">n</var>, <var class="var">Rp</var>, 1, &quot;s&quot;)</code>.
</p>
<p>Input:
</p><ul class="itemize mark-bullet">
<li><var class="var">N</var> Order of the filter must be a positive integer
</li><li><var class="var">RP</var> Ripple in the passband in dB
</li></ul>
<p>Output:
</p><ul class="itemize mark-bullet">
<li><var class="var">z</var> The zero vector
</li><li><var class="var">p</var> The pole vectorAngle
</li><li><var class="var">g</var> The gain factor
</li></ul>
<p>Example
</p><div class="example">
<pre class="example-preformatted"> [z, p, g] = cheb1ap (2, 1)
 z = [](0x1)
 p =
  -0.54887 - 0.89513i
  -0.54887 + 0.89513i
 g =  0.98261
</pre></div>
<p><strong class="strong">See also:</strong> buttap, cheby1, cheb2ap, ellipap.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="cheb1ord">
<h4 class="subsection">3.7.9 cheb1ord</h4>
<a class="index-entry-id" id="index-cheb1ord"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cheb1ord-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">cheb1ord</strong> <code class="def-code-arguments">(<var class="var">wp</var>, <var class="var">ws</var>, <var class="var">rp</var>, <var class="var">rs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheb1ord-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">cheb1ord</strong> <code class="def-code-arguments">([<var class="var">wp1</var>, <var class="var">wp2</var>], [<var class="var">ws1</var>, <var class="var">ws2</var>], <var class="var">rp</var>, <var class="var">rs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheb1ord-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">cheb1ord</strong> <code class="def-code-arguments">([<var class="var">wp1</var>, <var class="var">wp2</var>], [<var class="var">ws1</var>, <var class="var">ws2</var>], <var class="var">rp</var>, <var class="var">rs</var>, &quot;s&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheb1ord-4"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">n</var>, <var class="var">wc</var>] =</code> <strong class="def-name">cheb1ord</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheb1ord-5"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">n</var>, <var class="var">wc_p</var>, <var class="var">wc_s</var>] =</code> <strong class="def-name">cheb1ord</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd><p>Compute the minimum filter order of a Chebyshev type I filter with the
 desired response characteristics. The filter frequency band edges are
 specified by the passband frequency <var class="var">wp</var> and stopband frequency <var class="var">ws</var>.
 Frequencies are normalized to the Nyquist frequency in the range [0,1].
<var class="var">rp</var> is the allowable passband ripple measured in decibels, and <var class="var">rs</var>
 is the minimum attenuation in the stop band, also in decibels.
</p>
<p>The output arguments <var class="var">n</var> and <var class="var">wc_p</var> (or <var class="var">n</var> and <var class="var">wc_s</var>) can
 be given as inputs to <code class="code">cheby1</code>.
 Using <var class="var">wc_p</var> makes the filter characteristic touch at least one pass band
 corner and using <var class="var">wc_s</var> makes the characteristic touch at least one
 stop band corner.
</p>
<p>If <var class="var">wp</var> and <var class="var">ws</var> are scalars, then <var class="var">wp</var> is the passband cutoff
 frequency and <var class="var">ws</var> is the stopband edge frequency.  If <var class="var">ws</var> is
 greater than <var class="var">wp</var>, the filter is a low-pass filter.  If <var class="var">wp</var> is
 greater than <var class="var">ws</var>, the filter is a high-pass filter.
</p>
<p>If <var class="var">wp</var> and <var class="var">ws</var> are vectors of length 2, then <var class="var">wp</var> defines the
 passband interval and <var class="var">ws</var> defines the stopband interval.  If <var class="var">wp</var>
 is contained within <var class="var">ws</var> (<var class="var">ws1</var> &lt; <var class="var">wp1</var> &lt; <var class="var">wp2</var> &lt; <var class="var">ws2</var>),
 the filter is a band-pass filter.  If <var class="var">ws</var> is contained within <var class="var">wp</var>
 (<var class="var">wp1</var> &lt; <var class="var">ws1</var> &lt; <var class="var">ws2</var> &lt; <var class="var">wp2</var>), the filter is a band-stop
 or band-reject filter.
</p>
<p>If the optional argument <code class="code">&quot;s&quot;</code> is given, the minimum order for an analog
 elliptic filter is computed.  All frequencies <var class="var">wp</var> and <var class="var">ws</var> are
 specified in radians per second.
</p>
<p><strong class="strong">See also:</strong> buttord, cheby1, cheb2ord, ellipord.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="cheb2ap">
<h4 class="subsection">3.7.10 cheb2ap</h4>
<a class="index-entry-id" id="index-cheb2ap"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cheb2ap-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">cheb2ap</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">Rs</var>)</code></dt>
<dd><p>Design lowpass analog Chebyshev type II filter.
</p>
<p>This function exists for <small class="sc">MATLAB</small> compatibility only, and is equivalent
 to <code class="code">cheby2 (<var class="var">n</var>, <var class="var">Rs</var>, 1, &quot;s&quot;)</code>.
</p>
<p>Demo
</p><div class="example">
<pre class="example-preformatted"> demo cheb2ap
</pre></div>
<p><strong class="strong">See also:</strong> cheby2.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="cheb2ord">
<h4 class="subsection">3.7.11 cheb2ord</h4>
<a class="index-entry-id" id="index-cheb2ord"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cheb2ord-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">cheb2ord</strong> <code class="def-code-arguments">(<var class="var">wp</var>, <var class="var">ws</var>, <var class="var">rp</var>, <var class="var">rs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheb2ord-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">cheb2ord</strong> <code class="def-code-arguments">([<var class="var">wp1</var>, <var class="var">wp2</var>], [<var class="var">ws1</var>, <var class="var">ws2</var>], <var class="var">rp</var>, <var class="var">rs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheb2ord-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">cheb2ord</strong> <code class="def-code-arguments">([<var class="var">wp1</var>, <var class="var">wp2</var>], [<var class="var">ws1</var>, <var class="var">ws2</var>], <var class="var">rp</var>, <var class="var">rs</var>, &quot;s&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheb2ord-4"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">n</var>, <var class="var">wc_s</var>] =</code> <strong class="def-name">cheb2ord</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheb2ord-5"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">n</var>, <var class="var">wc_s</var>, <var class="var">wc_p</var>] =</code> <strong class="def-name">cheb2ord</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd><p>Compute the minimum filter order of a Chebyshev type II filter with the
 desired response characteristics. The filter frequency band edges are
 specified by the passband frequency <var class="var">wp</var> and stopband frequency <var class="var">ws</var>.
 Frequencies are normalized to the Nyquist frequency in the range [0,1].
<var class="var">rp</var> is the allowable passband ripple measured in decibels, and <var class="var">rs</var>
 is the minimum attenuation in the stop band, also in decibels.
</p>
<p>The output arguments <var class="var">n</var> and <var class="var">wc_p</var> (or <var class="var">n</var> and <var class="var">wc_s</var>) can
 be given as inputs to <code class="code">cheby2</code>.
 Using <var class="var">wc_p</var> makes the filter characteristic touch at least one pass band
 corner and using <var class="var">wc_s</var> makes the characteristic touch at least one
 stop band corner.
</p>
<p>If <var class="var">wp</var> and <var class="var">ws</var> are scalars, then <var class="var">wp</var> is the passband cutoff
 frequency and <var class="var">ws</var> is the stopband edge frequency.  If <var class="var">ws</var> is
 greater than <var class="var">wp</var>, the filter is a low-pass filter.  If <var class="var">wp</var> is
 greater than <var class="var">ws</var>, the filter is a high-pass filter.
</p>
<p>If <var class="var">wp</var> and <var class="var">ws</var> are vectors of length 2, then <var class="var">wp</var> defines the
 passband interval and <var class="var">ws</var> defines the stopband interval.  If <var class="var">wp</var>
 is contained within <var class="var">ws</var> (<var class="var">ws1</var> &lt; <var class="var">wp1</var> &lt; <var class="var">wp2</var> &lt; <var class="var">ws2</var>),
 the filter is a band-pass filter.  If <var class="var">ws</var> is contained within <var class="var">wp</var>
 (<var class="var">wp1</var> &lt; <var class="var">ws1</var> &lt; <var class="var">ws2</var> &lt; <var class="var">wp2</var>), the filter is a band-stop
 or band-reject filter.
</p>
<p>If the optional argument <code class="code">&quot;s&quot;</code> is given, the minimum order for an analog
 elliptic filter is computed.  All frequencies <var class="var">wp</var> and <var class="var">ws</var> are
 specified in radians per second.
</p>
<p><strong class="strong">See also:</strong> buttord, cheb1ord, cheby2, ellipord.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="cheby1">
<h4 class="subsection">3.7.12 cheby1</h4>
<a class="index-entry-id" id="index-cheby1"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cheby1-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">cheby1</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rp</var>, <var class="var">w</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheby1-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">cheby1</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rp</var>, <var class="var">w</var>, &quot;high&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheby1-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">cheby1</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rp</var>, [<var class="var">wl</var>, <var class="var">wh</var>])</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheby1-4"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">cheby1</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rp</var>, [<var class="var">wl</var>, <var class="var">wh</var>], &quot;stop&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheby1-5"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">cheby1</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheby1-6"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>] =</code> <strong class="def-name">cheby1</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheby1-7"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">cheby1</strong> <code class="def-code-arguments">(&hellip;, &quot;s&quot;)</code></dt>
<dd><p>Generate a Chebyshev type I filter with <var class="var">rp</var> dB of passband ripple.
</p>
<p>[b, a] = cheby1(n, Rp, Wc)
    low pass filter with cutoff pi*Wc radians
</p>
<p>[b, a] = cheby1(n, Rp, Wc, &rsquo;high&rsquo;)
    high pass filter with cutoff pi*Wc radians
</p>
<p>[b, a] = cheby1(n, Rp, [Wl, Wh])
    band pass filter with edges pi*Wl and pi*Wh radians
</p>
<p>[b, a] = cheby1(n, Rp, [Wl, Wh], &rsquo;stop&rsquo;)
    band reject filter with edges pi*Wl and pi*Wh radians
</p>
<p>[z, p, g] = cheby1(...)
    return filter as zero-pole-gain rather than coefficients of the
    numerator and denominator polynomials.
</p>
<p>[...] = cheby1(...,&rsquo;s&rsquo;)
     return a Laplace space filter, W can be larger than 1.
</p>
<p>[a,b,c,d] = cheby1(...)
  return  state-space matrices
</p>
<p>References:
</p>
<p>Parks &amp; Burrus (1987). Digital Filter Design. New York:
 John Wiley &amp; Sons, Inc.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="cheby2">
<h4 class="subsection">3.7.13 cheby2</h4>
<a class="index-entry-id" id="index-cheby2"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cheby2-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rs</var>, <var class="var">wc</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheby2-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rs</var>, <var class="var">wc</var>, &quot;high&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheby2-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rs</var>, [<var class="var">wl</var>, <var class="var">wh</var>])</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheby2-4"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rs</var>, [<var class="var">wl</var>, <var class="var">wh</var>], &quot;stop&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheby2-5"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheby2-6"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cheby2-7"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">cheby2</strong> <code class="def-code-arguments">(&hellip;, &quot;s&quot;)</code></dt>
<dd><p>Generate a Chebyshev type II filter with <var class="var">rs</var> dB of stopband attenuation.
</p>
<p>[b, a] = cheby2(n, Rs, Wc)
    low pass filter with cutoff pi*Wc radians
</p>
<p>[b, a] = cheby2(n, Rs, Wc, &rsquo;high&rsquo;)
    high pass filter with cutoff pi*Wc radians
</p>
<p>[b, a] = cheby2(n, Rs, [Wl, Wh])
    band pass filter with edges pi*Wl and pi*Wh radians
</p>
<p>[b, a] = cheby2(n, Rs, [Wl, Wh], &rsquo;stop&rsquo;)
    band reject filter with edges pi*Wl and pi*Wh radians
</p>
<p>[z, p, g] = cheby2(...)
    return filter as zero-pole-gain rather than coefficients of the
    numerator and denominator polynomials.
</p>
<p>[...] = cheby2(...,&rsquo;s&rsquo;)
     return a Laplace space filter, W can be larger than 1.
</p>
<p>[a,b,c,d] = cheby2(...)
  return  state-space matrices
</p>
<p>References:
</p>
<p>Parks &amp; Burrus (1987). Digital Filter Design. New York:
 John Wiley &amp; Sons, Inc.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="ellip">
<h4 class="subsection">3.7.14 ellip</h4>
<a class="index-entry-id" id="index-ellip"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-ellip-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rp</var>, <var class="var">rs</var>, <var class="var">wp</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ellip-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rp</var>, <var class="var">rs</var>, <var class="var">wp</var>, &quot;high&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ellip-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rp</var>, <var class="var">rs</var>, [<var class="var">wl</var>, <var class="var">wh</var>])</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ellip-4"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">rp</var>, <var class="var">rs</var>, [<var class="var">wl</var>, <var class="var">wh</var>], &quot;stop&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ellip-5"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ellip-6"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">b</var>, <var class="var">c</var>, <var class="var">d</var>] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ellip-7"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">ellip</strong> <code class="def-code-arguments">(&hellip;, &quot;s&quot;)</code></dt>
<dd>
<p>Generate an elliptic or Cauer filter with <var class="var">rp</var> dB of passband ripple and
<var class="var">rs</var> dB of stopband attenuation.
</p>
<p>[b,a] = ellip(n, Rp, Rs, Wp)
  low pass filter with order n, cutoff pi*Wp radians, Rp decibels
  of ripple in the passband and a stopband Rs decibels down.
</p>
<p>[b,a] = ellip(n, Rp, Rs, Wp, &rsquo;high&rsquo;)
  high pass filter with cutoff pi*Wp...
</p>
<p>[b,a] = ellip(n, Rp, Rs, [Wl, Wh])
  band pass filter with band pass edges pi*Wl and pi*Wh ...
</p>
<p>[b,a] = ellip(n, Rp, Rs, [Wl, Wh], &rsquo;stop&rsquo;)
  band reject filter with edges pi*Wl and pi*Wh, ...
</p>
<p>[z,p,g] = ellip(...)
  return filter as zero-pole-gain.
</p>
<p>[...] = ellip(...,&rsquo;s&rsquo;)
     return a Laplace space filter, W can be larger than 1.
</p>
<p>[a,b,c,d] = ellip(...)
  return  state-space matrices
</p>
<p>References:
</p>
<p>- Oppenheim, Alan V., Discrete Time Signal Processing, Hardcover, 1999.
 - Parente Ribeiro, E., Notas de aula da disciplina TE498 -  Processamento
   Digital de Sinais, UFPR, 2001/2002.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="ellipap">
<h4 class="subsection">3.7.15 ellipap</h4>
<a class="index-entry-id" id="index-ellipap"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-ellipap-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">ellipap</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">Rp</var>, <var class="var">Rs</var>)</code></dt>
<dd><p>Design lowpass analog elliptic filter.
</p>
<p>This function exists for <small class="sc">MATLAB</small> compatibility only, and is equivalent
 to <code class="code">ellip (<var class="var">n</var>, <var class="var">Rp</var>, <var class="var">Rs</var>, 1, &quot;s&quot;)</code>.
</p>
<p><strong class="strong">See also:</strong> ellip.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="ellipord">
<h4 class="subsection">3.7.16 ellipord</h4>
<a class="index-entry-id" id="index-ellipord"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-ellipord-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">ellipord</strong> <code class="def-code-arguments">(<var class="var">wp</var>, <var class="var">ws</var>, <var class="var">rp</var>, <var class="var">rs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ellipord-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">ellipord</strong> <code class="def-code-arguments">([<var class="var">wp1</var>, <var class="var">wp2</var>], [<var class="var">ws1</var>, <var class="var">ws2</var>], <var class="var">rp</var>, <var class="var">rs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ellipord-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">n</var> =</code> <strong class="def-name">ellipord</strong> <code class="def-code-arguments">([<var class="var">wp1</var>, <var class="var">wp2</var>], [<var class="var">ws1</var>, <var class="var">ws2</var>], <var class="var">rp</var>, <var class="var">rs</var>, &quot;s&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ellipord-4"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">n</var>, <var class="var">wc</var>] =</code> <strong class="def-name">ellipord</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd><p>Compute the minimum filter order of an elliptic filter with the desired
 response characteristics.  The filter frequency band edges are specified
 by the passband frequency <var class="var">wp</var> and stopband frequency <var class="var">ws</var>.
 Frequencies are normalized to the Nyquist frequency in the range [0,1].
<var class="var">rp</var> is the allowable passband ripple measured in decibels, and <var class="var">rs</var>
 is the minimum attenuation in the stop band, also in decibels.  The output
 arguments <var class="var">n</var> and <var class="var">wc</var> can be given as inputs to <code class="code">ellip</code>.
</p>
<p>If <var class="var">wp</var> and <var class="var">ws</var> are scalars, then <var class="var">wp</var> is the passband cutoff
 frequency and <var class="var">ws</var> is the stopband edge frequency.  If <var class="var">ws</var> is
 greater than <var class="var">wp</var>, the filter is a low-pass filter.  If <var class="var">wp</var> is
 greater than <var class="var">ws</var>, the filter is a high-pass filter.
</p>
<p>If <var class="var">wp</var> and <var class="var">ws</var> are vectors of length 2, then <var class="var">wp</var> defines the
 passband interval and <var class="var">ws</var> defines the stopband interval.  If <var class="var">wp</var>
 is contained within <var class="var">ws</var> (<var class="var">ws1</var> &lt; <var class="var">wp1</var> &lt; <var class="var">wp2</var> &lt; <var class="var">ws2</var>),
 the filter is a band-pass filter.  If <var class="var">ws</var> is contained within <var class="var">wp</var>
 (<var class="var">wp1</var> &lt; <var class="var">ws1</var> &lt; <var class="var">ws2</var> &lt; <var class="var">wp2</var>), the filter is a band-stop
 or band-reject filter.
</p>
<p>If the optional argument <code class="code">&quot;s&quot;</code> is given, the minimum order for an analog
 elliptic filter is computed.  All frequencies <var class="var">wp</var> and <var class="var">ws</var> are
 specified in radians per second.
</p>
<p>Reference: Lamar, Marcus Vinicius, <cite class="cite">Notas de aula da disciplina TE 456 -
 Circuitos Analogicos II</cite>, UFPR, 2001/2002.
</p>
<p><strong class="strong">See also:</strong> buttord, cheb1ord, cheb2ord, ellip.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="firpm">
<h4 class="subsection">3.7.17 firpm</h4>
<a class="index-entry-id" id="index-firpm"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-firpm-1"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-2"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, @<var class="var">respFn</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-3"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, {@<var class="var">respFn</var>, &hellip;})</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-4"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(&hellip;, <var class="var">w</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-5"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(&hellip;, <var class="var">class</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-6"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(&hellip;, {<var class="var">accuracy, &hellip;}</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-7"><span class="category-def">Loadable Function: </span><code class="def-type">[<var class="var">b</var>, <var class="var">minimax</var>] =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpm-8"><span class="category-def">Loadable Function: </span><code class="def-type">[<var class="var">b</var>, <var class="var">minimax</var>, <var class="var">res</var>] =</code> <strong class="def-name">firpm</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd><a class="index-entry-id" id="index-signal-processing"></a>
<p>Designs a linear-phase FIR filter according to given specifications and the
&lsquo;minimax&rsquo; criterion.  The method (per McClellan et al.<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>) uses successive approximation to minimize
the maximum weighted error between the desired and actual frequency response of
the filter.  Such filters are variably described as being &lsquo;minimax&rsquo;,
&lsquo;equiripple&rsquo;, or &lsquo;optimal (in the Chebyshev sense)&rsquo;.
</p>
<h3 class="heading" id="Arguments">Arguments</h3>
<dl class="table">
<dt><var class="var">&hellip;</var></dt>
<dd><p>Where shown as the first argument to <code class="code">firpm</code>, indicates that any
previously-indicated list of arguments may substitute for the ellipsis.
</p>
</dd>
<dt><var class="var">n</var></dt>
<dd><p>A positive integer giving the filter order.
</p>
</dd>
<dt><var class="var">f</var></dt>
<dd><p>A vector of real-numbers, increasing in the range [0,1], giving the frequencies
of the left and right edges of each band for which a specific amplitude
response is desired: [l1 r1 l2 r2 &hellip;].  1 represents the
Nyquist-frequency.  Transition-bands are defined implicitly as the regions
between or outside the given bands.
</p>
</dd>
<dt><var class="var">a</var></dt>
<dd><p>A vector of real-numbers giving the desired amplitude response.  An amplitude
value is given either for each band edge: [a(l1) a(r1) a(l2) a(r2) &hellip;], or
for each band: [a1 a2 &hellip;].  In the former case, in-band amplitude is
determined by linear interpolation between the given band-edge values.  1
represents unity-gain, 0 represents infinite attenuation, and &minus;1
represents a phase change of pi radians.
</p>
<p>Note that amplitude response is necessarily zero at <var class="var">f</var>=0 for type III and
IV filters, and at <var class="var">f</var>=1 for type II and III filters.
</p>
</dd>
<dt><var class="var">@respFn</var></dt>
<dd><p>A handle to a &lsquo;response function&rsquo; that supplies the desired amplitude response
and error-weighting.  This, unlike <var class="var">a</var> above, allows the response to be
arbitrary (subject to the note above).  <code class="code">firpm</code> invokes the response
function according to the following syntax:
</p>
<div class="example">
<pre class="example-preformatted"><var class="var">ag</var> = <code class="code">respFn</code> (<var class="var">n</var>,<var class="var">f</var>,<var class="var">g</var>,<var class="var">w</var>, ...)
[<var class="var">ag</var> <var class="var">wg</var>] = <code class="code">respFn</code> (<var class="var">n</var>,<var class="var">f</var>,<var class="var">g</var>,<var class="var">w</var>, ...)
<var class="var">symmetry</var> = <code class="code">respFn</code> (&quot;defaults&quot;, {<var class="var">n</var>,<var class="var">f</var>,<var class="var">g</var>,<var class="var">w</var>, ...})
</pre></div>
<p>where:
</p><ul class="itemize mark-bullet">
<li><var class="var">n</var> and <var class="var">f</var> are as given to <code class="code">firpm</code>.
</li><li><var class="var">w</var> is as given to <code class="code">firpm</code>, or ones if not given.
</li><li><var class="var">ag</var> and <var class="var">wg</var> are the desired amplitude and weighting functions
evaluated at each frequency in vector <var class="var">g</var> (which are frequencies within the
non-transition bands of <var class="var">f</var>).  Returning <var class="var">ag</var> alone gives uniform
weighting.
</li><li><var class="var">symmetry</var> is either <code class="code">&quot;even&quot;</code> or <code class="code">&quot;odd&quot;</code>; this provides an
alternative to using the <var class="var">class</var> values <code class="code">&quot;symmetric&quot;</code>
and <code class="code">&quot;antisymmetric&quot;</code>.
</li><li>Per the ellipses shown here and above, when @<var class="var">respFn</var> is given contained
in a cell-array, any additionally contained values are appended to the
<var class="var">respFn</var> invocation argument-list.
</li></ul>
</dd>
<dt><var class="var">w</var></dt>
<dd><p>When used in conjunction with <var class="var">a</var>, <var class="var">w</var> is a vector of positive
real-numbers giving error-weightings to be applied at each given band-edge
[w(l1) w(r1) w(l2) w(r2) &hellip;], or for each band [w1 w2 &hellip;].  In the
former case, in-band weighting is determined by linear interpolation between
the given band-edge values.  A higher relative error weighting yields a lower
relative error.
</p>
<p>When used in conjunction with @<var class="var">respFn</var>, <var class="var">w</var> is a vector (constrained
as above) that is passed through to <var class="var">respFn</var>.
</p>
</dd>
<dt><var class="var">class</var></dt>
<dd><p>A string, which may be abbreviated, giving the filter-class:
</p><ul class="itemize mark-bullet">
<li><code class="code">&quot;symmetric&quot;</code> (the default) for type I or II filters,
</li><li><code class="code">&quot;antisymmetric&quot;</code> (or <code class="code">&quot;hilbert&quot;</code>) for standard type III or IV
filters,
</li><li><code class="code">&quot;differentiator&quot;</code> for type III or IV filters with inverted phase and
with error-weighting (further to <var class="var">w</var>) of 2/f applied in the pass-band(s).
</li></ul>
</dd>
<dt><var class="var">accuracy, &hellip;</var></dt>
<dd><p>Up to three properties contained within a cell-array: <var class="var">accuracy</var>,
<var class="var">persistence</var>, <var class="var">robustness</var>, that respectively control how close the
computed filter will be to the ideal minimax solution, the number of
computation iterations over which the required accuracy will be sought, and the
precision of certain internal processing.  Each can each be set to a small
positive number (typically &le;3), to increase the relevant item; this may
increase computation time, but the need to do so should be rare.  A value of 0
can be used to leave an item unchanged.
</p>
<p>Alternatively, setting <var class="var">accuracy</var> &ge;16 emulates <small class="sc">MATLAB</small>&rsquo;s
<var class="var">lgrid</var> argument.
</p>
</dd>
</dl>
<h3 class="heading" id="Results">Results</h3>
<p>If a problem occurs during the computation, a diagnostic message will normally
be displayed.  If this happens, adjusting <var class="var">accuracy</var>, <var class="var">persistence</var>, or
<var class="var">robustness</var> may provide the solution.  Some filters however, may not be
realizable due to machine-precision limitations.  If a filter can be computed,
returned values are as follows:
</p>
<dl class="table">
<dt><var class="var">b</var></dt>
<dd><p>A length <var class="var">N</var>+1 row-vector containing the computed filter coefficients.
</p>
</dd>
<dt><var class="var">minimax</var></dt>
<dd><p>The absolute value of the minimized, maximum weighted error, or this number
negated if the required accuracy could not be achieved.
</p>
</dd>
<dt><var class="var">res</var></dt>
<dd><p>A structure of data relating to the filter computation and a partial
response-analysis of the resultant filter; fields are vectors:
</p><blockquote class="quotation">
<table class="multitable">
<tbody><tr><td width="12%"><code class="code">fgrid</code></td><td width="60%">Analysis frequencies per <var class="var">f</var>.</td></tr>
<tr><td width="12%"><code class="code">des</code></td><td width="60%">Desired amplitude response.</td></tr>
<tr><td width="12%"><code class="code">wt</code></td><td width="60%">Error weighting.</td></tr>
<tr><td width="12%"><code class="code">H</code></td><td width="60%">Complex frequency response.</td></tr>
<tr><td width="12%"><code class="code">error</code></td><td width="60%">Desired minus actual amplitude response.</td></tr>
<tr><td width="12%"><code class="code">iextr</code></td><td width="60%">Indices of local peaks in <code class="code">error</code>.</td></tr>
<tr><td width="12%"><code class="code">fextr</code></td><td width="60%">Frequencies of local peaks in <code class="code">error</code>.</td></tr>
</tbody>
</table>
</blockquote>
</dd>
</dl>
<p>Using <var class="var">res</var> is not recommended because it can be slow to compute and, since
the analysis excludes transition-bands, any &lsquo;anomalies&rsquo;<a class="footnote" id="DOCF2" href="#FOOT2"><sup>2</sup></a> therein are not easy to
discern.  In general, <code class="code">freqz</code> suffices to check that the response of the
computed filter is satisfactory.
</p>
<h3 class="heading" id="Examples">Examples</h3>
<div class="example">
<div class="group"><pre class="example-preformatted"># Low-pass with frequencies in Hz:
Fs = 96000; Fn = Fs/2; # Sampling &amp; Nyquist frequencies.
b = firpm (50, [0 20000 28000 48000] / Fn, [1 0]);
</pre></div></div>
<div class="example">
<div class="group"><pre class="example-preformatted"># Type IV high-pass:
b = firpm (31, [0 0.5 0.7 1], [0 1], &quot;antisym&quot;);
</pre></div></div>
<div class="example">
<div class="group"><pre class="example-preformatted"># Inverse-sinc (arbitrary response):
b = firpm (20, [0 0.5 0.9 1], @(n,f,g) ...
deal ((g&lt;=f(2))./sinc (g), (g&gt;=f(3))*9+1));
</pre></div></div>
<div class="example">
<div class="group"><pre class="example-preformatted"># Band-pass with filter-response check:
freqz (firpm (40, [0 3 4 6 8 10]/10, [0 1 0]))
</pre></div></div>
<p>Further examples can be found in the <code class="code">firpm</code> and <code class="code">firpmord</code>
demonstration scripts.
</p>
<h3 class="heading" id="Compatibility">Compatibility</h3>
<p>Given invalid filter specifications, Octave emits an error and does not produce
a filter; <small class="sc">MATLAB</small> in such circumstances may still produce filter
coefficients.
</p>
<p>Unlike with <small class="sc">MATLAB</small>, with Octave <var class="var">minimax</var> can be negative; for
compatibility, take the absolute value.
</p>
<p><strong class="strong">See also:</strong> firpmord.
</p>
</dd></dl>
</div>
<div class="subsection-level-extent" id="firpmord">
<h4 class="subsection">3.7.18 firpmord</h4>
<a class="index-entry-id" id="index-firpmord"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-firpmord-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">n</var>, <var class="var">Fout</var>, <var class="var">a</var>, <var class="var">w</var>] =</code> <strong class="def-name">firpmord</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">a</var>, <var class="var">d</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpmord-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">n</var>, <var class="var">Fout</var>, <var class="var">a</var>, <var class="var">w</var>] =</code> <strong class="def-name">firpmord</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">a</var>, <var class="var">d</var>, <var class="var">fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpmord-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">c</var> =</code> <strong class="def-name">firpmord</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">a</var>, <var class="var">d</var>, &quot;cell&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firpmord-4"><span class="category-def">Function File: </span><code class="def-type"><var class="var">c</var> =</code> <strong class="def-name">firpmord</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">a</var>, <var class="var">d</var>, <var class="var">fs</var>, &quot;cell&quot;)</code></dt>
<dd><a class="index-entry-id" id="index-signal-processing-1"></a>
<p>Estimate the filter-order needed for <code class="code">firpm</code> to design a type-I or
 type-II linear-phase FIR filter according to the given specifications.
</p>
<h3 class="heading" id="Arguments-1">Arguments</h3>
<dl class="table">
<dt><var class="var">f</var></dt>
<dd><p>A vector of real-numbers, increasing in the range (0, <var class="var">fs</var>/2), giving the
 frequencies of the left and right edges of each band for which a specific
 amplitude response is desired (omitting 0 and <var class="var">fs</var>/2, which are implied):
 [r1 l2 r2 &hellip;].  Transition-bands are defined implicitly as the regions
 between the given bands.
</p>
</dd>
<dt><var class="var">a</var></dt>
<dd><p>A vector of real-numbers giving the ideal amplitude response.  An amplitude
 value is given for each band specified by <var class="var">f</var>: [a1 a2 &hellip;].  1
 represents unity-gain, 0 represents infinite attenuation, and &minus;1
 represents a phase change of pi radians.
</p>
</dd>
<dt><var class="var">d</var></dt>
<dd><p>A vector of positive real-numbers giving the maximum allowable linear
 deviation from the amplitudes given in <var class="var">a</var>, thus constraining the actual
 amplitude response (where defined by <var class="var">f</var>) to be within <var class="var">a</var> +/&minus;
<var class="var">d</var>.  Note that, though related, <var class="var">d</var> does not equate to
<code class="code">firpm</code>&rsquo;s <var class="var">w</var> argument.
</p>
</dd>
<dt><var class="var">fs</var></dt>
<dd>
<p>The sampling-frequency, which defaults to 2.
</p>
</dd>
</dl>
<h3 class="heading" id="Usage">Usage</h3>
<p>The function returns the estimated filter-order, together with the other
 design specification values, in one of two forms suitable for use with
<code class="code">firpm</code>.  By default, multiple return values are used; alternatively, by
 giving <code class="code">&quot;cell&quot;</code> (or <code class="code">&quot;c&quot;</code>) as the last argument to <code class="code">firpmord</code>,
 the returned values are contained within a cell-array that can, if desired,
 be passed directly to <code class="code">firpm</code>.
</p>
<p>The following examples illustrate the use of both mechanisms, as well as
 aspects of <code class="code">firpmord</code> usage in general:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted"> # Low-pass; frequencies in kHz:
 [n f a w] = firpmord ([2.5 3], [1 0], [0.01 db2mag(-60)], 8);
 b = firpm (n, f, a, w);
</pre></div></div>
<div class="example">
<div class="group"><pre class="example-preformatted"> # Band-pass:
 c = firpmord ([3 4 8 9], [0 1 0], [1e-3 1e-2 1e-3], 20, &quot;cell&quot;);
 b = firpm (c{:});
</pre></div></div>
<div class="example">
<div class="group"><pre class="example-preformatted"> # High-pass:
 b = firpm (firpmord ([6.4 8]/16, [0 1], [1e-4 0.01], &quot;c&quot;){:});
</pre></div></div>
<p>In cases where elements of <var class="var">d</var> follow a repeating pattern (e.g. all the
 elements are equal, or elements corresponding to pass-bands are equal and
 elements corresponding to stop-bands are equal), only as many elements as are
 needed to establish the pattern need be given.
</p>
<p>For example, the following <code class="code">firpmord</code> invocation pairs are equivalent:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted"> # Low-pass:
 firpmord ([0.4 0.5], [0 1], [db2mag(-72) db2mag(-72)]);
 firpmord ([0.4 0.5], [0 1], [db2mag(-72)]);
</pre></div></div>
<div class="example">
<div class="group"><pre class="example-preformatted"> # Multi-band-pass:
 ds = db2mag(-80); dp = 0.01;
 firpmord ([1 2 3 4 5 6 7 8]/10, [0 1 0 1 0], [ds dp ds dp ds]);
 firpmord ([1 2 3 4 5 6 7 8]/10, [0 1 0 1 0], [ds dp]);
</pre></div></div>
<h3 class="heading" id="Notes">Notes</h3>
<p>The estimation algorithm used is per Ichige et al.<a class="footnote" id="DOCF3" href="#FOOT3"><sup>3</sup></a> Accuracy tends to decrease as
 the number of bands increases.  Even with two bands (i.e. high-pass or
 low-pass), the algorithm may under- or over-estimate.  See the
<code class="code">firpmord</code> demonstrations for some examples.
</p>
<p>In order to precisely determine the minimum order needed for a particular
 design, <code class="code">firpmord</code> could be used to seed an algorithm iterating
 invocations of <code class="code">firpm</code> (as exemplified in demonstration number five).
</p>
<h3 class="heading" id="Related-documentation">Related documentation</h3>
<p><strong class="strong">See also:</strong> firpm, kaiserord.
</p>
</dd></dl>
</div>
<div class="subsection-level-extent" id="impinvar">
<h4 class="subsection">3.7.19 impinvar</h4>
<a class="index-entry-id" id="index-impinvar"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-impinvar-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b_out</var>, <var class="var">a_out</var>] =</code> <strong class="def-name">impinvar</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">fs</var>, <var class="var">tol</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-impinvar-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b_out</var>, <var class="var">a_out</var>] =</code> <strong class="def-name">impinvar</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-impinvar-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b_out</var>, <var class="var">a_out</var>] =</code> <strong class="def-name">impinvar</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dd><p>Converts analog filter with coefficients <var class="var">b</var> and <var class="var">a</var> to digital,
 conserving impulse response.
</p>
<p>If <var class="var">fs</var> is not specified, or is an empty vector, it defaults to 1Hz.
</p>
<p>If <var class="var">tol</var> is not specified, it defaults to 0.0001 (0.1%)
 This function does the inverse of impinvar so that the following example should
 restore the original values of <var class="var">a</var> and <var class="var">b</var>.
</p>
<p><code class="command">invimpinvar</code> implements the reverse of this function.
</p><div class="example">
<pre class="example-preformatted"> [b, a] = impinvar (b, a);
 [b, a] = invimpinvar (b, a);
</pre></div>
<p>Reference: Thomas J. Cavicchi (1996) &ldquo;Impulse invariance and multiple-order
 poles&rdquo;. IEEE transactions on signal processing, Vol 44 (9): 2344&ndash;2347
</p>
<p><strong class="strong">See also:</strong> bilinear, invimpinvar.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="invimpinvar">
<h4 class="subsection">3.7.20 invimpinvar</h4>
<a class="index-entry-id" id="index-invimpinvar"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-invimpinvar-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b_out</var>, <var class="var">a_out</var>] =</code> <strong class="def-name">invimpinvar</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">fs</var>, <var class="var">tol</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-invimpinvar-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b_out</var>, <var class="var">a_out</var>] =</code> <strong class="def-name">invimpinvar</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-invimpinvar-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b_out</var>, <var class="var">a_out</var>] =</code> <strong class="def-name">invimpinvar</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dd><p>Converts digital filter with coefficients <var class="var">b</var> and <var class="var">a</var> to analog,
 conserving impulse response.
</p>
<p>This function does the inverse of impinvar so that the following example should
 restore the original values of <var class="var">a</var> and <var class="var">b</var>.
</p><div class="example">
<pre class="example-preformatted"> [b, a] = impinvar (b, a);
 [b, a] = invimpinvar (b, a);
</pre></div>
<p>If <var class="var">fs</var> is not specified, or is an empty vector, it defaults to 1Hz.
</p>
<p>If <var class="var">tol</var> is not specified, it defaults to 0.0001 (0.1%)
</p>
<p>Reference: Thomas J. Cavicchi (1996) &ldquo;Impulse invariance and multiple-order
 poles&rdquo;. IEEE transactions on signal processing, Vol 40 (9): 2344&ndash;2347
</p>
<p><strong class="strong">See also:</strong> bilinear, impinvar.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="ncauer">
<h4 class="subsection">3.7.21 ncauer</h4>
<a class="index-entry-id" id="index-ncauer"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cauer_0028Rp_002c"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">z</var>, <var class="var">p</var>, <var class="var">g</var>] =</code> <strong class="def-name">cauer(<var class="var">Rp</var>,</strong> <code class="def-code-arguments"><var class="var">Rs</var>, <var class="var">n</var>)</code></dt>
<dd><p>Analog prototype for Cauer filter.
</p>
<dl class="table">
<dt>Rp</dt>
<dd><p>Passband ripple
</p></dd>
<dt>Rs</dt>
<dd><p>Stopband ripple
</p></dd>
<dt>n</dt>
<dd><p>Desired order
</p></dd>
<dt>z</dt>
<dd><p>complex vector of zeros for the model.
</p></dd>
<dt>p</dt>
<dd><p>complex vector of poles for the model.
</p></dd>
<dt>g</dt>
<dd><p>gain value.
</p></dd>
</dl>
<p>References:
</p>
<p>- Serra, Celso Penteado, Teoria e Projeto de Filtros, Campinas: CARTGRAF,
   1983.
</p>
<p>- Lamar, Marcus Vinicius, Notas de aula da disciplina TE 456 - Circuitos
   Analogicos II, UFPR, 2001/2002.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="pei_005ftseng_005fnotch">
<h4 class="subsection">3.7.22 pei_tseng_notch</h4>
<a class="index-entry-id" id="index-pei_005ftseng_005fnotch"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-pei_005ftseng_005fnotch-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">b</var>, <var class="var">a</var>] =</code> <strong class="def-name">pei_tseng_notch</strong> <code class="def-code-arguments">(<var class="var">frequencies</var>, <var class="var">bandwidths</var>)</code></dt>
<dd><p>Return coefficients for an IIR notch-filter with one or more filter frequencies and according (very narrow) bandwidths
 to be used with <code class="code">filter</code> or <code class="code">filtfilt</code>.
 The filter construction is based on an allpass which performs a reversal of phase at the filter frequencies.
 Thus, the mean of the phase-distorted and the original signal has the respective frequencies removed.
 See the demo for an illustration.
</p>
<p>Original source:
 Pei, Soo-Chang, and Chien-Cheng Tseng
 &quot;IIR Multiple Notch Filter Design Based on Allpass Filter&quot;
 1996 IEEE Tencon
 doi: 10.1109/TENCON.1996.608814)
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="sftrans">
<h4 class="subsection">3.7.23 sftrans</h4>
<a class="index-entry-id" id="index-sftrans"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sftrans-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">Sz</var>, <var class="var">Sp</var>, <var class="var">Sg</var>] =</code> <strong class="def-name">sftrans</strong> <code class="def-code-arguments">(<var class="var">Sz</var>, <var class="var">Sp</var>, <var class="var">Sg</var>, <var class="var">W</var>, <var class="var">stop</var>)</code></dt>
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
<hr>
</div>
</div>
<div class="section-level-extent" id="FIR-Filter-Design">
<h3 class="section" id="FIR-Filter-Design-1">3.8 FIR Filter Design</h3>
<a class="index-entry-id" id="index-FIR-Filter-Design"></a>
<div class="subsection-level-extent" id="cl2bp">
<h4 class="subsection">3.8.1 cl2bp</h4>
<a class="index-entry-id" id="index-cl2bp"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cl2bp-1"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">h</var> =</code> <strong class="def-name">cl2bp</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">w1</var>, <var class="var">w2</var>, <var class="var">up</var>, <var class="var">lo</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cl2bp-2"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">h</var> =</code> <strong class="def-name">cl2bp</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">w1</var>, <var class="var">w2</var>, <var class="var">up</var>, <var class="var">lo</var>, <var class="var">gridsize</var>)</code></dt>
<dd>
<p>Constrained L2 bandpass FIR filter design.  This is a fast implementation of
the algorithm cited below.  Compared to <em class="dfn">remez</em>, it offers implicit
specification of transition bands, a higher likelihood of convergence, and an
error criterion combining features of both L2 and Chebyshev approaches.
</p>
<p>Inputs:
</p>
<dl class="table">
<dt><var class="var">m</var></dt>
<dd><p>degree of cosine polynomial, i.e. the number of output coefficients will be
<var class="var">m</var>*2+1
</p></dd>
<dt><var class="var">w1</var></dt>
<dt><var class="var">w2</var></dt>
<dd><p>bandpass filter cutoffs in the range 0 &lt;= <var class="var">w1</var> &lt; <var class="var">w2</var> &lt;= pi,
where pi is the Nyquist frequency
</p></dd>
<dt><var class="var">up</var></dt>
<dd><p>vector of 3 upper bounds for [stopband1, passband, stopband2]
</p></dd>
<dt><var class="var">lo</var></dt>
<dd><p>vector of 3 lower bounds for [stopband1, passband, stopband2]
</p></dd>
<dt><var class="var">gridsize</var></dt>
<dd><p>search grid size; larger values may improve accuracy,
but greatly increase calculation time. Default value is 2048, max value is 1e6.
</p></dd>
</dl>
<p>Output:
</p>
<p>A vector of <var class="var">m</var>*2+1 FIR coefficients, or an empty value if the solver
failed to converge.
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted"><code class="code">h = cl2bp(30, 0.3*pi, 0.6*pi, [0.02, 1.02, 0.02], [-0.02, 0.98, -0.02], 2^11);</code>
</pre></div>
<p>Original Paper:  I. W. Selesnick, M. Lang, and C. S. Burrus.  A modified
algorithm for constrained least square design of multiband FIR filters without
specified transition bands.
IEEE Trans. on Signal Processing, 46(2):497-501, February 1998.
</p></dd></dl>
<p><strong class="strong">See also:</strong> remez.
</p>
</div>
<div class="subsection-level-extent" id="fir1">
<h4 class="subsection">3.8.2 fir1</h4>
<a class="index-entry-id" id="index-fir1"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-fir1-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir1</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">w</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fir1-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir1</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">w</var>, <var class="var">type</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fir1-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir1</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">w</var>, <var class="var">type</var>, <var class="var">window</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fir1-4"><span class="category-def">Function File: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir1</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">w</var>, <var class="var">type</var>, <var class="var">window</var>, <var class="var">noscale</var>)</code></dt>
<dd>
<p>Produce an order <var class="var">n</var> FIR filter with the given frequency cutoff <var class="var">w</var>,
 returning the <var class="var">n</var>+1 filter coefficients in <var class="var">b</var>.  If <var class="var">w</var> is a
 scalar, it specifies the frequency cutoff for a lowpass or highpass filter.
 If <var class="var">w</var> is a two-element vector, the two values specify the edges of a
 bandpass or bandstop filter.  If <var class="var">w</var> is an N-element vector, each
 value specifies a band edge of a multiband pass/stop filter.
</p>
<p>The filter <var class="var">type</var> can be specified with one of the following strings:
 &quot;low&quot;, &quot;high&quot;, &quot;stop&quot;, &quot;pass&quot;, &quot;bandpass&quot;, &quot;DC-0&quot;, or &quot;DC-1&quot;.  The default
 is &quot;low&quot; is <var class="var">w</var> is a scalar, &quot;pass&quot; if <var class="var">w</var> is a pair, or &quot;DC-0&quot; if
<var class="var">w</var> is a vector with more than 2 elements.
</p>
<p>An optional shaping <var class="var">window</var> can be given as a vector with length
<var class="var">n</var>+1.  If not specified, a Hamming window of length <var class="var">n</var>+1 is used.
</p>
<p>With the option &quot;noscale&quot;, the filter coefficients are not normalized. The
 default is to normalize the filter such that the magnitude response of the
 center of the first passband is 1.
</p>
<p>To apply the filter, use the return vector <var class="var">b</var> with the <code class="code">filter</code>
 function, for example <code class="code">y = filter (b, 1, x)</code>.
</p>
<p>Examples:
</p><div class="example">
<pre class="example-preformatted"> freqz (fir1 (40, 0.3));
 freqz (fir1 (15, [0.2, 0.5], &quot;stop&quot;));  # note the zero-crossing at 0.1
 freqz (fir1 (15, [0.2, 0.5], &quot;stop&quot;, &quot;noscale&quot;));
</pre></div>
<p><strong class="strong">See also:</strong> filter, fir2.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="fir2">
<h4 class="subsection">3.8.3 fir2</h4>
<a class="index-entry-id" id="index-fir2"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-fir2-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fir2-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">m</var>, <var class="var">grid_n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fir2-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">m</var>, <var class="var">grid_n</var>, <var class="var">ramp_n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fir2-4"><span class="category-def">Function File: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">fir2</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">m</var>, <var class="var">grid_n</var>, <var class="var">ramp_n</var>, <var class="var">window</var>)</code></dt>
<dd>
<p>Produce an order <var class="var">n</var> FIR filter with arbitrary frequency response
<var class="var">m</var> over frequency bands <var class="var">f</var>, returning the <var class="var">n</var>+1 filter
 coefficients in <var class="var">b</var>.  The vector <var class="var">f</var> specifies the frequency band
 edges of the filter response and <var class="var">m</var> specifies the magnitude response
 at each frequency.
</p>
<p>The vector <var class="var">f</var> must be nondecreasing over the range [0,1], and the
 first and last elements must be 0 and 1, respectively.  A discontinuous
 jump in the frequency response can be specified by duplicating a band edge
 in <var class="var">f</var> with different values in <var class="var">m</var>.
</p>
<p>The resolution over which the frequency response is evaluated can be
 controlled with the <var class="var">grid_n</var> argument.  The default is 512 or the
 next larger power of 2 greater than the filter length.
</p>
<p>The band transition width for discontinuities can be controlled with the
<var class="var">ramp_n</var> argument.  The default is <var class="var">grid_n</var>/25.  Larger values
 will result in wider band transitions but better stopband rejection.
</p>
<p>An optional shaping <var class="var">window</var> can be given as a vector with length
<var class="var">n</var>+1.  If not specified, a Hamming window of length <var class="var">n</var>+1 is used.
</p>
<p>To apply the filter, use the return vector <var class="var">b</var> with the <code class="code">filter</code>
 function, for example <code class="code">y = filter (b, 1, x)</code>.
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted"> f = [0, 0.3, 0.3, 0.6, 0.6, 1]; m = [0, 0, 1, 1/2, 0, 0];
 [h, w] = freqz (fir2 (100, f, m));
 plot (f, m, &quot;;target response;&quot;, w/pi, abs (h), &quot;;filter response;&quot;);
</pre></div>
<p><strong class="strong">See also:</strong> filter, fir1.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="firls">
<h4 class="subsection">3.8.4 firls</h4>
<a class="index-entry-id" id="index-firls"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-firls-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firls</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-firls-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">firls</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>, <var class="var">w</var>)</code></dt>
<dd>
<p>FIR filter design using least squares method. Returns a length <var class="var">n</var>+1
 linear phase filter such that the integral of the weighted mean
 squared error in the specified bands is minimized.
</p>
<p>The vector <var class="var">f</var> specifies the frequencies of the band edges, normalized
 so that half the sample frequency is equal to 1.  Each band is specified by
 two frequencies, to the vector must have an even length.
</p>
<p>The vector <var class="var">a</var> specifies the amplitude of the desired response at each
 band edge.
</p>
<p>The optional argument <var class="var">w</var> is a weighting function that contains one
 value for each band that weights the mean squared error in that band.
</p>
<p><var class="var">a</var> must be the same length as <var class="var">f</var>, and <var class="var">w</var> must be half the
 length of <var class="var">f</var>.  <var class="var">n</var> must be even.  If given an odd value,
<code class="code">firls</code> increments it by 1.
</p>
<p>The least squares optimization algorithm for computing FIR filter
 coefficients is derived in detail in:
</p>
<p>I. Selesnick, &quot;Linear-Phase FIR Filter Design by Least Squares,&quot;
 http://cnx.org/content/m10577
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="kaiserord">
<h4 class="subsection">3.8.5 kaiserord</h4>
<a class="index-entry-id" id="index-kaiserord"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-kaiserord-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">n</var>, <var class="var">Wn</var>, <var class="var">beta</var>, <var class="var">ftype</var>] =</code> <strong class="def-name">kaiserord</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">m</var>, <var class="var">dev</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-kaiserord-2"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">kaiserord</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">m</var>, <var class="var">dev</var>, <var class="var">fs</var>)</code></dt>
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
<div class="group"><pre class="example-preformatted">           / 0.1102(A-8.7)                        A &gt; 50
    beta = | 0.5842(A-21)^0.4 + 0.07886(A-21)     21 &lt;= A &lt;= 50
           \ 0.0                                  A &lt; 21
    n = (A-8)/(2.285 dw)
</pre></div></div>
<p>Example:
</p><div class="example">
<div class="group"><pre class="example-preformatted"> [n, w, beta, ftype] = kaiserord ([1000, 1200], [1, 0], [0.05, 0.05], 11025);
 b = fir1 (n, w, kaiser (n+1, beta), ftype, &quot;noscale&quot;);
 freqz (b, 1, [], 11025);
</pre></div></div>
<p><strong class="strong">See also:</strong> fir1, kaiser.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="qp_005fkaiser">
<h4 class="subsection">3.8.6 qp_kaiser</h4>
<a class="index-entry-id" id="index-qp_005fkaiser"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-qp_005fkaiser-1"><span class="category-def">Function File: </span><strong class="def-name">qp_kaiser</strong> <code class="def-code-arguments">(<var class="var">nb</var>, <var class="var">at</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-qp_005fkaiser-2"><span class="category-def">Function File: </span><strong class="def-name">qp_kaiser</strong> <code class="def-code-arguments">(<var class="var">nb</var>, <var class="var">at</var>, <var class="var">linear</var>)</code></dt>
<dd>
<p>Computes a finite impulse response (FIR) filter for use with a
 quasi-perfect reconstruction polyphase-network filter bank. This
 version utilizes a Kaiser window to shape the frequency response of
 the designed filter. Tha number nb of bands and the desired
 attenuation at in the stop-band are given as parameters.
</p>
<p>The Kaiser window is multiplied by the ideal impulse response
 h(n)=a.sinc(a.n) and converted to its minimum-phase version by means
 of a Hilbert transform.
</p>
<p>By using a third non-null argument, the minimum-phase calculation is
 omitted at all.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="remez">
<h4 class="subsection">3.8.7 remez</h4>
<a class="index-entry-id" id="index-remez"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-remez-1"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">remez</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-remez-2"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">remez</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>, <var class="var">w</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-remez-3"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">remez</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>, <var class="var">w</var>, <var class="var">ftype</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-remez-4"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">b</var> =</code> <strong class="def-name">remez</strong> <code class="def-code-arguments">(<var class="var">n</var>, <var class="var">f</var>, <var class="var">a</var>, <var class="var">w</var>, <var class="var">ftype</var>, <var class="var">griddensity</var>)</code></dt>
<dd><p>Parks-McClellan optimal FIR filter design.
</p><dl class="table">
<dt><var class="var">n</var></dt>
<dd><p>gives the filter order, where the generated filter length taps is n+1
</p></dd>
<dt><var class="var">f</var></dt>
<dd><p>gives frequency at the band edges [b1 e1 b2 e2 b3 e3 &hellip;]
</p></dd>
<dt><var class="var">a</var></dt>
<dd><p>gives amplitude at the band edges [a(b1) a(e1) a(b2) a(e2) &hellip;]
</p></dd>
<dt><var class="var">w</var></dt>
<dd><p>gives weighting applied to each band
</p></dd>
<dt><var class="var">ftype</var></dt>
<dd><p>is &quot;bandpass&quot;, &quot;hilbert&quot; or &quot;differentiator&quot;
</p></dd>
<dt><var class="var">griddensity</var></dt>
<dd><p>determines how accurately the filter will be
constructed. The minimum value is 16, but higher numbers are
slower to compute.
</p></dd>
</dl>
<p>Frequency is in the range (0, 1), with 1 being the Nyquist frequency.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="sgolay">
<h4 class="subsection">3.8.8 sgolay</h4>
<a class="index-entry-id" id="index-sgolay"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sgolay-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">sgolay</strong> <code class="def-code-arguments">(<var class="var">p</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolay-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">sgolay</strong> <code class="def-code-arguments">(<var class="var">p</var>, <var class="var">n</var>, <var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sgolay-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">f</var> =</code> <strong class="def-name">sgolay</strong> <code class="def-code-arguments">(<var class="var">p</var>, <var class="var">n</var>, <var class="var">m</var>, <var class="var">ts</var>)</code></dt>
<dd><p>Computes the filter coefficients for all Savitzsky-Golay smoothing
 filters of order p for length n (odd). m can be used in order to
 get directly the mth derivative. In this case, ts is a scaling factor.
</p>
<p>The early rows of F smooth based on future values and later rows
 smooth based on past values, with the middle row using half future
 and half past.  In particular, you can use row i to estimate x(k)
 based on the i-1 preceding values and the n-i following values of x
 values as y(k) = F(i,:) * x(k-i+1:k+n-i).
</p>
<p>Normally, you would apply the first (n-1)/2 rows to the first k
 points of the vector, the last k rows to the last k points of the
 vector and middle row to the remainder, but for example if you were
 running on a realtime system where you wanted to smooth based on the
 all the data collected up to the current time, with a lag of five
 samples, you could apply just the filter on row n-5 to your window
 of length n each time you added a new sample.
</p>
<p>Reference: Numerical recipes in C. p 650
</p>
<p><strong class="strong">See also:</strong> sgolayfilt.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Transforms">
<h3 class="section" id="Transforms-1">3.9 Transforms</h3>
<a class="index-entry-id" id="index-Transforms"></a>
<div class="subsection-level-extent" id="bitrevorder">
<h4 class="subsection">3.9.1 bitrevorder</h4>
<a class="index-entry-id" id="index-bitrevorder"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-bitrevorder-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">bitrevorder</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-bitrevorder-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">y</var> <var class="var">i</var>] =</code> <strong class="def-name">bitrevorder</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dd><p>Reorder the elements of the vector <var class="var">x</var> in bit-reversed order.
 Equivalent to calling <code class="code">digitrevorder (<var class="var">x</var>, 2)</code>.
</p>
<p><strong class="strong">See also:</strong> digitrevorder, fft, ifft.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="cceps">
<h4 class="subsection">3.9.2 cceps</h4>
<a class="index-entry-id" id="index-cceps"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cceps-1"><span class="category-def">Function File: </span><strong class="def-name">cceps</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cceps-2"><span class="category-def">Function File: </span><strong class="def-name">cceps</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">correct</var>)</code></dt>
<dd><p>Return the complex cepstrum of the vector <var class="var">x</var>.
 If the optional argument <var class="var">correct</var> has the value 1, a correction
 method is applied.  The default is not to do this.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="cplxreal">
<h4 class="subsection">3.9.3 cplxreal</h4>
<a class="index-entry-id" id="index-cplxreal"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cplxreal-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">zc</var>, <var class="var">zr</var>] =</code> <strong class="def-name">cplxreal</strong> <code class="def-code-arguments">(<var class="var">z</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cplxreal-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">zc</var>, <var class="var">zr</var>] =</code> <strong class="def-name">cplxreal</strong> <code class="def-code-arguments">(<var class="var">z</var>, <var class="var">tol</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cplxreal-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">zc</var>, <var class="var">zr</var>] =</code> <strong class="def-name">cplxreal</strong> <code class="def-code-arguments">(<var class="var">z</var>, <var class="var">tol</var>, <var class="var">dim</var>)</code></dt>
<dd><p>Sort the numbers <var class="var">z</var> into complex-conjugate-valued and real-valued
 elements.  The positive imaginary complex numbers of each complex conjugate
 pair are returned in <var class="var">zc</var> and the real numbers are returned in <var class="var">zr</var>.
</p>
<p><var class="var">tol</var> is a weighting factor in the range [0, 1) which determines the
 tolerance of the matching.  The default value is <code class="code">100 * eps</code> and the
 resulting tolerance for a given complex pair is
<code class="code"><var class="var">tol</var> * abs (<var class="var">z</var>(i)))</code>.
</p>
<p>By default the complex pairs are sorted along the first non-singleton
 dimension of <var class="var">z</var>.  If <var class="var">dim</var> is specified, then the complex pairs are
 sorted along this dimension.
</p>
<p>Signal an error if some complex numbers could not be paired.  Signal an
 error if all complex numbers are not exact conjugates (to within <var class="var">tol</var>).
 Note that there is no defined order for pairs with identical real parts but
 differing imaginary parts.
</p>
<p><strong class="strong">See also:</strong> cplxpair.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="czt">
<h4 class="subsection">3.9.4 czt</h4>
<a class="index-entry-id" id="index-czt"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-czt-1"><span class="category-def">Function File: </span><strong class="def-name">czt</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-czt-2"><span class="category-def">Function File: </span><strong class="def-name">czt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-czt-3"><span class="category-def">Function File: </span><strong class="def-name">czt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">m</var>, <var class="var">w</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-czt-4"><span class="category-def">Function File: </span><strong class="def-name">czt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">m</var>, <var class="var">w</var>, <var class="var">a</var>)</code></dt>
<dd><p>Chirp z-transform.  Compute the frequency response starting at a and
 stepping by w for m steps.  a is a point in the complex plane, and
 w is the ratio between points in each step (i.e., radius increases
 exponentially, and angle increases linearly).
</p>
<p>To evaluate the frequency response for the range f1 to f2 in a signal
 with sampling frequency Fs, use the following:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted"> m = 32;                               ## number of points desired
 w = exp(-j*2*pi*(f2-f1)/((m-1)*Fs));  ## freq. step of f2-f1/m
 a = exp(j*2*pi*f1/Fs);                ## starting at frequency f1
 y = czt(x, m, w, a);
</pre></div></div>
<p>If you don&rsquo;t specify them, then the parameters default to a Fourier
 transform:
     m=length(x), w=exp(-j*2*pi/m), a=1
</p>
<p>If x is a matrix, the transform will be performed column-by-column.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="dct">
<h4 class="subsection">3.9.5 dct</h4>
<a class="index-entry-id" id="index-dct"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-dct-1"><span class="category-def">Function File: </span><strong class="def-name">dct</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-dct-2"><span class="category-def">Function File: </span><strong class="def-name">dct</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code></dt>
<dd><p>Compute the discrete cosine transform of <var class="var">x</var>.  If <var class="var">n</var> is given,
 then <var class="var">x</var> is padded or trimmed to length <var class="var">n</var> before computing the
 transform.  If <var class="var">x</var> is a matrix, compute the transform along the columns
 of the the matrix.  The transform is faster if <var class="var">x</var> is real-valued and
 has even length.
</p>
<p>The discrete cosine transform <var class="var">x</var> can be defined as follows:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">               N-1
   X[k] = w(k) sum x[n] cos (pi (2n+1) k / 2N ),  k = 0, ..., N-1
               n=0
</pre></div></div>
<p>with w(0) = sqrt(1/N) and w(k) = sqrt(2/N), k = 1, ..., N-1.  There
 are other definitions with different scaling of X[k], but this form
 is common in image processing.
</p>
<p><strong class="strong">See also:</strong> idct, dct2, idct2, dctmtx.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="dct2">
<h4 class="subsection">3.9.6 dct2</h4>
<a class="index-entry-id" id="index-dct2"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-dct2-1"><span class="category-def">Function File: </span><strong class="def-name">dct2</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-dct2-2"><span class="category-def">Function File: </span><strong class="def-name">dct2</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">m</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-dct2-3"><span class="category-def">Function File: </span><strong class="def-name">dct2</strong> <code class="def-code-arguments">(<var class="var">x</var>, [<var class="var">m</var>, <var class="var">n</var>])</code></dt>
<dd><p>Compute the 2-D discrete cosine transform of matrix <var class="var">x</var>.  If
<var class="var">m</var> and <var class="var">n</var> are specified, the input is padded or trimmed
 to the desired size.
</p>
<p><strong class="strong">See also:</strong> dct, idct, idct2.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="dctmtx">
<h4 class="subsection">3.9.7 dctmtx</h4>
<a class="index-entry-id" id="index-dctmtx"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-dctmtx-1"><span class="category-def">Function File: </span><strong class="def-name">dctmtx</strong> <code class="def-code-arguments">(<var class="var">n</var>)</code></dt>
<dd><p>Return the DCT transformation matrix of size <var class="var">n</var>-by-<var class="var">n</var>.
</p>
<p>If A is an <var class="var">n</var>-by-<var class="var">n</var> matrix, then the following are true:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">     T*A    == dct(A),  T'*A   == idct(A)
     T*A*T' == dct2(A), T'*A*T == idct2(A)
</pre></div></div>
<p>A DCT transformation matrix is useful for doing things like jpeg
 image compression, in which an 8x8 DCT matrix is applied to
 non-overlapping blocks throughout an image and only a subblock on the
 top left of each block is kept.  During restoration, the remainder of
 the block is filled with zeros and the inverse transform is applied
 to the block.
</p>
<p><strong class="strong">See also:</strong> dct, idct, dct2, idct2.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="dftmtx">
<h4 class="subsection">3.9.8 dftmtx</h4>
<a class="index-entry-id" id="index-dftmtx"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-dftmtx-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">d</var> =</code> <strong class="def-name">dftmtx</strong> <code class="def-code-arguments">(<var class="var">n</var>)</code></dt>
<dd><p>Compute the <var class="var">n</var>-by-<var class="var">n</var> Fourier transformation matrix.  This is
 the matrix <var class="var">d</var> such that the Fourier transform of a column vector of
 length <var class="var">n</var> is given by <code class="code">dftmtx(<var class="var">n</var>) * <var class="var">x</var></code> and the
 inverse Fourier transform is given by <code class="code">inv(dftmtx(<var class="var">n</var>)) * <var class="var">x</var></code>.
</p>
<p>In general this is less efficient than calling the <code class="code">fft</code> and
<code class="code">ifft</code> functions directly.
</p>
<p><strong class="strong">See also:</strong> fft, ifft.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="digitrevorder">
<h4 class="subsection">3.9.9 digitrevorder</h4>
<a class="index-entry-id" id="index-digitrevorder"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-digitrevorder-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">digitrevorder</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">r</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-digitrevorder-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">y</var>, <var class="var">i</var>] =</code> <strong class="def-name">digitrevorder</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">r</var>)</code></dt>
<dd><p>Reorder the elements of the vector <var class="var">x</var> in digit-reversed order.
 The elements of <var class="var">x</var> are converted to radix <var class="var">r</var> and reversed.
 The reordered indices of the elements of <var class="var">x</var> are returned in <var class="var">i</var>.
</p>
<p><strong class="strong">See also:</strong> bitrevorder, fft, ifft.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="dst">
<h4 class="subsection">3.9.10 dst</h4>
<a class="index-entry-id" id="index-dst"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-dst-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">dst</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-dst-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">dst</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code></dt>
<dd><p>Computes the type I discrete sine transform of <var class="var">x</var>.  If <var class="var">n</var> is given,
 then <var class="var">x</var> is padded or trimmed to length <var class="var">n</var> before computing the transform.
 If <var class="var">x</var> is a matrix, compute the transform along the columns of the
 the matrix.
</p>
<p>The discrete sine transform X of x can be defined as follows:
</p>
<pre class="verbatim">        N
 X[k] = sum x[n] sin (pi n k / (N+1) ),  k = 1, ..., N
        n=1
</pre>
<p><strong class="strong">See also:</strong> idst.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="dwt">
<h4 class="subsection">3.9.11 dwt</h4>
<a class="index-entry-id" id="index-dwt"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-dwt-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">u</var>, <var class="var">v</var>] =</code> <strong class="def-name">dwt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">wname</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-dwt-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">u</var>, <var class="var">v</var>] =</code> <strong class="def-name">dwt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">Hp</var>, <var class="var">Gp</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-dwt-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">u</var>, <var class="var">v</var>] =</code> <strong class="def-name">dwt</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">Hp</var>, <var class="var">Gp</var>, &hellip;)</code></dt>
<dd><p>Discrete wavelet transform (1D).
</p>
<p><strong class="strong">Inputs</strong>
</p><dl class="table">
<dt><var class="var">x</var></dt>
<dd><p>Signal vector.
</p></dd>
<dt><var class="var">wname</var></dt>
<dd><p>Wavelet name.
</p></dd>
<dt><var class="var">Hp</var></dt>
<dd><p>Coefficients of low-pass decomposition <abbr class="acronym">FIR</abbr> filter.
</p></dd>
<dt><var class="var">Gp</var></dt>
<dd><p>Coefficients of high-pass decomposition <abbr class="acronym">FIR</abbr> filter.
</p></dd>
</dl>
<p><strong class="strong">Outputs</strong>
</p><dl class="table">
<dt><var class="var">u</var></dt>
<dd><p>Signal vector of average, approximation.
</p></dd>
<dt><var class="var">v</var></dt>
<dd><p>Signal vector of difference, detail.
</p></dd>
</dl>
</dd></dl>
</div>
<div class="subsection-level-extent" id="fht">
<h4 class="subsection">3.9.12 fht</h4>
<a class="index-entry-id" id="index-fht"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-fht-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">m</var> =</code> <strong class="def-name">fht</strong> <code class="def-code-arguments">(<var class="var">d</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fht-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">m</var> =</code> <strong class="def-name">fht</strong> <code class="def-code-arguments">(<var class="var">d</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fht-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">m</var> =</code> <strong class="def-name">fht</strong> <code class="def-code-arguments">(<var class="var">d</var>, <var class="var">n</var>, <var class="var">dim</var>)</code></dt>
<dd><p>Calculate the Fast Hartley Transform of real input <var class="var">d</var>.  If <var class="var">d</var> is
 a matrix, the Hartley transform is calculated along the columns by default.
 The options <var class="var">n</var> and <var class="var">dim</var> are similar to the options of FFT
 function.
</p>
<p>The forward and inverse Hartley transforms are the same (except for a
 scale factor of 1/N for the inverse Hartley transform), but
 implemented using different functions.
</p>
<p>The definition of the forward hartley transform for vector d,
<em class="math"> m[K] = \sum_{i=0}^{N-1} d[i]*(cos[K*2*pi*i/N] + sin[K*2*pi*i/N]), for  0 &lt;= K &lt; N.
 m[K] = \sum_{i=0}^{N-1} d[i]*CAS[K*i], for  0 &lt;= K &lt; N. </em>
</p>
<div class="example">
<pre class="example-preformatted"> fht(1:4)
</pre></div>
<p><strong class="strong">See also:</strong> ifht, fft.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="fwht">
<h4 class="subsection">3.9.13 fwht</h4>
<a class="index-entry-id" id="index-fwht"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-fwht-1"><span class="category-def">Function File: </span><strong class="def-name">fwht</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fwht-2"><span class="category-def">Function File: </span><strong class="def-name">fwht</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fwht-3"><span class="category-def">Function File: </span><strong class="def-name">fwht</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">order</var>)</code></dt>
<dd><p>Compute the Walsh-Hadamard transform of <var class="var">x</var> using the Fast
 Walsh-Hadamard Transform (FWHT) algorithm.  If the input is a matrix,
 the FWHT is calculated along the columns of <var class="var">x</var>.
</p>
<p>The number of elements of <var class="var">x</var> must be a power of 2; if not, the
 input will be extended and filled with zeros.  If a second argument
 is given, the input is truncated or extended to have length <var class="var">n</var>.
</p>
<p>The third argument specifies the <var class="var">order</var> in which the returned
 Walsh-Hadamard transform coefficients should be arranged.  The
<var class="var">order</var> may be any of the following strings:
</p>
<dl class="table">
<dt>&quot;sequency&quot;</dt>
<dd><p>The coefficients are returned in sequency order.  This is the default
 if <var class="var">order</var> is not given.
</p>
</dd>
<dt>&quot;hadamard&quot;</dt>
<dd><p>The coefficients are returned in Hadamard order.
</p>
</dd>
<dt>&quot;dyadic&quot;</dt>
<dd><p>The coefficients are returned in Gray code order.
</p></dd>
</dl>
<p><strong class="strong">See also:</strong> ifwht.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="hilbert">
<h4 class="subsection">3.9.14 hilbert</h4>
<a class="index-entry-id" id="index-hilbert"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-hilbert-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">h</var> =</code> <strong class="def-name">hilbert</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">N</var>, <var class="var">dim</var>)</code></dt>
<dd><p>Analytic extension of real valued signal.
</p>
<p><code class="code"><var class="var">h</var> = hilbert (<var class="var">f</var>)</code> computes the extension of the real
 valued signal <var class="var">f</var> to an analytic signal. If <var class="var">f</var> is a matrix,
 the transformation is applied to each column. For N-D arrays,
 the transformation is applied to the first non-singleton dimension.
</p>
<p><code class="code">real (<var class="var">h</var>)</code> contains the original signal <var class="var">f</var>.
<code class="code">imag (<var class="var">h</var>)</code> contains the Hilbert transform of <var class="var">f</var>.
</p>
<p><code class="code">hilbert (<var class="var">f</var>, <var class="var">N</var>)</code> does the same using a length <var class="var">N</var>
 Hilbert transform. The result will also have length <var class="var">N</var>.
</p>
<p><code class="code">hilbert (<var class="var">f</var>, [], <var class="var">dim</var>)</code> or
<code class="code">hilbert (<var class="var">f</var>, <var class="var">N</var>, <var class="var">dim</var>)</code> does the same along
 dimension <var class="var">dim</var>.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="idct">
<h4 class="subsection">3.9.15 idct</h4>
<a class="index-entry-id" id="index-idct"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-idct-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">idct</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-idct-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">idct</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code></dt>
<dd><p>Compute the inverse discrete cosine transform of <var class="var">x</var>.  If <var class="var">n</var> is
 given, then <var class="var">x</var> is padded or trimmed to length <var class="var">n</var> before computing
 the transform.  If <var class="var">x</var> is a matrix, compute the transform along the
 columns of the the matrix.  The transform is faster if <var class="var">x</var> is
 real-valued and even length.
</p>
<p>The inverse discrete cosine transform <var class="var">x</var> can be defined as follows:
</p>
<div class="example">
<pre class="example-preformatted">          N-1
   x[n] = sum w(k) X[k] cos (pi (2n+1) k / 2N ),  n = 0, ..., N-1
          k=0
</pre></div>
<p>with w(0) = sqrt(1/N) and w(k) = sqrt(2/N), k = 1, ..., N-1
</p>
<p><strong class="strong">See also:</strong> dct, dct2, idct2, dctmtx.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="idct2">
<h4 class="subsection">3.9.16 idct2</h4>
<a class="index-entry-id" id="index-idct2"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-idct2-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">idct2</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-idct2-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">idct2</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">m</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-idct2-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">idct2</strong> <code class="def-code-arguments">(<var class="var">x</var>, [<var class="var">m</var>, <var class="var">n</var>])</code></dt>
<dd><p>Compute the inverse 2-D discrete cosine transform of matrix <var class="var">x</var>.
 If <var class="var">m</var> and <var class="var">n</var> are specified, the input is either padded or truncated
 to have <var class="var">m</var> rows and <var class="var">n</var> columns.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="idst">
<h4 class="subsection">3.9.17 idst</h4>
<a class="index-entry-id" id="index-idst"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-idst-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">idst</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-idst-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">idst</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code></dt>
<dd><p>Computes the inverse type I discrete sine transform of <var class="var">y</var>.  If <var class="var">n</var> is
 given, then <var class="var">y</var> is padded or trimmed to length <var class="var">n</var> before computing
 the transform.  If <var class="var">y</var> is a matrix, compute the transform along the
 columns of the the matrix.
</p>
<p><strong class="strong">See also:</strong> dst.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="ifht">
<h4 class="subsection">3.9.18 ifht</h4>
<a class="index-entry-id" id="index-ifht"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-ifht-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">m</var> =</code> <strong class="def-name">ifht</strong> <code class="def-code-arguments">(<var class="var">d</var>, <var class="var">n</var>, <var class="var">dim</var>)</code></dt>
<dd><p>Calculate the inverse Fast Hartley Transform of real input <var class="var">d</var>.  If
<var class="var">d</var> is a matrix, the inverse Hartley transform is calculated along the
 columns by default.  The options <var class="var">n</var> and <var class="var">dim</var> are similar to the
 options of FFT function.
</p>
<p>The forward and inverse Hartley transforms are the same (except for a
 scale factor of 1/N for the inverse hartley transform), but
 implemented using different functions.
</p>
<p>The definition of the forward hartley transform for vector d,
<em class="math"> m[K] = 1/N \sum_{i=0}^{N-1} d[i]*(cos[K*2*pi*i/N] + sin[K*2*pi*i/N]), for  0 &lt;= K &lt; N.
 m[K] = 1/N \sum_{i=0}^{N-1} d[i]*CAS[K*i], for  0 &lt;= K &lt; N. </em>
</p>
<div class="example">
<pre class="example-preformatted"> ifht(1:4)
</pre></div>
<p><strong class="strong">See also:</strong> fht, fft.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="ifwht">
<h4 class="subsection">3.9.19 ifwht</h4>
<a class="index-entry-id" id="index-ifwht"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-ifwht-1"><span class="category-def">Function File: </span><strong class="def-name">ifwht</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ifwht-2"><span class="category-def">Function File: </span><strong class="def-name">ifwht</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ifwht-3"><span class="category-def">Function File: </span><strong class="def-name">ifwht</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">order</var>)</code></dt>
<dd><p>Compute the inverse Walsh-Hadamard transform of <var class="var">x</var> using the
 Fast Walsh-Hadamard Transform (FWHT) algorithm.  If the input is a
 matrix, the inverse FWHT is calculated along the columns of <var class="var">x</var>.
</p>
<p>The number of elements of <var class="var">x</var> must be a power of 2; if not, the
 input will be extended and filled with zeros.  If a second argument
 is given, the input is truncated or extended to have length <var class="var">n</var>.
</p>
<p>The third argument specifies the <var class="var">order</var> in which the returned
 inverse Walsh-Hadamard transform coefficients should be arranged.
 The <var class="var">order</var> may be any of the following strings:
</p>
<dl class="table">
<dt>&quot;sequency&quot;</dt>
<dd><p>The coefficients are returned in sequency order.  This is the default
 if <var class="var">order</var> is not given.
</p>
</dd>
<dt>&quot;hadamard&quot;</dt>
<dd><p>The coefficients are returned in Hadamard order.
</p>
</dd>
<dt>&quot;dyadic&quot;</dt>
<dd><p>The coefficients are returned in Gray code order.
</p></dd>
</dl>
<p><strong class="strong">See also:</strong> fwht.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="rceps">
<h4 class="subsection">3.9.20 rceps</h4>
<a class="index-entry-id" id="index-rceps"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-rceps-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">y</var>, <var class="var">ym</var>] =</code> <strong class="def-name">rceps</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dd><p>Return the cepstrum of the signal <var class="var">x</var>.
</p>
<p>If <var class="var">x</var> is a matrix, return the cepstrum of each column.
</p>
<p>If called with two output arguments, the minimum phase reconstruction of
 the signal <var class="var">x</var> is returned in <var class="var">ym</var>.
</p>
<p>For example:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted"> f0 = 70; Fs = 10000;            # 100 Hz fundamental, 10kHz sampling rate
 a = poly (0.985 * exp (1i * pi * [0.1, -0.1, 0.3, -0.3])); # two formants
 s = 0.005 * randn (1024, 1);    # Noise excitation signal
 s(1:Fs/f0:length(s)) = 1;       # Impulse glottal wave
 x = filter (1, a, s);           # Speech signal
 [y, ym] = rceps (x .* hanning (1024));
</pre></div></div>
<p>Reference: <cite class="cite">Programs for Digital Signal Processing</cite>, IEEE Press,
 John Wiley &amp; Sons, New York, 1979.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Power-Spectrum-Analysis">
<h3 class="section" id="Power-Spectrum-Analysis-1">3.10 Power Spectrum Analysis</h3>
<a class="index-entry-id" id="index-Power-Spectrum-Analysis"></a>
<div class="subsection-level-extent" id="g_t_005f_005fpower">
<h4 class="subsection">3.10.1 __power</h4>
<a class="index-entry-id" id="index-_005f_005fpower"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-_005f_005fpower-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">P</var>, <var class="var">w</var>] =</code> <strong class="def-name">__power</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_005f_005fpower-2"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">__power</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">nfft</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_005f_005fpower-3"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">__power</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">nfft</var>, <var class="var">Fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_005f_005fpower-4"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">__power</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">nfft</var>, <var class="var">Fs</var>, <var class="var">range</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_005f_005fpower-5"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">__power</strong> <code class="def-code-arguments">(<var class="var">b</var>, <var class="var">a</var>, <var class="var">nfft</var>, <var class="var">Fs</var>, <var class="var">range</var>, <var class="var">units</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_005f_005fpower-6"><span class="category-def">Function File: </span><strong class="def-name">__power</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd>
<p>Plot the power spectrum of the given ARMA model.
</p>
<p>b, a: filter coefficients (b=numerator, a=denominator)
 nfft is number of points at which to sample the power spectrum
 Fs is the sampling frequency of x
 range is &rsquo;half&rsquo; (default) or &rsquo;whole&rsquo;
 units is  &rsquo;squared&rsquo; or &rsquo;db&rsquo; (default)
 range and units may be specified any time after the filter, in either
 order
</p>
<p>Returns P, the magnitude vector, and w, the frequencies at which it
 is sampled.  If there are no return values requested, then plot the power
 spectrum and don&rsquo;t return anything.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="ar_005fpsd">
<h4 class="subsection">3.10.2 ar_psd</h4>
<a class="index-entry-id" id="index-ar_005fpsd"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-ar_005fpsd-1"><span class="category-def">Function File: </span><strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">v</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ar_005fpsd-2"><span class="category-def">Function File: </span><strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">v</var>, <var class="var">freq</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ar_005fpsd-3"><span class="category-def">Function File: </span><strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">v</var>, <var class="var">freq</var>, <var class="var">Fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ar_005fpsd-4"><span class="category-def">Function File: </span><strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(&hellip;, <var class="var">range</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ar_005fpsd-5"><span class="category-def">Function File: </span><strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(&hellip;, <var class="var">method</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ar_005fpsd-6"><span class="category-def">Function File: </span><strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(&hellip;, <var class="var">plottype</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ar_005fpsd-7"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">psd</var>, <var class="var">f_out</var>] =</code> <strong class="def-name">ar_psd</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd>
<p>Calculate the power spectrum of the autoregressive model
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">                        M
 x(n) = sqrt(v).e(n) + SUM a(k).x(n-k)
                       k=1
</pre></div></div>
<p>where <em class="math">x(n)</em> is the output of the model and <em class="math">e(n)</em> is white noise.
 This function is intended for use with
<code class="code">[a, v, k] = arburg (x, poles, criterion)</code>
 which use the Burg (1968) method to calculate a &quot;maximum entropy&quot;
 autoregressive model of <var class="var">x</var>.
</p>
<p>If the <var class="var">freq</var> argument is a vector (of frequencies) the spectrum is
 calculated using the polynomial method and the <var class="var">method</var> argument is
 ignored.  For scalar <var class="var">freq</var>, an integer power of 2, or <var class="var">method</var> =
 &quot;FFT&quot;, causes the spectrum to be calculated by FFT.  Otherwise, the spectrum
 is calculated as a polynomial.  It may be computationally more
 efficient to use the FFT method if length of the model is not much
 smaller than the number of frequency values.  The spectrum is scaled so
 that spectral energy (area under spectrum) is the same as the time-domain
 energy (mean square of the signal).
</p>
<p>ARGUMENTS:
 All but the first two arguments are optional and may be empty.
</p><ul class="itemize mark-bullet">
<li><var class="var">a</var>
 list of M=(order+1) autoregressive model
 coefficients.  The first element of &quot;ar_coeffs&quot; is the
 zero-lag coefficient, which always has a value of 1.
</li><li><var class="var">v</var>
 square of the moving-average coefficient of the AR model.
</li><li><var class="var">freq</var>
 frequencies at which power spectral density is calculated, or a scalar
 indicating the number of uniformly distributed frequency
 values at which spectral density is calculated.
 (default = 256)
</li><li><var class="var">Fs</var>
 sampling frequency (Hertz) (default=1)
</li></ul>
<p>CONTROL-STRING ARGUMENTS &ndash; each of these arguments is a character string.
 Control-string arguments can be in any order after the other arguments.
</p>
<p>Range:
</p>
<p>&rsquo;half&rsquo;,  &rsquo;onesided&rsquo; : frequency range of the spectrum is
 from zero up to but not including sample_f/2.  Power
 from negative frequencies is added to the positive
 side of the spectrum.
 &rsquo;whole&rsquo;, &rsquo;twosided&rsquo; : frequency range of the spectrum is
 -sample_f/2 to sample_f/2, with negative frequencies
 stored in &quot;wrap around&quot; order after the positive
 frequencies; e.g. frequencies for a 10-point &rsquo;twosided&rsquo;
 spectrum are 0 0.1 0.2 0.3 0.4 0.5 -0.4 -0.3 -0.2 -0.1
 &rsquo;shift&rsquo;, &rsquo;centerdc&rsquo; : same as &rsquo;whole&rsquo; but with the first half
 of the spectrum swapped with second half to put the
 zero-frequency value in the middle. (See &quot;help
 fftshift&quot;. If &quot;freq&quot; is vector, &rsquo;shift&rsquo; is ignored.
 If model coefficients &quot;ar_coeffs&quot; are real, the default
 range is &rsquo;half&rsquo;, otherwise default range is &rsquo;whole&rsquo;.
</p>
<p>Method:
</p>
<p>&rsquo;fft&rsquo;:  use FFT to calculate power spectrum.
 &rsquo;poly&rsquo;: calculate power spectrum as a polynomial of 1/z
 N.B. this argument is ignored if the &quot;freq&quot; argument is a
 vector.  The default is &rsquo;poly&rsquo; unless the &quot;freq&quot;
 argument is an integer power of 2.
</p>
<p>Plot type:
</p>
<p>&rsquo;plot&rsquo;, &rsquo;semilogx&rsquo;, &rsquo;semilogy&rsquo;, &rsquo;loglog&rsquo;, &rsquo;squared&rsquo; or &rsquo;db&rsquo;:
 specifies the type of plot.  The default is &rsquo;plot&rsquo;, which
 means linear-linear axes. &rsquo;squared&rsquo; is the same as &rsquo;plot&rsquo;.
 &rsquo;dB&rsquo; plots &quot;10*log10(psd)&quot;.  This argument is ignored and a
 spectrum is not plotted if the caller requires a returned
 value.
</p>
<p>RETURNED VALUES:
 If returned values are not required by the caller, the spectrum
 is plotted and nothing is returned.
</p><ul class="itemize mark-bullet">
<li><var class="var">psd</var>
 estimate of power-spectral density
</li><li><var class="var">f_out</var>
 frequency values
</li></ul>
<p>REFERENCE
 [1] Equation 2.28 from Steven M. Kay and Stanley Lawrence Marple Jr.:
   &quot;Spectrum analysis &ndash; a modern perspective&quot;,
   Proceedings of the IEEE, Vol 69, pp 1380-1419, Nov., 1981
</p>
</dd></dl>
</div>
<div class="subsection-level-extent" id="cohere">
<h4 class="subsection">3.10.3 cohere</h4>
<a class="index-entry-id" id="index-cohere"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-_003d"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">Pxx</var>, <var class="var">freq</var>]</code> <strong class="def-name">=</strong> <code class="def-code-arguments">cohere(<var class="var">x</var>,<var class="var">y</var>,<var class="var">Nfft</var>,<var class="var">Fs</var>,<var class="var">window</var>,<var class="var">overlap</var>,<var class="var">range</var>,<var class="var">plot_type</var>,<var class="var">detrend</var>)</code></dt>
<dd><p>Estimate (mean square) coherence of signals &quot;x&quot; and &quot;y&quot;.
</p>
<p>Use the Welch (1967) periodogram/FFT method.
</p>
<p>Compatible with Matlab R11 cohere and earlier.
</p>
<p>See &quot;help pwelch&quot; for description of arguments, hints and references
 &mdash; especially hint (7) for Matlab R11 defaults.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="cpsd">
<h4 class="subsection">3.10.4 cpsd</h4>
<a class="index-entry-id" id="index-cpsd"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-cpsd-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">Pxx</var>, <var class="var">freq</var>] =</code> <strong class="def-name">cpsd</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cpsd-2"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">cpsd</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cpsd-3"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">cpsd</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cpsd-4"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">cpsd</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cpsd-5"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">cpsd</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>, <var class="var">Fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cpsd-6"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">cpsd</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>, <var class="var">Fs</var>, <var class="var">range</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-cpsd-7"><span class="category-def">Function File: </span><strong class="def-name">cpsd</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd>
<p>Estimate cross power spectrum of data <var class="var">x</var> and <var class="var">y</var> by the Welch (1967)
 periodogram/FFT method.
</p>
<p><strong class="strong">See also:</strong> pwelch.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="csd">
<h4 class="subsection">3.10.5 csd</h4>
<a class="index-entry-id" id="index-csd"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-_003d-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">Pxx</var>,<var class="var">freq</var>]</code> <strong class="def-name">=</strong> <code class="def-code-arguments">csd(<var class="var">x</var>, <var class="var">y</var>, <var class="var">Nfft</var>, <var class="var">Fs</var>, <var class="var">window</var>, <var class="var">overlap</var>, <var class="var">range</var>, <var class="var">plot_type</var>, <var class="var">detrend</var>)</code></dt>
<dd><p>Estimate cross power spectrum of data &quot;x&quot; and &quot;y&quot; by the Welch (1967)
 periodogram/FFT method.
</p>
<p>Compatible with Matlab R11 csd and earlier.
</p>
<p>See &quot;help pwelch&quot; for description of arguments, hints and references
 &mdash; especially hint (7) for Matlab R11 defaults.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="db2pow">
<h4 class="subsection">3.10.6 db2pow</h4>
<a class="index-entry-id" id="index-db2pow"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-db2pow-1"><span class="category-def">Function File: </span><strong class="def-name">db2pow</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dd><p>Convert decibels (dB) to power.
</p>
<p>The power of <var class="var">x</var> is defined as
<var class="var">p</var> = <code class="code">10 ^ (x/10)</code>.
</p>
<p>If <var class="var">x</var> is a vector, matrix, or N-dimensional array, the power is
 computed over the elements of <var class="var">x</var>.
</p>
<p>Example:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted"> db2pow ([-10, 0, 10])
&rArr; 0.1000 1.0000 10.0000
</pre></div></div>
<p><strong class="strong">See also:</strong> pow2db.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="mscohere">
<h4 class="subsection">3.10.7 mscohere</h4>
<a class="index-entry-id" id="index-mscohere"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-mscohere-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">Pxx</var>, <var class="var">freq</var>] =</code> <strong class="def-name">mscohere</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mscohere-2"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">mscohere</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mscohere-3"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">mscohere</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mscohere-4"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">mscohere</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mscohere-5"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">mscohere</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>, <var class="var">Fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mscohere-6"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">mscohere</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>, <var class="var">Fs</var>, <var class="var">range</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mscohere-7"><span class="category-def">Function File: </span><strong class="def-name">mscohere</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd>
<p>Estimate (mean square) coherence of signals <var class="var">x</var> and <var class="var">y</var>.
 Use the Welch (1967) periodogram/FFT method.
</p>
<p><strong class="strong">See also:</strong> pwelch.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="pburg">
<h4 class="subsection">3.10.8 pburg</h4>
<a class="index-entry-id" id="index-pburg"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-pburg_0028x_002c"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">psd</var>,<var class="var">f_out</var>] =</code> <strong class="def-name">pburg(<var class="var">x</var>,</strong> <code class="def-code-arguments"><var class="var">poles</var>, <var class="var">freq</var>, <var class="var">Fs</var>, <var class="var">range</var>, <var class="var">method</var>, <var class="var">plot_type</var>, <var class="var">criterion</var>)</code></dt>
<dd><p>Calculate Burg maximum-entropy power spectral density.
</p>
<p>The functions &quot;arburg&quot; and &quot;ar_psd&quot; do all the work.
 See &quot;help arburg&quot; and &quot;help ar_psd&quot; for further details.
</p>
<p>ARGUMENTS:
</p>
<p>All but the first two arguments are optional and may be empty.
</p>
<dl class="table">
<dt>x</dt>
<dd><p>[vector] sampled data
   </p></dd>
<dt>poles</dt>
<dd><p>[integer scalar] required number of poles of the AR model
   </p></dd>
<dt>freq</dt>
<dd><p>[real vector] frequencies at which power spectral density is calculated.
</p>
<p>[integer scalar] number of uniformly distributed frequency
      values at which spectral density is calculated.
      [default=256]
   </p></dd>
<dt>Fs</dt>
<dd><p>[real scalar] sampling frequency (Hertz) [default=1]
</p></dd>
</dl>
<p>CONTROL-STRING ARGUMENTS &ndash; each of these arguments is a character string.
</p>
<p>Control-string arguments can be in any order after the other arguments.
</p>
<dl class="table">
<dt>range</dt>
<dd><p>&rsquo;half&rsquo;,  &rsquo;onesided&rsquo; : frequency range of the spectrum is
           from zero up to but not including sample_f/2.  Power
           from negative frequencies is added to the positive
           side of the spectrum.
</p>
<p>&rsquo;whole&rsquo;, &rsquo;twosided&rsquo; : frequency range of the spectrum is
           -sample_f/2 to sample_f/2, with negative frequencies
           stored in &quot;wrap around&quot; order after the positive
           frequencies; e.g. frequencies for a 10-point &rsquo;twosided&rsquo;
           spectrum are 0 0.1 0.2 0.3 0.4 0.5 -0.4 -0.3 -0.2 -0.1
</p>
<p>&rsquo;shift&rsquo;, &rsquo;centerdc&rsquo; : same as &rsquo;whole&rsquo; but with the first half
           of the spectrum swapped with second half to put the
           zero-frequency value in the middle. (See &quot;help
           fftshift&quot;. If &quot;freq&quot; is vector, &rsquo;shift&rsquo; is ignored.
           If model coefficients &quot;ar_coeffs&quot; are real, the default
           range is &rsquo;half&rsquo;, otherwise default range is &rsquo;whole&rsquo;.
</p>
</dd>
<dt>method</dt>
<dd><p>&rsquo;fft&rsquo;:  use FFT to calculate power spectral density.
</p>
<p>&rsquo;poly&rsquo;: calculate spectral density as a polynomial of 1/z
           N.B. this argument is ignored if the &quot;freq&quot; argument is a
           vector.  The default is &rsquo;poly&rsquo; unless the &quot;freq&quot;
           argument is an integer power of 2.
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
<dt>criterion</dt>
<dd><p>[optional string arg]  model-selection criterion.  Limits
           the number of poles so that spurious poles are not
           added when the whitened data has no more information
           in it (see Kay &amp; Marple, 1981). Recognized values are
</p>
<p>&rsquo;AKICc&rsquo; &ndash; approximate corrected Kullback information
                     criterion (recommended),
</p>
<p>&rsquo;KIC&rsquo;  &ndash; Kullback information criterion
</p>
<p>&rsquo;AICc&rsquo; &ndash; corrected Akaike information criterion
</p>
<p>&rsquo;AIC&rsquo;  &ndash; Akaike information criterion
</p>
<p>&rsquo;FPE&rsquo;  &ndash; final prediction error&quot; criterion
</p>
<p>The default is to NOT use a model-selection criterion
</p></dd>
</dl>
<p>RETURNED VALUES:
</p>
<p>If return values are not required by the caller, the spectrum
     is plotted and nothing is returned.
</p>
<dl class="table">
<dt>psd</dt>
<dd><p>[real vector] power-spectral density estimate
   </p></dd>
<dt>f_out</dt>
<dd><p>[real vector] frequency values
</p></dd>
</dl>
<p>HINTS
</p>
<p>This function is a wrapper for arburg and ar_psd.
</p>
<p>See &quot;help arburg&quot;, &quot;help ar_psd&quot;.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="pow2db">
<h4 class="subsection">3.10.9 pow2db</h4>
<a class="index-entry-id" id="index-pow2db"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-pow2db-1"><span class="category-def">Function File: </span><strong class="def-name">pow2db</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dd><p>Convert power to decibels (dB).
</p>
<p>The decibel value of <var class="var">x</var> is defined as
<var class="var">d</var> = <code class="code">10 * log10 (x)</code>.
</p>
<p>If <var class="var">x</var> is a vector, matrix, or N-dimensional array, the decibel value
 is computed over the elements of <var class="var">x</var>.
</p>
<p>Examples:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted"> pow2db ([0, 10, 100])
&rArr; -Inf 10 20
</pre></div></div>
<p><strong class="strong">See also:</strong> db2pow.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="pwelch">
<h4 class="subsection">3.10.10 pwelch</h4>
<a class="index-entry-id" id="index-pwelch"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-pwelch_0028x_002c"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">spectra</var>,<var class="var">freq</var>] =</code> <strong class="def-name">pwelch(<var class="var">x</var>,</strong> <code class="def-code-arguments"><var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>, <var class="var">Fs</var>, <var class="var">range</var>, <var class="var">plot_type</var>, <var class="var">detrend</var>, <var class="var">sloppy</var>)</code></dt>
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
<p>&rsquo;shift&rsquo;, &rsquo;centered&rsquo;, &rsquo;centerdc&rsquo; (deprecated) : same as &rsquo;whole&rsquo; but with the first half
           of the spectrum swapped with second half to put the
           zero-frequency value in the middle. See &quot;help
           fftshift&quot;.
</p>
<p>If data (x and y) are real, the default range is &rsquo;half&rsquo;,
           otherwise default range is &rsquo;whole&rsquo;.
</p>
<p>&rsquo;centerdc&rsquo; : (deprecated) Use &rsquo;centered&rsquo; instead.
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
               Brian P. Flannery,
   &quot;Numerical recipes in C, The art of scientific computing&quot;, 2nd edition,
      Cambridge University Press, 2002 &mdash; Section 13.7.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="pyulear">
<h4 class="subsection">3.10.11 pyulear</h4>
<a class="index-entry-id" id="index-pyulear"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-pyulear_0028x_002cpoles_002cfreq_002cFs_002crange_002cmethod_002cplot_005ftype_0029"><span class="category-def">Function File: </span><code class="def-type">[psd,f_out] =</code> <strong class="def-name">pyulear(x,poles,freq,Fs,range,method,plot_type)</strong></dt>
<dd><p>Calculates a Yule-Walker autoregressive (all-pole) model of the data &quot;x&quot;
 and computes the power spectrum of the model.
</p>
<p>This is a wrapper for functions &quot;aryule&quot; and &quot;ar_psd&quot; which perform the
 argument checking.
</p>
<p>See &quot;help aryule&quot; and &quot;help ar_psd&quot; for further details.
</p>
<p>ARGUMENTS:
</p>
<p>All but the first two arguments are optional and may be empty.
</p><dl class="table">
<dt>x</dt>
<dd><p>[vector] sampled data
</p>
</dd>
<dt>poles</dt>
<dd><p>[integer scalar] required number of poles of the AR model
</p>
</dd>
<dt>freq</dt>
<dd><p>[real vector] frequencies at which power spectral density
           is calculated
</p>
<p>[integer scalar] number of uniformly distributed frequency
           values at which spectral density is calculated.
           [default=256]
</p>
</dd>
<dt>Fs</dt>
<dd><p>[real scalar] sampling frequency (Hertz) [default=1]
</p></dd>
</dl>
<p>CONTROL-STRING ARGUMENTS &ndash; each of these arguments is a character string.
</p>
<p>Control-string arguments can be in any order after the other arguments.
</p>
<dl class="table">
<dt>range</dt>
<dd><p>&rsquo;half&rsquo;,  &rsquo;onesided&rsquo; : frequency range of the spectrum is
           from zero up to but not including sample_f/2.  Power
           from negative frequencies is added to the positive
           side of the spectrum.
</p>
<p>&rsquo;whole&rsquo;, &rsquo;twosided&rsquo; : frequency range of the spectrum is
           -sample_f/2 to sample_f/2, with negative frequencies
           stored in &quot;wrap around&quot; order after the positive
           frequencies; e.g. frequencies for a 10-point &rsquo;twosided&rsquo;
           spectrum are 0 0.1 0.2 0.3 0.4 0.5 -0.4 -0.3 -0.2 -0.1
</p>
<p>&rsquo;shift&rsquo;, &rsquo;centerdc&rsquo; : same as &rsquo;whole&rsquo; but with the first half
           of the spectrum swapped with second half to put the
           zero-frequency value in the middle. (See &quot;help
           fftshift&quot;. If &quot;freq&quot; is vector, &rsquo;shift&rsquo; is ignored.
</p>
<p>If model coefficients &quot;ar_coeffs&quot; are real, the default
      range is &rsquo;half&rsquo;, otherwise default range is &rsquo;whole&rsquo;.
</p>
</dd>
<dt>method</dt>
<dd><p>&rsquo;fft&rsquo;:  use FFT to calculate power spectrum.
</p>
<p>&rsquo;poly&rsquo;: calculate power spectrum as a polynomial of 1/z
           N.B. this argument is ignored if the &quot;freq&quot; argument is a
           vector.  The default is &rsquo;poly&rsquo; unless the &quot;freq&quot;
           argument is an integer power of 2.
</p>
</dd>
<dt>plot_type</dt>
<dd><p>&rsquo;plot&rsquo;, &rsquo;semilogx&rsquo;, &rsquo;semilogy&rsquo;, &rsquo;loglog&rsquo;, &rsquo;squared&rsquo; or &rsquo;db&rsquo;:
           specifies the type of plot.  The default is &rsquo;plot&rsquo;, which
           means linear-linear axes. &rsquo;squared&rsquo; is the same as &rsquo;plot&rsquo;.
           &rsquo;dB&rsquo; plots &quot;10*log10(psd)&quot;.  This argument is ignored and a
           spectrum is not plotted if the caller requires a returned
           value.
</p></dd>
</dl>
<p>RETURNED VALUES:
</p>
<p>If return values are not required by the caller, the spectrum
     is plotted and nothing is returned.
</p>
<dl class="table">
<dt>psd</dt>
<dd><p>[real vector] power-spectrum estimate
   </p></dd>
<dt>f_out</dt>
<dd><p>[real vector] frequency values
</p></dd>
</dl>
<p>HINTS
</p>
<p>This function is a wrapper for aryule and ar_psd.
</p>
<p>See &quot;help aryule&quot;, &quot;help ar_psd&quot;.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="tfe">
<h4 class="subsection">3.10.12 tfe</h4>
<a class="index-entry-id" id="index-tfe"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-tfe_0028x_002cy_002cNfft_002cFs_002cwindow_002coverlap_002crange_002cplot_005ftype_002cdetrend_0029"><span class="category-def">Function File: </span><code class="def-type">[Pxx,freq] =</code> <strong class="def-name">tfe(x,y,Nfft,Fs,window,overlap,range,plot_type,detrend)</strong></dt>
<dd><p>Estimate transfer function of system with input &quot;x&quot; and output &quot;y&quot;.
</p>
<p>Use the Welch (1967) periodogram/FFT method.
</p>
<p>Compatible with Matlab R11 tfe and earlier.
</p>
<p>See &quot;help pwelch&quot; for description of arguments, hints and references
 &mdash; especially hint (7) for Matlab R11 defaults.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="tfestimate">
<h4 class="subsection">3.10.13 tfestimate</h4>
<a class="index-entry-id" id="index-tfestimate"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-tfestimate-1"><span class="category-def">Function File: </span><strong class="def-name">tfestimate</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-tfestimate-2"><span class="category-def">Function File: </span><strong class="def-name">tfestimate</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-tfestimate-3"><span class="category-def">Function File: </span><strong class="def-name">tfestimate</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-tfestimate-4"><span class="category-def">Function File: </span><strong class="def-name">tfestimate</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-tfestimate-5"><span class="category-def">Function File: </span><strong class="def-name">tfestimate</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>, <var class="var">Fs</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-tfestimate-6"><span class="category-def">Function File: </span><strong class="def-name">tfestimate</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>, <var class="var">window</var>, <var class="var">overlap</var>, <var class="var">Nfft</var>, <var class="var">Fs</var>, <var class="var">range</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-tfestimate-7"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">Pxx</var>, <var class="var">freq</var>] =</code> <strong class="def-name">tfestimate</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd>
<p>Estimate transfer function of system with input <var class="var">x</var> and output <var class="var">y</var>.
 Use the Welch (1967) periodogram/FFT method.
</p>
<p><strong class="strong">See also:</strong> pwelch.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Window-Functions">
<h3 class="section" id="Window-Functions-1">3.11 Window Functions</h3>
<a class="index-entry-id" id="index-Window-Functions"></a>
<div class="subsection-level-extent" id="barthannwin">
<h4 class="subsection">3.11.1 barthannwin</h4>
<a class="index-entry-id" id="index-barthannwin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-barthannwin-1"><span class="category-def">Function File: </span><strong class="def-name">barthannwin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dd><p>Return the filter coefficients of a modified Bartlett-Hann window of length
<var class="var">m</var>.
</p>
<p><strong class="strong">See also:</strong> rectwin, bartlett.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="blackmanharris">
<h4 class="subsection">3.11.2 blackmanharris</h4>
<a class="index-entry-id" id="index-blackmanharris"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-blackmanharris-1"><span class="category-def">Function File: </span><strong class="def-name">blackmanharris</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-blackmanharris-2"><span class="category-def">Function File: </span><strong class="def-name">blackmanharris</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;periodic&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-blackmanharris-3"><span class="category-def">Function File: </span><strong class="def-name">blackmanharris</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;symmetric&quot;)</code></dt>
<dd><p>Return the filter coefficients of a Blackman-Harris window of length <var class="var">m</var>.
</p>
<p>If the optional argument <code class="code">&quot;periodic&quot;</code> is given, the periodic form
 of the window is returned.  This is equivalent to the window of length
<var class="var">m</var>+1 with the last coefficient removed.  The optional argument
<code class="code">&quot;symmetric&quot;</code> is equivalent to not specifying a second argument.
</p>
<p><strong class="strong">See also:</strong> rectwin, bartlett.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="blackmannuttall">
<h4 class="subsection">3.11.3 blackmannuttall</h4>
<a class="index-entry-id" id="index-blackmannuttall"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-blackmannuttall-1"><span class="category-def">Function File: </span><strong class="def-name">blackmannuttall</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-blackmannuttall-2"><span class="category-def">Function File: </span><strong class="def-name">blackmannuttall</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;periodic&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-blackmannuttall-3"><span class="category-def">Function File: </span><strong class="def-name">blackmannuttall</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;symmetric&quot;)</code></dt>
<dd><p>Return the filter coefficients of a Blackman-Nuttall window of length
<var class="var">m</var>.
</p>
<p>If the optional argument <code class="code">&quot;periodic&quot;</code> is given, the periodic form
 of the window is returned.  This is equivalent to the window of length
<var class="var">m</var>+1 with the last coefficient removed.  The optional argument
<code class="code">&quot;symmetric&quot;</code> is equivalent to not specifying a second argument.
</p>
<p><strong class="strong">See also:</strong> nuttallwin, kaiser.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="bohmanwin">
<h4 class="subsection">3.11.4 bohmanwin</h4>
<a class="index-entry-id" id="index-bohmanwin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-bohmanwin-1"><span class="category-def">Function File: </span><strong class="def-name">bohmanwin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dd><p>Return the filter coefficients of a Bohman window of length <var class="var">m</var>.
</p>
<p><strong class="strong">See also:</strong> rectwin, bartlett.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="boxcar">
<h4 class="subsection">3.11.5 boxcar</h4>
<a class="index-entry-id" id="index-boxcar"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-boxcar-1"><span class="category-def">Function File: </span><strong class="def-name">boxcar</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dd><p>Return the filter coefficients of a rectangular window of length <var class="var">m</var>.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="chebwin">
<h4 class="subsection">3.11.6 chebwin</h4>
<a class="index-entry-id" id="index-chebwin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-chebwin-1"><span class="category-def">Function File: </span><strong class="def-name">chebwin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-chebwin-2"><span class="category-def">Function File: </span><strong class="def-name">chebwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">at</var>)</code></dt>
<dd>
<p>Return the filter coefficients of a Dolph-Chebyshev window of length <var class="var">m</var>.
 The Fourier transform of the window has a stop-band attenuation of <var class="var">at</var>
 dB.  The default attenuation value is 100 dB.
</p>
<p>For the definition of the Chebyshev window, see
</p>
<p>* Peter Lynch, &quot;The Dolph-Chebyshev Window: A Simple Optimal Filter&quot;,
   Monthly Weather Review, Vol. 125, pp. 655-660, April 1997.
   (http://www.maths.tcd.ie/~plynch/Publications/Dolph.pdf)
</p>
<p>* C. Dolph, &quot;A current distribution for broadside arrays which
   optimizes the relationship between beam width and side-lobe level&quot;,
   Proc. IEEE, 34, pp. 335-348.
</p>
<p>The window is described in frequency domain by the expression:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">          Cheb(m-1, beta * cos(pi * k/m))
   W(k) = -------------------------------
                 Cheb(m-1, beta)
</pre></div></div>
<p>with
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">   beta = cosh(1/(m-1) * acosh(10^(at/20))
</pre></div></div>
<p>and Cheb(m,x) denoting the m-th order Chebyshev polynomial calculated
 at the point x.
</p>
<p>Note that the denominator in W(k) above is not computed, and after
 the inverse Fourier transform the window is scaled by making its
 maximum value unitary.
</p>
<p><strong class="strong">See also:</strong> kaiser.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="expwin">
<h4 class="subsection">3.11.7 expwin</h4>
<a class="index-entry-id" id="index-expwin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-_0028m_002c"><span class="category-def">Function File: </span><code class="def-type">expwin</code> <strong class="def-name">(<var class="var">m</var>,</strong> <code class="def-code-arguments"><var class="var">alpha</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028m_002c-1"><span class="category-def">Function File: </span><code class="def-type">expwin</code> <strong class="def-name">(<var class="var">m</var>,</strong> <code class="def-code-arguments"><var class="var">sll</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028_002e_002e_002e_002c"><span class="category-def">Function File: </span><code class="def-type">expwin</code> <strong class="def-name">(&hellip;,</strong> <code class="def-code-arguments">&quot;canonical&quot;)</code></dt>
<dd><p>Return the coefficients of an exponential window<a class="footnote" id="DOCF4" href="#FOOT4"><sup>4</sup></a> of length <var class="var">m</var>.
</p>
<p>The window&rsquo;s adjustable parameter can be set directly as
<var class="var">alpha</var> (&ge;0) or indirectly with
<var class="var">sll</var> (&lt;0), the latter being the desired side-lobe level in dBc.
</p>
<p>By default, the returned window is both symmetric and periodic.  With the
 optional argument <code class="code">&quot;canonical&quot;</code>, the canonical form of the window is
 returned, which is symmetric but not periodic.
</p>
<p><strong class="strong">See also:</strong> kaiser, poisswin.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="flattopwin">
<h4 class="subsection">3.11.8 flattopwin</h4>
<a class="index-entry-id" id="index-flattopwin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-flattopwin-1"><span class="category-def">Function File: </span><strong class="def-name">flattopwin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-flattopwin-2"><span class="category-def">Function File: </span><strong class="def-name">flattopwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;periodic&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-flattopwin-3"><span class="category-def">Function File: </span><strong class="def-name">flattopwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;symmetric&quot;)</code></dt>
<dd>
<p>Return the filter coefficients of a Flat Top window of length <var class="var">m</var>.
 The Flat Top window is defined by the function f(w):
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">   f(w) = 1 - 1.93 cos(2 pi w) + 1.29 cos(4 pi w)
            - 0.388 cos(6 pi w) + 0.0322cos(8 pi w)
</pre></div></div>
<p>where w = i/(m-1) for i=0:m-1 for a symmetric window, or
 w = i/m for i=0:m-1 for a periodic window.  The default
 is symmetric.  The returned window is normalized to a peak
 of 1 at w = 0.5.
</p>
<p>This window has low pass-band ripple, but high bandwidth.
</p>
<p>According to [1]:
</p>
<p>The main use for the Flat Top window is for calibration, due
    to its negligible amplitude errors.
</p>
<p>[1] Gade, S; Herlufsen, H; (1987) &quot;Use of weighting functions in DFT/FFT
 analysis (Part I)&quot;, Bruel &amp; Kjaer Technical Review No.3.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="gaussian">
<h4 class="subsection">3.11.9 gaussian</h4>
<a class="index-entry-id" id="index-gaussian"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-gaussian-1"><span class="category-def">Function File: </span><strong class="def-name">gaussian</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-gaussian-2"><span class="category-def">Function File: </span><strong class="def-name">gaussian</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">a</var>)</code></dt>
<dd>
<p>Return a Gaussian convolution window of length <var class="var">m</var>.  The width of the
 window is inversely proportional to the parameter <var class="var">a</var>.  Use larger
<var class="var">a</var> for a narrower window.  Use larger <var class="var">m</var> for longer tails.
</p>
<p>w = exp ( -(a*x)^2/2 )
</p>
<p>for x = linspace ( -(m-1)/2, (m-1)/2, m ).
</p>
<p>Width a is measured in frequency units (sample rate/num samples).
 It should be f when multiplying in the time domain, but 1/f when
 multiplying in the frequency domain (for use in convolutions).
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="gausswin">
<h4 class="subsection">3.11.10 gausswin</h4>
<a class="index-entry-id" id="index-gausswin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-gausswin-1"><span class="category-def">Function File: </span><strong class="def-name">gausswin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-gausswin-2"><span class="category-def">Function File: </span><strong class="def-name">gausswin</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">a</var>)</code></dt>
<dd>
<p>Return the filter coefficients of a Gaussian window of length <var class="var">m</var>.
 The width of the window is inversely proportional to the parameter <var class="var">a</var>.
 Use larger <var class="var">a</var> for a narrow window.  Use larger <var class="var">m</var> for a smoother
 curve.
</p>
<p>w = exp ( -(a*x)^2/2 )
</p>
<p>for x = linspace(-(m-1)/m, (m-1)/m, m)
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="hann">
<h4 class="subsection">3.11.11 hann</h4>
<a class="index-entry-id" id="index-hann"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-hann-1"><span class="category-def">Function File: </span><strong class="def-name">hann</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-hann-2"><span class="category-def">Function File: </span><strong class="def-name">hann</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;periodic&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-hann-3"><span class="category-def">Function File: </span><strong class="def-name">hann</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;symmetric&quot;)</code></dt>
<dd><p>Return the filter coefficients of a Hanning window of length <var class="var">m</var>.
</p>
<p>If the optional argument <code class="code">&quot;periodic&quot;</code> is given, the periodic form
 of the window is returned.  This is equivalent to the window of length
<var class="var">m</var>+1 with the last coefficient removed.  The optional argument
<code class="code">&quot;symmetric&quot;</code> is equivalent to not specifying a second argument.
</p>
<p>This function exists for <small class="sc">MATLAB</small> compatibility only, and is equivalent
 to <code class="code">hanning (<var class="var">m</var>)</code>.
</p>
<p><strong class="strong">See also:</strong> hanning.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="kaiser">
<h4 class="subsection">3.11.12 kaiser</h4>
<a class="index-entry-id" id="index-kaiser"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-kaiser-1"><span class="category-def">Function File: </span><strong class="def-name">kaiser</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-kaiser-2"><span class="category-def">Function File: </span><strong class="def-name">kaiser</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">beta</var>)</code></dt>
<dd>
<p>Return the filter coefficients of a Kaiser window of length <var class="var">m</var>.  The
 Fourier transform of the window has a stop-band attenuation that is derived
 from the parameter <var class="var">beta</var>.
</p>
<p>For the definition of the Kaiser window, see A. V. Oppenheim &amp;
 R. W. Schafer, &quot;Discrete-Time Signal Processing&quot;.
</p>
<p>The continuous version of width m centered about x=0 is:
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">         besseli(0, beta * sqrt(1-(2*x/m).^2))
 k(x) =  -------------------------------------,  m/2 &lt;= x &lt;= m/2
                besseli(0, beta)
</pre></div></div>
<p><strong class="strong">See also:</strong> kaiserord.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="nuttallwin">
<h4 class="subsection">3.11.13 nuttallwin</h4>
<a class="index-entry-id" id="index-nuttallwin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-nuttallwin-1"><span class="category-def">Function File: </span><strong class="def-name">nuttallwin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-nuttallwin-2"><span class="category-def">Function File: </span><strong class="def-name">nuttallwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;periodic&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-nuttallwin-3"><span class="category-def">Function File: </span><strong class="def-name">nuttallwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;symmetric&quot;)</code></dt>
<dd><p>Return the filter coefficients of a Blackman-Harris window defined by
 Nuttall of length <var class="var">m</var>.
</p>
<p>If the optional argument <code class="code">&quot;periodic&quot;</code> is given, the periodic form
 of the window is returned.  This is equivalent to the window of length
<var class="var">m</var>+1 with the last coefficient removed.  The optional argument
<code class="code">&quot;symmetric&quot;</code> is equivalent to not specifying a second argument.
</p>
<p><strong class="strong">See also:</strong> blackman, blackmanharris.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="parzenwin">
<h4 class="subsection">3.11.14 parzenwin</h4>
<a class="index-entry-id" id="index-parzenwin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-parzenwin-1"><span class="category-def">Function File: </span><strong class="def-name">parzenwin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dd><p>Return the filter coefficients of a Parzen window of length <var class="var">m</var>.
</p>
<p><strong class="strong">See also:</strong> rectwin, bartlett.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="poisswin">
<h4 class="subsection">3.11.15 poisswin</h4>
<a class="index-entry-id" id="index-poisswin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-_0028m_002c-2"><span class="category-def">Function File: </span><code class="def-type">poisswin</code> <strong class="def-name">(<var class="var">m</var>,</strong> <code class="def-code-arguments"><var class="var">alpha</var>)</code></dt>
<dd><p>Return the coefficients of a Poisson (a.k.a. exponential) window<a class="footnote" id="DOCF5" href="#FOOT5"><sup>5</sup></a> of length <var class="var">m</var> and adjustable parameter
<var class="var">alpha</var>.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="rectwin">
<h4 class="subsection">3.11.16 rectwin</h4>
<a class="index-entry-id" id="index-rectwin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-rectwin-1"><span class="category-def">Function File: </span><strong class="def-name">rectwin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dd><p>Return the filter coefficients of a rectangular window of length <var class="var">m</var>.
</p>
<p><strong class="strong">See also:</strong> boxcar, hamming, hanning.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="taylorwin">
<h4 class="subsection">3.11.17 taylorwin</h4>
<a class="index-entry-id" id="index-taylorwin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-_0028m_0029"><span class="category-def">Function File: </span><code class="def-type">taylorwin</code> <strong class="def-name">(<var class="var">m</var>)</strong></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028m_002c-3"><span class="category-def">Function File: </span><code class="def-type">taylorwin</code> <strong class="def-name">(<var class="var">m</var>,</strong> <code class="def-code-arguments"><var class="var">nbar</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028m_002c-4"><span class="category-def">Function File: </span><code class="def-type">taylorwin</code> <strong class="def-name">(<var class="var">m</var>,</strong> <code class="def-code-arguments"><var class="var">nbar</var>, <var class="var">sll</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028m_002c-5"><span class="category-def">Function File: </span><code class="def-type">taylorwin</code> <strong class="def-name">(<var class="var">m</var>,</strong> <code class="def-code-arguments"><var class="var">nbar</var>, <var class="var">sll</var>, <var class="var">plots</var>)</code></dt>
<dd><p>Return the coefficients of a Taylor window of length <var class="var">m</var>, whose
 Fourier transform has <var class="var">nbar</var> (default 4) quasi-equiripple side-lobes
 adjacent to the main-lobe, at a nominal level of <var class="var">sll</var> (default
&minus;30) dBc.
</p>
<p>If <var class="var">plots</var> is non-zero then time and frequency domains plots of the
 resultant window are shown.
</p>
<p>Reference:
 Doerry, &lsquo;Catalog of Window Taper Functions for Sidelobe Control&rsquo;, 2017.
</p>
<p><strong class="strong">See also:</strong> chebwin.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="triang">
<h4 class="subsection">3.11.18 triang</h4>
<a class="index-entry-id" id="index-triang"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-triang-1"><span class="category-def">Function File: </span><strong class="def-name">triang</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dd>
<p>Return the filter coefficients of a triangular window of length <var class="var">m</var>.
 Unlike the Bartlett window, <code class="code">triang</code> does not go to zero at the edges
 of the window.  For odd <var class="var">m</var>, <code class="code">triang (<var class="var">m</var>)</code> is equal to
<code class="code">bartlett (<var class="var">m</var> + 2)</code> except for the zeros at the edges of the
 window.
</p>
<p><strong class="strong">See also:</strong> bartlett.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="tukeywin">
<h4 class="subsection">3.11.19 tukeywin</h4>
<a class="index-entry-id" id="index-tukeywin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-tukeywin-1"><span class="category-def">Function File: </span><strong class="def-name">tukeywin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-tukeywin-2"><span class="category-def">Function File: </span><strong class="def-name">tukeywin</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">r</var>)</code></dt>
<dd><p>Return the filter coefficients of a Tukey window (also known as the
 cosine-tapered window) of length <var class="var">m</var>.  <var class="var">r</var> defines the ratio
 between the constant section and and the cosine section.  It has to be
 between 0 and 1.  The function returns a Hanning window for <var class="var">r</var>
 equal to 1 and a rectangular window for <var class="var">r</var> equal to 0.
 The default value of <var class="var">r</var> is 1/2.
</p>
<p>For a definition of the Tukey window, see e.g. Fredric J. Harris,
 &quot;On the Use of Windows for Harmonic Analysis with the Discrete Fourier
 Transform, Proceedings of the IEEE&quot;, Vol. 66, No. 1, January 1978,
 Page 67, Equation 38.
</p>
<p><strong class="strong">See also:</strong> hanning.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="ultrwin">
<h4 class="subsection">3.11.20 ultrwin</h4>
<a class="index-entry-id" id="index-ultrwin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-ultrwin-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">w</var>, <var class="var">xmu</var>] =</code> <strong class="def-name">ultrwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">mu</var>, <var class="var">beta</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ultrwin-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">w</var>, <var class="var">xmu</var>] =</code> <strong class="def-name">ultrwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">mu</var>, <var class="var">att</var>, &quot;att&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ultrwin-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">w</var>, <var class="var">xmu</var>] =</code> <strong class="def-name">ultrwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">mu</var>, <var class="var">latt</var>, &quot;latt&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-ultrwin-4"><span class="category-def">Function File: </span><code class="def-type"><var class="var">w</var> =</code> <strong class="def-name">ultrwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, <var class="var">mu</var>, <var class="var">xmu</var>, &quot;xmu&quot;)</code></dt>
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
</div>
<div class="subsection-level-extent" id="welchwin">
<h4 class="subsection">3.11.21 welchwin</h4>
<a class="index-entry-id" id="index-welchwin"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-welchwin-1"><span class="category-def">Function File: </span><strong class="def-name">welchwin</strong> <code class="def-code-arguments">(<var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-welchwin-2"><span class="category-def">Function File: </span><strong class="def-name">welchwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;periodic&quot;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-welchwin-3"><span class="category-def">Function File: </span><strong class="def-name">welchwin</strong> <code class="def-code-arguments">(<var class="var">m</var>, &quot;symmetric&quot;)</code></dt>
<dd><p>Return the filter coefficients of a Welch window of length <var class="var">m</var>.  The
 Welch window is given by
<var class="var">w</var>(n)=1-(n/N-1)^2,   n=[0,1, ... <var class="var">m</var>-1].
 The optional argument specifies a &quot;symmetric&quot; window (the default) or a
 &quot;periodic&quot; window.
</p>
<p>A symmetric window has zero at each end and maximum in the middle, and the
 length must be an integer greater than 2.  The variable <var class="var">N</var> in the
 formula above is <code class="code">(<var class="var">m</var>-1)/2</code>.
</p>
<p>A periodic window wraps around the cyclic interval [0,1, ... <var class="var">m</var>-1],
 and is intended for use with the DFT.  The length must be an integer
 greater than 1.  The variable <var class="var">N</var> in the formula above is
<code class="code"><var class="var">m</var>/2</code>.
</p>
<p><strong class="strong">See also:</strong> blackman, kaiser.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="window">
<h4 class="subsection">3.11.22 window</h4>
<a class="index-entry-id" id="index-window"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-window-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">w</var> =</code> <strong class="def-name">window</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-window-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">w</var> =</code> <strong class="def-name">window</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">m</var>, <var class="var">opts</var>)</code></dt>
<dd><p>Create an <var class="var">m</var>-point window from the function <var class="var">f</var>.  The function
<var class="var">f</var> can be for example <code class="code">@blackman</code>.  Any additional
 arguments <var class="var">opt</var> are passed to the windowing function.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="wvtool">
<h4 class="subsection">3.11.23 wvtool</h4>
<a class="index-entry-id" id="index-wvtool"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-_0028w_002c"><span class="category-def">Function File: </span><code class="def-type">wvtool</code> <strong class="def-name">(<var class="var">w</var>,</strong> <code class="def-code-arguments">&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028_002e_002e_002e_002c-1"><span class="category-def">Function File: </span><code class="def-type">wvtool</code> <strong class="def-name">(&hellip;,</strong> <code class="def-code-arguments"><var class="var">options</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028title_002c"><span class="category-def">Function File: </span><code class="def-type">wvtool</code> <strong class="def-name">(<var class="var">title</var>,</strong> <code class="def-code-arguments">&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_003d-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">h</var></code> <strong class="def-name">=</strong> <code class="def-code-arguments">wvtool (&hellip;)</code></dt>
<dd><p>Plot time and frequency domain graphs of each vector of window function
 coefficients given in <var class="var">w</var> and any following arguments.  Given vectors
 must have the same length.
</p>
<p>The graphs are: (1) Time domain, (2) Frequency domain (initial
 bins), and (3) Frequency domain (all bins).  A subset of these can be selected
 by including their numbers as above as characters within the string
 argument <var class="var">options</var>; for example, &lsquo;13&rsquo; selects only graphs (1) and (3).
</p>
<p>By default, the x-axis of graph (3) is logarithmic, to facilitate assessment of
 side-lobe roll-off (SLR) rate.  Including an &lsquo;l&rsquo; character in <var class="var">options</var>
 changes to a linear x-axis.
</p>
<p>The layout of the graphs is set to horizontal if <var class="var">options</var> contains an
 &lsquo;h&rsquo; character.
</p>
<p>Any other characters in <var class="var">options</var> are passed to the plot command for
 graph (1) as its <var class="var">fmt</var> argument (for an example, see demo number 3).
</p>
<p>A figure title can be supplied as the first given argument; alternatively
 the returned handle <var class="var">h</var> provides a more general means to modify the figure.
</p>
<p>Measurements made on the window(s) are reported in the graph legends (subject
 to graph selection per above) and in the console output.
</p>
<p>To convert reported bin positions to bandwidth (in bins), multiply by 2.
 To convert bandwidth in bins to normalized bandwidth, divide by the
 window-length.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="System-Identification">
<h3 class="section" id="System-Identification-1">3.12 System Identification</h3>
<a class="index-entry-id" id="index-System-Identification"></a>
<div class="subsection-level-extent" id="arburg">
<h4 class="subsection">3.12.1 arburg</h4>
<a class="index-entry-id" id="index-arburg"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-arburg-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">v</var>, <var class="var">k</var>] =</code> <strong class="def-name">arburg</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">poles</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-arburg-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">v</var>, <var class="var">k</var>] =</code> <strong class="def-name">arburg</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">poles</var>, <var class="var">criterion</var>)</code></dt>
<dd>
<p>Calculate coefficients of an autoregressive (AR) model of complex data
<var class="var">x</var> using the whitening lattice-filter method of Burg (1968).  The
 inverse of the model is a moving-average filter which reduces <var class="var">x</var> to
 white noise.  The power spectrum of the AR model is an estimate of the
 maximum entropy power spectrum of the data.  The function <code class="code">ar_psd</code>
 calculates the power spectrum of the AR model.
</p>
<p>ARGUMENTS:
</p><ul class="itemize mark-bullet">
<li><var class="var">x</var>
 sampled data
</li><li><var class="var">poles</var>
 number of poles in the AR model or limit to the number of poles if a
 valid <var class="var">criterion</var> is provided.
</li><li><var class="var">criterion</var>
 model-selection criterion.  Limits the number of poles so that spurious
 poles are not added when the whitened data has no more information
 in it (see Kay &amp; Marple, 1981). Recognized values are
 &rsquo;AKICc&rsquo; &ndash; approximate corrected Kullback information criterion (recommended),
 &rsquo;KIC&rsquo;  &ndash; Kullback information criterion
 &rsquo;AICc&rsquo; &ndash; corrected Akaike information criterion
 &rsquo;AIC&rsquo;  &ndash; Akaike information criterion
 &rsquo;FPE&rsquo;  &ndash; final prediction error&quot; criterion
 The default is to NOT use a model-selection criterion
</li></ul>
<p>RETURNED VALUES:
</p><ul class="itemize mark-bullet">
<li><var class="var">a</var>
 list of (P+1) autoregression coefficients; for data input <em class="math">x(n)</em> and
 white noise <em class="math">e(n)</em>, the model is
<div class="example">
<div class="group"><pre class="example-preformatted">                       P+1
 x(n) = sqrt(v).e(n) + SUM a(k).x(n-k)
                       k=1
</pre></div></div>
<p><var class="var">v</var>
 mean square of residual noise from the whitening operation of the Burg
 lattice filter.
</p></li><li><var class="var">k</var>
 reflection coefficients defining the lattice-filter embodiment of the model
</li></ul>
<p>HINTS:
</p>
<p>(1) arburg does not remove the mean from the data.  You should remove
      the mean from the data if you want a power spectrum.  A non-zero mean
      can produce large errors in a power-spectrum estimate.  See
      &quot;help detrend&quot;.
  (2) If you don&rsquo;t know what the value of &quot;poles&quot; should be, choose the
      largest (reasonable) value you could want and use the recommended
      value, criterion=&rsquo;AKICc&rsquo;, so that arburg can find it.
      E.g. arburg(x,64,&rsquo;AKICc&rsquo;)
      The AKICc has the least bias and best resolution of the available
      model-selection criteria.
  (3) Autoregressive and moving-average filters are stored as polynomials
      which, in matlab, are row vectors.
</p>
<p>NOTE ON SELECTION CRITERION:
</p>
<p>AIC, AICc, KIC and AKICc are based on information theory.  They  attempt
   to balance the complexity (or length) of the model against how well the
   model fits the data.  AIC and KIC are biased estimates of the asymmetric
   and the symmetric Kullback-Leibler divergence respectively.  AICc and
   AKICc attempt to correct the bias. See reference [4].
</p>
<p>REFERENCES:
</p>
<p>[1] John Parker Burg (1968)
   &quot;A new analysis technique for time series data&quot;,
   NATO advanced study Institute on Signal Processing with Emphasis on
   Underwater Acoustics, Enschede, Netherlands, Aug. 12-23, 1968.
</p>
<p>[2] Steven M. Kay and Stanley Lawrence Marple Jr.:
   &quot;Spectrum analysis &ndash; a modern perspective&quot;,
   Proceedings of the IEEE, Vol 69, pp 1380-1419, Nov., 1981
</p>
<p>[3] William H. Press and Saul A. Teukolsky and William T. Vetterling and
               Brian P. Flannery
   &quot;Numerical recipes in C, The art of scientific computing&quot;, 2nd edition,
   Cambridge University Press, 2002 &mdash; Section 13.7.
</p>
<p>[4] Abd-Krim Seghouane and Maiza Bekara
   &quot;A small sample model selection criterion based on Kullback&rsquo;s symmetric
   divergence&quot;, IEEE Transactions on Signal Processing,
   Vol. 52(12), pp 3314-3323, Dec. 2004
</p>
<p><strong class="strong">See also:</strong> ar_psd.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="aryule">
<h4 class="subsection">3.12.2 aryule</h4>
<a class="index-entry-id" id="index-aryule"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-aryule-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">a</var> =</code> <strong class="def-name">aryule</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-aryule-2"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">v</var>, <var class="var">k</var>] =</code> <strong class="def-name">aryule</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>)</code></dt>
<dd><p>Fit an AR (<var class="var">p</var>)-model with Yule-Walker estimates.
</p><dl class="table">
<dt><var class="var">x</var></dt>
<dd><p>data vector to estimate
</p></dd>
<dt><var class="var">a</var></dt>
<dd><p>AR coefficients
</p></dd>
<dt><var class="var">v</var></dt>
<dd><p>variance of white noise
</p></dd>
<dt><var class="var">k</var></dt>
<dd><p>reflection coefficients for use in lattice filter
</p></dd>
</dl>
<p>The power spectrum of the resulting filter can be plotted with
 pyulear(x, p), or you can plot it directly with ar_psd(a,v,...).
</p>
<p>See also:
 pyulear, power, freqz, impz &ndash; for observing characteristics of the model
 arburg &ndash; for alternative spectral estimators
</p>
<p>Example: Use example from arburg, but substitute aryule for arburg.
</p>
<p>Note: Orphanidis &rsquo;85 claims lattice filters are more tolerant of
 truncation errors, which is why you might want to use them.  However,
 lacking a lattice filter processor, I haven&rsquo;t tested that the lattice
 filter coefficients are reasonable.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="invfreq">
<h4 class="subsection">3.12.3 invfreq</h4>
<a class="index-entry-id" id="index-invfreq"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-invfreq_0028H_002cF_002cnB_002cnA_0029"><span class="category-def">Function File: </span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreq(H,F,nB,nA)</strong></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-invfreq_0028H_002cF_002cnB_002cnA_002cW_0029"><span class="category-def">: </span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreq(H,F,nB,nA,W)</strong></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-invfreq_0028H_002cF_002cnB_002cnA_002cW_002c_005b_005d_002c_005b_005d_002cplane_0029"><span class="category-def">: </span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreq(H,F,nB,nA,W,[],[],plane)</strong></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-invfreq_0028H_002cF_002cnB_002cnA_002cW_002citer_002ctol_002cplane_0029"><span class="category-def">: </span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreq(H,F,nB,nA,W,iter,tol,plane)</strong></dt>
<dd><p>Fit filter B(z)/A(z) or B(s)/A(s) to complex frequency response at
 frequency points F.
</p>
<p>A and B are real polynomial coefficients of order
 nA and nB respectively.  Optionally, the fit-errors can be weighted vs
 frequency according to the weights W. Also, the transform plane can be
 specified as either &rsquo;s&rsquo; for continuous time or &rsquo;z&rsquo; for discrete time. &rsquo;z&rsquo;
 is chosen by default.  Eventually, Steiglitz-McBride iterations will be
 specified by iter and tol.
</p>
<p>H: desired complex frequency response
     It is assumed that A and B are real polynomials, hence H is one-sided.
</p>
<p>F: vector of frequency samples in radians
</p>
<p>nA: order of denominator polynomial A
</p>
<p>nB: order of numerator polynomial B
</p>
<p>plane=&rsquo;z&rsquo;: F on unit circle (discrete-time spectra, z-plane design)
</p>
<p>plane=&rsquo;s&rsquo;: F on jw axis     (continuous-time spectra, s-plane design)
</p>
<p>H(k) = spectral samples of filter frequency response at points zk,
  where zk=exp(sqrt(-1)*F(k)) when plane=&rsquo;z&rsquo; (F(k) in [0,.5])
     and zk=(sqrt(-1)*F(k)) when plane=&rsquo;s&rsquo; (F(k) nonnegative)
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted">     [B,A] = butter(12,1/4);
     [H,w] = freqz(B,A,128);
     [Bh,Ah] = invfreq(H,F,4,4);
     Hh = freqz(Bh,Ah);
     disp(sprintf('||frequency response error|| = %f',norm(H-Hh)));
</pre></div>
<p>References:
</p>
<p>J. O. Smith, &quot;Techniques for Digital Filter Design and System
      Identification with Application to the Violin, Ph.D. Dissertation,
      Elec. Eng. Dept., Stanford University, June 1983, page 50; or,
</p>
<p>http://ccrma.stanford.edu/~jos/filters/FFT_Based_Equation_Error_Method.html
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="invfreqs">
<h4 class="subsection">3.12.4 invfreqs</h4>
<a class="index-entry-id" id="index-invfreqs"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-invfreqs_0028H_002cF_002cnB_002cnA_0029"><span class="category-def">Function File: </span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreqs(H,F,nB,nA)</strong></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-invfreqs_0028H_002cF_002cnB_002cnA_002cW_0029"><span class="category-def">: </span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreqs(H,F,nB,nA,W)</strong></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-invfreqs_0028H_002cF_002cnB_002cnA_002cW_002citer_002ctol_002c_0027trace_0027_0029"><span class="category-def">: </span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreqs(H,F,nB,nA,W,iter,tol,'trace')</strong></dt>
<dd><p>Fit filter B(s)/A(s)to the complex frequency response H at frequency
 points F.
</p>
<p>A and B are real polynomial coefficients of order nA and nB.
</p>
<p>Optionally, the fit-errors can be weighted vs frequency according to
 the weights W.
</p>
<p>Note: all the guts are in invfreq.m
</p>
<p>H: desired complex frequency response
</p>
<p>F: frequency (must be same length as H)
</p>
<p>nA: order of the denominator polynomial A
</p>
<p>nB: order of the numerator polynomial B
</p>
<p>W: vector of weights (must be same length as F)
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted">       B = [1/2 1];
       A = [1 1];
       w = linspace(0,4,128);
       H = freqs(B,A,w);
       [Bh,Ah] = invfreqs(H,w,1,1);
       Hh = freqs(Bh,Ah,w);
       plot(w,[abs(H);abs(Hh)])
       legend('Original','Measured');
       err = norm(H-Hh);
       disp(sprintf('L2 norm of frequency response error = %f',err));
</pre></div>
</dd></dl>
</div>
<div class="subsection-level-extent" id="invfreqz">
<h4 class="subsection">3.12.5 invfreqz</h4>
<a class="index-entry-id" id="index-invfreqz"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-invfreqz_0028H_002cF_002cnB_002cnA_0029"><span class="category-def">Function File: </span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreqz(H,F,nB,nA)</strong></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-invfreqz_0028H_002cF_002cnB_002cnA_002cW_0029"><span class="category-def">: </span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreqz(H,F,nB,nA,W)</strong></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-invfreqz_0028H_002cF_002cnB_002cnA_002cW_002citer_002ctol_002c_0027trace_0027_0029"><span class="category-def">: </span><code class="def-type">[B,A] =</code> <strong class="def-name">invfreqz(H,F,nB,nA,W,iter,tol,'trace')</strong></dt>
<dd><p>Fit filter B(z)/A(z)to the complex frequency response H at frequency
 points F.
</p>
<p>A and B are real polynomial coefficients of order nA and nB.
 Optionally, the fit-errors can be weighted vs frequency according to
 the weights W.
</p>
<p>Note: all the guts are in invfreq.m
</p>
<p>H: desired complex frequency response
</p>
<p>F: normalized frequency (0 to pi) (must be same length as H)
</p>
<p>nA: order of the denominator polynomial A
</p>
<p>nB: order of the numerator polynomial B
</p>
<p>W: vector of weights (must be same length as F)
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted">     [B,A] = butter(4,1/4);
     [H,F] = freqz(B,A);
     [Bh,Ah] = invfreq(H,F,4,4);
     Hh = freqz(Bh,Ah);
     disp(sprintf('||frequency response error|| = %f',norm(H-Hh)));
</pre></div>
</dd></dl>
</div>
<div class="subsection-level-extent" id="levinson">
<h4 class="subsection">3.12.6 levinson</h4>
<a class="index-entry-id" id="index-levinson"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-levinson-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">v</var>, <var class="var">ref</var>] =</code> <strong class="def-name">levinson</strong> <code class="def-code-arguments">(<var class="var">acf</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-levinson-2"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">levinson</strong> <code class="def-code-arguments">(<var class="var">acf</var>, <var class="var">p</var>)</code></dt>
<dd>
<p>Use the Durbin-Levinson algorithm to solve:
    toeplitz(acf(1:p)) * x = -acf(2:p+1).
 The solution [1, x&rsquo;] is the denominator of an all pole filter
 approximation to the signal x which generated the autocorrelation
 function acf.
</p>
<p>acf is the autocorrelation function for lags 0 to p.
 p defaults to length(acf)-1.
 Returns
   a=[1, x&rsquo;] the denominator filter coefficients.
   v= variance of the white noise = square of the numerator constant
   ref = reflection coefficients = coefficients of the lattice
         implementation of the filter
 Use freqz(sqrt(v),a) to plot the power spectrum.
</p>
<p>REFERENCE
 [1] Steven M. Kay and Stanley Lawrence Marple Jr.:
   &quot;Spectrum analysis &ndash; a modern perspective&quot;,
   Proceedings of the IEEE, Vol 69, pp 1380-1419, Nov., 1981
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="lpc">
<h4 class="subsection">3.12.7 lpc</h4>
<a class="index-entry-id" id="index-lpc"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-lpc-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">a</var> =</code> <strong class="def-name">lpc</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-lpc-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">a</var> =</code> <strong class="def-name">lpc</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-lpc-3"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">g</var>] =</code> <strong class="def-name">lpc</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-lpc-4"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">a</var>, <var class="var">g</var>] =</code> <strong class="def-name">lpc</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>)</code></dt>
<dd>
<p>Determines the forward linear predictor by minimizing the prediction error
 in the least squares sense. Use the Durbin-Levinson algorithm to solve
 the Yule-Walker equations obtained by the autocorrelation of the input
 signal.
</p>
<p><var class="var">x</var> is a data vector used to estimate the lpc model of <var class="var">p</var>-th order,
 given by the prediction polynomial <code class="code"><var class="var">a</var> = [1 <var class="var">a</var>(2) &hellip;
<var class="var">a</var>(<var class="var">p</var>+1)]</code>. If <var class="var">p</var> is not provided, <code class="code">length(<var class="var">p</var>) - 1</code>
 is used as default.
</p>
<p><var class="var">x</var> might also be a matrix, in which case each column is regarded as a
 separate signal. <code class="code">lpc</code> will return a model estimate for each column of
<var class="var">x</var>.
</p>
<p><var class="var">g</var> is the variance (power) of the prediction error for each signal in
<var class="var">x</var>.
</p>
<p><strong class="strong">See also:</strong> aryule,levinson.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Sample-Rate-Change">
<h3 class="section" id="Sample-Rate-Change-1">3.13 Sample Rate Change</h3>
<a class="index-entry-id" id="index-Sample-Rate-Change"></a>
<div class="subsection-level-extent" id="data2fun">
<h4 class="subsection">3.13.1 data2fun</h4>
<a class="index-entry-id" id="index-data2fun"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-data2fun-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">fhandle</var>, <var class="var">fullname</var>] =</code> <strong class="def-name">data2fun</strong> <code class="def-code-arguments">(<var class="var">ti</var>, <var class="var">yi</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-data2fun-2"><span class="category-def">Function File: </span><code class="def-type">[&hellip;] =</code> <strong class="def-name">data2fun</strong> <code class="def-code-arguments">(&hellip;, <var class="var">property</var>, <var class="var">value</var>)</code></dt>
<dd><p>Create a vectorized function based on data samples using interpolation.
</p>
<p>The values given in <var class="var">yi</var> (N-by-k matrix) correspond to evaluations of the
 function y(t) at the points <var class="var">ti</var> (N-by-1 matrix).
 The data is interpolated and the function handle to the generated interpolant
 is returned.
</p>
<p>The function accepts <var class="var">property</var>-<var class="var">value</var> pairs described below.
</p>
<dl class="table">
<dt>&lsquo;<samp class="samp">file</samp>&rsquo;</dt>
<dd><p>Code is generated and .m file is created. The <var class="var">value</var> contains the name
 of the function. The returned function handle is a handle to that file. If
<var class="var">value</var> is empty, then a name is automatically generated using
<code class="code">tempname</code> and the file is created in the current directory. <var class="var">value</var>
 must not have an extension, since .m will be appended.
 Numerical values used in the function are stored in a .mat file with the same
 name as the function.
</p>
</dd>
<dt>&lsquo;<samp class="samp">interp</samp>&rsquo;</dt>
<dd><p>Type of interpolation. See <code class="code">interp1</code>.
</p></dd>
</dl>
<p><strong class="strong">See also:</strong> interp1.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="decimate">
<h4 class="subsection">3.13.2 decimate</h4>
<a class="index-entry-id" id="index-decimate"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-decimate-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">decimate</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">q</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-decimate-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">decimate</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">q</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-decimate-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">decimate</strong> <code class="def-code-arguments">(&hellip;, &quot;fir&quot;)</code></dt>
<dd>
<p>Downsample the signal <var class="var">x</var> by a reduction factor of <var class="var">q</var>. A lowpass
 antialiasing filter is applied to the signal prior to reducing the input
 sequence. By default, an order <var class="var">n</var> Chebyshev type I filter is used.
 If <var class="var">n</var> is not specified, the default is 8.
</p>
<p>If the optional argument <code class="code">&quot;fir&quot;</code> is given, an order <var class="var">n</var> FIR filter
 is used, with a default order of 30 if <var class="var">n</var> is not given.
</p>
<p>Note that <var class="var">q</var> must be an integer for this rate change method.
</p>
<p>Example:
</p><div class="example">
<pre class="example-preformatted"> ## Generate a signal that starts away from zero, is slowly varying
 ## at the start and quickly varying at the end, decimate and plot.
 ## Since it starts away from zero, you will see the boundary
 ## effects of the antialiasing filter clearly.  Next you will see
 ## how it follows the curve nicely in the slowly varying early
 ## part of the signal, but averages the curve in the quickly
 ## varying late part of the signal.
 t = 0:0.01:2;
 x = chirp (t, 2, .5, 10, &quot;quadratic&quot;) + sin (2*pi*t*0.4);
 y = decimate (x, 4);
 stem (t(1:121) * 1000, x(1:121), &quot;-g;Original;&quot;); hold on; # original
 stem (t(1:4:121) * 1000, y(1:31), &quot;-r;Decimated;&quot;); hold off; # decimated
</pre></div>
</dd></dl>
</div>
<div class="subsection-level-extent" id="downsample">
<h4 class="subsection">3.13.3 downsample</h4>
<a class="index-entry-id" id="index-downsample"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-downsample-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">downsample</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-downsample-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">downsample</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">offset</var>)</code></dt>
<dd><p>Downsample the signal, selecting every <var class="var">n</var>th element.  If <var class="var">x</var>
 is a matrix, downsample every column.
</p>
<p>For most signals you will want to use <code class="code">decimate</code> instead since
 it prefilters the high frequency components of the signal and
 avoids aliasing effects.
</p>
<p>If <var class="var">offset</var> is defined, select every <var class="var">n</var>th element starting at
 sample <var class="var">offset</var>.
</p>
<p><strong class="strong">See also:</strong> decimate, interp, resample, upfirdn, upsample.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="interp">
<h4 class="subsection">3.13.4 interp</h4>
<a class="index-entry-id" id="index-interp"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-interp-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">interp</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">q</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-interp-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">interp</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">q</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-interp-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">interp</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">q</var>, <var class="var">n</var>, <var class="var">Wc</var>)</code></dt>
<dd>
<p>Upsample the signal x by a factor of q, using an order 2*q*n+1 FIR
 filter. Note that q must be an integer for this rate change method.
 n defaults to 4 and Wc defaults to 0.5.
</p>
<p>Example
</p><div class="example">
<div class="group"><pre class="example-preformatted"> # Generate a signal.
 t=0:0.01:2; x=chirp(t,2,.5,10,'quadratic')+sin(2*pi*t*0.4);
 y = interp(x(1:4:length(x)),4,4,1);   # interpolate a sub-sample
 stem(t(1:121)*1000,x(1:121),&quot;-g;Original;&quot;); hold on;
 stem(t(1:121)*1000,y(1:121),&quot;-r;Interpolated;&quot;);
 stem(t(1:4:121)*1000,x(1:4:121),&quot;-b;Subsampled;&quot;); hold off;
</pre></div></div>
<p><strong class="strong">See also:</strong> decimate, resample.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="resample">
<h4 class="subsection">3.13.5 resample</h4>
<a class="index-entry-id" id="index-resample"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-resample-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">y</var>, <var class="var">h</var>] =</code> <strong class="def-name">resample</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>, <var class="var">q</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-resample-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">resample</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">p</var>, <var class="var">q</var>, <var class="var">h</var>)</code></dt>
<dd><p>Change the sample rate of <var class="var">x</var> by a factor of <var class="var">p</var>/<var class="var">q</var>.  This is
 performed using a polyphase algorithm.  The impulse response <var class="var">h</var> of
 the antialiasing filter is either specified or either designed with a
 Kaiser-windowed sinecard.
</p>
<p>Ref [1] J. G. Proakis and D. G. Manolakis,
 Digital Signal Processing: Principles, Algorithms, and Applications,
 4th ed., Prentice Hall, 2007. Chap. 6
</p>
<p>Ref [2] A. V. Oppenheim, R. W. Schafer and J. R. Buck,
 Discrete-time signal processing, Signal processing series,
 Prentice-Hall, 1999
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="upfirdn">
<h4 class="subsection">3.13.6 upfirdn</h4>
<a class="index-entry-id" id="index-upfirdn"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-upfirdn-1"><span class="category-def">Loadable Function: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">upfirdn</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">h</var>, <var class="var">p</var>, <var class="var">q</var>)</code></dt>
<dd><p>Upsample, FIR filtering, and downsample.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="upsample">
<h4 class="subsection">3.13.7 upsample</h4>
<a class="index-entry-id" id="index-upsample"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-upsample-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">upsample</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-upsample-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">upsample</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">offset</var>)</code></dt>
<dd><p>Upsample the signal, inserting <var class="var">n</var>-1 zeros between every element.
</p>
<p>If <var class="var">x</var> is a matrix, upsample every column.
</p>
<p>If <var class="var">offset</var> is specified, control the position of the inserted sample in
 the block of <var class="var">n</var> zeros.
</p>
<p><strong class="strong">See also:</strong> decimate, downsample, interp, resample, upfirdn.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Pulse-Metrics">
<h3 class="section" id="Pulse-Metrics-1">3.14 Pulse Metrics</h3>
<a class="index-entry-id" id="index-Pulse-Metrics"></a>
<div class="subsection-level-extent" id="statelevels">
<h4 class="subsection">3.14.1 statelevels</h4>
<a class="index-entry-id" id="index-statelevels"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-statelevels-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">levels</var> =</code> <strong class="def-name">statelevels</strong> <code class="def-code-arguments">(<var class="var">A</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-statelevels-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">levels</var> =</code> <strong class="def-name">statelevels</strong> <code class="def-code-arguments">(<var class="var">A</var>, <var class="var">nbins</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-statelevels-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">levels</var> =</code> <strong class="def-name">statelevels</strong> <code class="def-code-arguments">(<var class="var">A</var>, <var class="var">nbins</var>, <var class="var">method</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-statelevels-4"><span class="category-def">Function File: </span><code class="def-type"><var class="var">levels</var> =</code> <strong class="def-name">statelevels</strong> <code class="def-code-arguments">(<var class="var">A</var>, <var class="var">nbins</var>, <var class="var">method</var>, <var class="var">bounds</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-statelevels-5"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">levels</var>, <var class="var">histograms</var>] =</code> <strong class="def-name">statelevels</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-statelevels-6"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">levels</var>, <var class="var">histograms</var>, <var class="var">binlevels</var>] =</code> <strong class="def-name">statelevels</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-statelevels-7"><span class="category-def">Function File: </span><strong class="def-name">statelevels</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd><p>Estimate state-level for bilevel waveform <var class="var">A</var> using histogram method
</p>
<p>INPUTS:
</p>
<dl class="table">
<dt><var class="var">A</var></dt>
<dd><p>Bylevel waveform
</p></dd>
<dt><var class="var">nbins</var></dt>
<dd><p>Number of histogram bins (100 default)
</p></dd>
<dt><var class="var">method</var></dt>
<dd><p>State-level estimation method &rsquo;mode&rsquo; (default) or &rsquo;mean&rsquo;.
</p></dd>
<dt><var class="var">bounds</var></dt>
<dd><p>2 element vector for histogram lower and upper bounds. Values outside of this will be ignored.
</p></dd>
</dl>
<p>OUTPUTS:
</p>
<dl class="table">
<dt><var class="var">levels</var></dt>
<dd><p>Levels of high and low states
</p></dd>
<dt><var class="var">histograms</var></dt>
<dd><p>Histogram counts
</p></dd>
<dt><var class="var">binlevels</var></dt>
<dd><p>Histogram bincenters
</p></dd>
</dl>
<p>If no outputs are provided, the signal and histogram will be plotted, and display the levels.
</p>
</dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Utility">
<h3 class="section" id="Utility-1">3.15 Utility</h3>
<a class="index-entry-id" id="index-Utility"></a>
<div class="subsection-level-extent" id="buffer-1">
<h4 class="subsection">3.15.1 buffer</h4>
<a class="index-entry-id" id="index-buffer-1"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-buffer-4"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">buffer</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">n</var>, <var class="var">p</var>, <var class="var">opt</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-buffer-5"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">y</var>, <var class="var">z</var>, <var class="var">opt</var>] =</code> <strong class="def-name">buffer</strong> <code class="def-code-arguments">(&hellip;)</code></dt>
<dd><p>Buffer a signal into a data frame. The arguments to <code class="code">buffer</code> are
</p>
<dl class="table">
<dt><var class="var">x</var></dt>
<dd><p>The data to be buffered.
</p>
</dd>
<dt><var class="var">n</var></dt>
<dd><p>The number of rows in the produced data buffer. This is an positive
 integer value and must be supplied.
</p>
</dd>
<dt><var class="var">p</var></dt>
<dd><p>An integer less than <var class="var">n</var> that specifies the under- or overlap
 between column in the data frame. The default value of <var class="var">p</var> is 0.
</p>
</dd>
<dt><var class="var">opt</var></dt>
<dd><p>In the case of an overlap, <var class="var">opt</var> can be either a vector of length
<var class="var">p</var> or the string &rsquo;nodelay&rsquo;. If <var class="var">opt</var> is a vector, then the
 first <var class="var">p</var> entries in <var class="var">y</var> will be filled with these values. If
<var class="var">opt</var> is the string &rsquo;nodelay&rsquo;, then the first value of <var class="var">y</var>
 corresponds to the first value of <var class="var">x</var>.
</p>
<p>In the can of an underlap, <var class="var">opt</var> must be an integer between 0 and
<code class="code">-<var class="var">p</var></code>. The represents the initial underlap of the first
 column of <var class="var">y</var>.
</p>
<p>The default value for <var class="var">opt</var> the vector <code class="code">zeros (1, <var class="var">p</var>)</code>
 in the case of an overlap, or 0 otherwise.
</p></dd>
</dl>
<p>In the case of a single output argument, <var class="var">y</var> will be padded with
 zeros to fill the missing values in the data frame. With two output
 arguments <var class="var">z</var> is the remaining data that has not been used in the
 current data frame.
</p>
<p>Likewise, the output <var class="var">opt</var> is the overlap, or underlap that might
 be used for a future call to <code class="code">code</code> to allow continuous buffering.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="clustersegment">
<h4 class="subsection">3.15.2 clustersegment</h4>
<a class="index-entry-id" id="index-clustersegment"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-clustersegment-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">clusteridx</var> =</code> <strong class="def-name">clustersegment</strong> <code class="def-code-arguments">(<var class="var">unos</var>)</code></dt>
<dd><p>Calculate boundary indexes of clusters of 1&rsquo;s.
</p>
<p>The function calculates the initial index and end index of the sequences of
 1&rsquo;s in the rows of <var class="var">unos</var>. The clusters are sought in the rows of the
 array <var class="var">unos</var>.
</p>
<p>The result is returned in a cell array of size 1-by-<var class="var">Np</var>, where <var class="var">Np</var>
 is the number of rows in <var class="var">unos</var>. Each element of the cell has two rows.
 The first row is the initial index of a sequence of 1&rsquo;s and the second row
 is the end index of that sequence.
</p>
<p>If <var class="var">Np</var> == 1 the output is a matrix with two rows.
</p>
<p>The function works by finding the indexes of jumps between consecutive
 values in the rows of <var class="var">unos</var>.
</p>
</dd></dl>
</div>
<div class="subsection-level-extent" id="fracshift">
<h4 class="subsection">3.15.3 fracshift</h4>
<a class="index-entry-id" id="index-fracshift"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-fracshift-1"><span class="category-def">Function File: </span><code class="def-type">[<var class="var">y</var>, <var class="var">h</var>] =</code> <strong class="def-name">fracshift</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">d</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-fracshift-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">fracshift</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">d</var>, <var class="var">h</var>)</code></dt>
<dd><p>Shift the series <var class="var">x</var> by a (possibly fractional) number of samples <var class="var">d</var>.
 The interpolator <var class="var">h</var> is either specified or either designed with a
 Kaiser-windowed sinecard.
</p>
<p><strong class="strong">See also:</strong> circshift.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="marcumq">
<h4 class="subsection">3.15.4 marcumq</h4>
<a class="index-entry-id" id="index-marcumq"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-marcumq-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">q</var> =</code> <strong class="def-name">marcumq</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-marcumq-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">q</var> =</code> <strong class="def-name">marcumq</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>, <var class="var">m</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-marcumq-3"><span class="category-def">Function File: </span><code class="def-type"><var class="var">q</var> =</code> <strong class="def-name">marcumq</strong> <code class="def-code-arguments">(<var class="var">a</var>, <var class="var">b</var>, <var class="var">m</var>, <var class="var">tol</var>)</code></dt>
<dd>
<p>Compute the generalized Marcum Q function of order <var class="var">m</var> with
 noncentrality parameter <var class="var">a</var> and argument <var class="var">b</var>.  If the order
<var class="var">m</var> is omitted it defaults to 1.  An optional relative tolerance
<var class="var">tol</var> may be included, the default is <code class="code">eps</code>.
</p>
<p>If the input arguments are commensurate vectors, this function
 will produce a table of values.
</p>
<p>This function computes Marcum&rsquo;s Q function using the infinite
 Bessel series, truncated when the relative error is less than
 the specified tolerance.  The accuracy is limited by that of
 the Bessel functions, so reducing the tolerance is probably
 not useful.
</p>
<p>Reference: Marcum, &quot;Tables of Q Functions&quot;, Rand Corporation.
</p>
<p>Reference: R.T. Short, &quot;Computation of Noncentral Chi-squared
 and Rice Random Variables&quot;, www.phaselockedsystems.com/publications
</p>
</dd></dl>
</div>
<div class="subsection-level-extent" id="primitive">
<h4 class="subsection">3.15.5 primitive</h4>
<a class="index-entry-id" id="index-primitive"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-primitive-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">F</var> =</code> <strong class="def-name">primitive</strong> <code class="def-code-arguments">(<var class="var">f</var>, <var class="var">t</var>, <var class="var">F0</var>)</code></dt>
<dd><p>Calculate the primitive of a function.
</p>
<p>The function approximates the primitive (indefinite integral) of the
 univariate function handle <var class="var">f</var> with constant of integration <var class="var">F0</var>.
 The output is the primitive evaluated at the points <var class="var">t</var>.  The vector
<var class="var">t</var> must be ordered and ascending.
</p>
<p>This function is a fancy way of calculating the cumulative sum,
</p>
<p><code class="command">F = cumsum (f(t).*diff (t)([1 1:end]))</code>.
</p>
<p>Example:
</p><div class="example">
<div class="group"><pre class="example-preformatted"> f = @(t) sin (2 * pi * 3 * t);
 t = [0; sort(rand (100, 1))];
 F = primitive (f, t, 0);
 t_true = linspace (0, 1, 1e3).';
 F_true = (1 - cos (2 * pi * 3 * t_true)) / (2 * pi * 3);
 plot (t, F, 'o', t_true, F_true);
</pre></div></div>
<p><strong class="strong">See also:</strong> quadgk, cumsum.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="sampled2continuous">
<h4 class="subsection">3.15.6 sampled2continuous</h4>
<a class="index-entry-id" id="index-sampled2continuous"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sampled2continuous-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">xt</var> =</code> <strong class="def-name">sampled2continuous</strong> <code class="def-code-arguments">(<var class="var">xn</var>, <var class="var">T</var>, <var class="var">t</var>)</code></dt>
<dd>
<p>Calculate the x(t) reconstructed
 from samples x[n] sampled at a rate 1/T samples
 per unit time.
</p>
<p>t is all the instants of time when you need x(t)
 from x[n]; this time is relative to x[0] and not
 an absolute time.
</p>
<p>This function can be used to calculate sampling rate
 effects on aliasing, actual signal reconstruction
 from discrete samples.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="schtrig">
<h4 class="subsection">3.15.7 schtrig</h4>
<a class="index-entry-id" id="index-schtrig"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-_0028x_002clvl_002crst_003d1_0029"><span class="category-def"><var class="var">v</var> =: </span><code class="def-type">schtrig</code> <strong class="def-name">(<var class="var">x</var>,<var class="var">lvl</var>,<var class="var">rst</var>=1)</strong></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-_0028_002e_002e_002e_0029"><span class="category-def">[<var class="var">v</var>,<var class="var">rng</var>] =: </span><code class="def-type">schtrig</code> <strong class="def-name">(&hellip;)</strong></dt>
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
</div>
<div class="subsection-level-extent" id="upsamplefill">
<h4 class="subsection">3.15.8 upsamplefill</h4>
<a class="index-entry-id" id="index-upsamplefill"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-upsamplefill-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">upsamplefill</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">v</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-upsamplefill-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">upsamplefill</strong> <code class="def-code-arguments">(&hellip;, <var class="var">copy</var>)</code></dt>
<dd><p>Upsamples a vector interleaving given values or copies of the vector elements.
</p>
<p>The values in the vector <var class="var">v</var> are placed between the elements of <var class="var">x</var>.
</p>
<p>If the optional argument <var class="var">copy</var> is <var class="var">true</var> then <var class="var">v</var> should be a
 scalar and each value in <var class="var">x</var> are repeat <var class="var">v</var> times.
</p>
<p>Example:
</p><div class="example">
<div class="group"><pre class="example-preformatted"> upsamplefill (eye (2), 2, true)
&rArr;  1   0
     1   0
     1   0
     0   1
     0   1
     0   1
 upsamplefill (eye (2), [-1 -1 -1])
&rArr;  1   0
    -1  -1
    -1  -1
    -1  -1
     0   1
    -1  -1
    -1  -1
    -1  -1
</pre></div></div>
<p><strong class="strong">See also:</strong> upsample.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="wkeep">
<h4 class="subsection">3.15.9 wkeep</h4>
<a class="index-entry-id" id="index-wkeep"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-wkeep-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">wkeep</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">l</var>)</code></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-wkeep-2"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">wkeep</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">l</var>, <var class="var">opt</var>)</code></dt>
<dd><p>Extract the elements of <var class="var">x</var> of size <var class="var">l</var> from the center, the right
 or the left.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="wrev">
<h4 class="subsection">3.15.10 wrev</h4>
<a class="index-entry-id" id="index-wrev"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-wrev-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">y</var> =</code> <strong class="def-name">wrev</strong> <code class="def-code-arguments">(<var class="var">x</var>)</code></dt>
<dd><p>Reverse the order of the element of the vector <var class="var">x</var>.
</p>
<p><strong class="strong">See also:</strong> flipud, fliplr.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="zerocrossing">
<h4 class="subsection">3.15.11 zerocrossing</h4>
<a class="index-entry-id" id="index-zerocrossing"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-zerocrossing-1"><span class="category-def">Function File: </span><code class="def-type"><var class="var">x0</var> =</code> <strong class="def-name">zerocrossing</strong> <code class="def-code-arguments">(<var class="var">x</var>, <var class="var">y</var>)</code></dt>
<dd><p>Estimates the points at which a given waveform y=y(x) crosses the
 x-axis using linear interpolation.
</p>
<p><strong class="strong">See also:</strong> fzero, roots.
</p></dd></dl>
</div>
</div>
</div>
</div>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>
<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>J. H.
McClellan, T.  W. Parks and L. R.  Rabiner, &lsquo;A Computer Program for Designing
Optimum FIR Linear Phase Digital Filters&rsquo;, IEEE Trans. Audio Electroacoust.,
vol. AU-21, 1973, pp. 506&ndash;525.</p>
<h5 class="footnote-body-heading"><a id="FOOT2" href="#DOCF2">(2)</a></h5>
<p>Tapio
Saram&auml;ki, &lsquo;Finite impulse response filter design&rsquo;, Chapter 4 in &lsquo;Handbook for
Digital Signal Processing&rsquo;, edited by S.  K. Mitra and J. F. Kaiser, John Wiley
and Sons, New York, 1993, pp. 155&ndash;277.
(<a class="url" href="https://homepages.tuni.fi/tapio.saramaki/Mitra_Kaiser.pdf">https://homepages.tuni.fi/tapio.saramaki/Mitra_Kaiser.pdf</a>)</p>
<h5 class="footnote-body-heading"><a id="FOOT3" href="#DOCF3">(3)</a></h5>
<p>K. Ichige, M.
 Iwaki, algorithm and R. Ishii, &lsquo;Accurate Estimation of Minimum Filter Length
 for Optimum FIR Digital Filters&rsquo;, IEEE Transactions on Circuits and Systems,
 Vol. 47, No. 10, 2000, pp. 1008&ndash;1017</p>
<h5 class="footnote-body-heading"><a id="FOOT4" href="#DOCF4">(4)</a></h5>
<p>K. Avci &amp; A.
 Nacaroglu, &lsquo;Exponential Window Family&rsquo;, SIPIJ Vol. 4 No. 4, August
 2013.</p>
<h5 class="footnote-body-heading"><a id="FOOT5" href="#DOCF5">(5)</a></h5>
<p>S.
 Gade &amp; H. Herlufsen, &lsquo;Windows to FFT analysis (Part I)&rsquo;, Technical Review 3,
 Bruel &amp; Kjaer, 1987</p>
</div>
