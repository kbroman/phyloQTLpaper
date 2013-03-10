######################################################################
# calculate ROC curves with power and false pos've rates
#     of naive method and phyloqtl approach
######################################################################

attach("nullsims_all_rev.RData")
attach("compare2naiveB_ind.RData")
attach("compare2naive_phyloqtl_rev.RData")

thr1 <- quantile(null4r[,"onecross","75"], 0.95)
thr2b <- quantile(null4r[,"maxoveralllod.apac","75"], 0.95)
thr2 <- quantile(null4r[,"maxlod.apac","75"], 0.95)


qtlbypart <- qtl:::qtlByPartition(dimnames(indres)[[2]], genAllPartitions(4, LETTERS[1:4])[c(1,5,2:4,6,7)])
qtlbypart <- apply(abs(qtlbypart), 2, paste, collapse="")

temp <- apply(indres >= thr1, c(1,3), function(a) paste(as.numeric(a), collapse=""))
temp <- apply(temp, 2, function(a,b) match(a,b), qtlbypart)

ind.tp <- ind.fp <- temp[1,]
for(i in seq(along=ind.fp)) {
  ind.fp[i] <- mean(!is.na(temp[,i]) & temp[,i]!=i)
  ind.tp[i] <- mean(!is.na(temp[,i]) & temp[,i]==i)
}

allthr1 <- seq(0, max(indres)+1, len=501)
ind.roc <- array(dim=c(length(allthr1), 2, length(ind.tp)))
dimnames(ind.roc) <- list(allthr1, c("fp", "tp"), names(ind.tp))
for(j in seq(along=allthr1)) {
  if(j==round(j,-1)) cat(j, length(allthr1), "\n")
  temp <- apply(indres >= allthr1[j], c(1,3), function(a) paste(as.numeric(a), collapse=""))
  temp <- apply(temp, 2, function(a,b) match(a,b), qtlbypart)

  for(i in seq(along=ind.fp)) {
    ind.roc[j,1,i] <- mean(!is.na(temp[,i]) & temp[,i]!=i)
    ind.roc[j,2,i] <- mean(!is.na(temp[,i]) & temp[,i]==i)
  }
}

# tpa, fpa: true and false positive rates if we pick those in upper 95%
# tp, fp:   true and false positive rates if we pick the top one

phyloqtl.tpa <- phyloqtl.fpa <- phyloqtl.tp <- phyloqtl.fp <- ind.fp
for(i in seq(along=phyloqtl.tp)) {
  phyloqtl.fp[i] <- mean(phyloqtlres[,"maxlod","allpartitions",i] > thr2 & 
                         phyloqtlres[,"prob.above.truth","allpartitions",i]>0.95)
  phyloqtl.tp[i] <- mean(phyloqtlres[,"maxlod","allpartitions",i] > thr2 & 
                         phyloqtlres[,"prob.below.truth","allpartitions",i]<0.05)
  phyloqtl.fpa[i] <- mean(phyloqtlres[,"maxlod","allpartitions",i] > thr2 & 
                         phyloqtlres[,"prob.above.truth","allpartitions",i]>0.95)
  phyloqtl.tpa[i] <- mean(phyloqtlres[,"maxlod","allpartitions",i] > thr2 & 
                         phyloqtlres[,"prob.above.truth","allpartitions",i]<=0.95)
}

allthr2 <- seq(0, max(phyloqtlres[,"maxlod","allpartitions",])+1, len=501)
phyloqtl.roc <- array(dim=c(length(allthr1), 4, length(ind.tp)))
dimnames(phyloqtl.roc) <- list(allthr1, c("fp", "tp", "fpa", "tpa"), names(ind.tp))
for(j in seq(along=allthr2)) {
  if(j==round(j,-2)) cat(j, length(allthr2), "\n")

  for(i in seq(along=ind.fp)) {
    phyloqtl.roc[j,1,i] <- mean(phyloqtlres[,"maxlod","allpartitions",i] > allthr2[j] & 
                                phyloqtlres[,"prob.above.truth","allpartitions",i]>0.95)
    phyloqtl.roc[j,2,i] <- mean(phyloqtlres[,"maxlod","allpartitions",i] > allthr2[j] & 
                                phyloqtlres[,"prob.above.truth","allpartitions",i]<=0.95)
    phyloqtl.roc[j,3,i] <- mean(phyloqtlres[,"maxlod","allpartitions",i] > allthr2[j] & 
                         phyloqtlres[,"prob.above.truth","allpartitions",i]>0.95)
    phyloqtl.roc[j,4,i] <- mean(phyloqtlres[,"maxlod","allpartitions",i] > allthr2[j] & 
                         phyloqtlres[,"prob.below.truth","allpartitions",i]<0.05)
  }
}

save(ind.roc, ind.fp, ind.tp, phyloqtl.roc, phyloqtl.tp, phyloqtl.fp,
     phyloqtl.tpa, phyloqtl.fpa, file="forfig3.RData")
