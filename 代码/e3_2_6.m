clear
R=0.855; %͸�������ʰ뾶
N=400; %���ûҶȵȼ�
lamda=5893e-6; %����Ⲩ��
rr=0.1;
[x,y]=meshgrid(linspace(-rr,rr,N)); %������ȡֵ
r=abs(x+i*y); 
d=r.^2/R/lamda*pi*2; %ţ�ٻ��Ĺ������
z=cos(d);z=abs(z);
Z(:,:,1)=z/sqrt(2);Z(:,:,2)=z/sqrt(2); 
Z(:,:,3)=zeros(N);close all; 
H=imshow(Z); %��ʾͼ��
 t=0;k=1;
set(gcf,'doublebuffer','on');%����ͼ������ 
title('ţ�ٻ�');%��ӱ��� 
xlabel('�뵥���ո��ֹͣ�˶���ҳ��!',... 
  'fontsize',12,'color','r'); %���x���ǩ
set(gca,'position',[0.161111 0.1423913 0.675194 0.715217]); %��������ϵλ��
set(gcf,'position',[254 115 427 373]) 
while k; %����ѭ���Ƿ����
   s=get(gcf,'currentkey');  %��ȡ���̲�����Ϣ 
   if strcmp(s,'space'); %�ж��Ƿ�Ϊspce��
       clc;
       k=0;  %k=0ѭ����ֹ
   end 
   t=t+0.01; 
   pause(0.3); %��ͣ0.3s  
   d=d+t; 
   z=cos(d);z=abs(z); 
   Z(:,:,1)=z/sqrt(2); 
   Z(:,:,2)=z/sqrt(2); 
   set(H,'CData',Z); %��ϸcdata���ԣ�����Ϊͼ�񶯻�
end 
figure(gcf); %��ʾͼ��
