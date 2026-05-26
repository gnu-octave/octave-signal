## Copyright (C) 1999, 2001 Paul Kienzle <pkienzle@users.sf.net>
## Copyright (C) 2004 Stefan van der Walt <stefan@sun.ac.za>
## Copyright (C) 2019 Mike Miller
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; see the file COPYING. If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} {} zplane (@var{z}, @var{p})
## @deftypefnx {Function File} {} zplane (@var{b}, @var{a})
## @deftypefnx {Function File} {[hz, hp, ht] =} zplane (___)
## Plot the poles and zeros on a complex plane.  If the arguments are column
## vectors @var{z} and @var{p}, the complex zeros @var{z} and poles @var{p}
## are displayed. If the arguments are row vectors @var{b} and @var{a}, the
## zeros and poles of the transfer function represented by these filter
## coefficients are displayed.
##
## If @var{z} and @var{p} are matrices, the columns are distinct sets of zeros
## and poles and are displayed together in distinct colors.
##
## Note that due to the nature of the @code{roots} function, poles and zeros
## may be displayed as occurring around a circle rather than at a single
## point.
##
## The transfer function is
##
## @example
## @group
##        B(z)   b0 + b1 z^(-1) + b2 z^(-2) + ... + bM z^(-M)
## H(z) = ---- = --------------------------------------------
##        A(z)   a0 + a1 z^(-1) + a2 z^(-2) + ... + aN z^(-N)
##
##               b0          (z - z1) (z - z2) ... (z - zM)
##             = -- z^(-M+N) ------------------------------
##               a0          (z - p1) (z - p2) ... (z - pN)
## @end group
## @end example
##
## If called with only one argument, the poles @var{p} defaults to an empty
## vector, and the denominator coefficient vector @var{a} defaults to 1.
##
## If output variables are provided, hz is the handle to the zero lines, hp is the handle to the pole lines
## of the pole-zero plot. ht is a vector of handles to the axes/unit circle line and to text objects.
## If there are no zeros or no poles, hz or hp is the empty matrix, [].
## @end deftypefn

## FIXME: Consider a plot-like interface:
##           zplane(x1,y1,fmt1,x2,y2,fmt2,...)
##        with y_i or fmt_i optional as usual.  This would allow
##        legends and control over point color and filters of
##        different orders.

function [hz_out, hp_out, ht_out] = zplane(z, p = [])

  if (nargin < 1 || nargin > 2)
    print_usage;
  endif
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

  r = exp (2i * pi * [0:100] / 100);

  if (nargout > 0)
    hz_out = [];
    hp_out = [];
    ht_out = [];
  endif

  htp = plot (real (r), imag (r), "k", 'HandleVisibility','off');
  axis equal;
  grid on;
  axis (1.05 * [xmin, xmax, ymin, ymax]);

  hold on;
  [hz, htz] = plot_with_labels (z, "o");
  [hp, htp] = plot_with_labels (p, "x");
  hold off;
  hxl = xlabel ("Real Part");
  hyl = ylabel ("Imaginary Part");
  htt = title ("Pole-Zero Plot");

 if (nargout > 0)
   hz_out = hz;
   hp_out = hp;
 endif
 if (nargout > 2)
    # return all the handles
    ht_out = [htp; hxl; hyl; htt; htz(:); htp(:)];
  endif

endfunction

function [hplot, htext] = plot_with_labels (x, symbol)

  hplot = [];
  htext = [];

  if (! isempty(x))
    colors = get (gca (), "colororder");
    for c = 1:columns (x)
      color = colors(mod (c-1, rows (colors))+1, :);
      hplot(end+1,1) = plot (real (x(:,c)), imag (x(:,c)), "color", color, ...
            "linestyle", "none", "marker", symbol);

      x_u = unique (x(:,c));
      for i = 1:length (x_u)
        n = sum (abs(x_u(i) - x(:,c)) < eps);
        if (n > 1)
          label = sprintf ("  %d", n);
          htext(end+1,1) = text (real (x_u(i)), imag (x_u(i)), label, "color", color);
        endif
      endfor
    endfor
  endif

endfunction

%!demo
%! ## construct target system:
%! ##   symmetric zero-pole pairs at r*exp(iw),r*exp(-iw)
%! ##   zero-pole singletons at s
%! pw = [0.2, 0.4, 0.45, 0.95];   # pw = [0.4];
%! pr = [0.98, 0.98, 0.98, 0.96]; # pr = [0.85];
%! ps = [];
%! zw = [0.3];  # zw=[];
%! zr = [0.95]; # zr=[];
%! zs = [];
%!
%! ## system function for target system
%! p = [[pr, pr] .* exp(1i * pi * [pw, -pw]), ps]';
%! z = [[zr, zr] .* exp(1i * pi * [zw, -zw]), zs]';
%! M = length(z);
%! N = length(p);
%! sys_a = [zeros(1, M-N), real(poly(p))];
%! sys_b = [zeros(1, N-M), real(poly(z))];
%!
%! disp ("The first two graphs should be identical, with poles at (r,w) =");
%! disp (sprintf(" (%.2f,%.2f)", [pr; pw]));
%! disp ("and zeros at (r,w) =");
%! disp (sprintf(" (%.2f,%.2f)", [zr; zw]));
%! disp ("with reflection across the horizontal axis");
%!
%! subplot (2, 3, 1);
%! zplane (sys_b, sys_a);
%! title ("Transfer function form");
%!
%! subplot (2, 3, 2);
%! zplane (z, p);
%! title ("Zero pole form");
%!
%! subplot (2, 3, 3);
%! zplane (z);
%! title ("Zeros only, p=[]");
%!
%! subplot (2, 3, 4);
%! zplane (sys_b);
%! title ("Numerator only, a=1");
%!
%! disp ("The matrix plot has 2 sets of points, one inside the other");
%! subplot (2, 3, 5);
%! zplane ([z, 0.7*z], [p, 0.7*p]);
%! title ("Matrix of zeros and poles");

%!error zplane()
%!error zplane([1], [2], [3])

%!test
%! hf = figure ("visible", "off");
%! unwind_protect
%!   [z,p,k] = ellip(4,3,30,200/500);
%!   [hz, hp, ht] = zplane (z, p);
%!   assert (all (ishghandle (hz)));
%!   assert (all (ishghandle (hp)));
%!   assert (all (ishghandle (ht)));
%! unwind_protect_cleanup
%!   close (hf);
%! end_unwind_protect

%!test
%! hf = figure ("visible", "off");
%! unwind_protect
%!   [hz, hp, ht] = zplane ([1; 1], []);
%!   assert (numel (hz), 1);
%!   assert (isempty (hp));
%!   assert (! isempty (ht));
%! unwind_protect_cleanup
%!   close (hf);
%! end_unwind_protect
