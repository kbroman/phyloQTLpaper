######################################################################
# simulations under the null hypothesis of no QTL
#
# 4 taxa; various sample sizes; all crosses or a set of 3/6
#
# revised: also consider the maximum "overall lod" (log10 ave 10^LOD)
######################################################################

set.seed(22811303 + SUB)
data(map10)
map10 <- map10[-20]

n.sim <- 500
n.ind <- seq(50, 200, by=25)
null4 <- array(dim=c(n.sim, 13, length(n.ind)))
dimnames(null4) <- list(NULL, c("onecross",
                                "maxoveralllod.apac", "maxlod.apac", "diflod.apac",
                                "maxoveralllod.tpac", "maxlod.tpac", "diflod.tpac",
                                "maxoveralllod.apmc", "maxlod.apmc", "diflod.apmc",
                                "maxoveralllod.tpmc", "maxlod.tpmc", "diflod.tpmc"), n.ind)
treepart <- c("A|BCD", "B|ACD", "C|ABD", "D|ABC", "AB|CD")

for(i in 1:n.sim) {
  x <- simPhyloQTL(n.taxa=4, partition="A|BCD", crosses=c("AB","AC","AD","BC","BD","CD"),
                   n.ind=max(n.ind), model=c(1,0,0,0), map=map10)
  x <- lapply(x, calc.genoprob, step=1, err=0)
  for(j in seq(along=n.ind)) {
    y <- lapply(x, subset, ind=1:n.ind[j])
    null4[i,1,j] <- max(scanone(y[[1]], method="hk")[,3])

    outpq <- scanPhyloQTL(y, method="hk")
    temp <- max(outpq, format="postprob")
    null4[i,2,j] <- temp[[length(temp)]]
    null4[i,4,j] <- max(summary(outpq, format="lod")$loddif)
    null4[i,3,j] <- max(unlist(outpq[,-(1:2)]))

    outpq <- scanPhyloQTL(y, method="hk", partitions=treepart)
    temp <- max(outpq, format="postprob")
    null4[i,5,j] <- temp[[length(temp)]]
    null4[i,7,j] <- max(summary(outpq, format="lod")$loddif)
    null4[i,6,j] <- max(unlist(outpq[,-(1:2)]))

    z <- y[c("AB","AC","BD")]
    outpq <- scanPhyloQTL(z, method="hk")
    temp <- max(outpq, format="postprob")
    null4[i,8,j] <- temp[[length(temp)]]
    null4[i,10,j] <- max(summary(outpq, format="lod")$loddif)
    null4[i,9,j] <- max(unlist(outpq[,-(1:2)]))

    outpq <- scanPhyloQTL(z, method="hk", partitions=treepart)
    temp <- max(outpq, format="postprob")
    null4[i,11,j] <- temp[[length(temp)]]
    null4[i,13,j] <- max(summary(outpq, format="lod")$loddif)
    null4[i,12,j] <- max(unlist(outpq[,-(1:2)]))
    cat(i, j, "\n")
  }
  if(i==round(i,-2)) save(null4, file="nullsimsSUB_rev.RData")
}

save(null4, file="nullsimsSUB_rev.RData")
