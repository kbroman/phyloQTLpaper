######################################################################
# combine results from the individual analyses
######################################################################

rm(indres)
for(i in 1:50) {
  attachfile(i, "compare2naiveB")
  if(i==1) {
    d1 <- dim(indres)
    ir <- array(dim=c(d1[1]*50, d1[2], d1[3]))
    dimnames(ir) <- dimnames(indres)
  }
  ir[1:d1[1]+(i-1)*d1[1],,] <- indres
  detach(2)
}
indres <- ir
rm(ir)

save(indres, file="compare2naiveB_ind.RData")
