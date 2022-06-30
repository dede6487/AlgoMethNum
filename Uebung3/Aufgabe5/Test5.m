for N = [10 ,100 ,1000]
disp ('N:')
disp (N)

K_h = Stiff1(N);
f_h = RHS(@f,N);

tic ;
[ u_h_Jacobi , err ] = Jacobi ( K_h , f_h );
toc ;

if( err == 0 )
disp ('Did not converge ');
end
u_h_exact = RHS(@ub,N) ;
u_h_pcg = pcg ( K_h , f_h );

max(max ( abs ( u_h_Jacobi - u_h_exact ) ))
max(max ( abs ( u_h_Jacobi - u_h_pcg )))

end