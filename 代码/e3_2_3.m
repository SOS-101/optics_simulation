w1=50,w2=60,,k2=4,a=1;  %���в��Ĳ���
x=0:0.001:30;
A=2*a*cos((k1-k2)/2*x-(w1-w2)/2*t(end));
l=A.*A;
plot(x,l)
set(gca,'YTick',[0:1:4])
set(gca,'XTick',[0:5:30])
xlabel('���� X')
ylabel('����仯A')
title('�ϳɲ���ǿ����')
