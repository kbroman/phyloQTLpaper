pdf("../SuppFigs/supp_tree_fig.pdf", width=5.5, height=5, pointsize=14)
par(mar=rep(0, 4), bty="n")
plot(0,0, type="n", xlab="", ylab="", xlim=c(10,90), ylim=c(30,95), xaxt="n", yaxt="n",
     xaxs="i", yaxs="i")
ymid <- 85
segments(25,ymid,75,ymid, lwd=2, lend=1, ljoin=1)
segments(c(20,20), ymid+c(5,-5), c(25,25), c(ymid,ymid), lwd=2, lend=1, ljoin=1)
segments(c(80,80), ymid+c(5,-5), c(75,75), c(ymid,ymid), lwd=2, lend=1, ljoin=1)
x <- 25+c(10, 25, 40)
segments(x, ymid, x, ymid-8, lwd=2, lend=1, ljoin=1)
segments(rep(x[1],2), rep(ymid-8,2), x[1]+c(-5,5), rep(ymid-13,2), lwd=2, lend=1, ljoin=1)
segments(rep(x[3],2), rep(ymid-8,2), x[3]+c(-5,5), rep(ymid-13,2), lwd=2, lend=1, ljoin=1)
x <- c(20, 20, x[1]-5, x[1]+5, 50, x[3]-5, x[3]+5, 80,80)
y <- c(ymid+5, ymid-5, ymid-13, ymid-13, ymid-8, ymid-13, ymid-13, ymid-5, ymid+5)
xx <- c((25 + mean(x[3:4]))/2, mean(x[3:4]), (mean(x[3:4]) + x[5])/2, (x[5]+mean(x[6:7]))/2,
        mean(x[6:7]), (mean(x[6:7]) + 75)/2)
yy <- c(ymid, ymid-4, ymid, ymid, ymid-4, ymid)
xd <- c(-1, -1, 0, 0, 0, 0, 0, +1, +1)
yd <- c(0, 0, -1, -1, -1, -1, -1, 0, 0)
xxd <- c(0, -1, 0, 0, -1, 0)
yyd <- c(1, 0, 1, 1, 0, 1)
text(x+xd*2, y+yd*2, LETTERS[1:9])
text(xx+xxd*2, yy+yyd*2, letters[1:6])
z <- c(1,2,1,3,2,1,3,2,3)
text(x+xd*6, y+yd*6, z, col=c("blue","red","green3")[z])


ymid <- 47
segments(30,ymid,70,ymid, lwd=2, lend=1, ljoin=1)
segments(c(25,25), ymid+c(5,-5), c(30,30), c(ymid,ymid), lwd=2, lend=1, ljoin=1)
segments(c(75,75), ymid+c(5,-5), c(70,70), c(ymid,ymid), lwd=2, lend=1, ljoin=1)
x <- c(42, 58)
segments(x, ymid, x, ymid-8, lwd=2, lend=1, ljoin=1)
x <- c(25, 25, 42, 58, 75, 75)
y <- c(ymid+5, ymid-5, ymid-8, ymid-8, ymid-5, ymid+5)
xd <- c(-1, -1, 0, 0, +1, +1)
yd <- c(0, 0, -1, -1, 0, 0)
text(x+xd*2, y+yd*2, c("B","D","E","G","H","I"))

rect(11.5, 58, 88.5, 93)
rect(11.5, 58, 88.5, 32)

dev.off()
