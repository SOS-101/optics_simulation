%�������������Ļ�������
m=0;n=1;                  %�������ģʽ
n_clad=1.4955;            %����������
lamda_0=1.55*1e-06;       %�����Ⲩ��
k0=2*pi/lamda_0;          %����в�ʸ��
z0=122*pi;%��ղ��迹
a1_0=1;a2_0=0;            %����߽�����
eption_0=1/36/pi*1e-09;   %��ս�糣��
omega=2*pi/lamda_0*3*1e8;            %�Ⲩ��Ƶ��

                                     %����1�Ź��˵Ĳ���
r01_core=input('����1�Ź��˵���о�뾶(��λΪ��m)=')*1e-06; %����1�Ź�����о�뾶
r01_clad=3*r01_core;                 %����1�Ź��˵İ���뾶
nc01=input('����1�Ź��˵���о������='); %����1�Ź��˵���о������
delta1=(nc01-n_clad)/nc01;           %��������ʲ�
V1=nc01*k0*r01_core*sqrt(2*delta1);  %��һ��Ƶ��
while V1>2.40483,disp('1�Ź��˲��ǵ�ģ����,����������');   %�ж�1�Ź����Ƿ����㵥ģ����
r01_core=input('����1�Ź��˵���о�뾶(��λΪ��m)=')*1e-06; %����1�Ź�����о�뾶
r01_clad=3*r01_core;                 %����1�Ź��˵İ���뾶
nc01=input('����1�Ź��˵���о������='); %����1�Ź��˵���о������
delta1=(nc01-n_clad)/nc01;           %��������ʲ�
V1=nc01*k0*r01_core*sqrt(2*delta1);  %��һ��Ƶ��
end;
disp('1�Ź����ǵ�ģ����,������ȷ')      %1�Ź��˶������
%������������1�Ź��˵Ĺ�һ��������λ�����͹�һ������˥������
fun1=@(U1) U1.*besselj(m+1,U1)/besselj(m,U1)-sqrt(V1^2-U1^2).*besselk(m+1,sqrt(V1^2-U1^2))./besselk(m,sqrt(V1^2-U1^2)); %��������
U1=fzero(fun1,1);                    %����һ��������λ����U
W1=sqrt(V1^2-U1^2);                  %����һ������˥������W
beta01=sqrt(nc01^2*k0^2-(U1/r01_core)^2); %���1�Ź��˵Ĵ�������beta
A1=U1/V1*besselk(m,W1)/sqrt(besselk(m+1,W1)*besselk(m+1,W1))*sqrt(4*z0/n_clad/pi/r01_core^2);                                 %���1�Ź��˵�A
%��1�ŵ�ģ�����еĺ��򳡷���Ey1
Ey01=@(r,theta) A1*cos(m*theta).*besselj(m,U1*r/r01_core)./besselj(m,U1);
Ey02=@(r,theta) A1*cos(m*theta).*besselk(m,W1*r/r01_core)./besselk(m,W1);

%����2�Ź��˵Ĳ���
r02_core=input('����2�Ź��˵���о�뾶(��λΪ��m)=')*1e-06; %����2�Ź�����о�뾶
r02_clad=3*r02_core;                     %����2�Ź��˵İ���뾶
nc02=input('����2�Ź��˵���о������=');     %����2�Ź��˵���о������
delta2=(nc02-n_clad)/nc02;               %��������ʲ�
V2=nc02*k0*r02_core*sqrt(2*delta2);      %��һ��Ƶ��
while V2>2.40483,disp('2�Ź��˲��ǵ�ģ����,����������');   %�ж�2�Ź����Ƿ����㵥ģ����
r02_core=input('����2�Ź��˵���о�뾶(��λΪ��m)=')*1e-06; %����2�Ź�����о�뾶
r02_clad=3*r02_core;                     %����2�Ź��˵İ���뾶
nc02=input('����2�Ź��˵���о������=');     %����2�Ź��˵���о������
delta2=(nc02-n_clad)/nc02;               %��������ʲ�
V2=nc02*k0*r02_core*sqrt(2*delta2);      %��һ��Ƶ��
end;
disp('2�Ź����ǵ�ģ����,������ȷ')
disp('��ʼ���㣬�������ͼ')
%������������2�Ź��˵Ĺ�һ��������λ�����͹�һ������˥������
fun2=@(U2) U2.*besselj(m+1,U2)/besselj(m,U2)-sqrt(V2^2-U2^2).*besselk(m+1,sqrt(V2^2-U2^2))./besselk(m,sqrt(V2^2-U2^2));
U2=fzero(fun2,1);   %����һ��������λ����U 
W2=sqrt(V2^2-U2^2); %����һ������˥������W
beta02=sqrt(nc02^2*k0^2-(U2/r02_core)^2); %���2�Ź��˵Ĵ�������beta
%���2�Ź��˵�A
A2=U2/V2*besselk(m,W2)/sqrt(besselk(m+1,W2)*besselk(m+1,W2))*sqrt(4*z0/n_clad/pi/r02_core^2);
%��2�ŵ�ģ�����еĺ��򳡷���Ey2
Ey11=@(r,theta) A2*cos(m*theta).*besselj(m,U2*r/r02_core)./besselj(m,U2);
Ey12=@(r,theta) A2*cos(m*theta).*besselk(m,W2*r/r02_core)./besselk(m,W2);

