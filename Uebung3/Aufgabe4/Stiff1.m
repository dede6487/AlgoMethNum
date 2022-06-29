function [K_h] = Stiff1(N)

n = (N-1)^2;
h = 1/N;

b1 = -ones(n-1,1);

b = -ones(n-N+1,1);

b1(N-1:N-1:n-1) = 0;

i = [1:n,          1:n-1, 2:n,   1:n-N+1, N:n  ];
j = [1:n,          2:n,   1:n-1, N:n,     1:n-N+1];
s = [4*ones(n,1)', b1',   b1',   b',      b'   ];

K_h = (1/(h*h)) * sparse(i,j,s,n,n);

end