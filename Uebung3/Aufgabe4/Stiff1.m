function [K_h] = Stiff1(N)

i = N-1;
j = i;

K_h = sparse(i,j,s,m,n);

end