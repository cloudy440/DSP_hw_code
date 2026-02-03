function [Hr, w] = Hr_type3(h)
% HR_TYPE3 计算第3类线性相位FIR滤波器的振幅响应 (修正版)
% 修正说明：确保输出为列向量，以适配 E8.m 的转置操作
    
    N = length(h);
    L = (N-1)/2;
    
    % 生成频率向量 (列向量 501x1)
    w = (0:500)'*pi/500; 
    
    % 初始化 Hr 为列向量 (501x1) !!! 这里是关键修改
    Hr = zeros(length(w), 1);
    
    % 计算公式
    for n = 1:L
        % h(L+1-n) 是标量，sin(w*n) 是列向量，结果保持为列向量
        Hr = Hr + 2 * h(L+1-n) * sin(w*n);
    end
end