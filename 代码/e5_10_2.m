I=imread('E:\hua1.jpg');
imshow(I);
SE=strel('ball',5,5);%����SE=strel('ball',R,H,N)��������ȡ���νṹԪ�ء�
I2=imerode(I,SE);% ����IM2=imerode(IM,SE)���������и�ʴ��
figure
imshow(I2); 
