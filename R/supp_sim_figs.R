attach("power_summaries_rev.RData")

pdf("../SuppFigs/power_allpart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0))
hsq <- as.numeric(dimnames(pow)[[5]])*100
for(i in 3:1) {
  for(j in 1:2) {
    plot(hsq, pow[2,1,1,i,,j]*100,
         xlab="Percent variance explained by QTL", ylab="Power (%)",
         type="n", ylim=c(0,100), yaxs="i")
    abline(h=seq(20,80,by=20), lty=2, col="gray")
    for(k in 2:dim(pow)[[3]]) 
      lines(hsq, pow[2,1,k,i,,j]*100, col=c("green","red", "blue")[nqtl[[j]][k-1]], lwd=2)
    lines(hsq, pow[2,1,1,i,,j]*100, lwd=2, lty=2)
    if(i==3) mtext(side=3, line=2, dimnames(pow)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(pow)[[4]][i]), cex=0.9)
  }
}
mtext(side=3, "All partitions", outer=TRUE)
dev.off()

pdf("../SuppFigs/power_treepart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0))
hsq <- as.numeric(dimnames(pow)[[5]])*100
for(i in 3:1) {
  for(j in 1:2) {
    plot(hsq, pow[2,2,1,i,,j]*100,
         xlab="Percent variance explained by QTL", ylab="Power (%)",
         type="n", ylim=c(0,100), yaxs="i")
    abline(h=seq(20,80,by=20), lty=2, col="gray")
    for(k in 2:dim(pow)[[3]])
      lines(hsq, pow[2,2,k,i,,j]*100, col=c("green","red", "blue")[nqtl[[j]][k-1]], lwd=2)
    lines(hsq, pow[2,2,1,i,,j]*100, lwd=2, lty=2)
    if(i==3) mtext(side=3, line=2, dimnames(pow)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(pow)[[4]][i]), cex=0.9)
  }
}
mtext(side=3, "Tree partitions", outer=TRUE)
dev.off()

pdf("../SuppFigs/fp_allpart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0))
hsq <- as.numeric(dimnames(fp)[[5]])*100
for(i in 3:1) {
  for(j in 1:2) {
    plot(hsq, fp[2,1,1,i,,j]*100,
         xlab="Percent variance explained by QTL", ylab="False pos've rate (%)",
         type="n", ylim=c(0,5), yaxs="i")
    abline(h=1:4, lty=2, col="gray")
    for(k in 2:dim(fp)[[3]])
      lines(hsq, fp[2,1,k,i,,j]*100, col=c("green","red", "blue")[nqtl[[j]][k-1]], lwd=2)
    lines(hsq, fp[2,1,1,i,,j]*100, lwd=2, lty=2)
    if(i==3) mtext(side=3, line=2, dimnames(fp)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(fp)[[4]][i]), cex=0.9)
  }
}
mtext(side=3, "All partitions", outer=TRUE)
dev.off()

pdf("../SuppFigs/fp_treepart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0))
hsq <- as.numeric(dimnames(fp)[[5]])*100
for(i in 3:1) {
  for(j in 1:2) {
    plot(hsq, fp[2,2,1,i,,j]*100,
         xlab="Percent variance explained by QTL", ylab="False pos've rate (%)",
         type="n", ylim=c(0,5), yaxs="i")
    abline(h=1:4, lty=2, col="gray")
    for(k in 2:dim(fp)[[3]])
      lines(hsq, fp[2,2,k,i,,j]*100, col=c("green","red", "blue")[nqtl[[j]][k-1]], lwd=2)
    lines(hsq, fp[2,2,1,i,,j]*100, lwd=2, lty=2)
    if(i==3) mtext(side=3, line=2, dimnames(fp)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(fp)[[4]][i]), cex=0.9)
  }
}
mtext(side=3, "Tree partitions", outer=TRUE)
dev.off()

pdf("../SuppFigs/ns_allpart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0))
hsq <- as.numeric(dimnames(ns)[[5]])*100
for(i in 3:1) {
  for(j in 1:2) {
    plot(hsq, ns[2,1,1,i,,j]*100,
         xlab="Percent variance explained by QTL", ylab="False neg've rate (%)",
         type="n", ylim=c(0,100), yaxs="i")
    abline(h=seq(20,80,by=20), lty=2, col="gray")
    for(k in 2:dim(ns)[[3]])
      lines(hsq, ns[2,1,k,i,,j]*100, col=c("green","red", "blue")[nqtl[[j]][k-1]], lwd=2)
    lines(hsq, ns[2,1,1,i,,j]*100, lwd=2, lty=2)
    if(i==3) mtext(side=3, line=2, dimnames(ns)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(ns)[[4]][i]), cex=0.9)
  }
}
mtext(side=3, "All partitions", outer=TRUE)
dev.off()

