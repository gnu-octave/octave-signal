## Copyright (C) 2001 Paulo Neis
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
## along with this program; If not, see <http://www.gnu.org/licenses/>.

clc
disp('---------------------------> NELLIP 0.2 EXAMPLE <-------------------------')
x=input("Let's calculate the filter order: [ENTER]");
disp("")
x=input("[n, Ws] = ellipord([.1 .2],.4,1,90); [ENTER]");
[n, Ws] = ellipord([.1 .2],.4,1,90)
disp("")
x=input("Let's calculate the filter: [ENTER]");
disp("")
x=input("[b,a]=ellip(5,1,90,[.1,.2]);  [ENTER]");
[b,a]=ellip(5,1,90,[.1,.2])
disp("")
x=input("Let's calculate the frequency response: [ENTER]");
disp("")
x=input("[h,w]=freqz(b,a);  [ENTER]");
[h,w]=freqz(b,a);

xlabel("Frequency");
ylabel("abs(H[w])[dB]");
axis([0,1,-100,0]);
plot(w./pi, 20*log10(abs(h)), ';;')

hold('on');
x=ones(1,length(h));
plot(w./pi, x.*-1, ';-1 dB;')
plot(w./pi, x.*-90, ';-90 dB;')
hold('off');

xlabel("")
ylabel("")
clc
