#########
## 7.1 ##
#########

#(a) As closely as you can, re-create the following plot: (see book)

plot(-3:3,7:13,type="n",xlab="",ylab="")
text(x=0,y=10,labels="SOMETHING\nPROFOUND")
abline(v=c(-3,3),lty=2,lwd=4,col=8)
abline(h=c(7,13),lty=2,lwd=4,col=8)
arrows(x0=c(-2.5,-2.5,-2.5,2.5,2.5,2.5),y0=c(7.5,10,12.5,7.5,10,12.5),x1=c(-1,-1,-1,1,1,1),y1=c(9.5,10,10.5,9.5,10,10.5))

#(b) With the following data, create a plot of weight on the x-axis and height on
# the y-axis. Use different point characters or colors to distinguish between
# males and females and provide a matching legend. Label the axes and give the plot a title.

#    Weight Height    Sex
# 1      55    161 female
# 2      85    185   male
# 3      75    174   male
# 4      42    154 female
# 5      93    188   male
# 6      63    178   male
# 7      58    170 female
# 8      75    167   male
# 9      89    181   male
# 10     67    178 female


w <- c(55,85,75,42,93,63,58,75,89,67)
h <- c(161,185,174,154,188,178,170,167,181,178)
s <- c("female","male","male","female","male","male","female","male","male","female")
plot(w,h,type="n",xlab="Weight (kg)",ylab="Height (cm)",main="Height against weight for 10 people")
points(w[s=="male"],h[s=="male"],pch=19)
points(w[s=="female"],h[s=="female"],pch=3,col=2)
legend("topleft",legend=c("male","female"),pch=c(19,3),col=c(1,2))

