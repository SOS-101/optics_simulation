%ͼƬ����У׼�����մ��ں��ĺ����ģ���Ҫ��ͼƬ��Ϊ���ģ��Һڿ����ң�
[r c]=size(I2);%ͼ��ĳߴ�
BW=I2<80;%���ݺ��ߵĻҶ�ֵȷ��  BWΪ��ֵ��ͼ��
BW2 = bwareaopen(BW,10000);%������ͨ����������ҵ���������
if sum(sum(BW2)>0)<length(BW2)%���ݺ��߽�ͼƬ����(ΪУ׼ͼƬ������׼��)
    temp = bwareaopen(BW,2000);%������ͨ����������ҵ��ھ��ο�����Ϳ��ѡ��Ӱ�죩
    if sum(sum(temp(1:floor(c/2),:)))>sum(sum(temp(floor(c/2)...
+1:end,:)))%���ݺھ��ο����ϰ�ͼ�����°�ͼ�������ת����
        BW2=imrotate(BW2,-90);%imrotateΪ��תͼ����
        I2=imrotate(I2,-90);%imrotateΪ��תͼ����
    else
        BW2=imrotate(BW2,90);
        I2=imrotate(I2,90);
    end
end
figure
imshow(I2)
title('�������');

%����ֱ�߼��У���Ƕ�
[H theta rho]=hough(BW2);%����ֱ�߼�� %�����BW2Ϊ��������
lines = houghlines(BW2,theta, rho, houghpeaks(H,2));%�����������еĵ� houghpeaks�ҵ������ߵ�2�鼫ֵ��
I2=imrotate(I2,lines(2).theta+((lines(2).theta<0)*2-1)*90,'bilinear','crop');%�Ƕ�У�����ΪI2 ���ݼ��ĽǶ�������ȷ��ƫת����
figure
imshow(I2)
title('����ֱ�߼�⼰�ǶȽ���');
hold on
for k = 1:length(lines)  
    xy = [lines(k).point1; lines(k).point2];  
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');%�����߶�
end
