I=imread('E:\hua1.jpg');
h=fspecial('sobel');% ����h=fspecial('soble')�����ɡ�sobel��ģ�塣
BW1=edge(I,'sobel','horizontal');%ˮƽ�߽���ȡ
BW2=imfilter(I,h);
figure
imshow(I);
figure
imshow(BW1);
figure
imshow(BW2)
