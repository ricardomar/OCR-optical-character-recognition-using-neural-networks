% treino MA
P = load('P_500.dat');
T_MA = load('T_MA_500.dat');

% treino da mem�ria associativa pelo m�todo da pseudoinversa
Wp = T_MA * pinv(P);

save Wp_P500.dat Wp /ascii;

