function [K_h] = Stiff2(N)



K_h = spdiags(B,d,m,n);

end