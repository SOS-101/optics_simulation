I=imread('E:\huasheng.jpg');
imhist(I);
I0=edge(I,'sobel'); %��ֵΪĬ��ֵ�ı�Ե���
I1=edge(I,'sobel',0.06); %��ֵΪ0.06�ı�Ե���
I2=edge(I,'sobel',0.04);
I3=edge(I,'sobel',0.02);
figure
imshow(I);
figure
imshow(I0);
figure
imshow(I1);
figure
imshow(I2);
figure
imshow(I3)
