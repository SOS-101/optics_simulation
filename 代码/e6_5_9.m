clear
G=imread('E:\ͼƬ\Բ�̻�ͼ.png');
imshow(G);
title('ԭͼ','fontsize',26);
figure;
Gadd=fix(256*rand(256,256,3));%����������������
for i=1:256
   for j=1:256
        G1(i,j)=0.1*G(i,j)+0.9*Gadd(i,j);%���м�Ȩ���
end
end
subplot(1,2,1);
imshow(G1);
title('����ͼ��','fontsize',23);
for  i=1:256
     for j=1:256
           G2(i,j,:)=(G1(i,j)-0.9*Gadd(i,j))./0.1;%��ԭͼ��
end
end
subplot(1,2,2);
imshow(G2);
title('����ͼ��','fontsize',23);
