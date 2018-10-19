% parametri
% random walkers, goal seekers, wall followers, sitters

nBees = [30 0 0 0]; % 4 tipa pcela, ovisno o alphama i betama
Tsim = 200;
timestep = 0.1;

global alphas pBetaIs1 kws phiRange velocity dr maxTurn pWall pCongregate maxWait
alphas = [0.05 0.9 0.2 0.7]; % ovisi o velocity
kws = [1 1 1 1];
pBetaIs1 = [0.9 0.9 0.9 0.1];
phiRange = pi/6;
velocity = 3; %cm/s
dr = 1e-1;
maxTurn = 30;
pWall = 0.05;
pCongregate = 0.4;
maxWait = 8; % ovisi o velocity