pdf("../SuppFigs/ns_treepart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0))
hsq <- as.numeric(dimnames(ns)[[5]])*100
for(i in 3:1) {
  for(j in 1:2) {
    plot(hsq, ns[2,2,1,i,,j]*100,
         xlab="Percent variance explained by QTL", ylab="False neg've rate (%)",
         type="n", ylim=c(0,100), yaxs="i")
    abline(h=seq(20,80,by=20), lty=2, col="gray")
    for(k in 2:dim(ns)[[3]])
      lines(hsq, ns[2,2,k,i,,j]*100, col=c("green","red", "blue")[nqtl[[j]][k-1]], lwd=2)
    lines(hsq, ns[2,2,1,i,,j]*100, lwd=2, lty=2)
    if(i==3) mtext(side=3, line=2, dimnames(ns)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(ns)[[4]][i]), cex=0.9)
  }
}
mtext(side=3, "Tree partitions", outer=TRUE)
dev.off()


pdf("../SuppFigs/expower_allpart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0))
hsq <- as.numeric(dimnames(expow)[[5]])*100
for(i in 3:1) {
  for(j in 1:2) {
    plot(hsq, expow[2,1,1,i,,j]*100,
         xlab="Percent variance explained by QTL", ylab="Exact power (%)",
         type="n", ylim=c(0,100), yaxs="i")
    abline(h=seq(20,80,by=20), lty=2, col="gray")
    for(k in 2:dim(expow)[[3]]) 
      lines(hsq, expow[2,1,k,i,,j]*100, col=c("green","red", "blue")[nqtl[[j]][k-1]], lwd=2)
    lines(hsq, expow[2,1,1,i,,j]*100, lwd=2, lty=2)
    if(i==3) mtext(side=3, line=2, dimnames(expow)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(expow)[[4]][i]), cex=0.9)
  }
}
mtext(side=3, "All partitions", outer=TRUE)
dev.off()

pdf("../SuppFigs/expower_treepart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0))
hsq <- as.numeric(dimnames(expow)[[5]])*100
for(i in 3:1) {
  for(j in 1:2) {
    plot(hsq, expow[2,2,1,i,,j]*100,
         xlab="Percent variance explained by QTL", ylab="Exact power (%)",
         type="n", ylim=c(0,100), yaxs="i")
    abline(h=seq(20,80,by=20), lty=2, col="gray")
    for(k in 2:dim(expow)[[3]])
      lines(hsq, expow[2,2,k,i,,j]*100, col=c("green","red", "blue")[nqtl[[j]][k-1]], lwd=2)
    lines(hsq, expow[2,2,1,i,,j]*100, lwd=2, lty=2)
    if(i==3) mtext(side=3, line=2, dimnames(expow)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(expow)[[4]][i]), cex=0.9)
  }
}
mtext(side=3, "Tree partitions", outer=TRUE)
dev.off()

######################################################################

pdf("../SuppFigs/detailedpower_allpart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0), mar=c(7.1,5.1,4.1,3.1))
for(i in 3:1) {
  for(j in 1:2) {
    o <- c(1,1+order(-nqtl[[j]], names(nqtl[[j]])))
    if(j==1) o[4:5] <- o[5:4]
    if(j==2) o[6:13] <- o[c(7,8,11,12,6,9,10,13)]
    x <- 1:dim(pow)[3]
    plot(0,0,type="n", xlab="", ylab="Power (%)", ylim=c(0,100),
         xlim=c(0.5, dim(pow)[3]+0.5), xaxt="n", yaxs="i")
    abline(h=seq(20,80,by=20), lty=2, col="gray")

    thecol <- c("black", c("green", "red", "blue")[nqtl[[j]][o[-1]-1]])

    segments(x-0.25, pow[2,1,o,i,"0.1",j]*100,
             x+0.25, pow[2,1,o,i,"0.1",j]*100, lwd=2,
             col=thecol)
    ci <- matrix(ncol=2, nrow=dim(pow)[3])
    for(k in 1:dim(pow)[3]) 
      ci[k,] <- binom.test(pow[2,1,o[k],i,"0.1",j]*10000, 10000)$conf.int*100
    segments(x, ci[,1], x, ci[,2])

    axis(side=1, at=1:dim(pow)[3], tick=FALSE, lab=rep("", dim(pow)[3]))
    for(k in 1:dim(pow)[3]) 
      axis(side=1, at=k, dimnames(pow)[[3]][o[k]], las=2,
           col.axis=thecol[k], tick=FALSE)

    if(i==3) mtext(side=3, line=2, dimnames(pow)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(pow)[[4]][i]), cex=0.9)
    mtext(side=1, line=6, "Crosses")
  }
}
mtext(side=3, "All partitions", outer=TRUE)
dev.off()

