P = load('P_50.dat');
Wp = load('Wp_P50.dat');
T = load('T_CL_50.dat');

O_MA = Wp*P;
O_MA = round(O_MA);
O_MA = max(0,min(O_MA,1));

% definição da rede neuronal
net = newp( ones(256,1) * [0 1], 10,'hardlim','learnp');

W = 0.1 * rand(10,256);
b = 0.1 * rand(10,1);
net.IW{1,1} = W;
net.b{1,1} = b;

net.trainParam.epochs = 50000;
net.trainParam.show = 35;
net.trainParam.goal = 0.002;

%ver se este se parametro se mete mesmo
net.performFcn = 'sse';

%treino da rede neuronal
net = train(net,O_MA,T);

Wrede = net.IW{1,1};
Brede = net.b{1,1};

save Wrede_cl_MA_percetron_P50.dat Wrede /ascii;
save Brede_cl_MA_percetron_P50.dat Brede /ascii;