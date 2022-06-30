%A ... sparse Matrix
%löst GLS A*x = b mit Startvektor x0
function [x,exitflag] = Jacobi(A,b,x0,itmax,myeps)

exitflag = 0;
[n,m] = size(A);

if nargin < 5
    myeps = 1.e-8;
end
if nargin < 4
    itmax = n*n;
end
if nargin < 3
    x0 = zeros(n);
end

if n ~= m
    return;
end

x = x0;
k = 0;
r0 = b-A*x0;

nr0 = norm(r0)*myeps;

rk = r0;

W = diag(A);

if W(1:n) == 0
    return;
end

while nr0 <= norm(rk) && k < itmax
    pk = W .\ rk;
    x = x + pk;
    rk = b-A*x;
    
    k = k+1;
end

if(nr0 >= norm(rk))
    exitflag = 1;
end

end