pdf("../SuppFigs/detailedpower_treepart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0), mar=c(7.1,5.1,4.1,3.1))
for(i in 3:1) {
  for(j in 1:2) {
    o <- c(1,1+order(-nqtl[[j]], names(nqtl[[j]])))
    if(j==1) o[4:5] <- o[5:4]
    if(j==2) o[6:13] <- o[c(7,8,11,12,6,9,10,13)]
    x <- 1:dim(pow)[3]
    plot(0,0,type="n", xlab="", ylab="Power (%)", ylim=c(0,100),
         xlim=c(0.5, dim(pow)[3]+0.5), xaxt="n", yaxs="i")
    abline(h=seq(20,80,by=20), lty=2, col="gray")

    thecol <- c("black", c("green", "red", "blue")[nqtl[[j]][o[-1]-1]])

    segments(x-0.25, pow[2,2,o,i,"0.1",j]*100,
             x+0.25, pow[2,2,o,i,"0.1",j]*100, lwd=2,
             col=thecol)

    ci <- matrix(ncol=2, nrow=dim(pow)[3])
    for(k in 1:dim(pow)[3]) 
      ci[k,] <- binom.test(pow[2,2,o[k],i,"0.1",j]*10000, 10000)$conf.int*100
    segments(x, ci[,1], x, ci[,2])

    axis(side=1, at=1:dim(pow)[3], tick=FALSE, lab=rep("", dim(pow)[3]))
    for(k in 1:dim(pow)[3]) 
      axis(side=1, at=k, dimnames(pow)[[3]][o[k]], las=2,
           col.axis=thecol[k], tick=FALSE)

    if(i==3) mtext(side=3, line=2, dimnames(pow)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(pow)[[4]][i]), cex=0.9)
    mtext(side=1, line=6, "Crosses")
  }
}
mtext(side=3, "Tree partitions", outer=TRUE)
dev.off()


pdf("../SuppFigs/detailedexpower_allpart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0), mar=c(7.1,5.1,4.1,3.1))
for(i in 3:1) {
  for(j in 1:2) {
    o <- c(1,1+order(-nqtl[[j]], names(nqtl[[j]])))
    if(j==1) o[4:5] <- o[5:4]
    if(j==2) o[6:13] <- o[c(7,8,11,12,6,9,10,13)]
    x <- 1:dim(expow)[3]
    plot(0,0,type="n", xlab="", ylab="Exact power (%)", ylim=c(0,100),
         xlim=c(0.5, dim(expow)[3]+0.5), xaxt="n", yaxs="i")
    abline(h=seq(20,80,by=20), lty=2, col="gray")

    thecol <- c("black", c("green", "red", "blue")[nqtl[[j]][o[-1]-1]])

    segments(x-0.25, expow[2,1,o,i,"0.1",j]*100,
             x+0.25, expow[2,1,o,i,"0.1",j]*100, lwd=2,
             col=thecol)

    ci <- matrix(ncol=2, nrow=dim(expow)[3])
    for(k in 1:dim(expow)[3]) 
      ci[k,] <- binom.test(expow[2,1,o[k],i,"0.1",j]*10000, 10000)$conf.int*100
    segments(x, ci[,1], x, ci[,2])

    axis(side=1, at=1:dim(expow)[3], tick=FALSE, lab=rep("", dim(expow)[3]))
    for(k in 1:dim(expow)[3]) 
      axis(side=1, at=k, dimnames(expow)[[3]][o[k]], las=2,
           col.axis=thecol[k], tick=FALSE)

    if(i==3) mtext(side=3, line=2, dimnames(expow)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(expow)[[4]][i]), cex=0.9)
    mtext(side=1, line=6, "Crosses")
  }
}
mtext(side=3, "All partitions", outer=TRUE)
dev.off()

