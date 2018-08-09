## Copyright (C) 2018 Juan Pablo Carbajal
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program. If not, see <http://www.gnu.org/licenses/>.

## Author: Juan Pablo Carbajal <ajuanpi+dev@gmail.com>
## Created: 2018-08-09

## -*- texinfo -*-
## @defun {@var{} =} movfun (@var{}, @var{})
## 
## @seealso{}
## @end defun

function y = movfun (func, x, wlen, bc = 'open')
  persistent dispatch;

  if (isempty (dispatch))
    dispatch = struct ();
    valid_bc = {'open', 'periodic', 'fixed', 'zero', 'discard'};
    for k = valid_bc
      cmd = sprintf ('dispatch.%s = @%s_bc;', k{1}, k{1});
      eval (cmd);
    endfor
  endif

  N    = size (x, 1);
  IDX  = reshapemod (N, wlen);
  
  hwlen      = (wlen - 1) / 2;
  idxpre     = 1:hwlen;
  idxpos     = IDX(end-hwlen):N;
  IDX(:,end) = [];

  # process center part
  y = zeros (size (x));
  ctr = hwlen + 1;
  for i = 0:(wlen-1)
    y(IDX(ctr,:)+i) = func (x(IDX+i));
  endfor

  # process remainders
  # obtain function for boundary conditions
  bcfunc = dispatch.(bc);

  win       = -hwlen:hwlen;
  y(idxpre) = bcfunc (func, x, idxpre, win);
  y(idxpos) = bcfunc (func, x, idxpos, -fliplr (win));

endfunction

function y = open_bc (func, x, idxp, win)
    N = length (x);
    for i = 1:length(idxp)
      idx                          = idxp(i) + win;
      idx( (idx < 1) | (idx > N) ) = [];
      y(i)                         = func (x(idx));
    endfor
endfunction

function y = periodic_bc (func, x, idxp, win)
    N = length (x);
    for i = 1:length(idxp)
      idx     = idxp(i) + win;
      tf      = idx < 1;
      idx(tf) = N - idx(tf);
      tf      = idx > N;
      idx(tf) = idx(tf) - N;
      y(i)    = func (x(idx));
    endfor
endfunction

function y = fixed_bc (func, x, idxp, win)
    N = length (x);
    for i = 1:length(idxp)
      idx          = idxp(i) + win;
      idx(idx < 1) = 1;
      idx(idx > N) = N;
      y(i)         = func (x(idx));
    endfor
endfunction

function y = zero_bc (func, x, idxp, win)
    N = length (x);
    wlen = length (win);
    if (min (idxp) == 1)
      x = prepad (x, N + wlen);
    elseif (max (idxp) == N)
      x = postpad (x, N + wlen);
      wlen = -wlen;
    endif

    for i = 1:length(idxp)
      idx = idxp(i) + wlen + win;
      y(i) = func (x(idx));
    endfor
endfunction

function y = discard_bc (func, x, idxp, win)
    y = nan (length(idxp),1);
endfunction

%!demo
%! t  = 2 * pi * linspace (0,1,100).';
%! x  = sin (3 * t);
%! xn = x + 0.1 * randn (size (x));
%! x_o = mvnfunc (@mean, xn, 5, 'open');
%! x_p = mvnfunc (@mean, xn, 5, 'periodic');
%! x_f = mvnfunc (@mean, xn, 5, 'fixed');
%! x_z = mvnfunc (@mean, xn, 5, 'zero');
%! x_d = mvnfunc (@mean, xn, 5, 'discard');
%!
%! figure (), clf
%!    h = plot (
%!              t, xn, 'o;noisy signal;',
%!              t, x, '-;true;', 
%!              t, x_o, '-;open;', 
%!              t, x_p, '-;periodic;', 
%!              t, x_f, '-;fixed;', 
%!              t, x_z, '-;zero;',
%!              t, x_d, '-;discard;');
%!    set (h(1), 'markerfacecolor', 'auto');
%!    set (h(2:end), 'linewidth', 3);
%!    axis tight
%!    xlabel ('time')
%!    ylabel ('signal')

%!demo
%! t  = 2 * pi * linspace (0,1,100).';
%! x  = sin (3 * t);
%! xn = x + 0.1 * randn (size (x));
%! nw = 5;
%! x_ = zeros (size(x,1), nw);
%! w = 3 + (1:nw) * 4;
%! for i=1:nw
%!    x_(:,i) = mvnfunc (@mean, xn, w(i), 'periodic');
%!  endfor
%!
%! figure (), clf
%!    h = plot (
%!              t, xn, 'o',
%!              t, x, '-', 
%!              t, x_, '-');
%!    set (h(1), 'markerfacecolor', 'auto');
%!    set (h(2:end), 'linewidth', 3);
%!    axis tight
%!    xlabel ('time')
%!    ylabel ('signal')
%!    legend (h, {'noisy', 'true', strsplit(num2str(w)){:}});
