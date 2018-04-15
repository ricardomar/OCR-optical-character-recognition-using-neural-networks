%dados input treino do CL sao iguais aos dados inputtreino da MA
P = load('P_50.dat');

%definição da matriz de targets correspondentes aos dados em P
T = load('T_CL_50.dat');




% definição da rede neuronal
net = newff( ones(256,1) * [0 1], 10,{'purelin'},'traingd','learngd');

W = 0.1 * rand(10,256);
b = 0.1 * rand(10,1);
net.IW{1,1} = W;
net.b{1,1} = b;

net.trainParam.lr = 0.0002;
net.trainParam.epochs = 50000;
net.trainParam.show = 35;
net.trainParam.goal = 0.002;
net.performFcn = 'sse';

%treino da rede neuronal
net = train(net,P,T);

Wrede = net.IW{1,1};
Brede = net.b{1,1};

save Wrede_cl_purelin_gr_P50.dat Wrede /ascii;
save Brede_cl_purelin_gr_P50.dat Brede /ascii;