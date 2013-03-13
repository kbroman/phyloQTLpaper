#################################
# last update:  2010.02.24
#
# slightly revised (by Karl): 2010-02-24
#################################

library(qtl)

## Male=1,Female=0
###############################
# Lyons1: Cast/EiJ (C) x DBA/2J (D)
# 278 males; chol, HDL_log, nonHDL
cxd <- read.cross("csv", "../Data", "37QTL-Lyons1_rev.csv",
                  genotypes=0:2, na.strings="=", alleles=c("C","D"))
cd <- subset(cxd, chr=1:19)
cd$pheno$HDL <- 10^(cd$pheno$HDL_log)
cd$pheno$HDL_sqrt <- sqrt(cd$pheno$HDL)
#cd$pheno$cross <- 1  #as.factor('CD')
cd$pheno$sex <- as.numeric(pull.pheno(cd, "sex") == "M")

#hist(nmissing(cd,what="mar"),breaks=500)
dim(cd$pheno)  # 278  17

##################################
# Lyons3: 129S1/SvImJ (S) x CAST/EiJ (C)
# 277 males; HDL; nonHDL; chol
cxs <- read.cross("csv", "../Data", "37QTL-Lyons3_rev.csv",
                  genotypes=0:2, na.strings="=", alleles=c("C","S"))
cs <- subset(cxs, chr=1:19)
cs$pheno$HDL_log <- log10(cs$pheno$HDL)
cs$pheno$HDL_sqrt <- sqrt(cs$pheno$HDL)
#cs$pheno$cross <- 2

#hist(nmissing(cs,what="mar"),breaks=500)
dim(cs$pheno) # 277  20

##############################
# Wittenburg1: I/LnJ (I) x PERA/EiJ (PERA)
# 164 females, 141 males; chol, HDL, HDL_log, nonHDL
pxi <- read.cross("csv", "../Data", "37QTL-Wittenburg1_rev.csv",
                  genotypes=0:2, na.strings="=", alleles=c("P","I"))
pi <- subset(pxi, chr=1:19)
pi$pheno <- pi$pheno[,-find.pheno(pi, "pgm")]
pi$pheno$HDL_log <- log10(pi$pheno$HDL)
pi$pheno$HDL_sqrt <- sqrt(pi$pheno$HDL)
#pi$pheno$cross <- 3 
pi$pheno$sex <- as.numeric(pull.pheno(pi, "sex") == "M")

#hist(nmissing(pi,what="mar"),breaks=500)
dim(pi$pheno)  # 305  23

################################
# Wittenburg3: DBA/2J (D) x PERA/EiJ (PERA)
# 166 females, 158 males; chol_log, HDL_log, nonHDL_log
pxd <- read.cross("csv", "../Data", "37QTL-Wittenburg3_rev.csv",
                  genotypes=0:2, na.strings="=", alleles=c("P","D"))
pd <- subset(pxd, chr=1:19)
pd$pheno$HDL <- 10^(pd$pheno$HDL_log)
pd$pheno$HDL_sqrt <- sqrt(pd$pheno$HDL)
#pd$pheno$cross <- 4 
pd$pheno$sex <- as.numeric(pull.pheno(pd, "sex") == "M")

#hist(nmissing(pd,what="mar"),breaks=500)
dim(pd$pheno) # 324  23

##############################
# jitter map and place it within each cross
##############################
themap <- jittermap(pull.map(cd))
cd <- replace.map(cd, themap)
cs <- replace.map(cs, themap)
pi <- replace.map(pi, themap)
pd <- replace.map(pd, themap)


##################
# COMBINED DATA
###################
######################################
# delete obs with missing HDL_sqrt 
# rearrage HDL_sqrt to 1st pheno var
######################################
allx <- list(cd=cd, cs=cs, pi=pi, pd=pd)
 for (j in 1:4) {
   mis <- which(!is.na(allx[[j]]$pheno$HDL_sqrt))
   allx[[j]]$pheno <- allx[[j]]$pheno[mis,]

    for (i in 1:19) {
    allx[[j]]$geno[[i]]$data <- allx[[j]]$geno[[i]]$data[mis,]
     }
 }
allx[[1]]$pheno <- allx[[1]]$pheno[c(17,1:16)]
allx[[2]]$pheno <- allx[[2]]$pheno[c(20,1:19)]
allx[[3]]$pheno <- allx[[3]]$pheno[c(23,1:22)]
allx[[4]]$pheno <- allx[[4]]$pheno[c(23,1:22)]

# dim(allx[[1]]$pheno)  # 277  17  (missing=1)
# dim(allx[[2]]$pheno)  # 275  20  (missing=2)
# dim(allx[[3]]$pheno)  # 282  23  (missing=23)
# dim(allx[[4]]$pheno)  # 322  23  (missing=2)

rm(cd,cs,pi,pd,cxd,cxs,pxi,pxd,mis, i, j, themap)
