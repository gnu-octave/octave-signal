## Copyright (C) 2000 Dave Cogdell <cogdelld@asme.org>
## Copyright (C) 2000 Paul Kienzle <pkienzle@users.sf.net>
##
## This program is free software; you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation; either version 3 of the License, or (at your option) any later
## version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details.
##
## You should have received a copy of the GNU General Public License along with
## this program; if not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {@var{c} =} xcorr2 (@var{a})
## @deftypefnx {Function File} {@var{c} =} xcorr2 (@var{a}, @var{b})
## @deftypefnx {Function File} {@var{c} =} xcorr2 (@dots{}, @var{scale})
## Compute the 2D cross-correlation of matrices @var{a} and @var{b}.
##
## If @var{b} is not specified, it defaults to the same matrix as @var{a}, i.e.,
## it's the same as @code{xcorr(@var{a}, @var{a})}.
##
## The optional argument @var{scale}, defines the type of scaling applied to the
## cross-correlation matrix (defaults to "none"). Possible values are:
## @itemize @bullet
## @item "biased"
##
## Scales the raw cross-correlation by the maximum number of elements of @var{a}
## and @var{b} involved in the generation of any element of @var{c}.
##
## @item "unbiased"
##
## Scales the raw correlation by dividing each element in the cross-correlation
## matrix by the number of products @var{a} and @var{b} used to generate that
## element 
##
## @item "coeff"
##
## Normalizes the sequence so that the largest cross-correlation element is
## identically 1.0.
##
## @item "none"
##
## No scaling (this is the default).
## @end itemize
## @seealso{conv2, corr2, xcorr}
## @end deftypefn

function c = xcorr2 (a, b = a, biasflag = "none")

  if (nargin < 1 || nargin > 3)
    print_usage;
  elseif (nargin == 2 && ischar (b))
    biasflag = b;
    b        = a;
  endif

  ## compute correlation
  [ma,na] = size(a);
  [mb,nb] = size(b);
  c = conv2 (a, conj (b (mb:-1:1, nb:-1:1)));

  ## bias routines by Dave Cogdell (cogdelld@asme.org)
  ## optimized by Paul Kienzle (pkienzle@users.sf.net)
  if strcmp(lower(biasflag), 'biased'),
    c = c / ( min ([ma, mb]) * min ([na, nb]) );
  elseif strcmp(lower(biasflag), 'unbiased'), 
    lo   = min ([na,nb]);
    hi   = max ([na, nb]);
    row  = [ 1:(lo-1), lo*ones(1,hi-lo+1), (lo-1):-1:1 ];

    lo   = min ([ma,mb]);
    hi   = max ([ma, mb]);
    col  = [ 1:(lo-1), lo*ones(1,hi-lo+1), (lo-1):-1:1 ]';

    bias = col*row;
    c    = c./bias;

  elseif strcmp(lower(biasflag),'coeff'),
    c = c/max(c(:))';
  else
    error ("invalid type of scale %s", biasflag);
  endif
endfunction
