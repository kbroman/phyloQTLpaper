# treefig.R (phylotree.pdf, for fig 1 [we add the table via latex])
######################################################################
# Simple phylogenetic tree with 4 taxa
######################################################################

pdf("../Figs/phylotree.pdf", height=1.95, width=1.85, pointsize=9)
par(mar=rep(0.1,4))
plot(0, 0, type="n", xlab="", ylab="", xaxt="n", yaxt="n", xaxs="i", yaxs="i",
     xlim=c(-3,103), ylim=c(103,2))
slope <- (90-5)/(5-50)
x <- c(5,35,65,95,  20, 80,  50)
y <- c(90,90,90,90,  slope*15+90 ,  slope*15+90,   5)
segments(x[1],y[1], x[5],y[5], col="blue")
segments(x[5],y[5], x[2],y[2], col="green3")
segments(x[3],y[3], x[6],y[6], col="red")
segments(x[6],y[6], x[4],y[4], col="orange2")
segments(x[c(5,6)],y[c(5,6)],  x[c(7,7)],y[c(7,7)])
xd <- 5
text(mean(x[c(1,5)])-xd, mean(y[c(1,5)]), "1", col="blue")
text(mean(x[c(2,5)])+xd, mean(y[c(2,5)]), "2", col="green3")

text(mean(x[c(3,6)])-xd, mean(y[c(3,6)]), "3", col="red")
text(mean(x[c(4,6)])+xd, mean(y[c(4,6)]), "4", col="orange2")

text(mean(x[c(5,7)])-xd, mean(y[c(5,7)]), "5", col="black")

text(c(5,35,65,95), rep(96.5, 4), LETTERS[1:4], cex=1.2)
dev.off()
