I=imread('E:\hua1.jpg');
imshow(I);
SE=strel('ball',5,5);%����SE=strel('ball',R,H,N)��������ȡ���νṹԪ��
I2=imdilate(I,SE);%����IM2=imdilate(IM,SE)����ʵ������
figure
imshow(I2);
