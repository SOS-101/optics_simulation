%��ά���κ���ͼ��
x=-2.5:0.05:2.5;
y=-2.5:0.05:3.5;
[X,Y]=meshgrid(x,y);
x0=0;y0=1;%���ĵ�
a=2;b=3;%�߳�
Z=(rectpuls(X-x0,a)).*(rectpuls(Y-y0,b));
mesh(X,Y,Z)
set(gcf,'color',[1 1 1])
grid on
xlabel('X'),ylabel('Y'),zlabel('Z')
title('��ά���κ���ͼ��')
