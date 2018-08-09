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
## @defun {@var{} =} reshapemod (@var{}, @var{})
## 
## @seealso{}
## @end defun


function [IDX idxpos] = reshapemod (N, wlen)
  Nmod   = floor (N / wlen);
  dN    = N - Nmod * wlen;
  IDX    = reshape (1:(N - dN), wlen, Nmod);
  idxpos = (N - dN + 1):N;
endfunction

