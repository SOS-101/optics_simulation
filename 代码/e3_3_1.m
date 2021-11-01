clear;
Lambda = input('�����Ĳ���(��λΪ nm):(ȡ500)');
Lambda = Lambda*(1e-9);
aWidth = input('������(��λΪ mm)��(ȡ0.2)');
aWidth = aWidth*0.001;
Z = input('����쵽���ľ���(��λΪ m):(ȡ1)');
ymax = 3*Lambda*Z/aWidth;
Ny = 51;
ys = linspace(-ymax,ymax,Ny);
NPoints = 51;
yPoint = linspace(-aWidth/2,aWidth/2,NPoints);
for j=1:Ny
    L = sqrt((ys(j)-yPoint).^2+Z^2);
    Phi = 2*pi.*(L-Z)./Lambda;
    SumCos = sum(cos(Phi));
    SumSin = sum(sin(Phi));
    B(j) = (SumCos^2+SumSin^2)/NPoints^2'
end
plot(ys,B,'*',ys,B);
grid;
axis([-ymax,ymax,0.0,1.0]);
set(gcf,'color','w');
