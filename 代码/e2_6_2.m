syms a x            %������ű���a��x
f=sin(a*x);           %��������f
dfx=diff(f,x)        %��x��
dfa=diff(f,a)        %��a��


f=x*log(1+x);         %��������f
int1=int(f,x)         %��x����
int2=int(f,x,-1,1)    %��[-1,1]�����ϵĻ���
