attach("power_summaries_rev.RData")

#pdf("../Figs/fig4.pdf", height=7, width=7, pointsize=12)
postscript("../Figs/fig4.eps", height=7, width=7, pointsize=12, onefile=FALSE, paper="special", horizontal=FALSE)
par(mfrow=c(3,2), las=1)
hsq <- as.numeric(dimnames(pow)[[5]])*100
for(j in 1:2) {
  plot(hsq, pow[2,1,1,2,,j]*100,
       xlab="Percent variance explained by QTL", ylab="Power (%)",
       type="n", ylim=c(0,100), yaxs="i")
  abline(h=seq(20,80,by=20), lty=2, col="gray")
  for(k in 2:dim(pow)[[3]]) 
    lines(hsq, pow[2,1,k,2,,j]*100, col=c("green","red", "blue")[nqtl[[j]][k-1]], lwd=2)
  lines(hsq, pow[2,1,1,2,,j]*100, lwd=2, lty=2)
  mtext(side=3, line=1, dimnames(pow)[[6]][j])
}

for(j in 1:2) {
  plot(hsq, expow[2,1,1,2,,j]*100,
       xlab="Percent variance explained by QTL", ylab="Exact Power (%)",
       type="n", ylim=c(0,100), yaxs="i")
  abline(h=seq(20,80,by=20), lty=2, col="gray")
  for(k in 2:dim(expow)[[3]]) 
    lines(hsq, expow[2,1,k,2,,j]*100, col=c("green","red", "blue")[nqtl[[j]][k-1]], lwd=2)
  lines(hsq, expow[2,1,1,2,,j]*100, lwd=2, lty=2)
}

for(j in 1:2) {
  plot(hsq, fp[2,1,1,2,,j]*100,
       xlab="Percent variance explained by QTL", ylab="False Pos've Rate (%)",
       type="n", ylim=c(0,5), yaxs="i")
  abline(h=1:4, lty=2, col="gray")
  for(k in 2:dim(fp)[[3]])
    lines(hsq, fp[2,1,k,2,,j]*100, col=c("green","red", "blue")[nqtl[[j]][k-1]], lwd=2)
  lines(hsq, fp[2,1,1,2,,j]*100, lwd=2, lty=2)
}
dev.off()


postscript("../Figs/fig5.eps", height=7, width=7, pointsize=12, onefile=FALSE, paper="special", horizontal=FALSE)
par(mfrow=c(3,2), las=1, mar=c(7.1,5.1,2.6,3.1))
for(j in 1:2) {
  o <- c(1,1+order(-nqtl[[j]], names(nqtl[[j]])))
  if(j==1) o[4:5] <- o[5:4]
  if(j==2) o[6:13] <- o[c(7,8,11,12,6,9,10,13)]
  x <- 1:dim(pow)[3]
  plot(0,0,type="n", xlab="", ylab="Power (%)", ylim=c(0,100),
       xlim=c(0.5, dim(pow)[3]+0.5), xaxt="n", yaxs="i")
  abline(h=seq(20,80,by=20), lty=2, col="gray")

  thecol <- c("black", c("green", "red", "blue")[nqtl[[j]][o[-1]-1]])

  segments(x-0.25, pow[2,1,o,2,"0.1",j]*100,
           x+0.25, pow[2,1,o,2,"0.1",j]*100, lwd=2,
           col=thecol)
  ci <- matrix(ncol=2, nrow=dim(pow)[3])
  for(k in 1:dim(pow)[3]) 
    ci[k,] <- binom.test(pow[2,1,o[k],2,"0.1",j]*10000, 10000)$conf.int*100
  segments(x, ci[,1], x, ci[,2])

  axis(side=1, at=1:dim(pow)[3], tick=FALSE, lab=rep("", dim(pow)[3]))
  for(k in 1:dim(pow)[3]) 
    axis(side=1, at=k, dimnames(pow)[[3]][o[k]], las=2,
         col.axis=thecol[k], tick=FALSE)
  mtext(side=3, line=1, dimnames(pow)[[6]][j])
  mtext(side=1, line=6, "Crosses", cex=0.8)
}

for(j in 1:2) {
  o <- c(1,1+order(-nqtl[[j]], names(nqtl[[j]])))
  if(j==1) o[4:5] <- o[5:4]
  if(j==2) o[6:13] <- o[c(7,8,11,12,6,9,10,13)]
  x <- 1:dim(expow)[3]
  plot(0,0,type="n", xlab="", ylab="Exact power (%)", ylim=c(0,100),
       xlim=c(0.5, dim(expow)[3]+0.5), xaxt="n", yaxs="i")
  abline(h=seq(20,80,by=20), lty=2, col="gray")

  thecol <- c("black", c("green", "red", "blue")[nqtl[[j]][o[-1]-1]])

  segments(x-0.25, expow[2,1,o,2,"0.1",j]*100,
           x+0.25, expow[2,1,o,2,"0.1",j]*100, lwd=2,
           col=thecol)

  ci <- matrix(ncol=2, nrow=dim(expow)[3])
  for(k in 1:dim(expow)[3]) 
    ci[k,] <- binom.test(expow[2,1,o[k],2,"0.1",j]*10000, 10000)$conf.int*100
  segments(x, ci[,1], x, ci[,2])

  axis(side=1, at=1:dim(expow)[3], tick=FALSE, lab=rep("", dim(expow)[3]))
  for(k in 1:dim(expow)[3]) 
    axis(side=1, at=k, dimnames(expow)[[3]][o[k]], las=2,
         col.axis=thecol[k], tick=FALSE)
  mtext(side=1, line=6, "Crosses", cex=0.8)
}


for(j in 1:2) {
  o <- c(1,1+order(-nqtl[[j]], names(nqtl[[j]])))
  if(j==1) o[4:5] <- o[5:4]
  if(j==2) o[6:13] <- o[c(7,8,11,12,6,9,10,13)]
  x <- 1:dim(fp)[3]
  plot(0,0,type="n", xlab="", ylab="False positive rate (%)", ylim=c(0,5),
       xlim=c(0.5, dim(fp)[3]+0.5), xaxt="n", yaxs="i")
  abline(h=1:4, lty=2, col="gray")

  thecol <- c("black", c("green", "red", "blue")[nqtl[[j]][o[-1]-1]])

  segments(x-0.25, fp[2,1,o,2,"0.1",j]*100,
           x+0.25, fp[2,1,o,2,"0.1",j]*100, lwd=2,
           col=thecol)

  ci <- matrix(ncol=2, nrow=dim(fp)[3])
  for(k in 1:dim(fp)[3]) 
    ci[k,] <- binom.test(fp[2,1,o[k],2,"0.1",j]*10000, 10000)$conf.int*100
  segments(x, ci[,1], x, ci[,2])

  axis(side=1, at=1:dim(fp)[3], tick=FALSE, lab=rep("", dim(fp)[3]))
  for(k in 1:dim(fp)[3]) 
    axis(side=1, at=k, dimnames(fp)[[3]][o[k]], las=2,
         col.axis=thecol[k], tick=FALSE)

  mtext(side=1, line=6, "Crosses", cex=0.8)
}
dev.off()

detach(2)
