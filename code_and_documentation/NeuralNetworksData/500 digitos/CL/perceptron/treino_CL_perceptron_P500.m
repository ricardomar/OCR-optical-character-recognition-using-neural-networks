%dados input treino do CL sao iguais aos dados inputtreino da MA
P = load('P_500.dat');

%defini��o da matriz de targets correspondentes aos dados em P
T = load('T_CL_500.dat');

% defini��o da rede neuronal
net = newp( ones(256,1) * [0 1], 10,'hardlim','learnp');

W = 0.1 * rand(10,256);
b = 0.1 * rand(10,1);
net.IW{1,1} = W;
net.b{1,1} = b;

net.trainParam.epochs = 80000;
net.trainParam.show = 1250;
net.trainParam.goal = 0.003;

%ver se este se parametro se mete mesmo
net.performFcn = 'sse';

%treino da rede neuronal
net = train(net,P,T);

Wrede = net.IW{1,1};
Brede = net.b{1,1};

save Wrede_cl_percetron_P500.dat Wrede /ascii;
save Brede_cl_percetron_P500.dat Brede /ascii;