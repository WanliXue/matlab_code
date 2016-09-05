%Load data and train dictionary
    clear;
addpath(genpath('~/Documents/MATLAB/COM4335'))
addpath(genpath('~/Documents/MATLAB/l1magic'))

% addpath(genpath('~/mnt/wanli/MATLAB/l1magic'))
% addpath(genpath('~/mnt/wanli/MATLAB/SPAMS'))

load('2_car_acc_gps.mat');

limit=64;


data=acc_total(:,1);

% have to reshape the data to limit x n dimension
modulus = mod(length(data(:,1)),limit);
turn = (length(data(:,1)) - modulus) / limit;
reshape_data = reshape(data(1:end - modulus,1),limit,turn);


train_amount=limit;

%  psi=Dict_Train(reshape_data(:,:),limit);
%  save('64x64Acc1.mat','psi');
 load('64x64Acc1.mat');

err=reconstructAccuracy(reshape_data(:,train_amount:end),psi);

