A=imread('E:\flower.jpg');
B=imread('E:\juzi.png');
A1=im2double(A);
B1=im2double(B);
C=imdivide(A,B);%����imdivide�������ͼ��A��B�������
C1=imdivide(A1,B1); %����imdivide�������ͼ��A1��B1�������
figure
subplot(1,2,1);
imshow(A);
subplot(1,2,2);
imshow(B);
figure
subplot(1,2,1);
imshow(C);
subplot(1,2,2);
imshow(C1);
