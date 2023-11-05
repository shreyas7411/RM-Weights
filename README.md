# Sampling-Based-Estimates-of-the-Sizes-of-Constrained-Subcodes-of-Reed-Muller-Codes
This repository contains various programs used in numerical computations for the pape rSampling-Based Estimates of the Sizes of Constrained Subcodes of Reed-Muller Codes by V. Arvind Rameshwar, Shreyas Jain, Navin Kashyap. Link: https://arxiv.org/abs/2309.08907
This repositrory consists of 4 programs: 
1) A program in python for computing the weight enumerators of Reed-Muller Codes using the algebraic techniques in Chapter 5 of D. Sarwate, “Weight enumeration of Reed-Muller codes and cosets,” PhD thesis, Princeton University, 1973. This was developed by me.
2) A program in Python and Julia implementing the numerical techniques described in the paper, developed by me.
3) A MATLAB program for the same developed by V. Arvind Rameshwar : https://arvindrameshwar.github.io/

Note that for lower weights, the programs in 2) converge to zero (not the true value). This can be fixed by upping the number of metropolis iterations. Also, the Julia version is much faster than the python one with no functional differences between the two.
The program in 3) does not suffer the same prblem, but it is slower.
