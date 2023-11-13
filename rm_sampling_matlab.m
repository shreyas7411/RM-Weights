%Code for estimating the weight distribution of RM codes via sampling

%% Initializing parameters
clear;
M = 10000; % The number of iterations of the Metropolis algorithm (\tau)
M2 = 10; % The number of samples to be averaged over (t)
n = 5;
r = 3;
estimate = []; % Array of estimates for different weights
g = genmatrix(n,r);
%% The algorithm
% Looping over weights. This can be parallelized, if required, and suitably
% modified for other constraints.
tic
k = 1;
for wt=2^(n-r-1):2^(n-2)
w = wt*2;
cnt = 0;
m = randi([0 1],1,height(g)); 
c = mod(m*g,2); % A uniformly random codeword
bet = 0;
est = 2^height(g); % Z(0) = |\mathcal{C}|
prev = est;
% Looping over inverse temperatures
while(bet<=20)
    samp = 1;
    su = 0;
% Looping over samples drawn from p_\beta
while(samp<=M2)
    iter = 1;
% Looping over iterations of the Metropolis algorithm
while(iter<=M)
    %% Picking a uniformly random (n-r)-dimensional affine subspace
    A = randi([0 1],n-r,n);
    while(gfrank(A,2)~=n-r) % Ensuring that A is invertible
        A = randi([0 1],n-r,n);
    end
    b = randi([0 1],1,n);
    %% Obtaining the min. wt. vector v
    v = zeros(1,width(g));
    stor = [];
    t = dec2bin(0:2^(n-r)-1,n-r)-'0';
    temp = mod(t*A+b,2);
    v(bin2dec(num2str(temp))+1) = 1;
    %% Implementing a Metropolis step
    c1 = mod(c+v,2);
    cnt1 = abs(sum(c)-w); % Suitably modify this for other constraints
    cnt2 = abs(sum(c1)-w); % Suitably modify this for other constraints
    p1 = exp(1)^(-bet*(cnt1)); % Suitably modify this for other constraints
    p2 = exp(1)^(-bet*(cnt2)); % Suitably modify this for other constraints
    p = min(1,p2/p1);
    if(p1==0 && p2==0)
        break
    end
    tos = rand(1,1);
    if(tos<=p)
        c = c1;
    end
    iter = iter+1;
end
samp = samp+1;
su = su+exp(1)^((-1/width(g))*(abs(sum(c)-w))); % Suitably modify this for other constraints
end
prev = est;
est = est*(su/M2);
%% Checking if the estimate has converged
if(abs(est-prev)<=1e-3) % Here \delta = 1e-3
    estimate(k) = est;
    k = k+1;
    break;
end
bet = bet+1/width(g);
end
end
toc
