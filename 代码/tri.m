function tri
disp(['�����֮�����','  ���伤��뾶Ϊ','  ���伤����������ľ���','  ������ռ����',' �������',' ��ֵΪ']);
c=1.06;
%for a=3.2:2:10;
%for b=0.8:0.8:3.2;
a=3.2;
b=3.2;
d=50;
x=-100.01:0.1:100;
y=-100.01:0.1:100;
Z=1001;
y1=2*pi*a/(c*d);
y2=2*pi*b/(c*d);
[X,Y]=meshgrid(x,y);
y3=sqrt(X.^2+Y.^2);
L=((1+2*cos(y1.*X)).^2).*((besselj(1,y2*y3)).^2)*b*b./(y3.^2)*10000;
plot(X,L);
xlabel(��X��);ylabel(��L��);
%plot(Y,L);   %�ڻ��ơ�ͼ6-53���͡�ͼ6-54��ʱ�������ǰ��%ȥ��
xlabel(��Y��);ylabel(��L��);
%mesh(X,Y,L); %�ڻ��ơ�ͼ6-50������ͼ6-51���͡�ͼ6-52��ʱ�������ǰ��%ȥ��
xlabel(��X��);ylabel(��Y��);zlabel(��L��);

A=L(1001,1001);
f=1;
for m=1:1:Z-1
if L(Z+m-1,1001)>L(Z+m,Z)
A=A+L(Z+m,Z)+L(Z-m,Z);
        f=f+2;
else break;
end
end
for m=1:1:Z-1
     if L(Z,Z+m-1)>L(Z,Z+m)
        A=A+L(Z,Z+m)+L(Z,Z-m);
        f=f+2;
         for n=1:1:Z-1
            if L(Z+n-1,Z+m)>L(Z+n,Z+m)  
                 A=A+L(Z+n,Z+m)+L(Z-n,Z+m)+L(Z+n,Z-m)+L(Z-n,Z-m);
                 f=f+4; 
               else break;
            end
         end
    else break
    end
end
B=0;
for m=1:2*Z-1
    for n=1:2*Z-1
       B=B+L(m,n);
    end
end
C=A/B;
f=f*0.01;
disp([num2str(a),'mm',num2str(b),'mm',num2str(d),'m',num2str(C),num2str(f),'mm2',num2str(L(Z,Z))]);

