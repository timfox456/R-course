##########
## 25.4 ##
##########
aq <- na.omit(airquality[,c("Temp","Wind","Ozone")])
#(a)
aq.fit <- lm(Temp~Wind*Ozone,aq)
summary(aq.fit)
#(b)
res <- 50
winseq <- seq(min(aq$Wind),max(aq$Wind),length=res)
ozoseq <- seq(min(aq$Ozone),max(aq$Ozone),length=res)
winozo <- expand.grid(Wind=winseq,Ozone=ozoseq)
aq.pred <- matrix(predict(aq.fit,newdata=winozo),res,res)
#(c)
normalize <- function(datavec){
  lo <- min(datavec,na.rm=TRUE)
  up <- max(datavec,na.rm=TRUE)
  datanorm <- (datavec-lo)/(up-lo)
  return(datanorm)
}
library("shape")
par(mar=c(5,4,4,6))
image(x=winseq,y=ozoseq,z=aq.pred,col=topo.colors(20),xlab="Wind",ylab="Ozone")
points(aq$Wind,aq$Ozone,col=gray(normalize(aq$Temp)),pch=19)
colorlegend(col=topo.colors(20),zlim=range(aq.pred),zval=seq(60,140,10),posx=c(0.88,0.91),main="Pred. temp")
colorlegend(col=gray.colors(10,start=0,end=1),zlim=range(aq$Temp),zval=seq(60,95,5),posx=c(0.67,0.7),posy=c(0.4,0.8),main="Obs. temp")
#(d)
library("spatstat")
?clmfires
fire <- split(clmfires)$intentional
firewin <- clmfires$window
firewin.xr <- firewin$xrange
firewin.yr <- firewin$yrange
fire.dens <- kde2d(x=fire$x,fire$y,n=256,lims=c(firewin.xr,firewin.yr))
#(e)
fire.xy <- expand.grid(fire.dens$x,fire.dens$y)
fire.outside <- !inside.owin(x=fire.xy[,1],y=fire.xy[,2],w=firewin)
fire.dens$z[fire.outside] <- NA
#(f)
library("shape")
par(mar=c(3,3,3,7))
image(fire.dens$x,fire.dens$y,fire.dens$z,col=heat.colors(50),asp=1,bty="l",ann=FALSE)
plot(firewin,lwd=2,add=TRUE)
colorlegend(col=heat.colors(50),posx=c(0.83,0.86),zlim=range(fire.dens$z,na.rm=TRUE),zval=seq(5e-6,35e-6,5e-6),digit=6)
