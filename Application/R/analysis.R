library(qtl) # http://www.rqtl.org

# run calc.genoprob for all of the crosses
allx <- lapply(allx, calc.genoprob, step=1)

sex <- lapply(allx, function(a) a$pheno$sex)

# no sex covariate
out <- scanPhyloQTL(allx,  method="hk")

# sex as add've covariate
out.a <- scanPhyloQTL(allx,  method="hk", addcovar=sex)

sum1 <- summary(out)
sum1.a <- summary(out.a)

sum1[,c(1,2,ncol(sum1)+c(-1,0))]
sum1.a[,c(1,2,ncol(sum1)+c(-1,0))]

# Li et al:
#   c1  @ 86: DC|PIS (same for us)
#   c2  @ 48: CS|PID (we get c|dips)
#   c4  @ 22: PC|IDS (same for us)
#   c6  @ 68: C|PIDS (same for us)

#   c5  @  2: I|PDCS (same for us)
#   c11 @ 20: P|IDCS (we get di|cps)

out.ind <- vector("list", 4)
for(i in 1:4)
  out.ind[[i]] <- scanone(allx[[i]], method="hk", addcovar=sex[[i]])
out.ind <- cbind(out.ind[[1]], out.ind[[2]], out.ind[[3]], out.ind[[4]])
colnames(out.ind)[3:6] <- names(allx)

######################################################################
# try em
out.a.em <- scanPhyloQTL(allx,  method="em", addcovar=sex)
out.em <- scanPhyloQTL(allx,  method="em")

######################################################################
# bayes intervals; individual partitions and overall
combinedlod <-
function(out)
{
  out[,3] <- apply(out[,-(1:2)], 1, function(a) log10(mean(10^a)))
  out <- out[,1:3]
  class(out) <- c("scanone", "data.frame")
  out
}
out.em.c <- combinedlod(out.em)
out.a.em.c <- combinedlod(out.a.em)
out.c <- combinedlod(out)
out.a.c <- combinedlod(out.a)

out.ind.em <- vector("list", 4)
for(i in 1:4) {
  if(i > 2) 
    out.ind.em[[i]] <- scanone(allx[[i]], method="em", addcovar=sex[[i]])
  else 
    out.ind.em[[i]] <- scanone(allx[[i]], method="em")
}
out.ind.em <- cbind(out.ind.em[[1]], out.ind.em[[2]], out.ind.em[[3]], out.ind.em[[4]])
colnames(out.ind.em)[3:6] <- names(allx)

save(out, out.a, out.ind, out.ind.em, out.a.em, out.em,
     out.em.c, out.a.em.c, out.c, out.a.c,
     file="app_results.RData")

######################################################################
# permutations
######################################################################

# phyloqtl perms
for(i in 2:5) {
  attachfile(i, "operm_phyloqtl")
  if(i==2) {
    op <- operm.a.em
  }
  else {
    op <- c(op, operm.a.em)
  }
  detach(2)
}

load("operm_ind.RData")

save(operm.a.em, operm.ind.em, file="~/Docs/Papers/PhyloQTL/R/app_perms.RData")
