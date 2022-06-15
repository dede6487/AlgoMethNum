function [A, D, p, k] = QRFact_Gabriel(A)
%QRFACT Summary of this function goes here
%   Detailed explanation goes here

[m,n] = size(A);
nb = n;
p = 1:n;
s = zeros(n,1);

for j = n:-1:1
    s(j) = sum(A(:,j).^2);
    if s(j) == 0
        [p(j), p(nb)] = deal(p(nb), p(j));
        nb = nb-1;
    end
end
sb = s;
D = zeros(nb,1);

for k = 1:nb
    [val, piv] = max(s(p(k:nb))./sb(p(k:nb)));
    piv = piv+k-1;
    if val <= -1
        k = k-1;
        return
    end
    [p(k), p(piv)] = deal(p(piv), p(k));
    s(p(k)) = sum(A(k:m,p(k)).^2);
    if s(p(k)) < m*eps^2*sb(p(k))
        k = k-1;
        return
    end
    D(k) = -sgn(A(k,p(k))) * sqrt(s(p(k)));
    A(k,p(k)) = A(k,p(k)) - D(k);
    for j = k+1:nb
        g = sum(A(k:m,p(j)).*A(k:m,p(k))) / (-D(k)*A(k,p(k)));
        A(k:m,p(j)) = A(k:m,p(j)) - g*A(k:m,p(k));
        s(p(j)) = s(p(j)) - A(k,p(j))^2;
        if s(p(j)) < m*eps*sb(p(k))
            s(p(j)) = sum(A(k+1:m,p(j)).^2);
        end
    end
end
k = nb;
return