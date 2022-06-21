function [A] = randMatrix(m,n,k)

A=zeros (m, n ) ;
A ( : , 1 : k)=randn(m, k ) ; % b e s i t z t Rang k m i t W a h r s c h e i n l i c h k e i t 1
A( : , k+1:n)= A ( : , 1 : k )*randn( k , n-k ) ;

end