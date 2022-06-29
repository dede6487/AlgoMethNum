function [K_h] = Stiff2(N)

n = (N-1)^2;
h = 1/N;
e = ones(n,1);

b1 = -ones(n-1,1);
b1(N-1:N-1:n-1) = 0;


B = [-e,[b1',0]',4*e,[0,b1']',-e];
d = [-N+1,-1,0,1,N-1];

K_h = (1/h^2) * spdiags(B,d,n,n);

end