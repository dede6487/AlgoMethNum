function [ x ] = QRSolve (B,D, p , k , b )

%[A,d,p,k] = QRFact(B);
[m,n] = size(B);

if k < n
    x = zeros(n:1);
else
    %c = b ;
    %for j =1: k
    %    v= zeros (m ,1) ;
    %    if(j >1)
    %    v (1: j -1) =0;
    %    end
    %    v(j :m)=B (j:m ,p(j) );

    %    c= eye (m ) -(2/ dot(v ,v)) * dot(v,v)* c;
    %end

    Q = CompQ(B,p,k);
    Qt = transpose(Q);
    c= Qt * b';

    R = CompR(B,D,p,k);    
    %Rt = transpose(R);
    %x = Rt * c;
    R=B (: , p) ;
    x= zeros (n ,1) ;

    pi (p) =1: length (p );

    x(k )=c(k )/D( k);
    for i=k -1: -1:1
        x(i ) =( c( i) -dot (R(i ,i +1: k) ,x(i +1: k))) /D(i );
    end
    x=x ( pi );

end
end