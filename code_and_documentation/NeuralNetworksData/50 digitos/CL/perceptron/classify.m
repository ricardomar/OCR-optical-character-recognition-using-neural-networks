function Y=classify(dados, indices)

Bnet = load('Brede_cl_percetron_P50.dat');
Wnet = load('Wrede_cl_percetron_P50.dat');

% definição da rede neuronal
net = newp( ones(256,1) * [0 1], 10,'hardlim','learnp');
net.IW{1,1} = Wnet;
net.b{1,1} = Bnet;

dados=dados(:,indices);

% aplicação da rede aos dados
resultados_sim = sim(net,dados);

% determinacao 
[valor,posicao]=max(resultados_sim);

Y=posicao;

