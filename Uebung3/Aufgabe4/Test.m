for N =[10 ,100 ,1000]
disp ('N');
disp (N) ;

K_h = Stiff1 (N);

f_h = RHS (@f ,N);

u_h_exact = RHS (@ub ,N); % exakt

disp ('direkte Berechnung :')
tic
u_h_direct = K_h \ f_h ;
toc

disp ('Fehler direkte Lsg ( Maximumsnorm ):')
max ( abs ( u_h_direct - u_h_exact ) )

disp ('iterative Berechnung ')
tic
u_h_pcg = pcg ( K_h , f_h );
toc

disp ('Fehler iterative Lsg mit ( Maximumsnorm ):')
max ( abs ( u_h_pcg - u_h_exact ))

end