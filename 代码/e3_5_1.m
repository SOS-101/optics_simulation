% ƽ͹͸������׷��
clear;clc;
clear all;
n=1.5062;%1064nm ���������ʣ�k9 ����
d=3; % ͸�����ĺ��
R=100;% ͸��͹�����ʰ뾶
Dr=sqrt(R^2-(R-d)^2);% ͸���ߴ�(���뾶)
mh=30;
if Dr>10
	hmax=10;
else
	hmax=Dr;
end
h0=linspace(-hmax,hmax,mh);
mz=1000;
z0=20;%��ʼ������͸��ƽ��ľ���
y=zeros(size(z0));
theta1=asin(hmax/R);
theta2=asin(n*hmax/R);
theta=theta2-theta1;
f=hmax/tan(theta); %͸���Ľ��ƽ���
z=linspace(0,f+z0+f/3,mz);
for gh=1:mh
	theta1=asin(h0(gh)/R);
	theta2=asin(n*h0(gh)/R);
	theta=theta2-theta1;
for gz=1:mz
	L=sqrt(R^2-h0(gh)^2)-(R-d);
if z(gz)<=L+z0
	y(gz)=h0(gh);
else
	y(gz)=y(gz-1)-(z(gz)-z(gz-1))*tan(theta);
end
end
plot(z,y,'k');%��ͼ
hold on;
end
title(['͸������Ӧ��Ϊ��',num2str(f),' mm'])
