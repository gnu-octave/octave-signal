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
## The denominator a defaults to 1, and the poles p defaults to [].
## Either way no poles are displayed.

## 2001-03-17 Paul Kienzle
##     * extend axes to include all points outside the unit circle

## TODO: Give some indication of the number of poles or zeros at a 
## TODO:    specific point.  Affixing a x3 or something similar beside 
## TODO:    three identical poles for example would be useful.
## TODO: Use different colors for different columns of the matrix for
## TODO:    compatibility if no other reason
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
      if isempty(z), z=1; endif
      if isempty(p), p=1; endif
      [z, p, g] = tf2zp(z, p);
    endif
  endif

  eleo = empty_list_elements_ok;          ##<oct
  unwind_protect                          ##<oct
    empty_list_elements_ok = 1;           ##<oct

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
    if !isempty(z),                       ##<oct
      plot(real(z), imag(z), "bo;;");     ##<oct
    endif                                 ##<oct
    if !isempty(p),                       ##<oct
      plot(real(p), imag(p), "bx;;");     ##<oct
    endif                                 ##<oct
  unwind_protect_cleanup                  ##<oct
    empty_list_elements_ok = eleo;        ##<oct
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
%! save_empty_list_elements_ok = empty_list_elements_ok;      ##<oct
%! unwind_protect
%!   empty_list_elements_ok = 1;                              ##<oct
%!   ## system function for target system
%!   p=[[pr, pr].*exp(1i*pi*[pw, -pw]), ps]';
%!   z=[[zr, zr].*exp(1i*pi*[zw, -zw]), zs]';
%! unwind_protect_cleanup
%!   empty_list_elements_ok = save_empty_list_elements_ok;    ##<oct
%! end_unwind_protect
%! sys_a = real(poly(p));
%! sys_b = real(poly(z));

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
