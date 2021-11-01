function p=rgb_RGB(Ori_Face)
R=Ori_Face(:,:,1);
G=Ori_Face(:,:,2);
B=Ori_Face(:,:,3);
R1=im2double(R);                                  % ��uint8��ת����double�ʹ��� 
G1=im2double(G);
B1=im2double(B);
RGB=R1+G1+B1;
m=[0.4144,0.3174];                                %��ֵ
n=[0.0031,-0.0004;-0.0004,0.0003];                %����
row=size(Ori_Face,1);                             %��������
column=size(Ori_Face,2);                          %��������
for i=1:row
    for j=1:column
        if RGB(i,j)==0
            rr(i,j)=0;
            gg(i,j)=0;
        else
            rr(i,j)=R1(i,j)/RGB(i,j);             %RGB��һ��
            gg(i,j)=G1(i,j)/RGB(i,j);
            x=[rr(i,j),gg(i,j)];
            p(i,j)=exp((-0.5)*(x-m)*inv(n)*(x-m)');% Ƥ�����ʷ��Ӹ�˹�ֲ�
        end
    end
end
