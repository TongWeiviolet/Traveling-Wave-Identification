# Traveling-Wave-Identification
This repository contains the codes for our paper, entitled "Singular Value Decomposition of Dual Matrices and Its Application to Traveling Wave Identification in the Brain" [1]. 
Specifically, we develop an approach to identify spatiotemporal patterns in the time-series data such as traveling waves using the singular value decomposition of dual matrices.

## Codes
### Algorithm
* [dualsvd.m](dualsvd.m) is the code for the compact dual singular value decomposition (CDSVD) of the optimal rank-k approximation of dual matrices under the quasi-metric d<sub>*</sub>. For more details, please refer to Algorithm 3.1 in reference [1].
### Numerical experiments
* [DKFnorm.m](DKFnorm.m) is the code for calculating the dual-valued Ky Fan p-k-norm of a dual matrix.
* [Markov.m](Markov.m) is the code for our numerical experiments on a dumbbell Markov chain. Our findings indicate that the value of k, corresponding to the maximum value of the infinitesimal part of the dual-valued Ky Fan p-k-norm by adjusting p in the interval [1, 2), characterizes the optimal classification number of the system for the occurrence of the causal emergence.

## References
[1] [Tong Wei](https://doi.org/10.1137/23M1556642), Weiyang Ding, and Yimin Wei, Singular Value Decomposition of Dual Matrices and Its Application to Traveling Wave Identification in the Brain, SIAM J. Matrix Anal. Appl., 45 (2024), pp. 634–660. 
