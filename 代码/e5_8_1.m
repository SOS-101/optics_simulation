I=imread('E:\4.jpg');
figure
imshow(I);
figure
imhist(I);%����imhist���������л�ȡֱ��ͼ��
I1=im2bw(I,130/255); %�ָ�
figure
imshow(I1);
