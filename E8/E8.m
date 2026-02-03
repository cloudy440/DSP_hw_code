%-------------------------------------------------------------------------%
%--------Experiment 14:14-1,14-2,14-3,14-4--------------------------------%
%-------------------------------------------------------------------------%
%% Experiment 14-1
%------Part I---------
clc;clear;close all;
N= 33;
a=(N-1)/2;
Hrs=[ones(1,9),zeros(1,16),ones(1,8)];
k=0:1:N-1;
k1=0:floor((N-1)/2);
k2=floor((N-1)/2)+1:N-1;
% angH=[-a*(2*pi)/N*k1,a*(2*pi)/N*(N-k2)];
angH=-k*pi*(N-1)/N;
H=Hrs.*exp(i*angH);
h=real(ifft(H,N));
[H,w]=freqz(h,1,1000);
mag=abs(H);
Hdb=20*log10(mag);
H1=0.3;
Hrs1=[ones(1,9),H1,zeros(1,14),H1,ones(1,8)];
Hb1=Hrs1.*exp(i*angH);
hb1=real(ifft(Hb1,N));
[Hb1,w1]=freqz(hb1,1,1000);
mag1=abs(Hb1);
Hdb1=20*log10(mag1);
figure(1);
plot(w/pi,Hdb,'--k');grid on;hold on;
plot(w1/pi,Hdb1,'b');hold off;
xlabel('\Omega/\pi');ylabel('Mag(dB)');legend('N=33','N=33 优化');
figure(2);
plot(w/pi,unwrap(angle(H)),'--k');grid on;hold on;
plot(w1/pi,unwrap(angle(Hb1)),'b');hold off;
xlabel('\omega/\pi');ylabel('Phase');legend('N=33','N=33 优化');
%-----Part II-------
clc;clear;close all;
N = 32;
F=[0:1/32:1];
A=[ones(1,16),zeros(1,N-15)];
h=fir2(N,F,A);
freqz(h);
figure(2);stem(h,'.');
line([0,35],[0,0]);xlabel('n');ylabel('h(n)');
%% Experiment 14-2
clc;clear;close all;
N=33;
a=(N-1)/2;
k=0:N-1;
wk=2*pi/N*k;
T1=0.1095;
T2=0.5980;
Hk=[zeros(1,11),T1,T2,ones(1,8),T2,T1,zeros(1,10)];
k1=0:floor((N-1)/2);
k2=floor((N-1)/2)+1:N-1;
angk=[-(N-1)/N*pi*k1,(N-1)/N*pi*(N-k2)];
H=Hk.*exp(i*angk);
h=real(ifft(H,N));
freqz(h);
figure(2);stem(h,'.');
line([0,35],[0,0]);xlabel('n');ylabel('h(n)');grid on;

%% Experiment 14-3
%-----Part I--------------
clc;clear;close all;
N = 22;
alpha=(N-1)/2;
Hk=[zeros(1,3),ones(1,2),zeros(1,13),-1*ones(1,2),zeros(1,2)];
k=0:N-1;
wk=-2*pi*alpha/N*k;
H=Hk.*exp(i*wk);
h=real(ifft(H,N));
[H,w]=freqz(h);
magH=abs(H);
Hdb=20*log10(magH);
subplot(2,1,1);
plot(w/pi,Hdb,'-k');ylim([-100,0]);grid on;
xlabel('\omega/\pi');ylabel('Mag/dB');
subplot(2,1,2);
plot(w/pi,unwrap(angle(H)),'-b');grid on;
xlabel('\omega/\pi');ylabel('Phase');
figure(2);stem(h,'.');
line([0,25],[0,0]);xlabel('n');ylabel('h(n)');grid on;

%-----Part II-----------
clc;clear;close all;
N = 21;
F=[0:1/100:1];
A=[zeros(1,20),ones(1,20),zeros(1,101-40)];
h=fir2(N,F,A);
freqz(h);
figure(2);stem(h,'.');
line([0,25],[0,0]);xlabel('n');ylabel('h(n)');grid on;

%% Experiment 14-4
clc;clear;close all;
f=0:0.002:1;
m(1:201)=1;
m(202:301)=0;
m(302:351)=0.5;
m(352:401)=0;
m(402:501)=1;
h=fir2(100,f,m);
[H,w1]=freqz(h);
plot(f,m,'k:');hold on;
w1=w1./pi;
plot(w1,abs(H));legend('理想滤波器','设计滤波器');
xlabel('归一化频率');ylabel('Mag');
figure(2);plot(w1,unwrap(angle(H)),'--k');grid on;
xlabel('\omega/\pi');ylabel('Phase');

%% Experiment 14-5
clc;clear;close all;
N=51;a=(N-1)/2;
k=0:N-1;wk=2*pi/N*k;
k1=0:floor((N-1)/2);
k2=floor((N-1)/2)+1:N-1;
T=0.39i;
Hk=[0,-i*ones(1,(N-3)/2),-1*T,1*T,i*ones(1,(N-3)/2)];
angk=[-(N-1)/N*pi*k1,(N-1)/N*pi*(N-k2)];
H=Hk.*exp(i*angk);
h=real(ifft(H,N));
freqz(h);
subplot(2,1,1);
xlabel('\omega/\pi');ylabel('Mag(dB)');
subplot(2,1,2);
xlabel('\omega/\pi');ylabel('Phase');
figure(2);
[Hr,W]=Hr_type3(h);
W=W';Hr=Hr';
W=[-fliplr(W),W(2:501)];
Hr=[-fliplr(Hr),Hr(2:501)];
plot(W/pi,Hr);
xlabel('\omega/\pi');ylabel('振幅响应H（\omega）');grid on;

%% Experiment 14-6
clc;clear;close all;
N =33;
alpha=(N-1)/2;
Dw=2*pi/N;
k=0:N-1;
w1=Dw*k;
k1=0:floor((N-1)/2);
k2=((N-1)/2)+1:N-1;
Hrs=[i*Dw*k1,-i*Dw*(N-k2)];
angH=[-alpha*Dw*k1,alpha*Dw*(N-k2)];
H=Hrs.*exp(i*angH);
h=real(ifft(H,N));
freqz(h);
subplot(2,1,1);
xlabel('\omega/\pi');ylabel('Mag(dB)');
subplot(2,1,2);
xlabel('\omega/\pi');ylabel('Phase');
figure(2);
[Hr,ww]=Hr_type3(h);
subplot(2,1,1);plot(ww/pi,Hr);grid on;
xlabel('\omega/\pi');ylabel('Mag(dB)');hold on;
plot((2*k1/N),imag(Hrs(1,k1+1)),'-o');hold off;
subplot(2,1,2);stem(h,'o');
line([0,35],[0,0]);grid on;
xlabel('n');ylabel('h(n)');

