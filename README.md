# Sampling-Based-Estimates-of-the-Sizes-of-Constrained-Subcodes-of-Reed-Muller-Codes
This repository contains computer code for the numerical computations of estimates of weight enumerators of Reed-Muller (RM) codes in the paper: V. A. Rameshwar, S. Jain, and N. Kashyap, “Sampling-Based Estimates of the Sizes of Constrained Subcodes of Reed-Muller Codes”, <i>arXiv e-prints</i>, 2023. doi:10.48550/arXiv.2309.08907.

This repository consists of 4 computer programs:

1. Two Python programs (`true_weight_enum_1.ipynb` and `true_weight_enum_2.ipynb`) written by Shreyas Jain for computing the weight enumerators of RM codes using the algebraic techniques in Chapter 5 of D. Sarwate, “Weight enumeration of Reed-Muller codes and cosets,” PhD thesis, Princeton University, 1973
2. A Python (`rm_sampling_python.ipynb`) and a Julia (`rm_sampling_julia.ipynb`) program written by Shreyas Jain for computing weight enumerator estimates
3. A MATLAB program (`rm_sampling_matlab.m`) for computing weight enumerator estimates

Further details about the programs are provided below.

## Python programs for true weight enumerators

## Python program for weight enumerator estimates

## Julia program for weight enumerator estimates

## MATLAB program for weight enumerator estimates
The variables `n` and `r` define the code RM$(n,r)$. The m-file `genmatrix.m` is used as a subroutine to create the generator matrix of RM$(n,r)$. The lines
```matlab
cnt1 = abs(sum(c)-w);
cnt2 = abs(sum(c1)-w);
```
evaluate the energy function for the constant-weight constraint $E$ (see Example III.2 in the paper) at the codewords c and c1, respectively. The line 
```matlab
su = su+exp(1)^((-1/width(g))*(abs(sum(c)-w)));
```
is then used to obtain the random variable $X_{i,j}$ (see Section III.A of the paper).

These lines should be suitably modified for other constraints of interest. For example, for the no-consecutive-ones constraint, the code ```abs(sum(c)-w)``` will be replaced with ```length(strfind(c,[1 1])).```

Note that for selected lower weights, increasing the number of metropolis iterations in the Python and Julia programs for weight estimates may be necessary to obtain non-zero estimate values. Also, the Julia version is much faster than the Python one, with no functional differences. The MATLAB program for weight estimates is slower than in Python and Julia.

Also note that by a simple change to the energy functions in the weight estimator programs, we can obtain size estimates of more general constrained subcodes of Reed-Muller codes.

