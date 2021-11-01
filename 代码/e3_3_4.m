clear;
lam = 632.8e-9;%����
R = 5e-4;       %�׾���С
f = 1;          %͸������
ym = 2.5e-3;   %y��ķ�Χ
m = 1000;
y = linspace(-ym,ym,m);
x = y;
for i=1:m
    r = x(i).^2+y.^2;
    s = sqrt(r./(r+f^2));
    x1 = 2*pi*R*s./lam;
    I(:,i) = ((2*besselj(1,x1)).^2./x1.^2).*5000;
end
image(x,y,I);
%title('Բ�׷��ź̷�����ֲ�');
n = 100;
colormap(gray(n));
colorbar;
