%ƽ�沨͸������������ֵ����
clear;
n=1.5062;%1064nm ���������ʣ�k9 ����
d=3; % ͸�����ĺ��
RL=0.025e3;% ͸��͹�����ʰ뾶
f=RL/(n-1);%͸���Ľ���
R0=1;%��������뾶
lambda=1.064e-3;k=2*pi/lambda;phy=lambda/pi/R0;
z=f;
mr2=41;ne2=51;mr0=81;
while sqrt(R0^2+z^2)-sqrt(R0^2*(1-1/mr0)^2+z^2)>lambda/10
mr0=mr0+1;
end
ne0=mr0;
rmax=5*f*phy;
r=linspace(0,rmax,mr2);eta=linspace(0,2*pi,ne2);
[rho,theta]=meshgrid(r,eta);
[x,y]=pol2cart(theta,rho);
r0=linspace(0,R0,mr0);eta0=linspace(0,2*pi*(ne0-1),ne0-1);
[rho0,theta0]=meshgrid(r0,eta0);
[x0,y0]=pol2cart(theta0,rho0);
deta=R0/(mr0-1)*2*pi/(ne0-1);
E2=zeros(size(x));
for gk=1:ne2
for df=1:mr2
Rrho=sqrt((x(gk,df)-x0).^2+(y(gk,df)-y0).^2+z^2);
Rtheta=z./Rrho;
opd=exp(j*k*((n-1)*(sqrt(RL^2-rho0.^2)-(RL-d))+d));
Ep=-j/lambda/2*exp(Rrho*j*k).*(1+Rtheta)./Rrho*deta.*rho0.*opd;
E2(gk,df)=sum(Ep(:));
end
end
Ie=conj(E2).*E2;
%Ie=Ie/max(Ie(:));
figure;
surf(x,y,Ie);%������ά����ͼ
shading interp;
axis([-rmax,rmax,-rmax,rmax])
grid off;
box on;
