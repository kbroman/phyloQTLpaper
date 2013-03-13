######################################################################
# determine power of approach for 4 taxa
# revised to include maximum "overall LOD" (log10 ave 10^LOD)
######################################################################

set.seed(2125903+SUB)

data(map10)
map10 <- map10[1]
qtlloc <- 54
hsq <- seq(0.025, 0.15, by=0.025)
eff <- sqrt(2*hsq/(1-hsq))
n.ind <- c(300, 450, 600)
partitions <- c("A|BCD", "AB|CD")
crosses <- list(c("AB","AC","AD"),
                c("AB","AC","BD"),
                c("AB","AC","CD"),
                c("AB","AD","BC"),
                c("AB","AD","CD"),
                c("AB","BC","BD"),
                c("AB","BC","CD"),
                c("AB","BD","CD"),
                c("AC","AD","BC"),
                c("AC","AD","BD"),
                c("AC","BC","BD"),
                c("AC","BC","CD"),
                c("AC","BD","CD"),
                c("AD","BC","BD"),
                c("AD","BC","CD"),
                c("AD","BD","CD"))

n.sim <- 500
res <- array(dim=c(n.sim, 6, 2, length(crosses)+1, length(n.ind), length(hsq), length(partitions)))
dimnames(res) <- list(NULL, c("maxoveralllod", "maxlod", "loddif", "prob.above.truth", "prob.below.truth", "truthbest"),
                      c("allpartitions","treepartitions"),
                      c("all", sapply(crosses, paste, collapse=":")), n.ind, hsq, partitions)

for(i in 1:n.sim) {
  for(j in seq(along=partitions)) {

#    cat(i, j, "\n")

    x <- simPhyloQTL(n.taxa=4, partition=partitions[j], map=map10, n.ind=max(n.ind)/3,
                     model=c(1,qtlloc,eff[1],0), keep.qtlgeno=TRUE)
    x <- lapply(x, calc.genoprob, step=1, err=0)

    for(k in seq(along=eff)) {
      if(k > 1) {
        for(s in seq(along=x)) {
          if(!is.null(x[[s]]$qtlgeno))
            x[[s]]$pheno[,1] <- (x[[s]]$qtlgeno-2)*eff[k] + rnorm(max(n.ind)/3)
        }
      }

      for(s in seq(along=n.ind)) {
        xx <- lapply(x, subset, ind=1:(n.ind[s]/3))

        cat(i, j, k, s, "\n")

        for(ss in 1:(length(crosses)+1)) {

          xxx <- xx
          if(ss > 1) xxx <- xx[crosses[[ss-1]]]
          else xxx <- lapply(xx, subset, ind=1:(n.ind[s]/6))

          outpq <- scanPhyloQTL(xxx, method="hk")
          sum1 <- summary(outpq, format="postprob")
          sum2 <- summary(outpq, format="lod")
          res[i,1,1,ss,s,k,j] <- sum1$max.overall.lod
          res[i,2,1,ss,s,k,j] <- sum2$maxlod
          res[i,3,1,ss,s,k,j] <- sum2$loddif
          pprob <- unlist(sum1[3:(ncol(sum1)-2)])
          res[i,4,1,ss,s,k,j] <- sum(pprob[pprob >= pprob[partitions[j]] & names(pprob) != partitions[j]])
          res[i,5,1,ss,s,k,j] <- sum(pprob[pprob < pprob[partitions[j]] & names(pprob) != partitions[j]])
          res[i,6,1,ss,s,k,j] <- as.numeric(sum1$inferred == partitions[j])

          outpq <- outpq[,1:7]
          sum1 <- summary(outpq, format="postprob")
          sum2 <- summary(outpq, format="lod")
          res[i,1,2,ss,s,k,j] <- sum1$max.overall.lod
          res[i,2,2,ss,s,k,j] <- sum2$maxlod
          res[i,3,2,ss,s,k,j] <- sum2$loddif
          pprob <- unlist(sum1[3:(ncol(sum1)-2)])
          res[i,4,2,ss,s,k,j] <- sum(pprob[pprob >= pprob[partitions[j]] & names(pprob) != partitions[j]])
          res[i,5,2,ss,s,k,j] <- sum(pprob[pprob < pprob[partitions[j]] & names(pprob) != partitions[j]])
          res[i,6,2,ss,s,k,j] <- as.numeric(sum1$inferred == partitions[j])
        }

      }
    }
  }
  if(i==round(i/50)*50) save(res, file="powerSUB_rev.RData")
}

save(res, file="powerSUB_rev.RData")
