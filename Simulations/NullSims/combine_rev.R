######################################################################
# combine null simulation results
######################################################################

rm(null4r)
for(i in 1:20) {
  attachfile(i, "nullsims", "_rev.RData")
  if(i==1) {
    d <- dim(null4)
    n4 <- array(dim=c(d[1]*20, d[2], d[3]))
    dimnames(n4) <- dimnames(null4)
  }
  n4[1:d[1]+(i-1)*d[1],,] <- null4
  detach(2)
}
null4r <- n4
rm(n4)
#if(any(is.na(null4))) {
#  cat("dropping some NAs\n")
#  null4 <- null4[!is.na(null4[,1,1]), ,,drop=FALSE]
#}

save(null4r, file="nullsims_all_rev.RData")
