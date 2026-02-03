%% Code for experiment2
%% Experiment 2-1-1
clear;clc;close all;
n=0:19;
hn=0.5.^n;
m=0:101;
xn=(1/3).^m;
y=conv(xn,hn);
stem(0:length(y)-1,y);
grid on;
xlabel('n');
ylabel('x(n)和h(n)的卷积和计算结果');

%% Experiment 2-1-2
clear;clc;close all;
n=0:19;
hn=0.5.^n;
m=0:101;
xn=(1/3).^m;
[y,ny]=convolution(xn,m,hn,n);
stem(ny,y);
grid on;
xlabel('n');
ylabel('x(n)和h(n)的卷积和计算结果');

%% Experiment 2-1-3
clear;clc;close all;
n=0:19;
hn=0.5.^n;
m=0:101;
xn=(1/3).^m;
[y,ny]=conv_m(xn,m,hn,n);
stem(ny,y);
grid on;
xlabel('n');
ylabel('x(n)和h(n)的卷积和计算结果');

%% Experiment 2-2
clear;clc;close all;
x = [2 10 6 -1 -2 4 2];
nx =-3:3;
h = [3 4 1 -4 3 2];
nh = -1:4;
y1=conv(x,h);
[y2,ny2]=conv_m(x,nx,h,nh);
[y3,ny3]=convolution(x,nx,h,nh);
subplot(3,1,1);stem(ny2,y1);
subplot(3,1,2);stem(ny2,y2);
subplot(3,1,3);stem(ny3,y3);

%% Experiment 2-3
clc;clear;close all;
xn=[0,ones(1,99)];
hn=[0 0 0 3 0.5 0.2 0.7 0 -0.8];
y=conv(xn,hn);
stem(0:length(y)-1,y);
grid on;
xlabel('n');
ylabel('系统的频率响应');

%% Experiment 2-4
clc;clear;close all;
[x,fs]=audioread('test.wav');
d=30;
h=[1,zeros(1,d-2),1];
y=conv(x,h);
subplot(2,1,1);
stem(0:length(x)-1,x);title('原始信号');
subplot(2,1,2);
stem(0:length(y)-1,y);title('回声信号');

%% Experiment 2-5
clear;clc;close all;
[x,nx]=stepseq(0,-5,9);
[u,nu]=stepseq(0,0,50);
nh=nu;h=0.9.^nh.*u;
[h1,nh1]=sigfold(h,nh);
nyb=nx(1)+nh(1);
nye=nx(length(x))+nh(length(h));
for n=nyb:nye
    [h2,nh2]=sigshift(h1,nh1,n);
    y1=sigmult(x,nx,h2,nh2);
    y(n-1*nyb+1)=sum(y1);
end
subplot(3,1,1);stem(nx,x);ylabel('x(n)');grid on;
subplot(3,1,2);stem(nh,h);ylabel('h(n)');grid on;
subplot(3,1,3);stem(nyb:nye,y);xlabel('n');ylabel('y(n)=x(n)*h(n)');grid on;

%% Experiment 2-6
%------Part I-------%
clear;clc;close all;
x=ones(1,10);
n=[0:14];h=0.5.^n;
y=conv(x,h);
stem(y);
xlabel('n');
ylabel('y(n)=x(n)*h(n)');

%------Part II-------%
nx=[-5:4];
x=ones(1,10);
nh=[0:14];
h=0.5.^nh;
y=conv(x,h);
n0=nx(1)+nh(1);
N=length(nx)+length(nh)-2;
ny=n0:n0+N;
subplot(2,2,1);stem(nx,x);title('x(n)');xlabel('n');ylabel('x(n)');
subplot(2,2,2);stem(nh,h);title('h(n)');xlabel('n');ylabel('h(n)');
subplot(2,2,3);stem(ny,y);title('x(n)与h(n)的卷积和y(n)');xlabel('n');ylabel('y(n)');
h=get(gca,'position');h(3)=2.5*h(3);
set(gca,'position',h);

%------Part III-------%
x=ones(1,10);lx=length(x);
h=0.5.^[0:14];lh=length(h);
lmax=max(lx,lh);
if lx>lh
    nx=0;nh=lx-lh;
elseif lx<lh
    nh=0;nx=lh-lx;
else
    nx=0;lh=0;
end
lt=lmax;
u=[zeros(1,lt),x,zeros(1,nx),zeros(1,lt)];
t1=(-lt+1:2*lt);
h=[zeros(1,2*lt),h,zeros(1,nh)];
hf=fliplr(h);
N=length(hf);
y=zeros(1,3*lt);
for k=0:2*lt
    p=[zeros(1,k),hf(1:N-k)];
    y1=u.*p;
    yk=sum(y1);
    y(k+lt+1)=yk;
    subplot(4,1,1);stem(t1,u);
    axis([-lt,2*lt,min(u),max(u)]);hold on;ylabel('x(n)');
    subplot(4,1,2);stem(t1,p);axis([-lt,2*lt,min(p),max(p)]);ylabel('h(k-n)');
    subplot(4,1,3);stem(t1,y1);axis([-lt,2*lt,min(y1),max(y1)+eps]);
    ylabel('s=u.*h(k-n)');
    subplot(4,1,4);stem(k,yk);
    axis([-lt,2*lt,floor(min(y)+eps),ceil(max(y+eps))]);hold on;ylabel('y(k)=sum(s)');
    pause(1);
end

