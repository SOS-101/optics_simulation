clear;clc;close all
I=imread('ceshi.png');%��ͼ
BW=rgb2gray(I);%ת���ɻҶ�ͼ
BW=edge(BW,'canny');%��Ե���
BW =bwareaopen(BW,100);%�˲��˳���ͨ�������С��100�����ص����ͨ����
[L,num] =bwlabel(BW,8);%Ӧ��8��ͨ����õ�N����ͬ������
%��ÿһ��ֱ������ϵת��ɼ�����ϵ��������Ƕ��볤����Ĺ�ϵ
for n=1:num
    temp=L==n;%ÿһ��ģ�鶼����ǳ�������
    %ȥ��ȫΪ�������
    temp = temp(any(temp'),:);
    temp = temp(:,any(temp));
    [S_x S_y]=size(temp);%ͼ���С
    [x y]=find(temp~=0);%�ҵ��߽�������
    x=(x-S_x/2)./S_x;y=(y-S_y/2)./S_y;%�ƶ�ԭ�㵽�м�λ�����б�����ͬ���й�һ��
    [theta,rho]=cart2pol(x,y);%ֱ������ת���ɼ�����
    r=sortrows([theta/pi*180 rho]);%���սǶ�����
    %�����min���ڵ�һ����󣬽�����С��ǰ��Ƕȼ���360�㲢�Ƶ����
    if min(r(:,2))~=r(1,2) || min(r(:,2))~=r(1,end)
        [addr ~]=find(min(r(:,2))==r(:,2));%�ҵ���Сֵ�ڵĵ���Сֵλ��Ҳ��ֹһ��
        r(1:addr(1)-1,1)=r(1:addr(1)-1,1)+360;%����360��
        r = circshift(r,1-addr(1));%�����
        theta=r(:,1)/max(r(:,1));tho=r(:,2)/max(r(:,2));%��һ��
    end
    %��ʾ
    subplot(2,num,n);imshow(temp);%ͼ��
    subplot(2,num,n+num);plot(theta,tho);%����ѵĹ�ϵͼ
    title('\theta - \rho��ϵͼ')
    %���ݳ��������ļ���ֵ�ж�����
    tho=tho(round(linspace(1,length(theta),min([length(theta) 40]))));%thoȡ40������
    peak_num=length(findpeaks(tho))%�ҵ�����ֵ
    xlabel([num2str(peak_num) '����']);%��ʾ�жϵĽ��
end
