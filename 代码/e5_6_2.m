I=imread('E:\flower2.jpg');
h1=[0,-1,0;-1,5,-1;0,-1,0];
h2=[-1,-1,-1;-1,9,-1;-1,-1,-1];
BW1=imfilter(I,h1);% ����imfliter��������ͼ�����������������˹�񻯡�
BW2=imfilter(I,h2); % ����imfliter��������ͼ����а�����������˹��
imshow(I);
figure
imshow(uint8(BW1));
figure
imshow(uint8(BW2))
