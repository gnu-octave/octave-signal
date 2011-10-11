## Copyright 2007 R.G.H. Eschauzier <reschauzier@yahoo.com>
## Adapted by Carnë Draug on 2011 <carandraug+dev@gmail.com>
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
## Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

## This function is necessary for impinvar and invimpinvar of the signal package

## Inverse of Octave residue function
function [b_out, a_out] = inv_residue(r_in, p_in, k_in, tol)

  n = length(r_in); % Number of poles/residues

  k = 0; % Capture contstant term
  if (length(k_in)==1)    % A single direct term (order N = order D)
    k = k_in(1);          % Capture constant term
  elseif (length(k_in)>1) % Greater than one means non-physical system
    error("Order numerator > order denominator");
  endif

  a_out = poly(p_in);

  b_out  = zeros(1,n+1);
  b_out += k*a_out; % Constant term: add k times denominator to numerator
  i=1;
  while (i<=n)
    term   = [1 -p_in(i)];               % Term to be factored out
    p      = r_in(i)*deconv(a_out,term); % Residue times resulting polynomial
    p      = prepad(p, n+1, 0, 2);       % Pad for proper length
    b_out += p;

    m          = 1;
    mterm      = term;
    first_pole = p_in(i);
    while (i<n && abs(first_pole-p_in(i+1))<tol) % Multiple poles at p(i)
       i++; %Next residue
       m++;
       mterm  = conv(mterm, term);              % Next multiplicity to be factored out
       p      = r_in(i) * deconv(a_out, mterm); % Resulting polynomial
       p      = prepad(p, n+1, 0, 2);           % Pad for proper length
       b_out += p;
    endwhile
  i++;
  endwhile
endfunction
