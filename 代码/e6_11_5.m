%����ѡ���
figure
imshow(part2)
title('ѡ��������');
part2(:,find(sum(part2==0)>10))=[];%ȥ������ת���߽����0����
part2=imresize(part2,[2500 2800]);%�����趨��С������ָ���С��һ��
[r c]=size(part2);%�����趨�˴�С
BW=part2>10&part2<100;%���ݺڿ�ĻҶ�ֵȷ��
BW(:,1:ceil(c/2))=0;%ǰ�벿��Ϳ��(���ܴ����ֺ��±߽���ߵ�Ӱ��)
temp = bwareaopen(BW,1000);%������ͨ����������ҵ��ھ��ο�����Ϳ��ѡ��Ӱ�죩
temp=bwareaopen(imdilate(temp,ones(40,3)),100000).*temp;%��ȡ���ڿ�
addr_r=ceil(mean(find(sum(temp)>0)));%��
addr=find(sum(temp')>0);%��һ��
addr2=addr(find(diff(addr)>1));%�Ժ��
addr=[addr2-ceil((addr2(1)-addr(1))/2) addr2(end)+ceil(addr2(1)-addr(1))*2 ];%ȷ��ÿһ���ڿ����ڵ�������
%�Զ���ѡ������(ֻ�ܴ���С,������Ϣ��ʧ)  ��4��
xz{1}=part2(50:end,250:addr_r-1820);
xz{2}=part2(50:end,addr_r-1670:addr_r-1250);
xz{3}=part2(50:end,addr_r-1080:addr_r-680);
xz{4}=part2(50:end,addr_r-540:addr_r-180);
figure
for n=1:4
    subplot(1,4,n);
    imshow(xz{n});
end
%�ҵ�20��ģ��
xz_temp=[];%���ڴ洢20��ģ�� 6+6+6+2=20
for m=1:4%��4��
    temp=xz{m};
    if m<4%ǰ3��ÿ��6��
        for n=1:6:31%1:6:37����Ϊ�ָ�ı�־
            xz_temp{end+1}=imresize(temp(addr(n):addr(n+6)-50,:),[400 600]);
        end
    else%������ֻ��2��
        for n=1:6:7 %1:6:7����Ϊ�ָ�ı�־
            xz_temp{end+1}=imresize(temp(addr(n):addr(n+6)-50,:),[400 600]);
        end
    end
end
figure
subplot(1,2,1);
imshow(xz_temp{1});
title('ѡ�����һģ��')
%��ȡÿ��ģ��Ĵ�
xz_ans=[];%�ж�ѡ����Ĵ𰸣�ABCD-1234��δ��Ϊ0
for n=1:20
    ans_temp=zeros(1,5);%Ĭ��ȫ��δ��
    temp=xz_temp{n};%��ȡģ��
    temp=temp>10&temp<100;%���ݺڿ�ĻҶ�ֵȷ��
    temp = imfill(temp,'holes');%����ڲ�����
    temp=bwareaopen(temp,1500);%�ҵ���Ϳ��ѡ��
    if n<2
        subplot(1,2,2);
        temp22=temp;%������ʾ
        temp22([80 160 240 320],:)=1;
        temp22(:,[150 300 450])=1;
        imshow(temp22);
        title('��ֵͼ');
    end
    [L num]=bwlabel(temp);%�����Ϳ����
    for m=1:num
        xz_r=ceil(mean(find(sum(L'==m)>0))/400*5);%��(1~5)
        xz_c=ceil(mean(find(sum(L==m)>0))/600*4);%��(1~4)
        ans_temp(xz_r)=xz_c;%��ѡ���������ģ����
    end
    xz_ans(n,1:5)=ans_temp;
end
disp('ѧ���𰸣�');
disp(char(xz_ans+64));
