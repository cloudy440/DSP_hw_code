function Xk = ditfft(xn)
% DIT-FFT function;
% xn is input;
% Xk is output;
%% 获取输入的数据，并补零到2的整数幂
M = nextpow2(length(xn));           %计算距离最近2的幂次
N = 2^M;
for m = 0:N/2-1
    WN(m+1)=exp(-i*2*pi/N)^m;
end
A = [xn, zeros(1, N-length(xn))];   %长度补零至2^M
%% 倒序运算
J = 0;
for I = 0:N-1
    if I < J
        T = A(I+1);
        A(I+1) = A(J+1);
        A(J+1) = T;
    end
    
    K = N/2;
    while J >= K
        J = J-K;
        K = K/2;
    end
    J = J + K;
end
%% 蝶形运算
for L = 1:M
    B = 2^(L-1);        % 蝶形因子的个数
    for R = 0:B-1       % 蝶形因子的顺序
        P = 2^(M-L)*R;  % 蝶形运算K的间隔；
        for K = R:2^L:N-2
            T = A(K+1)+A(K+B+1)*WN(P+1);
            A(K+B+1) = A(K+1)-A(K+B+1)*WN(P+1);
            A(K+1) = T;
        end
    end
end
Xk = A;
end

