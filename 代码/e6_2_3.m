   %��ͨͨͨ�˲�����
clear
Y1=imread('fft.jpg');
J1=fftshift(fft2(rgb2gray(Y1)));
[m,n]=size(J1);
J2=zeros(m,n);
T=zeros(m,n);
for i=1:m
    for j=1:n
    if (sqrt((i-m/2)^2+(j-n/2)^2)<=30)||(sqrt((i-m/2)^2+(j-n/2)^2)>=80)
            T(i,j)=0;
    else
        T(i,j)=1;

    end
    J2(i,j)=T(i,j)*J1(i,j);
    end
end
figure
subplot(3,2,1);imshow(Y1);title('ԭ����');
subplot(3,2,2);imshow(abs(J1),[]);title('����ĳ�');
J11=uint8(real(ifft2(ifftshift(J2))));
subplot(3,2,3);imshow(T,[]);title('��ͨ�˲���')
subplot(3,2,4);imshow(abs(J2),[]);title('�˲�������ĳ�');
subplot(3,2,5);imshow(J11,[]);title('ͨ���˲����������')
