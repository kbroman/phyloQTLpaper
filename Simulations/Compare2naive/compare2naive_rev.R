######################################################################
# compare phyloqtl method to the naive approach
# revised to include max "overall lod" (log10 ave 10^LOD)
######################################################################

set.seed(34615989+SUB)

data(map10)
map10 <- map10[1]
qtlloc <- 54
eff <- sqrt(2*0.1/(1-0.1))
partitions <- c("A|BCD", "AB|CD")

n.sim <- 500
indres <- array(dim=c(n.sim, 6, length(partitions)))
phyloqtlres <- array(dim=c(n.sim, 5, 2, length(partitions)))
dimnames(phyloqtlres) <- list(NULL, c("overallmaxlod", "maxlod", "loddif", "prob.above.truth", "truthbest"),
                              c("allpartitions","treepartitions"), partitions)

for(i in 1:n.sim) {
  for(j in seq(along=partitions)) {
    cat(i, j, "\n")
    x <- simPhyloQTL(n.taxa=4, partition=partitions[j], map=map10, n.ind=100,
                     model=c(1,qtlloc,eff,0))
    x <- lapply(x, calc.genoprob, step=1, err=0)

    outind <- lapply(x, scanone, method="hk")
    indres[i,,j] <- sapply(outind, function(a) max(a[,3]))

    outpq <- scanPhyloQTL(x, method="hk")
    sum1 <- summary(outpq, format="postprob")
    sum2 <- summary(outpq, format="lod")
    phyloqtlres[i,1,1,j] <- sum1$max.overall.lod
    phyloqtlres[i,2,1,j] <- sum2$maxlod
    phyloqtlres[i,3,1,j] <- sum2$loddif
    pprob <- unlist(sum1[3:(ncol(sum1)-2)])
    phyloqtlres[i,4,1,j] <- sum(pprob[pprob >= pprob[partitions[j]] & names(pprob) != partitions[j]])
    phyloqtlres[i,5,1,j] <- as.numeric(sum1$inferred == partitions[j])

    outpq <- outpq[,1:7]
    sum1 <- summary(outpq, format="postprob")
    sum2 <- summary(outpq, format="lod")
    phyloqtlres[i,1,2,j] <- sum1$max.overall.lod
    phyloqtlres[i,2,2,j] <- sum2$maxlod
    phyloqtlres[i,3,2,j] <- sum2$loddif
    pprob <- unlist(sum1[3:(ncol(sum1)-2)])
    phyloqtlres[i,4,2,j] <- sum(pprob[pprob >= pprob[partitions[j]] & names(pprob) != partitions[j]])
    phyloqtlres[i,5,2,j] <- as.numeric(sum1$inferred == partitions[j])

  }
}

dimnames(indres) <- list(NULL, names(x), partitions)

save(indres, phyloqtlres, file="compare2naiveSUB_rev.RData")
