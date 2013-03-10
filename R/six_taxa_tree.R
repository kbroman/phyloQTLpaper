# six_taxa_tree.R (fig 2)
######################################################################
# A six-taxa tree with three sets of possible crosses
######################################################################

#pdf(file="../Figs/fig2.pdf", width=6.5, height=6.5, pointsize=12)
postscript(file="../Figs/fig2.eps", onefile=FALSE, horizontal=FALSE, paper="special", width=6.5, height=6.5, pointsize=12)
par(mar=rep(0.5,4),las=1)
plot(0, 0, type="n", xlab="", ylab="", xaxt="n", yaxt="n", xlim=c(0,120*2), ylim=c(0,75*2),
     xaxs="i", yaxs="i")

u <- par("usr")
abline(v=mean(u[1:2]), h=mean(u[3:4]))

xd <- 5
yd <- 5
text(u[1]+xd,         u[4]-xd,         "A", font=2)
text(mean(u[1:2])+xd, u[4]-xd,         "B", font=2)
text(u[1]+xd,         mean(u[3:4])-xd, "C", font=2)
text(mean(u[1:2])+xd, mean(u[3:4])-xd, "D", font=2)



xd <- 7
yd <- 5
y <- c(mean(u[3:4])+yd*2.2, u[4]-yd)
x <- seq(u[1]+xd, mean(u[1:2])-xd, len=6)
text(x, mean(u[3:4])+yd*1.2, LETTERS[1:6])
segments(x[1], y[1], mean(x[3:4]), y[2], lwd=2)
segments(x[6], y[1], mean(x[3:4]), y[2], lwd=2)

m1 <- (y[2]-y[1])/(mean(x[3:4])-x[1])

y[3] <- m1*(mean(x[1:2])-x[1])+y[1]
segments(x[2], y[1], mean(x[1:2]), y[3], lwd=2)
segments(x[5], y[1], mean(x[5:6]), y[3], lwd=2)

m2 <- (y[3]-y[1])/(mean(x[1:2])-x[2])

xstar <- (m1*x[1]-m2*x[3])/(m1-m2)
ystar <- m2*(xstar-x[3])+y[1]
segments(x[3], y[1], xstar, ystar, lwd=2)
segments(x[4], y[1], x[6]-xstar+x[1], ystar, lwd=2)


# crosses that work for some but not all partitions

x <- c(50, 20, 35, 65, 35, 65)
y <- c(50, 50, 20, 80, 80, 20)
x <- (x - mean(x))*1.5 + u[1] + mean(u[1:2])/2 + mean(u[1:2])
y <- (y - mean(y))/1.5 + u[3] + mean(u[3:4])/2

xd <- c(-10, -10, 0, 0, 0, 0)/1.5
yd <- c(0, 0, -10, +10, +10, -10)/2
lab <- LETTERS[1:6]
seg <- list(c(1,4), c(1,6), c(2, 3), c(2, 5), c(3, 5))
points(x, y, pch=16, cex=1.2)
text(x+xd, y+yd, lab)
for(i in seq(along=seg))
  segments(x[seg[[i]][1]], y[seg[[i]][1]], x[seg[[i]][2]], y[seg[[i]][2]], lwd=2)  


# connected set

x <- c(50, 20, 35, 65, 35, 65)
y <- c(50, 50, 20, 80, 80, 20)
x[1] <- (x[4]-x[1])+x[4]
x <- (x - mean(x))*1.3 + u[1] + mean(u[1:2])/2 + mean(u[1:2])
y <- (y - mean(y))/1.5 + u[3] + mean(u[3:4])/2 + mean(u[3:4])


xd <- c(+10, -10, 0, 0, 0, 0)/1.5
yd <- c(0, 0, -10, +10, +10, -10)/2
lab <- LETTERS[c(3,6,5,2,1,4)]
seg <- list(c(5,6), c(4,1), c(1,6), c(6,3), c(3,2))
points(x, y, pch=16, cex=1.2)
text(x+xd, y+yd, lab)
for(i in seq(along=seg))
  segments(x[seg[[i]][1]], y[seg[[i]][1]], x[seg[[i]][2]], y[seg[[i]][2]], lwd=2)  


# crosses that don't work

x <- c(50, 20, 35, 65, 35, 65)
y <- c(50, 50, 20, 80, 80, 20)
x <- (x - mean(x))*1.5 + u[1] + mean(u[1:2])/2 
y <- (y - mean(y))/1.5 + u[3] + mean(u[3:4])/2

xd <- c(-10, -10, 0, 0, 0, 0)/1.5
yd <- c(0, 0, -10, +10, +10, -10)/2
lab <- LETTERS[c(4,1,3,5,2,6)]
seg <- list(c(1,4), c(1,6), c(2, 3), c(2, 5), c(3, 5))
points(x, y, pch=16, cex=1.2)
text(x+xd, y+yd, lab)
for(i in seq(along=seg))
  segments(x[seg[[i]][1]], y[seg[[i]][1]], x[seg[[i]][2]], y[seg[[i]][2]], lwd=2)  



dev.off()





