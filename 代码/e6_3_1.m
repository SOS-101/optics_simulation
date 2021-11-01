clear;
N=input('Number of samples(enter from 100 to 500)=');%N:������
L=10*10^-3;
Ld=input('�����벨�� [����]=');
Ld=Ld*10^-6;
ko=(2*pi)/Ld;
wo=input('���������� [����]=');
wo=wo*10^-3;
z_ray=(ko*wo^2)/2*10^3;
z_ray=z_ray*10^-3;
z=input('�����봫�����z[��]=');
dx=L/N;
for n=1:N+1
    for m=1:N+1
           %Space axis 
            x(m)=(m-1)*dx-L/2;
            y(n)=(n-1)*dx-L/2;
            %�����еĸ�˹����
                Gau(n,m)=exp(-(x(m)^2+y(n)^2)/(wo^2));%Frequency axis 
            Kx(m)=(2*pi*(m-1))/(N*dx)-((2*pi*(N))/(N*dx))/2;
               Ky(n)=(2*pi*(n-1))/(N*dx)-((2*pi*(N))/(N*dx))/2;
            %���ɿռ䴫�亯��
            H(n,m)=exp(j/(2*ko)*z*(Kx(m)^2+Ky(n)^2));
    end
end
%Ƶ���еĸ�˹����
FGau=fft2(Gau);
FGau=fftshift(FGau);
%Ƶ���д���ĸ�˹����
FGau_pro=FGau.*H; 
Gau_pro=ifft2(FGau_pro);
x=x*10^3;
y=y*10^3;
figure(1);
mesh(x,y,abs(Gau))
title('��˹��ǿ�ֲ�')
xlabel('x [����]')
ylabel('y [����]')
axis([min(x) max(x) min(y) max(y) 0 1])
axis square
figure(2);
mesh(x,y,abs(Gau_pro))
title(['����',num2str(z),'�׺�ĸ�˹����'])
xlabel('x [����]')
ylabel('y [����]')
axis([min(x) max(x) min(y) max(y) 0 1])
axis square
