%-------------------------------------------------------------------------%
%--------Experiment 13:13-1,13-2,13-3,13-4,13-6---------------------------%
%-------------------------------------------------------------------------%
%% Experiment 13-1
clc;clear;close all;
N = input('N = ?');
n = 0:N-1;a = (N-1)/2;Wc=pi/4;
k = n-a;k=k+(k==0)*eps;
hd=(-1).^n.*sin(k*Wc)./(k*pi);
Wr=ones(1,N);
Whn=0.5*(1-cos(2*pi*n/(N-1)));
h1=hd.*Wr;
h2=hd.*Whn;
[H1,w1]=freqz(h1,1,1000);
[H2,w]=freqz(h2,1,1000);
mag1=abs(H1);db1=20*log10(mag1/max(mag1));
mag2=abs(H2);db2=20*log10(mag2/max(mag2));
figure(1);subplot(2,1,1);
stem(k,h1);
xlabel('n');ylabel('h(n)');grid on;
subplot(2,1,2);
plot(w1/pi,mag1,'-k');
xlabel('\omega/\pi');ylabel('Mag(dB)');grid on;
figure(2);subplot(2,1,1);
stem(k,h2);
xlabel('n');ylabel('h(n)');grid on;
subplot(2,1,2);
plot(w/pi,mag2,'-k');
xlabel('\omega/\pi');ylabel('Mag(dB)');grid on;
figure(3)
freqz(h1)

%% experiment 13-2
clc;clear;close all;
N = 21;
wc=pi/4;
n=0:N-1;
a=(N-1)/2;
na=n-a+eps*((n-a)==0);
hdn=sin(wc*na)/pi./na;
% if rem(N,2)~=0 
%     hdn(a+1)=wc/pi;
% end
wn1=boxcar(N);
hn1=hdn.*wn1';
figure(1);stem(n,hn1,'.');line([0,20],[0,0]);grid on;
xlabel('n');ylabel('h(n)');title('矩形窗设计的h(n)');
hw1=fft(hn1,512);w1=2*[0:511]/512;
figure(2);
subplot(2,1,1);plot(w1,20*log10(abs(hw1)));grid on;
ylabel('Mag(dB)');title('MagFeature');
subplot(2,1,2);plot(w1,unwrap(angle(hw1)));grid on;
xlabel('\omega/\pi');ylabel('Phase(deg)');title('PhaseFeature');

%% Experiment 13-3
clc;clear;close all;
N = input('N=?');
wc=0.25;
h1=fir1(N,wc,boxcar(N+1));
h2=fir1(N,wc,hamming(N+1));
M=128;
H1=freqz(h1,1,M);
H2=freqz(h2,1,M);
f=0:0.5/M:0.5-0.5/M;
plot(f,abs(H1),'--k');hold on;
plot(f,abs(H2),'-');hold on;
legend('矩形窗','汉明窗');grid on;
xlabel('\omega/(2\pi)');ylabel('|H(e^j\omega)|');
axis([0,0.5,0, 1.2]);

%% Experiment 13-4
clc;clear;close all;
ws1=0.2*pi;
ws2=0.8*pi;
wp1=0.35*pi;
wp2=0.5*pi;
tr_width=min((wp1-ws1),(ws2-wp2));
N = ceil(12*pi/tr_width)+1;
wc1=(ws1+wp1)/2;
wc2=(ws2+wp2)/2;
wc=[wc1,wc2];
h=fir1(N,wc/pi,blackman(N+1));
[H,w]=freqz(h,1,1000);
mag=abs(H);
db=20*log10(mag/max(mag));
subplot(2,1,1);
plot(w/pi,db,'-b');
xlabel('\omega/\pi');ylabel('Mag(dB)');axis([0,1,-150,10]);grid on;
subplot(2,1,2);
plot(w/pi,unwrap(angle(H)),'-k');
xlabel('\omega/\pi');ylabel('Phase(dB)');grid on;
%% Experiment 13-5
clc;clear;close all;
wc=[0.2 0.4 0.6 0.8];
h=fir1(40,wc,'dc-1');
stem(h,'.');
line([0 45],[0 0]);
xlabel('n');
ylabel('h(n)');
figure(2);
freqz(h);

%% Experiment 13-6
clc;clear;close all;
N = 21;
a=(N-1)/2;
n=0:N-1;
hd=cos(pi*(n-a))./(n-a);
hd(a+1)=0;
win=(hamming(N))';
hn= hd.*win;
[H,w]=freqz(hn);
mag=abs(H);
db=20*log10(mag/max(mag));
subplot(2,1,1);plot(w/pi,db,'-b');
xlabel('\omega/\pi');ylabel('Mag(dB)');grid on;
subplot(2,1,2);plot(w/pi,unwrap(angle(H)),'-k');
xlabel('\omega/\pi');ylabel('Phase(dB)');grid on;
figure(2);
[Hr,W]=zerophase(hn);
plot(W/pi,Hr);
xlabel('\omega/\pi');ylabel('振幅响应H(\omega)');grid on;

%% Experiment 13-8
clc;clear all;close all;
N=1000;
Fs=1000;
fc=200;
n = [0:N-1];
t = n/Fs;
f1=50;
f2=250;
x=sin(2*pi*f1*t)+sin(2*pi*f2*t);
h=fir1(40,fc*2/Fs);
yfft=fftfilt(h,x,256);
n1=81:241;
t1=t(n1);
x1=x(n1);
subplot(2,1,1);plot(t1,x1),grid on;
title('输人信号');
n2=n1-40/2;
t2=t(n2);
y2=yfft(n2);
subplot(2,1,2);
plot(t2,y2);title('输出信号');grid on;xlabel('时间/s');
