######################################################################
# combine the phyloqtl results
######################################################################

rm(phyloqtlres)
for(i in 1:20) {
  attachfile(i, "compare2naive", "_rev.RData")
  if(i==1) {
    d2 <- dim(phyloqtlres)
    pqr <- array(dim=c(d2[1]*20, d2[2], d2[3], d2[4]))
    dimnames(pqr) <- dimnames(phyloqtlres)
  }
  pqr[1:d2[1]+(i-1)*d2[1],,,] <- phyloqtlres
  detach(2)
}
phyloqtlres <- pqr
rm(pqr)

save(phyloqtlres, file="compare2naive_phyloqtl_rev.RData")
