%���Ų���
figure
imshow(part1)
title('ѧ������');
%�ҵ��ұߺڿ��λ��(�������ͣ�ʹ�ұߵĺڿ���ͨ����ɾ��С����ͨ����)
BW=part1>10&part1<100;%���ݺڿ�ĻҶ�ֵȷ��
BW(:,1:ceil(c/2))=0;%ǰ�벿��Ϳ��(���ܴ����ֺ��±߽���ߵ�Ӱ��)
temp = bwareaopen(BW,1000);%������ͨ����������ҵ��ھ��ο�����Ϳ��ѡ��Ӱ�죩
temp=bwareaopen(imdilate(temp,ones(40,3)),50000).*temp;%��ȡ���ڿ�
%Ŀ����10���ڿ򣬿��ܴ���11���ڿ�(��11��Ϊ�����Եĺڿ���Ҫȥ��)
[L,num] = bwlabel(temp);%�����ͨ����
if num==11%���Ϊ11���������(���������Ǹ�)Ĩȥ
    L(find(L==11))=0;
    num=10;
end
figure
imshow(L)
title('�ڿ�λ�ã�����ȷ��ѧ����ֵ');
%ȷ���ڿ������λ������ȷ����߿��ŵĴ��λ�á�
addr=find(sum(L')>0);%��һ��
addr2=addr(find(diff(addr)>1));
addr=[addr2-ceil((addr2(1)-addr(1))/2);
addr2(end)+ceil(addr2(1)-addr(1))*2 ];%ȷ��ÿһ���ڿ����ڵ�������
addr_c=ceil(mean(find(sum(L)>0)));%��
addr_r=ceil(mean(find(sum(L')>0)));%��
part1=part1(addr_r-300:end,addr_c-890:addr_c-100);%�Զ��忼������(ֻ�ܴ���С,������Ϣ��ʧ)
figure
imshow(part1)
title('ѧ������');
part1=part1>10&part1<120;%�ҵ���ͼ��ģ��
part1 = bwareaopen(part1,400);%������ͨ����������ҵ���Ϳ�Ŀ���
[L,num] = bwlabel(part1');%�����ͨ���� %��Ϊ��ͨ�����Ǵ������£��ٴ������ҵģ��������������棬������Ҫת��
L=L';%ת�û�ȥ
part1(find(L>8))=0;%ȥ��������
[L num] = bwlabel(part1);%�ٴα�ǣ���ǺŶ�Ӧ��������˳��
figure
imshow(L)
title('ѧ����Ϳ����');
for n=1:8%���ž�8λ
    addr_kh(n)=ceil(mean(find(sum(L'.*(L'==n))>0)))+addr_r-300;%�ҵ����ŵ��С�
    num(n)=find(abs(addr_kh(n)-addr)==min(abs(addr_kh(n)-addr)))-1;%���ŵ�����ڿ�����������ֵ��С����Ӧ�����ټ�1
end
xh=num;
