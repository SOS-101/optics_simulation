clear
a=imread('fft2.jpg');%�ֱ����jpg��ʽ�ľ��οס�ʮ�ּܡ�ɡ�οס�����׵�������
figure(1)
imshow(a,[]);
afft=fft2(a);
aa=ifft2(fftshift(afft));
figure(2)
imshow(aa,[])
