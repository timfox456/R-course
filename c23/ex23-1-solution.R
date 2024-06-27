
##########
## 23.1 ##
##########
#(a)
par(mfrow=c(2,1))
boxplot(mtcars$mpg~mtcars$cyl,xlab="Cylinders",ylab="MPG")
carfit <- lm(mpg~cyl,data=mtcars)
plot(mtcars$mpg~mtcars$cyl,xlab="Cylinders",ylab="MPG")
abline(carfit,lwd=2)
#(b)
##(i)
lay.mat <- cbind(c(2,1,1,3),c(2,1,1,3))
lay.mat
layout(lay.mat)
layout.show(3)
##(ii)
lay.mat <- rbind(c(1,1,2,3),c(1,1,4,5))
lay.mat
layout(lay.mat)
layout.show(5)
##(iii)
lay.mat <- cbind(c(2,3,3,1),c(2,3,3,1),c(2,4,5,1))
lay.mat
layout(lay.mat)
layout.show(5)
#(c)
dev.new(width=9,height=4.5)
lay.mat <- rbind(c(1,1,2,4),c(1,1,3,4))
layout(lay.mat)
layout.show(4)
par(mar=c(4,4,2,1))
plot(quakes$long,quakes$lat,cex=0.02*quakes$stations,xlab="Longitude",ylab="Latitude")
box(which="figure",col="gray")
plot(quakes$mag,quakes$stations,xlab="Magnitude",ylab="Stations")
box(which="figure",col="gray")
plot(quakes$depth,quakes$stations,xlab="Depth",ylab="Stations")
box(which="figure",col="gray")
hist(quakes$stations,main="",xlab="Stations")
abline(v=mean(quakes$stations),lty=2)
box(which="figure",col="gray")
#(d)
interactive.arrow <- function(...,label=NA){
    arr.pts <- locator(2)
    arrows(x0=arr.pts$x[1],y0=arr.pts$y[1],x1=arr.pts$x[2],y1=arr.pts$y[2],...)
    if(!is.na(label)){
      lab.pt <- text(locator(1),label=label,xpd=NA)
    }
}
boxplot(quakes$mag)
interactive.arrow(xpd=TRUE,label="minumum")
interactive.arrow(xpd=TRUE,label="1st quartile")
interactive.arrow(xpd=TRUE,label="median")
interactive.arrow(xpd=TRUE,label="3rd quartile")
interactive.arrow(xpd=TRUE,label="maximum")
interactive.arrow(xpd=TRUE,label="outliers")

