A=imread('E:\hua1.jpg');
B=uint8(filter2(fspecial('gaussian'),A));%��˹ģ��
C=imabsdiff(A,B);% ����imabsdiff�������ͼ��������
figure
imshow(A);
figure
imshow(B);
figure
imshow(C)
