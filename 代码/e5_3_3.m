I=imread('E:\3.jpg');
[X,map]=gray2ind(I,32);% ����gray2ind��������ͼ��ת����
figure
imshow(I);
figure
imshow(X,map)
