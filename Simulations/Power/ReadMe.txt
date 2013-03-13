
power_rev.R       Simulations to determine power in different situations
                  Needs the create_Rsub.pl script in ../../Analysis/R

combine_rev.R     Code to combine simulation results

summarize_rev.R   Code to summarize the results (summaries placed in ../../R/)

------

The actual results are not included as the file is ~300 MB
Email me at kbroman @ biostat dot wisc dot edu

Power results: 4 taxa with minimal crosses ("res")

7-dimensional array:

   10,000 simulations
       x 6 statistics (maxoveralllod, max lod, lod diff [best vs 2nd best],
                       prob above truth, prob below truth, is true part'n best?)
       x all partitions vs tree partitions
       x all crosses and then each possible set of minimal crosses
       x no. individuals total
       x effect of QTL (as proportion of variance explained)
       x 2 possible true partitions
