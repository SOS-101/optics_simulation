I=imread('E:\juzi.png');
map=pink(1024);
X=dither(I,map);% ����dither��������ͼ��ת����
subplot(2,1,1);
imshow(I);
subplot(2,1,2);
imshow(X,map)
