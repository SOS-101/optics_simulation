clear;
A=zeros(200,200);       %��ֱ��դ
for i=1:10 
    A(:,20*i-9:20*i)=1;
end
B=zeros(200,200);      %ˮƽ��դ
for i=1:10 
    B(20*i-9:20*i,:)=1;
end
C=A.*B;                %ʱ�����
c=abs(fftshift(fft2(C)));
cc1=abs(fftshift(fft2(C)));
aa=abs(fftshift(fft2(A)));
bb=abs(fftshift(fft2(B)));
cc=conv2(aa,bb);        %Ƶ����
figure(1);
subplot(1,2,1);imshow(B);
subplot(1,2,2);imshow(bb);
figure(2);
subplot(1,2,1);imshow(A);
subplot(1,2,2);imshow(aa);
figure(3);
imshow(c);
figure(4);
imshow(cc);
