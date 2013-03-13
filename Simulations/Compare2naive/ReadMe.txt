
Simulations to compare the phyloqtl method to the naive one

compare2naiveB.R           Simulation code, analyses of individual crosses
compare2naive_rev.R        Simulation code, phyloqtl method

combineB.R                 Combine the results for the simulations
                           with the analysis of the individual crosses
combine_phyloqtl_rev.R     Combine the results for the simulations
                           with the phyloqtl analysis


----------------------------------------------------------------------

Structure of results objects (in ../../R/)

indres:

  10000 sims
     x 6 crosses
     x truth = A|BCD or AB|CD

phyloqtlres

  10000 sims
     x 5 statistics [overallmaxlod, maxlod, loddif, prob.above.truth, truthbest]
     x all vs tree partitions
     x truth = A|BCD or AB|CD
