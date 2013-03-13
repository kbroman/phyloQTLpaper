# combine power simulation results

rm(res)
# 300   6   2  17   3   6   2
cur <- 0
for(i in 1:20) {
  attachfile(i, "power", "_rev.RData")
  cat(i,"\n")
  if(i==1) {
    d <- dim(res)
    r <- array(dim=c(10000, d[-1]))
    dimnames(r) <- dimnames(res)
  }
  else d <- dim(res)
  r[1:d[1]+cur,,,,,,] <- res
  cur <- cur + d[1]
  detach(2)
}
res <- r
rm(r)
if(any(is.na(res))) {
  cat("dropping some NAs\n")
  res <- res[!is.na(res[,1,1,1,1,1,1]), ,,,,,,drop=FALSE]
}

save(res, file="power_all_rev.RData")
