clear;clc;close all;
filePath='./';%·��
fileName = 'ceshi.mp4';   %����
file=[filePath fileName];%������·��
obj = VideoReader(fileName);  %��Ƶ��ȡ����
numFrames = obj.NumberOfFrames;   %��ȡ��Ƶ�����ԣ�֡������
%����һ�����ļ�������洢�����ͼƬ
if ~exist('./Images')  %����������ļ���
     mkdir('./Images');  %����һ���ļ���
end
 for num = 1 : numFrames%ѭ�����е�֡
     frame = read(obj,num);   %��ȡ����
     imwrite(frame,strcat('./Images/',sprintf('%05d.jpg',num)),'jpg');%��jpg��ʽ����֡
end  
