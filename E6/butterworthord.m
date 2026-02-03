function [N,omegac]=butterworthord(wp,ws,rp,rs)
if wp<0
    error('通带截止频率必须大于0');
end
if ws<=wp
    error('阻带截止频率必须大于通带截止频率');
end
if (wp<0)||(rs<0)
    error('通带衰减或阻带衰减必须大于0');
end
N=ceil((log10((10^(rp/10)-1)/(10^(rs/10)-1)))/(2*log10(wp/ws)));
omegac=ws/((10^(rs/10)-1)^(1/(2*N)));
