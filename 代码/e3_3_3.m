clear;
a = input('���뵥�ؿ׵Ŀ��(��λ m):a = ');
b = input('���뵥�ؿ׵ĳ���(��λ m):b = ');
lambda = input('���뵥ɫ��Ĳ���(��λ m): ');
f = 1; %͸������Ϊ1m
m = 500; %ȷ����Ļ�ϵ���
ym = 8000*lambda*f;      %��Ļ��y�ķ�Χ
ys = linspace(-ym,ym,m); 
xs = ys;                 %��Ļ��x�ķ�Χ
n = 255;
for i=1:m
    sinth1 = xs(i)/sqrt(xs(i)^2+f^2);
    sinth2 = ys./sqrt(ys.^2+f^2);
    angleA = pi*a*sinth1/lambda;
    angleB = pi*b*sinth2./lambda;
B(:,i)=(sin...
(angleA).^2.*sin(angleB).^2.*a^2.*b^2.*1250./lambda^2./(angleA.^2.*angleB.^2));
end
subplot(1,2,1);
image(xs,ys,B);
colormap(gray(n));
subplot(1,2,2);
plot(B(m/2,:),ys,'k');
