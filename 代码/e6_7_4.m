clc; 
clear all;
close all;
I=imread('ban.jpg');
figure(1)
subplot(1,3,1)
imshow(I)%��ʾԭʼ���
title('ԭʼ���')
I1=imadjust(I,[0.2,0.6],[]);
subplot(1,3,2)
imshow(I1)%���ȵ�����Ĺ�� 
title('���ȵ������ͼ��') 
I2=rgb2gray(I1);%ת��Ϊ�Ҷȹ��
level=graythresh(I2);%��ָ���ֵ
I3=im2bw(I2,level);%��ֵ��
subplot(1,3,3)
imshow(I3);   %��ʾ��ֵ�����
title('��ֵ�����')
I4=medfilt2(I3);
figure(2)
subplot(2,2,1)
imshow(I4)%��ֵ�˲���Ĺ��
title('��ֵ�˲���Ĺ��')
I5=bwmorph(I4,'open');%�Զ�ֵ����ͼ����ж�ֵ��̬ѧ������
subplot(2,2,2)
imshow(I5)%��ʾ�������Ĺ��
title('�������Ĺ��')
I6=bwmorph(I5,'close');   %�Կ������Ĺ�߽�����̬ѧ������
subplot(2,2,3)
imshow(I6) %��ʾ�������Ĺ��
title('�������Ĺ��')
L=bwlabel(I6); %��ע������ͼ���������ӵĲ���
stats = regionprops(L, {'Area', 'ConvexHull', 'MajorAxisLength', ...
'MinorAxisLength', 'Eccentricity', 'Centroid'});
%����ͼ���������ԣ���ע����L��ÿһ����ע�����һϵ�����ԡ�L�в�ͬ��������Ԫ�ض�Ӧ��ͬ������
A=[];
for i=1:length(stats)
A=[A stats(i).Area]; %�������ͼ����������������ܸ�����
end
[mA,ind]=max(A);
I7=I6;
I7(find(L~=ind))=0;
subplot(2,2,4)
imshow(I7);%��ʾ���������Ĺ��
hold on;
temp=stats(ind).ConvexHull; %'ConvexHull'�������ĳ�������С͹����Ρ��˾����ÿһ�д洢�˶����һ�������xy���ꡣ
t=linspace(0, 2*pi,1000);
c1=stats(ind).Centroid;%����ÿ�����������
a1=stats(ind).MajorAxisLength;%��Բ�ĳ��᳤��
b1=stats(ind).MinorAxisLength;%��Բ�Ķ��᳤��
d1=stats(ind).Eccentricity;%��Բ��������
x1=c1(1)+d1*b1*cos(t);
y1=c1(2)+d1*a1*sin(t);
m=plot(x1, y1, 'r-');%�������Բ
title('���Բ')
x2=x1(1,1);
y2=y1(1,1);
x3=x1(1,30);
y3=y1(1,30);
x4=x1(1,80);
y4=y1(1,80);
a=2*(x3-x2);
b=2*(y3-y2);
n=(x3*x3+y3*y3-x2*x2-y2*y2);
d=2*(x4-x3);
e=2*(y4-y3);
f=(x4*x4+y4*y4-x3*x3-y3*y3);
x0=(b*f-e*n)/(b*d-e*a+eps)                  % ��Բ��x����
y0=(d*n-a*f)/(b*d-e*a+eps)                  % ��Բ��y����
r0=sqrt((x0-x2)*(x0-x2)+(y0-y2)*(y0-y2))    % ��뾶
