function [K_h] = Stiff2(N)

n = (N-1)^2;

e = ones(n,1);

K_h = spdiags([-e 4*e -e],-1:1,n,n);

%K_h = K_h + spdiags([-e -e],-N+1:N-1,n,n);

end