%����������Ǹ���ʵ��Ҫ��õ�
clear;clc
I=imread('ceshi2.png');%��ͼ
I2=rgb2gray(I);%�Ҷ�ͼ
%Ԥ����
BW=edge(I2,'canny',0.3);%��Ե���
BW = imdilate(BW,ones(4));%����
BW = bwareaopen(BW,2000);%ȥ��ɢ��
BW = imfill(BW,'holes');%����ڲ�����
%�����ͨ����
[L,num] = bwlabel(BW);%�����ͨ����
%��ͼ
subplot(1,2,1);
imshow(I2);
title('�Ҷ�ͼ');
subplot(1,2,2)
imshow(BW);
title('ģ��');
figure
for n=1:num
    subplot(2,2,n);
    imshow(uint8(L==n).*I2);%���ĸ�ģ��ֿ�
end
