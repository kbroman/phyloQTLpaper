
# load results
#attach("../NullSims/thresholds_rev.RData") # null4
#attach("power_all_rev.RData") # res

# calculate no selection rate
ns <- array(dim=c(2,dim(res)[3:7]))
dimnames(ns) <- c(list(c("maxoveralllod", "maxlod")), dimnames(res)[3:7])
# all partitions, all crosses
for(i in 1:dim(res)[5]) {
  for(j in 1:2)
    ns[j,1,1,i,,] <- apply(res[,j,1,1,i,,], 2:3, function(a,b) mean(a < b), thrr[j+1,i])
}
# tree partitions, all crosses
for(i in 1:dim(res)[5]) {
  for(j in 1:2)
    ns[j,2,1,i,,] <- apply(res[,j,2,1,i,,], 2:3, function(a,b) mean(a < b), thrr[j+3,i])
}
# all partitions, minimal crosses
for(i in 1:dim(res)[5]) {
  for(j in 2:dim(res)[4]) {
    for(k in 1:2)
      ns[k,1,j,i,,] <- apply(res[,k,1,j,i,,], 2:3, function(a,b) mean(a < b), thrr[k+5,i])
  }
}
# tree partitions, minimal crosses
for(i in 1:dim(res)[5]) {
  for(j in 2:dim(res)[4]) {
    for(k in 1:2)
      ns[k,2,j,i,,] <- apply(res[,k,2,j,i,,], 2:3, function(a,b) mean(a < b), thrr[k+7,i])
  }
}

# false positives
fp <- array(dim=c(2,dim(res)[3:7]))
dimnames(fp) <- c(list(c("maxoveralllod", "maxlod")), dimnames(res)[3:7])

# all partitions, all crosses
for(i in 1:dim(res)[5]) {
  for(k in 1:2)
    fp[k,1,1,i,,] <- apply((res[,k,1,1,i,,] > thrr[k+1,i] & res[,4,1,1,1,,] > 0.95), 2:3, mean)
}
# tree partitions, all crosses
for(i in 1:dim(res)[5]) {
  for(k in 1:2)
    fp[k,2,1,i,,] <- apply((res[,k,2,1,i,,] > thrr[k+3,i] & res[,4,2,1,1,,] > 0.95), 2:3, mean)
}
# all partitions, minimal crosses
for(i in 1:dim(res)[5]) {
  for(j in 2:dim(res)[4]) {
    for(k in 1:2)
      fp[k,1,j,i,,] <- apply((res[,k,1,j,i,,] > thrr[k+5,i] & res[,4,1,j,1,,] > 0.95), 2:3, mean)
  }
}
# tree partitions, minimal crosses
for(i in 1:dim(res)[5]) {
  for(j in 2:dim(res)[4]) {
    for(k in 1:2)
      fp[k,2,j,i,,] <- apply((res[,k,2,j,i,,] > thrr[k+7,i] & res[,4,2,j,1,,] > 0.95), 2:3, mean)
  }
}
# power
pow <- 1 - fp - ns

#### stopped here ####

# "exact" power
expow <- array(dim=c(2,dim(res)[3:7]))
dimnames(expow) <- c(list(c("maxoveralllod", "maxlod")), dimnames(res)[3:7])

# all partitions, all crosses
for(i in 1:dim(res)[5]) {
  for(k in 1:2)
    expow[k,1,1,i,,] <- apply((res[,k,1,1,i,,] > thrr[k+1,i] & res[,5,1,1,1,,] < 0.05), 2:3, mean)
}
# tree partitions, all crosses
for(i in 1:dim(res)[5]) {
  for(k in 1:2)
    expow[k,2,1,i,,] <- apply((res[,k,2,1,i,,] > thrr[k+3,i] & res[,5,2,1,1,,] < 0.05), 2:3, mean)
}
# all partitions, minimal crosses
for(i in 1:dim(res)[5]) {
  for(j in 2:dim(res)[4]) {
    for(k in 1:2)
      expow[k,1,j,i,,] <- apply((res[,k,1,j,i,,] > thrr[k+5,i] & res[,5,1,j,1,,] < 0.05), 2:3, mean)
  }
}
# tree partitions, minimal crosses
for(i in 1:dim(res)[5]) {
  for(j in 2:dim(res)[4]) {
    for(k in 1:2)
      expow[k,2,j,i,,] <- apply((res[,k,2,j,i,,] > thrr[k+7,i] & res[,5,2,j,1,,] < 0.05), 2:3, mean)
  }
}


# the minimal crosses
crosses <- dimnames(pow)[[3]][-1]
nqtl <- list("A|BCD"=sapply(qtl:::qtlByPartition(crosses, "A|BCD"), sum),
             "AB|CD"=sapply(qtl:::qtlByPartition(crosses, "AB|CD"), sum))


save(crosses, nqtl, ns, fp, pow, expow, file="power_summaries_rev.RData")

phyloqtlres <- res[,,,1,2,4,]
save(phyloqtlres, file="~/Docs/Papers/PhyloQTL/R/compare2naive_phyloqtl_rev.RData")
