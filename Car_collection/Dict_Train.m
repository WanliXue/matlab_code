% Train with SPAMS
function Psi=Dict_Train(X, limit)

if exist('limit','var') == 0, limit = 8; end;

param.K = limit ; % change limit*2 to limit so the size square
param.iter = 500; % 10000
param.modeParam = 0;
param.mode = 0; % done the testing with 1,2,3,4. do not produce good results.
param.posAlpha = 0;
param.posD = 0;
param.whiten = 0;
param.L = param.K * 2;
param.lambda = 1e9;

Psi = mexTrainDL(X, param);

Psi = full(Psi);

