clear;clc;close all
I=rgb2gray(imread('����.jpg'));
%���м򵥵���̬ѧ�����Լ���ʶ�����
SE =strel('ball',5,5);%����SE = strel('ball',R,H,N)������ʵ�����νṹԪ��
I2 =imdilate(I,SE);%����
I2 =imerode(I2,SE);  %��ʴ
BW =edge(I2,'Canny');%��ȡ�߽�
imshow(BW)    %��ʾͼ��
[c,r]=imfindcircles(BW,[20,300],'ObjectPolarity','dark');%�ҵ��뾶Ϊ20~300���ص�Բ
viscircles(c,r,'LineStyle','--');%��ͼ������Բ
