clear;             %����ڴ�ռ�
disp('���������������n1��n2')
n1=input('n1='); %���ܼ�������������ʵ�������n1
n2=input('n2='); %���ܼ�������������ʵ�������n2
theta = 0:0.1:90;   %����Ƿ�Χ0-90�㣬����0.1��
a=theta*pi/180;   %�ǶȻ�Ϊ����
rp =(n2*cos(a)-n1*sqrt(1-(n1/n2*sin(a)).^2))./...
    (n2*cos(a)+n1*sqrt(1-(n1/n2*sin(a)).^2));   %p�������������
rs = (n1*cos(a)-n2*sqrt(1-(n1/n2*sin(a)).^2))./...
    (n1*cos(a)+n2*sqrt(1-(n1/n2*sin(a)).^2));   %s�������������
tp = 2*n1*cos(a)./(n2*cos(a)+n1*sqrt(1-(n1/n2*sin(a)).^2));%p�������͸����
ts = 2*n1*cos(a)./(n1*cos(a)+n2*sqrt(1-(n1/n2*sin(a)).^2));%s�������͸����

figure(1);
subplot(1,2,1);  %��ͼrp��rs��|rp|��|rs|������ǵı仯����
plot(theta,rp,'-',theta,rs,'--',theta,abs(rp),':',...
    theta,abs(rs),'-.','LineWidth',2);
legend('rp','rs','|rp|','|rs|');
xlabel('�����\theta_i');
ylabel('���');
title(['n_1=',num2str(n1),',n_2=',num2str(n2),'ʱ����ϵ��������ǵı仯����']);
axis([0 90 -1 1]);    %�趨��ͼ����
grid on;              %��ͼ��դ��
subplot(1,2,2);
plot(theta,tp,'-',theta,ts,'--',theta,abs(tp),':',...
    theta,abs(ts),'-.','LineWidth',2);
legend('tp','ts','|tp|','|ts|');
xlabel('�����\theta_i');
ylabel('���');
title(['n_1=',num2str(n1),',n_2=',num2str(n2),'ʱ͸��ϵ��������ǵı仯����']);
if n1<n2
axis([0 90 0 1]);
else
axis([0 90 0 3.5]);
end
grid on;
