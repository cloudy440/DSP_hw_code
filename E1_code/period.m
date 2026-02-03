function[xperi,nx]=period(x,n,P,M)
%x,n分别为输入序列和其时间序列
%P,M分别为周期延拓的次数即左边延拓的次数
%xperi,nx 分别为周期延拓序列及其时间序列
x1=x'*ones(1,P);
x2=x1(:);
xperi=x2';
N=length(x);
nx=[n,max(n)+1:max(n)+(P-1)*N];
nx=nx-M*N;