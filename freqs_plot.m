## -*- texinfo -*-
## @deftypefn {Function File} freqs_plot (@var{w}, @var{h})
## Plot the amplitude and phase of the vector @var{h}.
##
## @end deftypefn

function freqs_plot(w,h)
    n = length(w);
    mag = 20*log10(abs(h));
    phase = unwrap(arg(h));
    maxmag = max(mag);
    title('Frequency response plot by freqs');
    unwind_protect # protect graph state
      subplot(211);
      gset lmargin 10;
      axis("labely");
      ylabel("dB");
      xlabel("");
      grid("on");
      if (maxmag - min(mag) > 100) % make 100 a parameter?
      	axis([w(1), w(n), maxmag-100, maxmag]);
      else
      	axis("autoy");
      endif
      plot(w, mag, ";Magnitude (dB);");
%     semilogx(w, mag, ";Magnitude (dB);");

      subplot(212);
      axis("label");
      title("");
      grid("on");
      axis("autoy");
      xlabel("Frequency (rad/sec)");
      ylabel("Cycles");
      axis([w(1), w(n)]);
      plot(w, phase/(2*pi), ";Phase (radians/2pi);");
      
    unwind_protect_cleanup # restore graph state
      grid("off");
      axis("auto","label");
      gset lmargin;
      gset tmargin;
      oneplot();
    end_unwind_protect

endfunction
