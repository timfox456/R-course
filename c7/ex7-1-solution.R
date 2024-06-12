#########
## 7.1 ##
#########
#(a)
plot(-3:3,7:13,type="n",xlab="",ylab="")
text(x=0,y=10,labels="SOMETHING\nPROFOUND")
abline(v=c(-3,3),lty=2,lwd=4,col=8)
abline(h=c(7,13),lty=2,lwd=4,col=8)
arrows(x0=c(-2.5,-2.5,-2.5,2.5,2.5,2.5),y0=c(7.5,10,12.5,7.5,10,12.5),x1=c(-1,-1,-1,1,1,1),y1=c(9.5,10,10.5,9.5,10,10.5))
#(b)
w <- c(55,85,75,42,93,63,58,75,89,67)
h <- c(161,185,174,154,188,178,170,167,181,178)
s <- c("female","male","male","female","male","male","female","male","male","female")
plot(w,h,type="n",xlab="Weight (kg)",ylab="Height (cm)",main="Height against weight for 10 people")
points(w[s=="male"],h[s=="male"],pch=19)
points(w[s=="female"],h[s=="female"],pch=3,col=2)
legend("topleft",legend=c("male","female"),pch=c(19,3),col=c(1,2))

