%% Code for Experiment-1;
%% 1-1
clear;close all;clc;
N = 50;
x1 = [1,zeros(1,N-1)];
x2 = ones(1,N);
n = 0:N-1;
a = 0.6;
x3 = a.^n;
w0 = pi/3;
ang = pi/15;
x4 = sin(n*w0+ang);
x5 = exp((a+j*w0)*n);
figure(1);
subplot(3,1,1);stem(x1);
ylabel('x_1(n)=\delta(n)');xlabel('n');
subplot(3,1,2);stem(x2);
ylabel('x_2(n)=u(n)');xlabel('n');
subplot(3,1,3);stem(x3);
ylabel('x_3(n)=0.6^n');xlabel('n');
figure(2);
subplot(2,1,1);stem(x4);
ylabel('x_4(n)=sin(n\pi/3+\pi/5');xlabel('n');
subplot(2,1,2);stem(abs(x5));
ylabel('x_5(n)=e^(^0^.^6^+^j^*^\pi^/^3^)^n^)');xlabel('n');

%% 1-2
clc;clear;close all;
a = 0.8;N = 8;
n = -12:12;
Rn = [zeros(1,12),ones(1,N),zeros(1,5)];
x = a.^n.*Rn;
n1=n;n2=n1-3;n3=n1+2;n4=-n1;
subplot(4,1,1);stem(n1,x,'fill');
grid on;ylabel('x1_(n)');axis([-15,15,0,1]);
subplot(4,1,2);stem(n2,x,'fill');
grid on;ylabel('x2_(n)');axis([-15,15,0,1]);
subplot(4,1,3);stem(n3,x,'fill');
grid on;ylabel('x3_(n)');axis([-15,15,0,1]);
subplot(4,1,4);stem(n4,x,'fill');
grid on;ylabel('x4_(n)');axis([-15,15,0,1]);

%% 1-3
clc;clear;close all;
n = -10:20;
x1=3*sin(3*pi*n/5);
x2=cos(1.2*n);
subplot(2,1,1);stem(n,x1);
xlabel('n');ylabel('x1=3*sin(3\pi/5)');grid on;
subplot(2,1,2);stem(n,x2);
xlabel('n');ylabel('x2=cos(1.2*n)');grid on;            %%教材代码有错误；

%% 1-4
clear;close all;clc;
x=1:5;n=-1:3;
nxb=min(n);nxe=max(n);
x1=[x,x,x,x];
nx1=[nxb-5:nxe+2*5];
[x2,nx2]=period(x,n,4,1);       %function
[x3,nx3]=sigperi(x,n,3,1);      %function
subplot(3,1,1);stem(nx1,x1);ylabel('x^~_1(n)');grid on;
subplot(3,1,2);stem(nx2,x2);ylabel('x^~_2(n)');grid on;
subplot(3,1,3);stem(nx3,x3);ylabel('x^~_3(n)');grid on;

%% 1-5
z=LFMdemo(1e2,0,1e-6,1e-9);

%% 1-6
clc;clear;close all;
x=[1:7,6:-1:1];
n=-2:10;
[xl1,nl1]=sigshift(x,n,5);
[x12,n12]=sigshift(x,n,-4);
[x1,n1]=sigadd(2*xl1,nl1,-3*x12,n12);
subplot(2,1,1);stem(n1,x1,'.');grid on;
xlabel('n');ylabel('x_1(n)=2x(n-5)+3x(n+4)');
[x21,n21]=sigfold(x,n);
[x21,n21]=sigshift(x21,n21,3);
[x22,n22]=sigshift(x,n,2);
[x22,n22]=sigmult(x,n,x22,n22);
[x2,n2]=sigadd(x21,n21,x22,n22);
subplot(2,1,2);stem(n2,x2,'.');grid on;
xlabel('n');ylabel('x_2(n)=x(3-n)+x(n)x(n+4)');


function [y,n]=sigadd(x1,n1,x2,n2)
n=min(min(n1),min(n2)):max(max(n1),max(n2));
y1=zeros(1,length(n));y2=y1;
y1(find((n>=min(n1))&(n<=max(n1))==1))=x1;
y2(find((n>=min(n2))&(n<=max(n2))==1))=x2;
y=y1+y2;
end

function [y,n]=sigmult(x1,n1,x2,n2)
n=min(min(n1),min(n2)):max(max(n1),max(n2));
y1=zeros(1,length(n));y2=y1;
y1(find((n>=min(n1))&(n<=max(n1))==1))=x1;
y2(find((n>=min(n2))&(n<=max(n2))==1))=x2;
y=y1.*y2;
end

function [y,ny]=sigshift(x,nx,m)
ny=nx+m;
y=x;
end

function [y,ny]=sigfold(x,nx)
y=fliplr(x);
ny=-fliplr(nx);
end

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
end

function y=LFMdemo(D,be,Tp,s)
b=D/(Tp^2);ss=1/s;
t=be:s:(Tp+be);
n=(t-be)*ss+1;
y=exp(j*pi*b*t.*t);
figure;
Realx=real(y);
Imagx=imag(y);
subplot(2,1,1);plot(n,Realx);
xlabel('n');ylabel('Real(x)');title('实部');
subplot(2,1,2);plot(n,Imagx);
xlabel('n');ylabel('Imag(x)');title('虚部');
end

function[y,ny]=sigperi(x,nx,P,M)
N = length(x);
nxb=nx(1);
nxe=nx(N);
ny=[nxb-M*N:nxe+(P-M)*N];
nmod=ny+(-1)*nxb;
y=x(mod(nmod,N)+1);
end

