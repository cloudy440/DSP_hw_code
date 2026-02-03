%% IIR数字滤波器设计
% 完成实验例程，并自行完成课后实验内容第2，3题。
%% 实验11-1
wp =2000*pi;
rp=1;
ws=3000*pi;
rs=15;
[N,omegac]=butterworthord(wp,ws,rp,rs);
disp(N);
disp(omegac);

%% 实验11-2
num = [1];
den = [1,sqrt(5),2,sqrt(2),1];
[B1,A1]=impinvar(num,den);
[B2,A2]=bilinear(num,den,1);
disp(B1);
disp(A1);
disp(B2);
disp(A2);
%% IIR数字滤波器的设计，实验11,11-3
clc;clear;close all;
N = 3;T = 250*10^(-6);
fs=1/T;fc=1000;
[B, A] = butter(N,2*pi*fc,'s');
[num1,den1] = impinvar(B,A,fs);
[h1,w] = freqz(num1,den1);
[B,A]= butter(N,2/T*tan(2*pi*fc*T/2),'s');
[num2,den2]=bilinear(B,A,fs);
[h2,w]=freqz(num2,den2);
f = w/pi*2000;
figure(1);
plot(f,abs(h1),'k',f,abs(h2),'b--');
grid on;
xlabel('Freq(Hz)');ylabel('Amp(dB)');
legend('Impulse','bilinear');
disp(num1);
disp(den1);
disp(num2);
disp(den2);

%% 实验11， 11-4
clc;clear;close all;
fc=1000;
ap=1;as=25;fp=100;fs=300;
wp=2*pi*fp/fc;
ws=2*pi*fs/fc;
Wanp=wp*fc;
Wans=ws*fc;
[N,Wans]=buttord(Wanp,Wans,ap,as,'s');
[b,a]=butter(N,Wans,'s');
[B1,A1]=impinvar(b,a,fc);
[H1,w]=freqz(B1,A1,'whole');
figure(2);
subplot(2,1,1);
plot(w*fc/2/pi,20*log10(abs(H1)));grid on;
axis([0,1000,-40,0]);
ylabel('H1 amp(dB)');
title('冲激响应不变法设计的IIR滤波器');

%---------------------%
fc=1000;
ap=1;as=25;fp=100;fs=300;
wp=2*pi*fp/fc;
ws=2*pi*fs/fc;
anp=2*fc*tan(wp/2);
ans=2*fc*tan(ws/2);
[N, anc]= buttord(anp,ans,ap,as,'s');
[b,a]=butter(N,anc,'s');
[B2,A2]=bilinear(b,a,fc);
[H2,w]=freqz(B2,A2,'whole');
subplot(2,1,2);
plot(w*fc/2/pi,20*log10(abs(H2)));
axis([0,1000,-100,0]);grid on;
xlabel('Freq(Hz)');ylabel('H2 Amp(dB)');
title('双线性变化法设计的IIR滤波器');

%-------直接设计法-----------%
clc;clear;
fc=1000;
ap=1;as=25;fp=100;fs=300;
wp=2*fp/fc;
ws=2*fs/fc;
[N,Wn]=buttord(wp,ws,ap,as);
[B,A]=butter(N,Wn);
[H,W]=freqz(B,A,'whole');
figure(3)
subplot(2,1,1);
plot(W*fc/2/pi,20*log10(abs(H)));
axis([0,1000,-100,0]);grid on;
xlabel('Freq(Hz)');ylabel('H Amp(dB)');
title('直接设计法设计的IIR滤波器');
subplot(2,1,2);
plot(W*fc/2/pi,angle(H)/pi*180);
xlabel('Freq(Hz)');ylabel('Phase(deg)');grid on;

%% 实验11,11-5
clc;clear;close all;
fs=80000;
f1=4000;Rp=0.5;
f2=20000;Rs=45;
wp=2*pi*f1;
ws=2*pi*f2;
[N,Wn]=cheb1ord(wp,ws,Rp,Rs,'s');
[b,a]=cheby1(N,Rp,Wn,'low','s');
[B,A]=impinvar(b,a,fs);
[H,w]=freqz(B,A);
figure(3);
subplot(2,1,1);
f=w/2/pi*fs;
plot(f,20*log10(abs(H)));
grid on;ylabel('Amp(dB)');
title('IIR数字滤波器的设计步骤');

fs=80000;
f1=4000;Rp=0.5;
f2=20000;Rs=45;
wp=2*f1/fs;
ws=2*f2/fs;
[N,Wn]=cheb1ord(wp,ws,Rp,Rs);
[B,A]=cheby1(N,Rp,Wn);
[H,w]=freqz(B,A);
subplot(2,1,2);
f= w/2/pi*fs;
plot(f,20*log10(abs(H)));
grid on;xlabel('Freq(Hz)');ylabel('Amp(dB)');
axis([0,40000,-100,0]);
title('直接设计');

