%�ɼ�����������еĴ�ΪA
ans_file=textread('answers.txt','%s');%��ȡ��׼��
for n=1:20
    answers(n,1:5)=abs(ans_file{n})-64;%��ABCD->1234
end
score=sum(sum(xz_ans==answers));%��ɼ�
%�����ʾ
disp('ѧ���𰸣�');
disp(char(xz_ans+64));
disp(['ѧ�ţ�' num2str(xh)]);
disp(['�ɼ���' num2str(score)]);
