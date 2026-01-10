## Copyright (C) 2023-2026 The Octave Project Developers
##
## See the file COPYRIGHT.md in the top-level directory of this
## distribution or <https://octave.org/copyright/>.
##
## This file is part of Octave.
##
## Octave is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} wvtool (@var{w}, @dots{})
## @deftypefnx {Function File} wvtool (@dots{}, @var{options})
## @deftypefnx {Function File} wvtool (@var{title}, @dots{})
## @deftypefnx {Function File} @var{h} = wvtool (@dots{})
## Plot time and frequency domain graphs of each vector of window function
## coefficients given in @var{w} and any following arguments.  Given vectors
## must have the same length.
##
## The graphs are: (1) Time domain, (2) Frequency domain (initial
## bins), and (3) Frequency domain (all bins).  A subset of these can be selected
## by including their numbers as above as characters within the string
## argument @var{options}; for example, `13' selects only graphs (1) and (3).
##
## By default, the x-axis of graph (3) is logarithmic, to facilitate assessment of
## side-lobe roll-off (SLR) rate.  Including an `l' character in @var{options}
## changes to a linear x-axis.
##
## The layout of the graphs is set to horizontal if @var{options} contains an
## `h' character.
##
## Any other characters in @var{options} are passed to the plot command for
## graph (1) as its @var{fmt} argument (for an example, see demo number 3).
##
## A figure title can be supplied as the first given argument; alternatively
## the returned handle @var{h} provides a more general means to modify the figure.
##
## Measurements made on the window(s) are reported in the graph legends (subject
## to graph selection per above) and in the console output.
##
## To convert reported bin positions to bandwidth (in bins), multiply by 2.
## To convert bandwidth in bins to normalized bandwidth, divide by the
## window-length.
## @end deftypefn

