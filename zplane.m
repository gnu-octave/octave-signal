## Copyright (C) 1999 Paul Kienzle
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

## usage: zplane(b [, a]) or zplane(z [, p])
##
## Plot the poles and zeros.  If the arguments are row vectors then they
## represent filter coefficients (numerator polynomial b and denominator
## polynomial a), but if they are column vectors or matrices then they
## represent poles and zeros.
##
## This is a horrid interface, but I didn't choose it; better would be
## to accept b,a or z,p,g like other functions.  The saving grace is
## that poly(x) always returns a row vector and roots(x) always returns
## a column vector, so it is usually right.  You must only be careful
## when you are creating filters by hand.
##
## Note that due to the nature of the roots() function, poles and zeros
## may be displayed as occurring around a circle rather than at a single
## point.
##
## The transfer function is
##                         
##        B(z)   b0 + b1 z^(-1) + b2 z^(-2) + ... + bM z^(-M)
## H(z) = ---- = --------------------------------------------
##        A(z)   a0 + a1 z^(-1) + a2 z^(-2) + ... + aN z^(-N)
##
##               b0          (z - z1) (z - z2) ... (z - zM)
##             = -- z^(-M+N) ------------------------------
##               a0          (z - p1) (z - p2) ... (z - pN)
##
## The denominator a defaults to 1, and the poles p defaults to [].

## 2001-03-17 Paul Kienzle
##     * extend axes to include all points outside the unit circle

## 2004-04-20 Stefan van der Walt
##     * plot correct nr of zeros at 0
##     * label nr of zeros/poles at a point
##     * use different colours for plotting each column (matrix zeros/poles)
##     * set automatic_replot to 0 for duration of demo

## TODO: Consider a plot-like interface:
## TODO:       zplane(x1,y1,fmt1,x2,y2,fmt2,...)
## TODO:    with y_i or fmt_i optional as usual.  This would allow
## TODO:    legends and control over point colour and filters of
## TODO:    different orders.
function zplane(z, p)

  if (nargin < 1 || nargin > 2)
    usage("zplane(b [, a]) or zplane(z [, p])");
  end
  if nargin < 2, p=[]; endif
  if columns(z)>1 || columns(p)>1
    if rows(z)>1 || rows(p)>1
      ## matrix form: columns are already zeros/poles
    else
      ## z -> b
      ## p -> a      
      if isempty(z), z=1; endif
      if isempty(p), p=1; endif
          
      M = length(z) - 1;
      N = length(p) - 1;
      z = [ roots(z); zeros(N - M, 1) ];
      p = [ roots(p); zeros(M - N, 1) ];
    endif
  endif

  try eleo = empty_list_elements_ok;      ##<oct
  catch eleo = 0; end;                    ##<oct
  try wele = warn_empty_list_elements;    ##<oct
  catch wele = 0; end;                    ##<oct
  unwind_protect                          ##<oct
    empty_list_elements_ok = 1;           ##<oct
    warn_empty_list_elements = 0;         ##<oct

    xmin = min([-1; real(z(:)); real(p(:))]);
    xmax = max([ 1; real(z(:)); real(p(:))]);
    ymin = min([-1; imag(z(:)); imag(p(:))]);
    ymax = max([ 1; imag(z(:)); imag(p(:))]);
    xfluff = max([0.05*(xmax-xmin), (1.05*(ymax-ymin)-(xmax-xmin))/10]);
    yfluff = max([0.05*(ymax-ymin), (1.05*(xmax-xmin)-(ymax-ymin))/10]);
    xmin = xmin - xfluff;
    xmax = xmax + xfluff;
    ymin = ymin - yfluff;
    ymax = ymax + yfluff;
  
    gset pointsize 2                      ##<oct
    axis('equal');                        ##<oct
    axis([xmin, xmax, ymin, ymax]);       ##<oct
    grid('on');                           ##<oct
    r = exp(2i*pi*[0:100]/100);           ##<oct
    plot(real(r), imag(r),";;");          ##<oct
    hold on;                              ##<oct

    text();
    plot_with_labels(z, "o");
    plot_with_labels(p, "x");
      
  unwind_protect_cleanup                  ##<oct
    empty_list_elements_ok = eleo;        ##<oct
    warn_empty_list_elements = wele;      ##<oct
    hold off;                             ##<oct
    grid("off");                          ##<oct
    axis();                               ##<oct
    gset pointsize 1                      ##<oct
    axis('normal');                       ##<oct
  end_unwind_protect                      ##<oct
  ##<mat r = exp(2i*pi*[0:100]/100);
  ##<mat plot(real(r), imag(r),'k'); hold on;
  ##<mat axis equal;
  ##<mat grid on;
  ##<mat axis(1.05*[xmin, xmax, ymin, ymax]);
  ##<mat if !isempty(p), plot(real(p), imag(p), "bx", 'MarkerSize', 10); end
  ##<mat if !isempty(z), plot(real(z), imag(z), "bo", 'MarkerSize', 10); end
  ##<mat hold off;
endfunction

function plot_with_labels(x, symbol)
  if ( !isempty(x) )

    x_u = unique(x(:));
    
    for i = 1:length(x_u)
      n = sum(x_u(i) == x(:));
      if (n > 1)
        text(real(x_u(i)), imag(x_u(i)), [" " num2str(n)]);
       endif
    endfor

    for c = 1:columns(x)
      plot(real( x(:,c) ), imag( x(:,c) ), 
           [ num2str(mod(c+1,6) + 1) symbol ";;" ]);
    endfor
    
  endif
endfunction

%!demo
%! ## construct target system:
%! ##   symmetric zero-pole pairs at r*exp(iw),r*exp(-iw)
%! ##   zero-pole singletons at s
%! pw=[0.2, 0.4, 0.45, 0.95];   #pw = [0.4];
%! pr=[0.98, 0.98, 0.98, 0.96]; #pr = [0.85];
%! ps=[];
%! zw=[0.3];  # zw=[];
%! zr=[0.95]; # zr=[];
%! zs=[];
%! 
%! ## system function for target system
%! p=[[pr, pr].*exp(1i*pi*[pw, -pw]), ps]';
%! z=[[zr, zr].*exp(1i*pi*[zw, -zw]), zs]';
%! M = length(z); N = length(p);
%! sys_a = [ zeros(1, M-N), real(poly(p)) ];
%! sys_b = [ zeros(1, N-M), real(poly(z)) ];

%! save_replot = automatic_replot;
%! automatic_replot = 0;
%! disp("The first two graphs should be identical, with poles at (r,w)=");
%! disp(sprintf(" (%.2f,%.2f)", [pr ; pw]));
%! disp("and zeros at (r,w)=");
%! disp(sprintf(" (%.2f,%.2f)", [zr ; zw]));
%! disp("with reflection across the horizontal plane");
%! subplot(231); title("transfer function form"); zplane(sys_b, sys_a);
%! subplot(232); title("pole-zero form"); zplane(z,p);

%! subplot(233); title("empty p"); zplane(z); 
%! subplot(234); title("empty a"); zplane(sys_b);
%! disp("The matrix plot has 2 sets of points, one inside the other");
%! subplot(235); title("matrix"); zplane([z, 0.7*z], [p, 0.7*p]);
%! oneplot();
%! automatic_replot = save_replot;
