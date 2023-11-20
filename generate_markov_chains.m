clear all
if ~exist('results','dir')
    mkdir('results')
end
addpath('tools')
rz      = 0.89;
sez     = 0.013;
nz      = 15;
initz   = (nz+1)/2;
[Gz,Pz] = build_markov_chain(rz,sez,nz);
gen_mc  = 2;
disp('    * Generating Markov Chains')
disp('      ========================')
% For simulation
T       = 500000;
burn    = 1000;
iz      = simulate_markov(1:nz,Pz,T+burn,initz);
save('results/mc_sim','iz')
% For IRFs
i0      = (nz+1)/2;
T       = 40;
nsim    = 100000;
Z1p     = zeros(nsim,T);
Z2p     = zeros(nsim,T);
start=tic;
for s=1:nsim
    [Z1p(s,:),Z2p(s,:)]	= simulate_markov2(1:nz,Pz,T,[i0+1;i0]);
end
save('results/mc_irf','Z1p','Z2p')
