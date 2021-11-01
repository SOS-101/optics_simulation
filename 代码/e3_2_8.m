xmax = 10;
ymax = 10;
Lambda = 632.8e-006; %�趨����Ⲩ��
f = 200;     
n = 1.0;
N = 150;
d = 0.39010; %����Ĥ���
x = linspace(-xmax,xmax,N);
y = linspace(-ymax,ymax,N);
   for i=1:N
       for j=1:N
            r(i,j)=sqrt(x(i)*x(i)+y(j)*y(j));
            B(i,j)=cos(pi*(2*n*d*cos(asin(n*sin(atan(r(i,j)/f)))))/Lambda).^2; 
       end
   end
figure(gcf);
NClevels = 255;          %�趨�Ҷ�
Br = 2.5*B*NClevels;
image(x,y,Br);
colormap(gray(NClevels));
