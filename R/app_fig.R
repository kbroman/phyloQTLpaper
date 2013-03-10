
load("app_results.RData")
load("app_perms.RData")
ind.thr <- quantile(as.numeric(operm.ind.em), 0.95)
phyloqtl.thr <- quantile(operm.a.em, 0.95)

#pdf("../Figs/fig6.pdf", height=10, width=7.5, pointsize=12)
postscript("../Figs/fig6.eps", height=10, width=7.5, pointsize=12, horizontal=FALSE, paper="special", onefile=FALSE)
thechr <- c(1,2,4,5,6,11)
par(mfrow=c(length(thechr), 3), mar=c(4.6,4.1,1.1,1.1), las=1, oma=c(0,2,2,0))
for(i in thechr) {
  maxlod <- max(c(unlist(out.ind.em[out.ind.em[,1]==i,-(1:2)]), ind.thr))
  plot(out.ind.em, chr=i, lod=1, ylab="LOD score",
       ylim=c(0, maxlod), yaxt="n", col="white")
  abline(h=ind.thr, lty=2, col="gray")

  if(maxlod > 6)
    axis(side=2, at=seq(0, ceiling(maxlod), by=2))
  else
    axis(side=2, at=0:ceiling(maxlod))

  for(j in 1:4) plot(out.ind.em, chr=i, lod=j, add=TRUE,
                     col=c("black","blue","red","green")[j])

  mtext(side=2, line=4.5, paste("Chr", i), las=0)
  if(i==1)
    mtext(side=3, line=1, "Individual crosses", cex=0.9)

  if(i==1) {
    text(90, 5.8, expression(D %*% P), col="green")
    text(58, 2, expression(C %*% S), col="blue")
  }
  else if(i==2) {
    text(30, 5, expression(C %*% D), col="black")
  }
  else if(i==4) {
    text(48, 6.5, expression(C %*% D), col="black")
  }
  else if(i==5) {
    text(20, 5, expression(I %*% P), col="red")
  }
  else if(i==6) {
    text(40, 4, expression(C %*% D), col="black")
  }
  else if(i==11) {
    text(10, 3.2, expression(I %*% P), col="red")
    text(40, 2.0, expression(D %*% P), col="green")
  }


  prob <- as.numeric(summary(out.a.em)[i,3:17])
  o <- order(prob, decreasing=TRUE)
  maxlod <- max(c(unlist(out.a.em[out.a.em[,1]==i,3:17]), phyloqtl.thr))
  
  qtl:::plot.scanone(out.a.em, chr=i, lod=o[1], ylim=c(0, maxlod),
               ylab="LOD score", yaxt="n", col="white")
  abline(h=phyloqtl.thr, lty=2, col="gray")
  for(j in 1:5)
    qtl:::plot.scanone(out.a.em, chr=i, lod=o[j], add=TRUE, col=c("black","blue","red","orange","green")[j])

  if(maxlod > 10)
    axis(side=2, at=seq(0, ceiling(maxlod), by=5))
  else if(maxlod > 6)
    axis(side=2, at=seq(0, ceiling(maxlod), by=2))
  else
    axis(side=2, at=0:ceiling(maxlod))

  if(i==1) mtext(side=3, line=1, "Top 5 partitions", cex=0.9)

  thecol <- rep("gray", 15)
  for(j in 1:5)
    thecol[o[j]] <- c("black","blue","red","orange","green")[j]

  plot(as.numeric(summary(out.a.em)[i,3:17]), ylim=c(0,1),
       xlab="", ylab="Posterior prob",
       col=thecol, xaxt="n")
  mtext("Partition", side=1, line=3.5, cex=0.7)

  nam <- sub("\\|", ":", toupper(names(out.a.em)[-(1:2)]))
  axis(side=1, at=1:15, rep("", 15))
  for(j in 1:15)
    axis(side=1, at=j, nam[j], col.axis=thecol[j], las=2, tick=FALSE,
         cex.axis=0.8)

  if(i==1) {
    text(o[1]+0.5, prob[o[1]], nam[o[1]], adj=c(0, 0.5), col=thecol[o[1]])
    text(o[2]-0.5, prob[o[2]], nam[o[2]], adj=c(1, 0.5), col=thecol[o[2]])
  }
  else if(i==2) {
    text(o[1]+0.5, prob[o[1]], nam[o[1]], adj=c(0, 0.5), col=thecol[o[1]])
    text(o[2]+0.5, prob[o[2]], nam[o[2]], adj=c(0, 0.5), col=thecol[o[2]])
  }
  else if(i==4) {
    text(o[1]+0.5, prob[o[1]], nam[o[1]], adj=c(0, 0.5), col=thecol[o[1]])
    text(o[2]+0.5, prob[o[2]], nam[o[2]], adj=c(0, 0.5), col=thecol[o[2]])
    text(o[3]-0.5, prob[o[3]]+0.05, nam[o[3]], adj=c(1, 0.5), col=thecol[o[3]])
  }
  else if(i==5) {
    text(o[1]+0.5, prob[o[1]], nam[o[1]], adj=c(0, 0.5), col=thecol[o[1]])
    text(o[2], prob[o[2]]+0.1, nam[o[2]], adj=c(1, 0), col=thecol[o[2]])
    text(o[3]-0.5, prob[o[3]]+0.1, nam[o[3]], adj=c(0.5, 0), col=thecol[o[3]])
  }
  else if(i==6) {
    text(o[1]+0.5, prob[o[1]], nam[o[1]], adj=c(0, 0.5), col=thecol[o[1]])
    text(o[2]+0.5, prob[o[2]], nam[o[2]], adj=c(0, 0.5), col=thecol[o[2]])
    text(o[3]-0.5, prob[o[3]]+0.05, nam[o[3]], adj=c(1, 0.5), col=thecol[o[3]])
  }
  else if(i==11) {
    text(o[1]+0.5, prob[o[1]], nam[o[1]], adj=c(0, 0.5), col=thecol[o[1]])
    text(o[2]-0.5, prob[o[2]], nam[o[2]], adj=c(1, 0.5), col=thecol[o[2]])
    text(o[3]+0.5, prob[o[3]], nam[o[3]], adj=c(0, 0.5), col=thecol[o[3]])
  }
  print(myround(cumsum(prob[o[1:5]]), 2))

  if(i==1) mtext(side=3, line=1, "Posterior Probability", cex=0.9)
}
dev.off()
