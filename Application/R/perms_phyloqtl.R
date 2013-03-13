set.seed(3729935+SUB)
load("allx_2010-03-03.RData")
allx <- lapply(allx, calc.genoprob, step=1)

sex <- lapply(allx, function(a) a$pheno$sex)

n.perm <- 2500
operm.a.em <- rep(NA, n.perm)
n.ind <- sapply(allx, nind)
tempx <- allx
tempsex <- sex
for(i in 1:n.perm) {
  cat(i,"\n")
  o <- lapply(n.ind, sample)
  for(j in seq(along=allx)) {
    tempx[[j]]$pheno <- allx[[j]]$pheno[o[[j]],]
    tempsex[[j]] <- sex[[j]][o[[j]]]
  }
  tempout <- scanPhyloQTL(tempx, addcovar=tempsex, method="em")
  operm.a.em[i] <- max(unlist(tempout[,-(1:2)]), na.rm=TRUE)
  if(i==round(i,-2)) save(operm.a.em, file="operm_phyloqtlSUB.RData")
}
save(operm.a.em, file="operm_phyloqtlSUB.RData")
