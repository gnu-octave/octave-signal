## Copyright (C) 1996, 1998, 2000, 2003, 2004, 2005, 2006, 2007 Auburn University
## Copyright (C) 2012 Lukas F. Reichlin <lukas.reichlin@gmail.com>
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
## @deftypefn {Function File} {[@var{z}, @var{p}, @var{k}] =} tf2zp (@var{num}, @var{den})
## Convert transfer functions to poles-and-zero representations.
##
## Returns the zeros and poles of the system defined
## by @var{num}/@var{den}.
## @var{k} is a gain associated with the system zeros.
## @end deftypefn

## Author: A. S. Hodel <a.s.hodel@eng.auburn.edu>

function [z, p, k] = tf2zp (varargin)

  if (nargin == 0)
    print_usage ();
  endif

  [z, p, k] = zpkdata (tf (varargin{:}), "vector");

endfunction

%!error [b, a] =  eqtflength ();
%!error [b, a] =  eqtflength (1);

%!test
%! b = [2 3];
%! a = [1 1/sqrt(2) 1/4];
%! 
%! [b,a] = eqtflength(b,a);
%! [z,p,k] = tf2zp(b,a);
%! assert(z, [-1.5; 0]);
%! assert(p, [ -0.3536 + 0.3536i; -0.3536 - 0.3536i], 1/1e4);
%! assert(k, 2);

