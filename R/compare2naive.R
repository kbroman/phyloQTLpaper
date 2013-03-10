######################################################################
# figure with ROC curves comparing power and false pos've rates
#     of naive method to phyloqtl approach
######################################################################

load("forfig3.RData")

#pdf("../Figs/fig3.pdf", height=5, width=5, pointsize=12)
postscript("../Figs/fig3.eps", height=5, width=5, pointsize=12, onefile=FALSE, paper="special", horizontal=FALSE)
par(mar=c(5.1,4.1,0.6,0.6), las=1)
plot(ind.roc[,1,1]*100, ind.roc[,2,1]*100, xlab="False positive rate (%)",
     ylab="Power (%)", xlim=c(0, 3.5), ylim=c(0, 100), yaxs="i",
     type="l", lwd=2, col="blue")
lines(ind.roc[,1,dim(ind.roc)[3]]*100, ind.roc[,2,dim(ind.roc)[3]]*100, lwd=2, 
      col="red")
lines(phyloqtl.roc[,3,1]*100, phyloqtl.roc[,4,1]*100, 
      lwd=2, lty=3, col="blue")
lines(phyloqtl.roc[,3,dim(phyloqtl.roc)[3]]*100, phyloqtl.roc[,4,dim(phyloqtl.roc)[3]]*100, 
      lwd=2, lty=3, col="red")
points(ind.fp[c(1,length(ind.fp))]*100, ind.tp[c(1,length(ind.fp))]*100,
       col=c("blue","red"), lwd=2, pch=0, xpd=TRUE)
points(phyloqtl.fpa[c(1,length(phyloqtl.fpa))]*100, phyloqtl.tpa[c(1,length(phyloqtl.fpa))]*100,
       col=c("blue","red"), lwd=2, xpd=TRUE)

lines(phyloqtl.roc[,1,1]*100, phyloqtl.roc[,2,1]*100, 
      lwd=2, lty=2, col="blue")
lines(phyloqtl.roc[,1,dim(phyloqtl.roc)[3]]*100, phyloqtl.roc[,2,dim(phyloqtl.roc)[3]]*100, 
      lwd=2, lty=2, col="red")

points(phyloqtl.fp[c(1,length(phyloqtl.fp))]*100, phyloqtl.tp[c(1,length(phyloqtl.fp))]*100,
       col=c("blue","red"), lwd=2, pch=2, xpd=TRUE)

legend("topright", lwd=rep(2,5), lty=c(2,3,1,1,1,1), col=c("black","black","black","white","red", "blue"),
       c("Proposed (credible)", "Proposed (exact)", "Naive method", "", "A|BCD", "AB|CD"), pch=c(1, 2, 0, 0, NA, NA))

dev.off()
