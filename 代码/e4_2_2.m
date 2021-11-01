clear
imga=imread('fft4.jpg');
grid on
figure(1);
imshow(imga,[ ]);
imgray0=rgb2gray(imga);
imgray1=double(imgray0);
afft=fft2(imgray1);      %����Ҷ�任

afftI=fftshift(afft);    % ֱ�������Ƶ�Ƶ������
RR=real(afftI);      % ȡ����Ҷ�任��ʵ��
II=imag(afftI);      % ȡ����Ҷ�任���鲿
A=sqrt(RR.^2+II.^2); % ����Ƶ�׷�ֵ
A=(A-min(min(A)))/(max(max(A))-min(min(A)))*255;    %��һ��
figure(2);
imshow(A);        % ��ʾԭͼ�����

[m,n]=size(A);
[x,y]=meshgrid(1:n,1:m);
figure(4)
mesh(x,y,A)