function f=wvtool (varargin)

  if nargin < 1
    print_usage ();
  endif

  % Parse OPTIONS:
  if (L=length (varargin)) && ischar (varargin{L})
    opts=varargin{L--};
  else
    opts='';
  endif

  for c=1:3
    t = num2str (c);
    plots(c) = any (opts==t);
    opts = erase (opts,t);
  endfor
  
  if !sum (plots)
    plots = [1 1 1];
  endif

  hz = any (opts=='h');
  sp = sum (plots)*10^(2-hz)+10^(1+hz);
  opts = erase (opts,'h');
  
  lin=any (opts=='l');
  opts=erase (opts,'l');

  orient = ifelse (hz, 'vertical','horizontal');
  xbrk = ifelse (hz, '\n' , ' ');

  if ischar (varargin{l=1})
    Title=varargin{l++};
  else
    Title='';
  endif

  if l > L
    print_usage ();
  endif

  % Store input vectors in W:
  for k=l:L
    W(:,k+1-l) = double (varargin{k}(:));
  endfor
  if length (W)<3 || !max (W)
    error ('wvtool: W must be a non-zero vector with length>2');
  endif
  m = length (W./=max (W));

  # Time-domain -> frequency-domain:
  t = ceil (log2 (m));
  L = 2^(t+max ([min([23-t 6]) 1]));
  x = m/2/L*(0:L);
  y = 20*log10 (abs (fft (W./sum (W),2*L)));
  y = max (y,-300); % Below this level is likely noise.

  # Main- and side-lobe analysis:
  dy = y - circshift (y,-1);
  y = y(1:L+1,:);
  xmax = min ([m/2-.01 15]); % for plot #2
  inset3 = inset2 = inset1 ={};

  for k=1:size (dy)(2)
    t = dy(:,k)+eps*(dy(:,k)==0);
    idx = (find (t(1:L+1).*circshift (t,-1)(1:L+1)<0))';
    if length (idx)<3
      t = dy(:,k);
      t = t-circshift (t,-1);
      t = t+eps*(t==0);
      idx = (find (t(1:L).*circshift (t,k)(1:L)<0))';
      if length (idx)<3
        idx=[1:64:L];
      endif
    endif

    if idx(1)!=1
      idx=[1 idx];
    endif

    while y(idx(2)) > 0
      idx(2)=[];
    endwhile

    firstNullIdx = idx(2);
    firstNull = x(firstNullIdx);
    idx = idx(1:2:end); % Indices of peaks.
    allPeaks = peaks = y(idx0=idx,k);

    t=1; its=6;
    while t && length (idx)>2 && its-- % Extract upper envelope of peaks:
      t = 1+find ((peaks(1:end-2)>peaks(2:end-1))&(peaks(3:end)>peaks(2:end-1)));
      peaks(t)=[];
      idx(t)=[];
    endwhile
    idx(1) = [];
    peaks(1) = [];

    if length (idx)>1
      t = interp1 (t=log2 (x(idx)),peaks',xp=linspace (t(1),t(end),(ho=15)*6),'spline');
      dp = diff (t)/(xp(2)-xp(1));
      ddp = diff (dp);
      w = sin(pi/2/ho*[0:2*ho])+.105;
      w/=sum (w);
      d2 = sqrt (conv (ddp.^2,w)(1+2*ho:end-2*ho));
      t = 1+[find((d2(1:end-2)>d2(2:end-1))&(d2(3:end)>d2(2:end-1))) floor(length(d2)/2)];
      [val pos] = min (d2(t));
      pos = t(pos);
      slr = -dp(pos+1+ho);
      slls(k) = max (allPeaks(2:end));
      minSll(k) = min (allPeaks);
      minInitialSll(k)=min ([slls(k) y(idx(find (x(idx)<=xmax)),k)']);
      inset3(k)=sprintf ('%.1f, %.1f', slls(k), slr);
    else
      inset3(k) = 'NaN, NaN';
      minSll(k) = minInitialSll(k)=slls(k)=y(idx(1)); val=slr=nan;
    endif

    inset2(k) = sprintf ('%.3g, %.3g', dB3_pt=x(find (y(:,k)<-3,1)), firstNull);
    pwr = 10.^(y(:,k)/10);
    inset1(k) = sprintf ('%.2g', leakage=sum (pwr(firstNullIdx:end))/sum (pwr)*100);
    if k==1
      printf ('|WVTOOL|  m=%i%s%s\n', m, ifelse (length (Title), '; ', ''), Title);
      printf ('Leakage  3dB point  1st null   Side-lobe  ~SLR, slew\n');
      printf ('   %%       @ bin      @ bin    level dBc   dB/octave\n');
      printf ('-------  ---------  ---------  ---------  -----------\n');
    endif
    printf ('%7.2g%9.3g%10.3g%12.1f%8.1f, %.2f\n',leakage,dB3_pt,firstNull,slls(k),slr,val);
  endfor

  # Plots:
  f = gcf();
  if strcmp (get (0, "defaultfigurevisible"), "on")
    f = figure(f);
  endif
  pos = get (f,'position');
  X = [560 920];
  pos(3) = ifelse (pos(3)==X(2-hz),X(1+hz),pos(3));
  set (f,'Name','Window Visualization Tool','position', pos);
  clf;

  if plots(1)
    mn = min (min (W));
    mx = max (max (W));
    md = (mx-mn)/ifelse (hz,26,13);
    md += md<eps;
    subplot (++sp); plot (linspace (-.5,.5,m),W,opts); axis ([-.52 .52 mn-md mx+md]);
    ylabel (ifelse (hz || sum (plots)<3, 'Normalized amplitude', sprintf ('Normalized\namplitude')));
    xlabel (sprintf (sprintf ('Time period.%sInset: leakage %%%%', xbrk)));
    legend (inset1, 'location', 'south', 'orientation', orient); grid on;
  endif

  sll=max (slls); ymax=max ([0 sll])+4;

  if plots(2)
    subplot (++sp); plot (x,y); axis ([0 xmax (t=min(minInitialSll))+min([t/4 -15]) ymax]);
    ylabel ('dBc'); xlabel (sprintf (sprintf ('Frequency bins (detail);%sinset: 3dB pt., 1st null', xbrk)));
    legend (inset2, 'location', 'northeast', 'orientation', orient); grid on;
  endif

  if plots(3)
    ymin = max ([min(minSll) sll-140]);
    subplot (++sp); ifelse (lin, @plot, @semilogx) (x(2:end), y(2:end,:)); axis ([.1 m/2 ymin+min([ymin/5 -15]) ymax]);
    ylabel ('dBc'); xlabel (sprintf (sprintf ('Frequency bins. Inset:%sSLL dBc,SLR dB/octave',xbrk)));
    legend (inset3, 'location', 'southwest'); grid on;
  endif

  if Title
    axes ('visible','off','title', Title);
  endif

endfunction

%% Test input validation:
%!error wvtool
%!error wvtool (0)
%!error wvtool ([1 1])

%!demo wvtool ('Bartlett window', bartlett (200));
%!demo wvtool ('hamming, ultrwin, hann, bohmanwin', hamming (m=2000), ultrwin (m,2,7/3), hann (m), bohmanwin (m));
%!demo h=wvtool (taylorwin (m=40,2,-5), chebwin (m,40), expwin (m,-40), '12h-*');
%! axes (h,'visible','off','title', 'Example of using wvtool options');
