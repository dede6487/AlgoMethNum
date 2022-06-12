function [A, D, pi , k ] = QRFact (A)
    
[m,n] = size(A);


pi = 1:n; %p=pi
si = zeros(n);
siq = zeros(n);

D = zeros(min(m,n),1);

nq = n;

for j = n:-1:1 
    for i = 1:m
        siq(j) = dot(A(:,j),A(:,j));%siq(j) + A(i,j)^2;
    end
    si(j) = siq(j);
    if si(j) == 0
        temp1 = pi(j);
        pi(j) = pi(nq);
        pi(nq) = temp1;
        nq = nq-1;
    end
end

for i = 1:nq%different loop iterator than in script, here i is k
    piv = i-1;
    val = -1;

    [val,piv] = max(si(pi(i:nq))./siq(pi(i:nq)));
    
    if piv < i
        k =i-1;
        return;
    end
    temp1 = pi(i);
    pi(i) = pi(piv);
    pi(piv) = temp1;
    
    for j = i:m
        si(pi(i)) = 0;%maybe not necessarry
        si(pi(i)) = si(pi(i)) + A(j,pi(i));
    end

    if si(pi(i)) < m * eps^2 * siq(pi(i))
        k = i-1;
        return;
    end
    
    if sign(A(i,(pi(i)))) == 0 %to compensate for the different sign function
        D(i,1) = sqrt(si(pi(i)));
    else
        D(i,1) = -sign(A(i,(pi(i)))) * sqrt(si(pi(i)));
    end

    A(i,pi(i)) = A(i, pi(i)) - D(i,1);

    for j = i+1:nq
        gamma = dot(A(i,pi(j)),A(i,pi(i))) / (-D(i,1)*A(i,pi(i))); %dot() is scalarproduct
        A(i:n, pi(j)) = A(i:n, pi(j)) - gamma * A(i:n, pi(j));
        si(pi(j)) = si(pi(j)) - A(i, pi(j))^2;
        if si(pi(j)) < m * eps * siq(pi(j))
            for l = i+1 : m
            si(pi(j)) = 0;
            si(pi(j)) = si(pi(j)) + A(l,pi(j))^2;
            end
        end
    end
end
k = nq;
end