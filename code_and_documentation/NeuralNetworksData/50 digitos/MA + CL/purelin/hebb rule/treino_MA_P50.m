% treino MA
P = load('P_50.dat');
T_MA = load('T_MA_50.dat');

% treino da memória associativa pelo método da pseudoinversa
Wp = T_MA * pinv(P);

save Wp_P50.dat Wp /ascii;

