A=imread('E:\3.jpg');
background=imread('E:\background.jpg');%���뱳��ͼ��
B=imsubtract(A,background);% ����imsubtract�������ͼ��������
figure
imshow(A);
figure
imshow(background);
figure
imshow(B)
