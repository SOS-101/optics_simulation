A=imread('E:\hua1.jpg');
B=imread('E:\rice.jpg');
C1=imadd(A,B,'uint16');%����imadd�������ͼ�����ӣ��������Ϊ16λ��ʽ��
C2=imadd(A,B); %�������Ϊ8λ��ʽ��
figure(1)
subplot(1,2,1);
imshow(A);
subplot(1,2,2);
imshow(B);
figure(2)
subplot(1,2,1);
imshow(C1,[]);
subplot(1,2,2);
imshow(C2)
