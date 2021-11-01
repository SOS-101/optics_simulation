clear;
Lambda = input('�����Ĳ�������λΪnm������ȡ500)');
Lambda = Lambda*(1e-9); %��nm�任Ϊm
d = input('����������ļ�ࣨ��λΪmm������ȡ2��');
d = d*0.001;
Z = input('����쵽���ľ��루��λΪm������ȡ1��');
yMax = 5*Lambda*Z/d;
xs = yMax;
Ny = 101;
ys = linspace(-yMax,yMax,Ny);
for i=1:Ny
r1 = sqrt((ys(i)-d/2).^2+Z^2);
r2 = sqrt((ys(i)+d/2).^2+Z^2);
    Phi = 2*pi*(r2-r1)/Lambda;
    B(i,:) = 4*cos(Phi/2).^2;
end
NCLevels = 255;
Br = (B/4.0)*NCLevels;
subplot(1,2,1);
image(xs,ys,Br);
colormap(gray(NCLevels));
subplot(1,2,2);
plot(B(:),ys);
