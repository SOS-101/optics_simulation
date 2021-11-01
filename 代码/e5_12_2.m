clear;clc;close all;
framesPath = './Images/';%ͼ����������·����ͬʱҪ��֤ͼ���С��ͬ
videoName = 'ceshi2.avi';%��ʾ��Ҫ��������Ƶ�ļ�������
fps = 25; %֡����ʱ�� = ͼƬ����Ŀ/֡��
numFrames = length(dir('./Images'))-2; %ͳ��ͼƬ����һ���ļ���. �ڶ����ļ���.. ����Ҫ��2
if(exist('videoName','file'))  %���������ͬ���ֵ�video
    delete videoName.avi   %ɾ��video
end  
%������Ƶ�Ĳ����趨
aviobj=VideoWriter(videoName);  %����һ��avi��Ƶ�ļ����󣬿�ʼʱ��Ϊ��
aviobj.FrameRate=fps;  %֡�ʸ��Ƹ�video����
open(aviobj);%��video�Ľӿڣ���ʼд������
for num=1:numFrames  
    fileName=sprintf('%05d',num); %ͼƬ��
    frames=imread([framesPath,fileName,'.jpg']);%��ȡͼƬ����
    writeVideo(aviobj,frames);  %��ͼƬ����д��video 
end  
close(aviobj);   %�ر�video
