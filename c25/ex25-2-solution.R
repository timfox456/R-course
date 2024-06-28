##########
## 25.2 ##
##########
library("scatterplot3d")
#(a)
library("faraway")
scatterplot3d(x=diabetes$hip,y=diabetes$waist,z=diabetes$weight,highlight.3d=TRUE,pch=c(1,2)[as.numeric(diabetes$gender)],xlab="Hip",ylab="Waist",zlab="Weight")
legend("topleft",legend=levels(diabetes$gender),pch=1:2)
#(b)
aq <- na.omit(airquality)
ozcols <- topo.colors(50)
colindex <- cut(aq$Ozone,breaks=seq(min(aq$Ozone),max(aq$Ozone),length=51),include.lowest=TRUE)
scatterplot3d(x=aq$Wind,y=aq$Solar.R,z=aq$Temp,type="h",lty.hplot=3,color=ozcols[colindex],pch=aq$Month-4,main="NY Air Quality",xlab="Wind (MPH)",ylab=expression(paste("Solar Radiation (",ring(A),")")),zlab="Temperature (F)")
legend(locator(1),legend=c("May","June","July","August","September"),pch=1:5,title="Month",xpd=TRUE)
library("shape")
colorlegend(ozcols,zlim=range(aq$Ozone),main="Ozone",zval=seq(0,160,40),posx=c(0.1,0.13),posy=c(0.7,0.9))

