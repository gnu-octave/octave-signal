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

% Usage: [B,A] = invfreqs(H,F,nB,nA)
%        [B,A] = invfreqs(H,F,nB,nA,W)
%        [B,A] = invfreqs(H,F,nB,nA,W,iter,tol,'trace')
%
% Fit filter B(s)/A(s)to the complex frequency response H at frequency
% points F.  A and B are real polynomial coefficients of order nA and nB.
% Optionally, the fit-errors can be weighted vs frequency according to
% the weights W.
% Note: all the guts are in invfreq.m
%
% H: desired complex frequency response
% F: frequency (must be same length as H)
% nA: order of the denominator polynomial A
% nB: order of the numerator polynomial B
% W: vector of weights (must be same length as F)
%
% Example:
%       B = [1/2 1];
%       A = [1 1];
%       w = linspace(0,4,128);
%       H = freqs(B,A,w);
%       [Bh,Ah] = invfreqs(H,w,1,1);
%       Hh = freqs(Bh,Ah,w);
%       plot(w,[abs(H);abs(Hh)])
%       legend('Original','Measured');
%       err = norm(H-Hh);
%       disp(sprintf('L2 norm of frequency response error = %f',err));

% 2003-05-10 Andrew Fitting
%     *built first rev of function from jos source
% 2003-05-16 Julius Smith <jos@ccrma.stanford.edu>
%     *final debugging

% TODO: check invfreq.m for todo's

function [B,A] = invfreqs(H,F,nB,nA,W,iter,tol,tr)

if nargin < 8
    tr = '';
    if nargin < 7
        tol = [];
        if nargin < 6 
            iter = [];
            if nargin < 5
                W = ones(1,length(F));
            end
        end
    end
end

% now for the real work
[B,A] = invfreq(H,F,nB,nA,W,iter,tol,tr,'s');
endfunction

%!demo
%! B = [1/2 1];
%! A = [1 1];
%! w = linspace(0,4,128);
%! H = freqs(B,A,w);
%! [Bh,Ah] = invfreqs(H,w,1,1);
%! Hh = freqs(Bh,Ah,w);
%! xlabel("Frequency (rad/sec)");
%! ylabel("Magnitude");
%! plot(w,[abs(H);abs(Hh)])
%! legend('Original','Measured');
%! err = norm(H-Hh);
%! disp(sprintf('L2 norm of frequency response error = %f',err));
