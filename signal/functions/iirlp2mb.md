---
layout: "default"
permalink: "/functions/8_iirlp2mb/"
pkg_name: "signal"
pkg_version: "1.4.7"
pkg_description: "Signal processing tools, including filtering, windowing and display functions."
title: "Signal Toolkit - iirlp2mb"
category: "Utility"
func_name: "iirlp2mb"
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
<pre> IIR Low Pass Filter to Multiband Filter Transformation

 [Num,Den,AllpassNum,AllpassDen] = iirlp2mb(B,A,Wo,Wt)
 [Num,Den,AllpassNum,AllpassDen] = iirlp2mb(B,A,Wo,Wt,Pass)

 Num,Den:               numerator,denominator of the transformed filter
 AllpassNum,AllpassDen: numerator,denominator of allpass transform,
 B,A:                   numerator,denominator of prototype low pass filter
 Wo:                    normalized_angular_frequency/pi to be transformed
 Wt:                    [phi=normalized_angular_frequencies]/pi target vector
 Pass:                  This parameter may have values 'pass' or 'stop'.  If
                        not given, it defaults to the value of 'pass'.

 With normalized ang. freq. targets 0 < phi(1) <  ... < phi(n) < pi radians

 for Pass == 'pass', the target multiband magnitude will be:
       --------       ----------        -----------...
      /        \     /          \      /            .
 0   phi(1) phi(2)  phi(3)   phi(4)   phi(5)   (phi(6))    pi

 for Pass == 'stop', the target multiband magnitude will be:
 -------      ---------        ----------...
        \    /         \      /           .
 0   phi(1) phi(2)  phi(3)   phi(4)  (phi(5))              pi

 Example of use:
 [B, A] = butter(6, 0.5);
 [Num, Den] = iirlp2mb(B, A, 0.5, [.2 .4 .6 .8]);
</pre>
