attach("nullsims_all_rev.RData")
thrr <- apply(null4r[,c(1,2:3,5:6,8:9,11:12),], 2:3, quantile, 0.95)
thrr[6:9,1:3] <- thrr[6:9,c(3,5,7)]
thrr <- thrr[,1:3]
colnames(thrr) <- as.numeric(colnames(thrr))*6
save(thrr, file="thresholds_rev.RData")
