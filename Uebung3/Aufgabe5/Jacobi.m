%A ... sparse Matrix
%löst GLS A*x = b mit Startvektor x0
function [x,exitflag] = Jacobi(A,b,x0,itmax,myeps)

if nargin < 5
    myeps = 1.e-8;
    if nargin < 4
        itmax = n*n;
        if nargin < 3
            x0 = zeros(n);
        end
    end
end



end