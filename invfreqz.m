% Copyright (C) 1986,2003 Julius O. Smith III
%
% This program is free software; you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2, or (at your option)
% any later version.
%
% Octave is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Octave; see the file COPYING.  If not, write to the Free
% Software Foundation, 59 Temple Place - Suite 330, Boston, MA
% 02111-1307, USA.

% usage: [B,A] = invfreqz(H,F,nA,nB)
%        [B,A] = invfreqz(H,F,nA,nB,W)
%        [B,A] = invfreqz(H,F,nA,nB,W,iter,tol,'trace')
%
% Fit filter B(z)/A(z)to the complex frequency response H at frequency
% points F.  A and B are real polynomial coefficients of order nA and nB.
% Optionally, the fit-errors can be weighted vs frequency according to
% the weights W.
% Note: all the guts are in invfreq.m
%
% H: desired complex frequency response
% F: normalized frequncy (0 to pi) (must be same length as H)
% nA: order of the denominator polynomial A
% nB: order of the numerator polynomial B
% W: vector of weights (must be same length as F)
%
% Example:
%     [B,A] = butter(12,1/4);
%     [H,w] = freqz(B,A,128);
%     [Bh,Ah] = invfreq(H,F,4,4);
%     Hh = freqz(Bh,Ah);
%     disp(sprintf('||frequency response error|| = %f',norm(H-Hh)));

% 2003-05-10 Andrew Fitting
%     *built first rev of function from jos source
% 2003-05-16 Julius Smith <jos@ccrma.stanford.edu>
%     *final debugging

% TODO: check invfreq.m for todo's

function [B,A] = invfreqz(H,F,nB,nA,W,iter,tol,tr)

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
[B,A] = invfreq(H,F,nB,nA,W,iter,tol,tr,'z');
endfunction

%!demo
%! order = 12; % order of test filter
%! fc = 1/2;   % sampling rate / 4
%! n = 128;    % frequency grid size
%! [B,A] = butter(order,fc);
%! [H,w] = freqz(B,A,n);
%! [Bh,Ah] = invfreqz(H,w,order,order);
%! [Hh,wh] = freqz(Bh,Ah,n);
%! xlabel("Frequency (rad/sample)");
%! ylabel("Magnitude");
%! plot(w,[abs(H);abs(Hh)])
%! legend('Original','Measured');
%! err = norm(H-Hh);
%! disp(sprintf('L2 norm of frequency response error = %f',err));

