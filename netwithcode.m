clc;clear;
data = xlsread('data230k1.xlsx');
x = data(1:230400,2)';
y = data(1:230400,1)';
net = newff(minmax(x),[50,1],{'tansig','purelin','trainlm'});
net.trainparam.epochs = 1000;
net.trainparam.goal = 1e-25;
net.trainparam.lr = 0.001;
net = train(net,x,y);
output = net(x);
plot(output);
title('50 neurons epoch=1000 lr=0.001 tansig,trainlm');
hold on;
plot(y);
e = y - output;
plot(e);
legend({'target','output','error'},'Location','northeast');

