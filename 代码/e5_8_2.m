I=imread('E:\flower2.jpg');
figure
imshow(I);
level=graythresh(I); %����graythresh���������л�÷ָ���ֵ
BW=im2bw(I,level); %�ָ�
figure
imshow(BW);
