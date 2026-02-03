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
