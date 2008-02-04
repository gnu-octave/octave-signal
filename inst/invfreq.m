% Copyright (C) 1986,2003 Julius O. Smith III
%
% This program is free software; you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2, or (at your option)
% any later version.
%
% This software is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this software; see the file COPYING.  If not, write to the Free
% Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
% 02110-1301, USA.

% usage: [B,A] = invfreq(H,F,nB,nA)
%        [B,A] = invfreq(H,F,nB,nA,W)
%        [B,A] = invfreq(H,F,nB,nA,W,[],[],plane)
%        [B,A] = invfreq(H,F,nB,nA,W,iter,tol,plane)
%
% Fit filter B(z)/A(z) or B(s)/A(s) to complex frequency response at 
% frequency points F. A and B are real polynomial coefficients of order 
% nA and nB respectively.  Optionally, the fit-errors can be weighted vs 
% frequency according to the weights W. Also, the transform plane can be
% specified as either 's' for continuous time or 'z' for discrete time. 'z'
% is chosen by default.  Eventually, Steiglitz-McBride iterations will be
% specified by iter and tol.
%
% H: desired complex frequency response
%     It is assumed that A and B are real polynomials, hence H is one-sided.
% F: vector of frequency samples in radians
% nA: order of denominator polynomial A
% nB: order of numerator polynomial B
% plane='z': F on unit circle (discrete-time spectra, z-plane design)
% plane='s': F on jw axis     (continuous-time spectra, s-plane design)
% H(k) = spectral samples of filter frequency response at points zk,
%  where zk=exp(sqrt(-1)*F(k)) when plane='z' (F(k) in [0,.5])
%     and zk=(sqrt(-1)*F(k)) when plane='s' (F(k) nonnegative)
% Example:
%     [B,A] = butter(12,1/4);
%     [H,w] = freqz(B,A,128);
%     [Bh,Ah] = invfreq(H,F,4,4);
%     Hh = freqz(Bh,Ah);
%     disp(sprintf('||frequency response error|| = %f',norm(H-Hh)));
%
% References: J. O. Smith, "Techniques for Digital Filter Design and System 
%  	Identification with Application to the Violin, Ph.D. Dissertation, 
% 	Elec. Eng. Dept., Stanford University, June 1983, page 50; or,
%
% http://ccrma.stanford.edu/~jos/filters/FFT_Based_Equation_Error_Method.html
% written by J.O. Smith, 4-23-1986
% updated for Octave on 6-11-2000
% original name: eqnerr2()
% 2003-05-10 Andrew Fitting
%    *generated invfreqz and invfreqs to better mimic matlab
%    *reorganized documentation to conform to Paul Kienzle's
%    *added 'trace' argument (doesn't work like matlab yet)
%    *added demo feature, not debugged yet
% 2003-05-16 Julius Smith <jos@ccrma.stanford.edu>
%     *final debugging
% 2007-08-03 Rolf Schirmacher <Rolf.Schirmacher@MuellerBBM.de>
%     *replaced == by strcmp() for character string comparison

% TODO: implement Steiglitz-McBride iterations
% TODO: improve numerical stability for high order filters (matlab is a bit better)
% TODO: modify to accept more argument configurations

function [B,A] = invfreq(H,F,nB,nA,W,iter,tol,tr,plane)
  n = max(nA,nB);
  m = n+1; mA = nA+1; mB = nB+1;
  nF = length(F);
  if nF ~= length(H), disp('invfreqz: length of H and F must be the same'); end;
  if nargin < 5, W = ones(1,nF); end;
  if nargin < 6, iter = []; end
  if nargin < 7  tol = []; end
  if nargin < 8, tr = ''; end
  if nargin < 9, plane = 'z'; end
  if iter~=[], disp('no implementation for iter yet'),end
  if tol ~=[], disp('no implementation for tol yet'),end
  if plane ~= 'z' & plane ~= 's', disp('invfreqz: Error in plane argument'), end

  Ruu = zeros(mB,mB); Ryy = zeros(nA,nA); Ryu = zeros(nA,mB);
  Pu = zeros(mB,1);   Py = zeros(nA,1);
  if strcmp(tr,'trace')
      disp(' ')
      disp('Computing nonuniformly sampled, equation-error, rational filter.');
      disp(['plane = ',plane]);
      disp(' ')
  end

  s = sqrt(-1)*F;
  if strcmp(plane,'z')
    if max(F)>pi || min(F)<0
      disp('hey, you frequency is outside the range 0 to pi, making my own')
      F = linspace(0,pi,length(H));
      s = sqrt(-1)*F;
    end
    s = exp(-s);
  end;
  
  for k=1:nF
    Zk = (s(k).^[0:n]).';
    Hk = H(k);
    aHks = Hk*conj(Hk);
    Rk = (W(k)*Zk)*Zk';
    rRk = real(Rk);
    Ruu = Ruu+rRk(1:mB,1:mB);
    Ryy = Ryy+aHks*rRk(2:mA,2:mA);
    Ryu = Ryu+real(Hk*Rk(2:mA,1:mB));
    Pu = Pu+W(k)*real(conj(Hk)*Zk(1:mB));
    Py = Py+(W(k)*aHks)*real(Zk(2:mA));
  end;

  R = [Ruu,-Ryu';-Ryu,Ryy];
  P = [Pu;-Py];
  Theta = R\P;

  B = Theta(1:mB)';
  A = [1 Theta(mB+1:mB+nA)'];
  if strcmp(plane,'s')
    B = B(mB:-1:1);
    A = A(mA:-1:1);
  end
endfunction

%!demo
%! order = 12; % order of test filter
%! fc = 1/2;   % sampling rate / 4
%! n = 128;    % frequency grid size
%! [B,A] = butter(order,fc);
%! [H,w] = freqz(B,A,n);
%! [Bh,Ah] = invfreq(H,w,order,order);
%! [Hh,wh] = freqz(Bh,Ah,n);
%! xlabel("Frequency (rad/sample)");
%! ylabel("Magnitude");
%! plot(w,[abs(H);abs(Hh)])
%! legend('Original','Measured');
%! err = norm(H-Hh);
%! disp(sprintf('L2 norm of frequency response error = %f',err));

