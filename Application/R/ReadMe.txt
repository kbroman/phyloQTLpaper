Code and data for the analysis of the Li et al. data

prepData.R            Load and prepare the data files
analysis.R            The analyses

perms_ind.R           Permutation test for individual crosses
perms_phyloqtl.R      Permutaiton test with phyloQTL analysis

app_results.RData     Analysis results moved to ../../R/
app_perms.RData       Permutation results moved to ../../R/

create_Rsub.pl        Perl script used to split a big permutation test
                      into pieces for running on a cluster
                      [Used with perms_ind.R and perms_phyloqtl.R]
