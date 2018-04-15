function Y=classify(dados, indices)

Bnet = load('Brede_cl_MA_purelin_gr_P50.dat');
Wnet = load('Wrede_cl_MA_purelin_gr_P50.dat');
Wp = load ('Wp_P50.dat');

% definição da rede neuronal
net = newff( ones(256,1) * [0 1], 10,{'purelin'},'traingd','learngd');
net.IW{1,1} = Wnet;
net.b{1,1} = Bnet;

dados=dados(:,indices);
O_MA = Wp * dados;
O_MA = round(O_MA);
O_MA = max(0,min(O_MA,1));


% aplicação da rede aos dados
resultados_sim = sim(net,O_MA);

% determinacao 
[valor,posicao]=max(resultados_sim);

Y=posicao;

