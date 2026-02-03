function[y,ny]=sigperi(x,nx,P,M)
N = length(x);
nxb=nx(1);
nxe=nx(N);
ny=[nxb-M*N:nxe+(P-M)*N];
nmod=ny+(-1)*nxb;
y=x(mod(nmod,N)+1);