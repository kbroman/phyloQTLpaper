Code for simulations under null hypothesis of no QTL.

nullsim_rev.R         Code to do the simulations; used with create_Rsub.pl in the
                      Applications/ directory
 
combine_rev.R         Combine the results of multiple simulation runs
                      into a single object

get_thresholds_rev.R  Calculate LOD thresholds

-------

Structure of results:

nullsims_all_rev.RData: [moved to ../../R/]
  contains null simulation results ("null4r") with 4 taxa

  3-dimensional array
    10,000 permutations x statistic x no. ind'ls per cross

  statistics:
    onecross: genome-wide maximum LOD score for one cross
    maxoveralllod : genome-wide maximum of log10{ ave [10^LOD] } 
    maxlod  : genome-wide maximum LOD score for best partition
    diflod  : genome-wide maximum difference between best and 2nd best partition

    apac:  all partitions, all crosses
    tpac:  tree partitions, all crosses
    apmc:  all partitions, minimal crosses
    tpmc:  tree partitions, minimal crosses



