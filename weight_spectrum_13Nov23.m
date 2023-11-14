%Code for determining the weight spectrum of RM codes via MCMC sampling.
%This gives the correct weight spectrum for (7,3) (13-Nov-23)

%% Initializing parameters
clear;
M = 5e6; % The number of iterations of the Metropolis algorithm (\tau)
M2 = 5;
n = 9;
r = 4;
bet = 10; %Set some large (fixed) \beta
wtspec = zeros(1,2^(n-1)); % Array to determine weight spectrum
g = genmatrix(n,r);
%% The algorithm
% Looping over weights. This can be parallelized, if required, and suitably
% modified for other constraints.
tic
for wt=2^(n-r-1):2^(n-2) %This should be modified based on Cor. 13, Chap. 15, of MWS
w = wt*2;
w = 32;
cnt = 0;
m = randi([0 1],1,height(g)); 
c = mod(m*g,2); % A uniformly random codeword
samp = 1;
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
   % p1 = exp(1)^(bet*w)*exp(1)^(-bet*(cnt1)); % Suitably modify this for other constraints; scaling this (13-11-23)
   % p2 = exp(1)^(bet*w)*exp(1)^(-bet*(cnt2)); % Suitably modify this for other constraints; scaling this (13-11-23)
    p = min(1,exp(1)^(bet*(cnt1-cnt2)));
%     if(p1==0 && p2==0)
%         break
%     end
    if(p==0)
        break;
    end
    tos = rand(1,1);
    if(tos<=p)
        c = c1;
    end
    if(sum(c)==w)
        wtspec(w) = 1;
        break;
    end
    iter = iter+1;
end
samp = samp+1;
if(wtspec(w)==1)
    break;
end
end
end
toc