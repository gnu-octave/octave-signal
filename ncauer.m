## Copyright (C) 2001 Paulo Neis
##
## This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
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
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
## 
## References: 
##
## Serra, Celso Penteado, Teoria e Projeto de Filtros, Campinas: CARTGRAF, 1983.
## Author: p_neis@yahoo.com.br

## usage: [Zz, Zp, Zg] = ncauer(Rp, Rs, ws)
##
##Calcula o protótipo analógico normalizado do filtro cauer.
##[z, p, g]=ncauer(Rp, Rs, ws)
##Rp = ripple da banda de passagem
##Rs = ripple da banda de rejeicao
##Ws = inicio da banda de rejeicao

function [zer, pol, T0]=ncauer(Rp, Rs, ws)
wp=1;	#Definir a frequência de corte normalizada 1.
k=wp/ws;
k1=sqrt(1-k^2);
q0=(1/2)*((1-sqrt(k1))/(1+sqrt(k1)));
##Calculo do "q":
q= q0 + 2*q0^5 + 15*q0^9 + 150*q0^13; %(....)
##Calculo do D:
D=(10^(0.1*Rs)-1)/(10^(0.1*Rp)-1);
##Calculo da ordem do filtro:
n=ceil(log10(16*D)/log10(1/q))
##Calculo do lambda:
l=(1/(2*n))*log((10^(0.05*Rp)+1)/(10^(0.05*Rp)-1));
##Calculo do sigma0:
sig01=0; sig02=0;
for m=0 : 30
	sig01=sig01+(-1)^m * q^(m*(m+1)) * sinh((2*m+1)*l); 
end
for m=1 : 30
	sig02=sig02+(-1)^m * q^(m^2) * cosh(2*m*l); 
end
sig0=abs((2*q^(1/4)*sig01)/(1+2*sig02));
##Calculo de w
w=sqrt((1+k*sig0^2)*(1+sig0^2/k));
#
if rem(n,2)
	r=(n-1)/2;
else
	r=n/2;
end
#
wi=zeros(1,r);
for ii=1 : r
	if rem(n,2)
		mu=ii;
	else
		mu=ii-1/2;
	end
	soma1=0;
	for m=0 : 30
		soma1 = soma1 + 2*q^(1/4) * ((-1)^m * q^(m*(m+1)) * sin(((2*m+1)*pi*mu)/n));
	end
	soma2=0;
	for m=1 : 30
		soma2 = soma2 + 2*((-1)^m * q^(m^2) * cos((2*m*pi*mu)/n));
	end
	wi(ii)=(soma1/(1+soma2));
end
#
Vi=sqrt((1-(k.*(wi.^2))).*(1-(wi.^2)/k));
A0i=1./(wi.^2);
sqrA0i=1./(wi);
B0i=((sig0.*Vi).^2 + (w.*wi).^2)./((1+sig0^2.*wi.^2).^2);
B1i=(2 * sig0.*Vi)./(1 + sig0^2 * wi.^2);
##Ganho T0:
if rem(n,2)
	T0=sig0*prod(B0i./A0i)*sqrt(ws);
else
	T0=10^(-0.05*Rp)*prod(B0i./A0i);
end
##zeros:
	zer=[i*sqrA0i, -i*sqrA0i];
##polos:
pol=[(-2*sig0*Vi+2*i*wi.*w)./(2*(1+sig0^2*wi.^2)), (-2*sig0*Vi-2*i*wi.*w)./(2*(1+sig0^2*wi.^2))];
##Se n impar, existe um polo em -sig0:
if rem(n,2)
        pol=[pol, -sig0];
end
##Desnormalização
pol=(sqrt(ws)).*pol;
zer=(sqrt(ws)).*zer;
endfunction
