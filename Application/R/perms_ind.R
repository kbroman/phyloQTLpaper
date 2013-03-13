# permutation tests with individual crosses

set.seed(3729935)
load("allx_2010-03-03.RData")
allx <- lapply(allx, calc.genoprob, step=1)

sex <- lapply(allx, function(a) a$pheno$sex)

operm.ind.em <- vector("list", 4)
for(i in 1:4) {
  cat(i,"\n")
  if(i > 2) 
    operm.ind.em[[i]] <- scanone(allx[[i]], method="em", addcovar=sex[[i]], n.perm=10000, n.cluster=4)
  else 
    operm.ind.em[[i]] <- scanone(allx[[i]], method="em", n.perm=10000, n.cluster=4)
}
operm.ind.em <- cbind(operm.ind.em[[1]], operm.ind.em[[2]], operm.ind.em[[3]], operm.ind.em[[4]],
                      labels=names(allx))
save(operm.ind.em, file="operm_ind_em.RData")
