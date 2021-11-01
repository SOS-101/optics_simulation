clear;
[fname,pname]=uigetfile({'*.jpg';'*.bmp';'*.tif';'*.gif'},'Please choose a color picture...');% ���ش򿪵�ͼƬ����ͼƬ·���� 
[u,v]=size(fname);
y=fname(v);% ͼƬ��ʽ����ֵ
switch y
    case 0 
        errordlg('You Should Load Image File First...','Warning...');
    case{'g';'G';'p';'P';'f';'F'};% ͼƬ��ʽ����JPG/jpg��BMP/bmp��TIF/tif����GIF/gif���Ŵ�     
        I=cat(2,pname,fname);
        Ori_Face=imread(I);
        subplot(2,3,1),imshow(Ori_Face);
    otherwise
        errordlg('You Should Load Image File First...','Warning...');
end
p=rgb_RGB(Ori_Face);          %��ɫ�ָ�
subplot(2,3,2);imshow(p);     % ��ʾƤ���Ҷ�ͼ��
low_pass=1/9*ones(3);
image_low=filter2(low_pass,p);% ��ͨ�˲�ȥ���� 
subplot(2,3,3);imshow(image_low);
% ����Ӧ��ֵ���� 
previousSkin2=zeros(i,j);
changelist=[];
for threshold=0.55:-0.1:0.05
    two_value=zeros(i,j);
    two_value(find(image_low>threshold))=1;
    change=sum(sum(two_value-previousSkin2));
    changelist=[changelist change];
    previousSkin2=two_value;
end
[C,I]=min(changelist);
optimalThreshold=(7-I)*0.1;
two_value=zeros(i,j);
two_value(find(image_low>optimalThreshold))=1;% ��ֵ��
subplot(2,3,4);imshow(two_value);             % ��ʾ��ֵͼ��
frontalmodel=imread('templet.jpg');           % ��������ģ����Ƭ
FaceCoord=[];
imsourcegray=rgb2gray(Ori_Face)��             % ��ԭ��Ƭת��Ϊ�Ҷ�ͼ�� 
[L,N]=bwlabel(two_value,8);% ��ע��ֵͼ�������ӵĲ���,LΪ���ݾ���NΪ�����ĸ��� 
for i=1:N,
    [x,y]=find(bwlabel(two_value)==i);% Ѱ�Ҿ����б��Ϊi���к��е��±� 
    bwsegment=bwselect(two_value,y,x,8);% ѡ�����i������ 
    numholes=1-bweuler(bwsegment,4);% ���������Ŀն���
    if(numholes>=1)% �����������ٰ���һ����������ѡ��������һ������ 
        RectCoord=-1;
        [m n]=size(bwsegment);
        [cx,cy]=center(bwsegment);% ������������ 
        bwnohole=bwfill(bwsegment,'holes');% ������ס�����Ҷ�ֵ��Ϊ1�� 
        justface=uint8(double(bwnohole).*double(imsourcegray));% ֻ��ԭ��Ƭ�ĻҶ�ͼ���б����ô�ʶ������ 
        angle=orient(bwsegment,cx,cy);% ��������ƫת�Ƕ�
        bw=imrotate(bwsegment,angle,'bilinear');
        bw=bwfill(bw,'holes');
        [l,r,u,d]=bianjie(bw);
        wx=(r-l+1);% ��� 
        ly=(d-u+1);% �߶� 
        wratio=ly/wx;% �߿��      
        if((0.8<=wratio)&&(wratio<=2))% ���Ŀ������ĸ߶�/��ȱ�������0.8��С��2.0������ѡ��������һ������ 
            S=ly*wx;% ���������������ε���� 
            A=bwarea(bwsegment);% ������������
            if(A/S>0.35)
                [ccorr,mfit,RectCoord]=mobanpipei(justface,frontalmodel,ly,wx,cx,cy,angle);
            end
            if(ccorr>=0.6)
                mfitbw=(mfit>=1);
                invbw=xor(mfitbw,ones(size(mfitbw)));
                source_with_hole=uint8(double(invbw).*double(imsourcegray));
                final_image=uint8(double(source_with_hole)+double(mfit));
                subplot(2,3,5);imshow(final_image);% ��ʾ������ģ�����ĻҶ�ͼ�� 
                imsourcegray=final_image;
                subplot(2,3,6);imshow(Ori_Face);% ��ʾ���Ч��ͼ
            end;
            if(RectCoord~=-1)
                FaceCoord=[FaceCoord;RectCoord];
            end
        end
    end
end
% ����Ϊ�����������򻭾��� 
[numfaces x]=size(FaceCoord);
for i=1:numfaces,
    hd=rectangle('Position',FaceCoord(i,:),'LineWidth',3);
    set(hd,'edgecolor','r');
end
