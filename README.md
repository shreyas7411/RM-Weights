# Sampling-Based-Estimates-of-the-Sizes-of-Constrained-Subcodes-of-Reed-Muller-Codes
This repository contains various programs used in numerical computations for the pape rSampling-Based Estimates of the Sizes of Constrained Subcodes of Reed-Muller Codes by V. Arvind Rameshwar, Shreyas Jain, Navin Kashyap. Link: https://arxiv.org/abs/2309.08907
This repositrory consists of 4 programs: 
1) A program in python for computing the weight enumerators of Reed-Muller Codes using the algebraic techniques in Chapter 5 of D. Sarwate, “Weight enumeration of Reed-Muller codes and cosets,” PhD thesis, Princeton University, 1973. The program was developed by me.
2) A program in Python and Julia implementing the numerical techniques described in the paper, developed by me.
3) A MATLAB program for the same developed by V. Arvind Rameshwar : https://arvindrameshwar.github.io/

Note that for selected lower weights, it may be necessary to increase the number of metropolis iterations in the Python and Julia programs for weight estimates to obtain non-zero estimate values. Also, the Julia version is much faster than the python one with no functional differences between the two.
The MATLAB program for weight estimates is slower.

Also note, that by a simple change to the energy functions in the weight estimator programs, we can obtain size estimates of more general constrained subcodes of Reed-Muller codes.

