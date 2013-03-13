######################################################################
# compare phyloqtl method to the naive approach
######################################################################

set.seed(34615989+SUB)

data(map10)
map10 <- map10[1]
qtlloc <- 54
eff <- sqrt(2*0.1/(1-0.1))
partitions <- c("A|BCD", "AB|CD")

n.sim <- 20
indres <- array(dim=c(n.sim, 6, length(partitions)))
phyloqtlres <- array(dim=c(n.sim, 4, 2, length(partitions)))
dimnames(phyloqtlres) <- list(NULL, c("maxlod", "loddif", "prob.above.truth", "truthbest"),
                              c("allpartitions","treepartitions"), partitions)

for(i in 1:n.sim) {
  for(j in seq(along=partitions)) {
    cat(i, j, "\n")
    x <- simPhyloQTL(n.taxa=4, partition=partitions[j], map=map10, n.ind=75,
                     model=c(1,qtlloc,eff,0))
    x <- lapply(x, calc.genoprob, step=1, err=0)

    outind <- lapply(x, scanone, method="hk")
    indres[i,,j] <- sapply(outind, function(a) max(a[,3]))


  }
}

dimnames(indres) <- list(NULL, names(x), partitions)

save(indres, file="compare2naiveBSUB.RData")