d=r01_clad+r02_clad;
delta_beta=beta01-beta02;        %����ʧ����λ����
F=@(r,theta)conj(Ey01(r,theta)).*Ey12(sqrt(d^2+r.^2-2*d*r.*cos(theta)),theta)*(nc01^2-n_clad^2).*r*omega*eption_0/4;
K12=dblquad(F,0,r01_core,0,2*pi);%������ϵ��K12
K21=conj(K12);                  %������ϵ��K21

%����Ϲ����еĹ����ܶ�
c2=((delta_beta+sqrt(delta_beta^2+4*abs(K21)^2))*a1_0+2*K12*a2_0)/(2*sqrt(delta_beta^2+4*abs(K21)^2));
c1=a1_0-c2;
%���1�Ź����е���ϼ���
r_core1=linspace(-r01_core,r01_core,400); %rzƽ������о��ĳ���������
z1=linspace(0,4,1000);                    %��Ͼ���
[Z1,R_core1]=meshgrid(z1,r_core1);
theta0=0;                                 %����ȷ�λ��ȡ���˵��������棨rzƽ�棩
r_clad1=linspace(r01_core,(d+r02_clad),500); %rz������ĳ���������
[Z11,R_clad1]=meshgrid(z1,r_clad1);
a1=c1*exp(i*(delta_beta+sqrt(delta_beta^2+4*abs(K21)^2))/2*z1)+c2*exp(i*(delta_beta-sqrt(delta_beta^2+4*abs(K21)^2))/2*z1); %���1�Ź����г����
Sz_core1=A1^2/2/z0*(cos(m*theta0))^2*nc01.*(besselj(m,U1*abs(r_core1)'/r01_core)./besselj(m,U1)).^2*abs(a1).^2;             %�����о�����ܶ�
Sz_clad1=A1^2/2/z0*(cos(m*theta0))^2*n_clad.*(besselk(m,W1*r_clad1'/r01_core)/besselk(m,W1)).^2*abs(a1).^2;                %�����㹦���ܶ�

%���2�Ź����е���ϼ���
r_core2=linspace(d-r02_core,d+r02_core,500); %rzƽ������о��ĳ���������
z2=linspace(0,4,1000);                %��Ͼ���
[Z2,R_core2]=meshgrid(z2,r_core2);
r_clad2=linspace(0,d-r02_core,500);
[Z22,R_clad2]=meshgrid(z2,r_clad2);
a2=-(c1*(delta_beta+sqrt(delta_beta^2+4*abs(K21)^2))/2*exp(i*(-delta_beta+sqrt(delta_beta^2+4*abs(K21)^2))/2*z2)+c2*(delta_beta-sqrt(delta_beta^2+4*abs(K21)^2))/2*exp(-i*(delta_beta+sqrt(delta_beta^2+4*abs(K21)^2))/2*z2))/K12;  %���2�Ź����г����
Sz_core2=A2^2/2/z0*(cos(m*theta0))^2*nc02.*(besselj(m,U2*abs(r_core2-d)'/r02_core)./besselj(m,U2)).^2*abs(a2).^2;      %���2�Ź�����о�����ܶ�
Sz_clad2=A2^2/2/z0*(cos(m*theta0))^2*n_clad.*(besselk(m,W2*(d-r_clad2)'/r02_core)/besselk(m,W2)).^2*abs(a2).^2; %���2�Ź��˰��㹦���ܶ�
%��Ϲ����ܶȻ�ͼ

cmap=[linspace(1,0,256);linspace(1,0,256);zeros(1,256)]';
colormap(cmap);
subplot(1,1,1);
surf(Z1,R_core1,Sz_core1),view(-10,60);
hold on;
surf(Z11,R_clad1,Sz_clad1),view(-10,60);
subplot(1,1,1);
surf(Z2,R_core2,Sz_core2),view(-10,60);
hold on;
surf(Z22,R_clad2,Sz_clad2),view(-10,60);
shading flat;colorbar;axis tight;
xlabel('��Ͼ���z��m��');
ylabel('r','Fontsize',13,'FontName','Times');
title('1�ź�2�Ź��˵���Ϲ����ܶȷֲ�');

%������Ϲ��˹����ܶȶԱ�ͼ
figure
cmap=[linspace(1,0,256);linspace(1,0,256);zeros(1,256)]';
colormap(cmap);
subplot(2,1,2);
mesh(Z1,R_core1,Sz_core1),view(0,0);
hold on;
mesh(Z11,R_clad1,Sz_clad1);
shading flat;colorbar;axis tight;
xlabel('��Ͼ���z(m)');
ylabel('r','Fontsize',13,'Fontname','Times');
title('1�Ź��˵���Ϲ����ܶȷֲ�');
subplot(2,1,1);
mesh(Z2,R_core2,Sz_core2);
hold on;
mesh(Z22,R_clad2,Sz_clad2),view(0,0);
shading flat;colorbar;axis tight;
xlabel('��Ͼ���z��m��');
ylabel('r','Fontsize',13,'FontName','Times');
title('2�Ź��˵���Ϲ����ܶȷֲ�');

%�������Ч������ͼ
figure
Pout_1=abs(a1).^2;
Pout_2=abs(a2).^2;
enta=Pout_2;
subplot(3,1,1);
plot(z1,Pout_1);
xlabel('��Ͼ���z(m)');ylabel('ֱͨ�۹���Pout_1');
subplot(3,1,2);
plot(z1,Pout_2);
xlabel('��Ͼ���z(m)');ylabel('��ϱ۹���Pout_2');
subplot(3,1,3);
plot(z1,enta);
xlabel('��Ͼ���z(m)');ylabel('���Ч��');
title('���Ч�ʡ�����Ͼ�������ͼ');
