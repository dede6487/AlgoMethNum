function [ x ] = QRSolve (B,D, p , k , b )

%[A,d,p,k] = QRFact(B);
[m,n] = size(B);

if k < n
    x = zeros(n:1);
else

    Q = CompQ(B,p,k);
    R = CompR(B,D,p,k);

    Qt = transpose(Q);
    Rt = transpose(R);
    
    c= Qt * b';

    x = Rt * c;
end
end