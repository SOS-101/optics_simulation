function [ccorr,mfit,RectCoord]=mobanpipei(mult,frontalmodel,ly,wx,cx,cy,angle)
frontalmodel=rgb2gray(frontalmodel);
model_rot=imresize(frontalmodel,[ly wx],'bilinear');% ����ģ���С
model_rot=imrotate(model_rot,angle,'bilinear');% ��תģ�� 
[l,r,u,d]=bianjie(model_rot);% ��߽����� 
bwmodel_rot=imcrop(model_rot,[l u (r-l) (d-u)]);% ѡ��ģ���������� 
[modx,mody]=center(bwmodel_rot);% ������ 
[morig,norig]=size(bwmodel_rot);% ����һ������������ģ��ĻҶ�ͼ�� 
mfit=zeros(size(mult));
mfitbw=zeros(size(mult));
[limy,limx]=size(mfit);
% ����ԭͼ��������ģ������� 
startx=cx-modx;
starty=cy-mody;
endx=startx+norig-1;
endy=starty+morig-1;
startx=checklimit(startx,limx);
starty=checklimit(starty,limy);
endx=checklimit(endx,limx);
endy=checklimit(endy,limy);
for i=starty:endy,
    for j=startx:endx,
        mfit(i,j)=model_rot(i-starty+1,j-startx+1);
    end;
end;
ccorr=corr2(mfit,mult);% ������ض� 
[l,r,u,d]=bianjie(bwmodel_rot);
sx=startx+l;
sy=starty+u;
RectCoord=[sx sy (r-1) (d-u)];% ������������
