%% Experiment 8 -1，ditfft
xn=[1 2 3 4 5 6 7 8];
Xk=ditfft(xn);
disp(Xk);

%% Experiment 8-2
clc;clear;close all;
Xk=[36,-4+9.6569i,-4+4i,-4+1.6569i,-4,-4-1.6569i,-4-4i,-4-9.6569i];
N =length(Xk);
Xk1=conj(Xk);
xn1=ditfft(Xk1);
xn1=conj(xn1)/N;
xn1=real(xn1);

xn2=fft(Xk1);
xn2=conj(xn2)/N;
xn2=abs(xn2);
disp(xn1);
disp(xn2);

%% Experiment 8-3
clc;clear;close all;
Nmax = 8001;        % 增加N的长度，方便评估计算时间；
%-------DiT-FFT
ditfft_time = zeros(1,Nmax);
for n = 1:50:Nmax
    x = rand(1,n);
    t = clock;
    ditfft(x);
    ditfft_time(n) = etime(clock,t);
end
k = 1:50:Nmax;
subplot(3,1,1);plot(k,ditfft_time(k),'r-o');hold on;
axis([0 Nmax 0 max(ditfft_time)]);
ylabel('t/s');title('Dit-FFT执行时间');
%-----DFTfor
DFTfor_time = zeros(1,Nmax);
for n =1:800:Nmax
    x = rand(1,n);
    t = clock;
    DFTfor(x);
    DFTfor_time(n)=etime(clock,t);
end
k=1:800:Nmax;
subplot(3,1,2);plot(k,DFTfor_time(k),'r-o'); hold on;
axis([0 Nmax 0 max(DFTfor_time)]);
ylabel('t/s');title('DFTfor执行时间');
%----DFTmat
DFTmat_time = zeros(1,Nmax);
for n =1:800:Nmax
    x = rand(1,n);
    t = clock;
    DFTfor(x);
    DFTmat_time(n)=etime(clock,t);
end
k=1:800:Nmax;
subplot(3,1,3);plot(k,DFTmat_time(k),'r-o');hold on;
axis([0 Nmax 0 max(DFTmat_time)]);
ylabel('t/s');title('DFTmat执行时间');