pdf("../SuppFigs/detailedexpower_treepart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0), mar=c(7.1,5.1,4.1,3.1))
for(i in 3:1) {
  for(j in 1:2) {
    o <- c(1,1+order(-nqtl[[j]], names(nqtl[[j]])))
    if(j==1) o[4:5] <- o[5:4]
    if(j==2) o[6:13] <- o[c(7,8,11,12,6,9,10,13)]
    x <- 1:dim(expow)[3]
    plot(0,0,type="n", xlab="", ylab="Exact power (%)", ylim=c(0,100),
         xlim=c(0.5, dim(expow)[3]+0.5), xaxt="n", yaxs="i")
    abline(h=seq(20,80,by=20), lty=2, col="gray")

    thecol <- c("black", c("green", "red", "blue")[nqtl[[j]][o[-1]-1]])

    segments(x-0.25, expow[2,2,o,i,"0.1",j]*100,
             x+0.25, expow[2,2,o,i,"0.1",j]*100, lwd=2,
             col=thecol)

    ci <- matrix(ncol=2, nrow=dim(expow)[3])
    for(k in 1:dim(expow)[3]) 
      ci[k,] <- binom.test(expow[2,2,o[k],i,"0.1",j]*10000, 10000)$conf.int*100
    segments(x, ci[,1], x, ci[,2])

    axis(side=1, at=1:dim(expow)[3], tick=FALSE, lab=rep("", dim(expow)[3]))
    for(k in 1:dim(expow)[3]) 
      axis(side=1, at=k, dimnames(expow)[[3]][o[k]], las=2,
           col.axis=thecol[k], tick=FALSE)

    if(i==3) mtext(side=3, line=2, dimnames(expow)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(expow)[[4]][i]), cex=0.9)
    mtext(side=1, line=6, "Crosses")
  }
}
mtext(side=3, "Tree partitions", outer=TRUE)
dev.off()



pdf("../SuppFigs/detailedfp_allpart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0), mar=c(7.1,5.1,4.1,3.1))
for(i in 3:1) {
  for(j in 1:2) {
    o <- c(1,1+order(-nqtl[[j]], names(nqtl[[j]])))
    if(j==1) o[4:5] <- o[5:4]
    if(j==2) o[6:13] <- o[c(7,8,11,12,6,9,10,13)]
    x <- 1:dim(fp)[3]
    plot(0,0,type="n", xlab="", ylab="False pos've rate (%)", ylim=c(0,5),
         xlim=c(0.5, dim(fp)[3]+0.5), xaxt="n", yaxs="i")
    abline(h=1:4, lty=2, col="gray")

    thecol <- c("black", c("green", "red", "blue")[nqtl[[j]][o[-1]-1]])

    segments(x-0.25, fp[2,1,o,i,"0.1",j]*100,
             x+0.25, fp[2,1,o,i,"0.1",j]*100, lwd=2,
             col=thecol)

    ci <- matrix(ncol=2, nrow=dim(fp)[3])
    for(k in 1:dim(fp)[3]) 
      ci[k,] <- binom.test(fp[2,1,o[k],i,"0.1",j]*10000, 10000)$conf.int*100
    segments(x, ci[,1], x, ci[,2])

    axis(side=1, at=1:dim(fp)[3], tick=FALSE, lab=rep("", dim(fp)[3]))
    for(k in 1:dim(fp)[3]) 
      axis(side=1, at=k, dimnames(fp)[[3]][o[k]], las=2,
           col.axis=thecol[k], tick=FALSE)

    if(i==3) mtext(side=3, line=2, dimnames(fp)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(fp)[[4]][i]), cex=0.9)
    mtext(side=1, line=6, "Crosses")
  }
}
mtext(side=3, "All partitions", outer=TRUE)
dev.off()

pdf("../SuppFigs/detailedfp_treepart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0), mar=c(7.1,5.1,4.1,3.1))
for(i in 3:1) {
  for(j in 1:2) {
    o <- c(1,1+order(-nqtl[[j]], names(nqtl[[j]])))
    if(j==1) o[4:5] <- o[5:4]
    if(j==2) o[6:13] <- o[c(7,8,11,12,6,9,10,13)]
    x <- 1:dim(fp)[3]
    plot(0,0,type="n", xlab="", ylab="False pos've rate (%)", ylim=c(0,5),
         xlim=c(0.5, dim(fp)[3]+0.5), xaxt="n", yaxs="i")
    abline(h=1:4, lty=2, col="gray")

    thecol <- c("black", c("green", "red", "blue")[nqtl[[j]][o[-1]-1]])

    segments(x-0.25, fp[2,2,o,i,"0.1",j]*100,
             x+0.25, fp[2,2,o,i,"0.1",j]*100, lwd=2,
             col=thecol)

    ci <- matrix(ncol=2, nrow=dim(fp)[3])
    for(k in 1:dim(fp)[3]) 
      ci[k,] <- binom.test(fp[2,2,o[k],i,"0.1",j]*10000, 10000)$conf.int*100
    segments(x, ci[,1], x, ci[,2])

    axis(side=1, at=1:dim(fp)[3], tick=FALSE, lab=rep("", dim(fp)[3]))
    for(k in 1:dim(fp)[3]) 
      axis(side=1, at=k, dimnames(fp)[[3]][o[k]], las=2,
           col.axis=thecol[k], tick=FALSE)

    if(i==3) mtext(side=3, line=2, dimnames(fp)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(fp)[[4]][i]), cex=0.9)
    mtext(side=1, line=6, "Crosses")
  }
}
mtext(side=3, "Tree partitions", outer=TRUE)
dev.off()



