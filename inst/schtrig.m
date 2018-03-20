## Copyright (C) 2012 Juan Pablo Carbajal <carbajal@ifi.uzh.ch>
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
## @deftypefn {@var{v} =} schtrig (@var{x},@var{lvl},@var{rst}=1)
## @deftypefnx {[@var{v},@var{rng}] =} schtrig (@dots{})
## Implements a multisignal Schmitt trigger with levels @var{lvl}.
##
## The triger works along the first dimension of the 2-dimensional array @var{x}.
## It compares each column in @var{x} to the levels in @var{lvl}, when the
## value is higher @code{max (@var{lvl})} the output @var{v} is high (i.e. 1); when the
## value is below @code{min (@var{lvl})} the output is low (i.e. 0); and when
## the value is between the two levels the output retains its value.
##
## The threshold levels are passed in the array @var{lvl}. If this is a scalar,
## the thresholds are symmetric around 0, i.e. @code{[-lvl lvl]}.
##
## The second output argument stores the ranges in which the output is high, so
## the indexes @var{rng(1,i):rng(2,i)} point to the i-th segment of 1s in @var{v}.
## See @code{clustersegment} for a detailed explanation.
##
## The function conserves the state of the trigger across calls (persistent variable).
## If the reset flag is active, i.e. @code{@var{rst}== true}, then the state of
## the trigger for all signals is set to the low state (i.e. 0).
##
## Example:
## @example
## x = [0 0.5 1 1.5 2 1.5 1.5 1.2 1 0 0].';
## y = schtrig (x, [1.3 1.6]);
## disp ([x y]);
##   0.0   0
##   0.5   0
##   1.0   0
##   1.5   0
##   2.0   1
##   1.5   1
##   1.5   1
##   1.2   0
##   1.0   0
##   0.0   0
##   0.0   0
## @end example
##
## Run @code{demo schtrig} to see further examples.
##
## @seealso{clustersegment}
## @end deftypefn

function [v rg] = schtrig (x, lvl, rst = true)

  if (length (ndims (x)) > 2)
    error ('Octave:invalid-input-arg', 'The input should be two dimensional.');
  endif
  if (length (ndims (lvl)) > 2)
    error ('Octave:invalid-input-arg', 'Only a maximum of two threshold levels accepted.');
  endif

  [nT nc] = size (x);

  persistent st0;
  if (rst || isempty (st0))
    st0 = zeros (1,nc);
  endif

  if (length(lvl) == 1)
    lvl = abs (lvl) .* [1 -1];
  else
    lvl = sort (lvl,'descend');
  endif

  v      = NA (nT, nc);
  v(1,:) = st0;

  ## Signal is above up level
  up    = x > lvl(1);
  v(up) = 1;

  ## Signal is below down level
  dw    = x < lvl(2);
  v(dw) = 0;

  ## Resolve intermediate states
  ## Find data between the levels
  idx    = isnan (v);
  ranges = clustersegment (idx');
  if (nc == 1)
    ranges = {ranges};
  endif

  for i=1:nc
    ## Record the state at the beginning of the interval between levels
    if (!isempty (ranges{i}))
      prev         = ranges{i}(1,:)-1;
      prev(prev<1) = 1;
      st0          = v(prev,i);

      ## Copy the initial state to the interval
      ini_idx = ranges{i}(1,:);
      end_idx = ranges{i}(2,:);
      for j =1:length(ini_idx)
        v(ini_idx(j):end_idx(j),i) = st0(j);
      endfor
    endif
  endfor

  st0 = v(end,:);

endfunction

%!demo
%! t = linspace(0,1,100)';
%! x = sin (2*pi*2*t) + sin (2*pi*5*t).*[0.8 0.3];
%!
%! lvl = [0.8 0.25]';
%! v   = schtrig (x,lvl);
%!
%! subplot(2,1,1)
%! h = plot (t, x(:,1), t, v(:,1));
%! set (h, 'linewidth',2);
%! line([0; 1],lvl([1; 1]),'color','g');
%! line([0;1],lvl([2;2]),'color','k')
%! axis tight
%!
%! subplot(2,1,2)
%! h = plot (t, x(:,2), t, v(:,2));
%! set (h,'linewidth',2);
%! line([0; 1],lvl([1; 1]),'color','g');
%! line([0;1],lvl([2;2]),'color','k')
%! axis tight

# TODO add tests
