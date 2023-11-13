%Script to create an RM generator matrix
function g = genmatrix(n,r)
if(r==0)
    g = ones(1,2^n);
elseif(r==n)
    g = eye(2^n);
else
    g = [genmatrix(n-1,r) genmatrix(n-1,r); zeros(size(genmatrix(n-1,r-1),1),size(genmatrix(n-1,r-1),2)) genmatrix(n-1,r-1)];
end