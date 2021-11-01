%��ͬ�﷽���������˹�����ľ۽�
clear;clc;
lambda=1.064e-3;
w0=0.2;
R0=1.0e30;
Mf1=[1,0;-1/50,1];
z=linspace(0,300,1000);
Mp2=1.5;
q0=1/(1/R0-j*lambda*Mp2/pi/w0^2);
L1=200; %͸����λ��
s=input('����������λ��s=');%����������λ��
wz=zeros(size(z));
for gk=1:1000
if z(gk)<=L1
M=[1,z(gk)-s;0,1];
q=(M(1,1)*q0+M(1,2))/(M(2,1)*q0+M(2,2));
wz(gk)=sqrt(-1/imag(1/q)/pi*lambda*Mp2);
elseif z(gk)>L1
M=[1,z(gk)-L1;0,1]*Mf1*[1,L1-s;0,1];
q=(M(1,1)*q0+M(1,2))/(M(2,1)*q0+M(2,2));
wz(gk)=sqrt(-1/imag(1/q)/pi*lambda*Mp2);
end
end
plot(z,wz,'b',z,-wz,'b');
title('��ͬ�﷽���������˹�����ľ۽�');
xlabel('z/mm');
ylabel('Wz/mm');
hold on;