pdf("../SuppFigs/detailedns_allpart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0), mar=c(7.1,5.1,4.1,3.1))
for(i in 3:1) {
  for(j in 1:2) {
    o <- c(1,1+order(-nqtl[[j]], names(nqtl[[j]])))
    if(j==1) o[4:5] <- o[5:4]
    if(j==2) o[6:13] <- o[c(7,8,11,12,6,9,10,13)]
    x <- 1:dim(ns)[3]
    plot(0,0,type="n", xlab="", ylab="False neg've rate (%)", ylim=c(0,100),
         xlim=c(0.5, dim(ns)[3]+0.5), xaxt="n", yaxs="i")
    abline(h=seq(20,80,by=20), lty=2, col="gray")

    thecol <- c("black", c("green", "red", "blue")[nqtl[[j]][o[-1]-1]])

    segments(x-0.25, ns[2,1,o,i,"0.1",j]*100,
             x+0.25, ns[2,1,o,i,"0.1",j]*100, lwd=2,
             col=thecol)

    ci <- matrix(ncol=2, nrow=dim(ns)[3])
    for(k in 1:dim(ns)[3]) 
      ci[k,] <- binom.test(ns[2,1,o[k],i,"0.1",j]*10000, 10000)$conf.int*100
    segments(x, ci[,1], x, ci[,2])

    axis(side=1, at=1:dim(ns)[3], tick=FALSE, lab=rep("", dim(ns)[3]))
    for(k in 1:dim(ns)[3]) 
      axis(side=1, at=k, dimnames(ns)[[3]][o[k]], las=2,
           col.axis=thecol[k], tick=FALSE)

    if(i==3) mtext(side=3, line=2, dimnames(ns)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(ns)[[4]][i]), cex=0.9)
    mtext(side=1, line=6, "Crosses")
  }
}
mtext(side=3, "All partitions", outer=TRUE)
dev.off()

pdf("../SuppFigs/detailedns_treepart.pdf", height=7, width=7)
par(mfrow=c(3,2), las=1, oma=c(0,0,1.5,0), mar=c(7.1,5.1,4.1,3.1))
for(i in 3:1) {
  for(j in 1:2) {
    o <- c(1,1+order(-nqtl[[j]], names(nqtl[[j]])))
    if(j==1) o[4:5] <- o[5:4]
    if(j==2) o[6:13] <- o[c(7,8,11,12,6,9,10,13)]
    x <- 1:dim(ns)[3]
    plot(0,0,type="n", xlab="", ylab="False neg've rate (%)", ylim=c(0,100),
         xlim=c(0.5, dim(ns)[3]+0.5), xaxt="n", yaxs="i")
    abline(h=seq(20,80,by=20), lty=2, col="gray")

    thecol <- c("black", c("green", "red", "blue")[nqtl[[j]][o[-1]-1]])

    segments(x-0.25, ns[2,2,o,i,"0.1",j]*100,
             x+0.25, ns[2,2,o,i,"0.1",j]*100, lwd=2,
             col=thecol)

    ci <- matrix(ncol=2, nrow=dim(ns)[3])
    for(k in 1:dim(ns)[3]) 
      ci[k,] <- binom.test(ns[2,2,o[k],i,"0.1",j]*10000, 10000)$conf.int*100
    segments(x, ci[,1], x, ci[,2])

    axis(side=1, at=1:dim(ns)[3], tick=FALSE, lab=rep("", dim(ns)[3]))
    for(k in 1:dim(ns)[3]) 
      axis(side=1, at=k, dimnames(ns)[[3]][o[k]], las=2,
           col.axis=thecol[k], tick=FALSE)

    if(i==3) mtext(side=3, line=2, dimnames(ns)[[6]][j])
    mtext(side=3, line=0.3, paste("n =", dimnames(ns)[[4]][i]), cex=0.9)
    mtext(side=1, line=6, "Crosses")
  }
}
mtext(side=3, "Tree partitions", outer=TRUE)
dev.off()

detach(2)
