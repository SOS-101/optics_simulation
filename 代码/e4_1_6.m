%һά�Ͷ�ά��˹����ͼ�Σ��������ֱ�ӴӸ�˹�����Ķ���������Ƹ�˹����ͼ�Σ�����Ҳ���Բ���gaussmf( )����������л��Ƹ�˹����ͼ�Ρ�
% ��˹����һάͼ��
x=-4.5:0.01:4.5; 
gaus=exp(-pi*x.^2);
subplot(1,2,1)
plot(x,gaus)
axis([-4.5 4.5 -0.3 1.1])
grid on 
xlabel('x') 
ylabel('gaus (x)')
title('��˹����һάͼ��')
% ��˹������άͼ��
subplot(1,2,2)
y=-4.5:0.01:4.5; 
[X,Y]=meshgrid(x,y);  
Z=exp(-pi*(X.^2+Y.^2)); 
mesh(X,Y,Z)  
grid on  
xlabel('X'),ylabel('Y'),zlabel('ZY')  
title('��˹������άͼ��')
