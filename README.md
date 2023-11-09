# Sampling-Based-Estimates-of-the-Sizes-of-Constrained-Subcodes-of-Reed-Muller-Codes
This repository contains various programs used in numerical computations for the paper "Sampling-Based Estimates of the Sizes of Constrained Subcodes of Reed-Muller Codes by V. Arvind Rameshwar, Shreyas Jain, Navin Kashyap. Link: https://arxiv.org/abs/2309.08907 

This repository consists of 4 programs:

1) A Python program was developed by Shreyas Jain for computing the weight enumerators of Reed-Muller Codes using the algebraic techniques in Chapter 5 of D. Sarwate, “Weight enumeration of Reed-Muller codes and cosets,” PhD thesis, Princeton University, 1973.
2) A Python and a Julia program were developed by Shreyas Jain for implementing the techniques discussed in the paper.
3) V. Arvind Rameshwar developed a MATLAB program for the same: https://arvindrameshwar.github.io/

Note that for selected lower weights, increasing the number of metropolis iterations in the Python and Julia programs for weight estimates may be necessary to obtain non-zero estimate values. Also, the Julia version is much faster than the Python one, with no functional differences. The MATLAB program for weight estimates is slower than in Python and Julia.

Also note that by a simple change to the energy functions in the weight estimator programs, we can obtain size estimates of more general constrained subcodes of Reed-Muller codes.

