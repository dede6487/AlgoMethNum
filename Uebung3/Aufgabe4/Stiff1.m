function [K_h] = Stiff1(N)

m = (N-1)^2;
n = m;

K_h = sparse(i,j,s,m,n);

end