# Traveling-Wave-Identification
This repository contains the codes for our paper, entitled "Singular Value Decomposition of Dual Matrices and Its Application to Traveling Wave Identification in the Brain" [1]. 
Specifically, we develop an approach to identify spatiotemporal patterns in the time-series data such as traveling waves using the singular value decomposition of dual matrices.

## Algorithm
* [dualsvd.m](dualsvd.m) is the code for the compact dual singular value decomposition (CDSVD) of the optimal rank-k approximation of a dual matrix under the quasi-metric d<sub>*</sub>. For more details, please refer to Algorithm 3.1 in reference [1].

## Numerical experiments
### (1) Simulations of standing waves and traveling waves
Corresponding to the figure 2 in reference [1].
* [standing_wave_and_traveling_wave.m](Simulations/standing_wave_and_traveling_wave.m) is the code for simulations of a pure standing wave and a pure traveling wave. 
* [combination_waves.m](Simulations/combination_waves.m) is the code for simulations of combination waves consisting of four standing waves and two traveling waves.

### (2) Small-scale road monitoring video data
Corresponding to the figure 4 in reference [1].
* [road_monitoring_video_data.mat](Car/road_monitoring_video_data.mat) is the road monitoring video data.
* [traveling.m](Car/traveling.m) is the code for traveling wave identification in the small-scale road monitoring video data.

### (3) Large-scale brain fMRI data
Corresponding to the figure 5 in reference [1].

## References
[1] [Tong Wei](https://doi.org/10.1137/23M1556642), Weiyang Ding, and Yimin Wei, Singular Value Decomposition of Dual Matrices and Its Application to Traveling Wave Identification in the Brain, SIAM J. Matrix Anal. Appl., 45 (2024), pp. 634–660. 
