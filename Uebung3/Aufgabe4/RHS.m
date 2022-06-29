function [f_h] = RHS(f,N)

n = (N-1)^2;

f_h = zeros(n,1);

h = 1/N;

for i = 1:N-1:n
    for j = 1:N-1
        f_h(i+j) = f(h*j,i*h);
    end
end