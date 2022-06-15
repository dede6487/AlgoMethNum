function [R] = CompR(B,D, p , k )

R(1:k,:)= triu ( B (1:k , p ));
R= full ( spdiags (D ,0 , R) );

end