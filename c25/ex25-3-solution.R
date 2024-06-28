

##########
## 25.3 ##
##########
library("boot")
?nuclear
#(a)
##(i)
nuc.fit1 <- lm(cost~cap+date,data=nuclear)
summary(nuc.fit1)
##(ii)
nuc.fit2 <- lm(cost~cap*date,data=nuclear)
summary(nuc.fit2)
#(b)
capseq <- seq(min(nuclear$cap),max(nuclear$cap),length=50)
datseq <- seq(min(nuclear$date),max(nuclear$date),length=50)
capdat <- expand.grid(cap=capseq,date=datseq)
nuc.pred1 <- matrix(predict(nuc.fit1,newdata=capdat),50,50)
nuc.pred2 <- matrix(predict(nuc.fit2,newdata=capdat),50,50)
#(c)
par(mfrow=c(1,2))
contour(x=capseq,y=datseq,z=nuc.pred1)
contour(x=capseq,y=datseq,z=nuc.pred2)
# The two response surfaces appear extremely similar, with only a slight curvature appearing in the surface associated with the interactive model. This similarity is to be expected based on the model summaries from (a), which don't provide any evidence supporting the need to include the interaction.
#(d)
filled.contour(x=capseq,y=datseq,z=nuc.pred1,xlab="Capacity",ylab="Permit date",color.palette=topo.colors,plot.axes={axis(1);axis(2);contour(capseq,datseq,nuc.pred2,add=TRUE,lwd=2,lty=2)})
text(locator(1),label=c("Color fill: Main effects only.\nLines: Interaction included."),xpd=NA)
#(e)
?faithful
plot(faithful$eruptions~faithful$waiting,xlab="Waiting time",ylab="Eruption duration",main="Old Faithful Geyser")
#(f)
library("MASS")
faith.dens <- kde2d(x=faithful$waiting,y=faithful$eruptions,n=100)
contour(faith.dens$x,faith.dens$y,faith.dens$z)
#(g)
faith.cols <- colorRampPalette(c("darkblue","hotpink"))
filled.contour(faith.dens$x,faith.dens$y,faith.dens$z,color.palette=faith.cols,xlab="Waiting time",ylab="Eruption duration",plot.axes={axis(1);axis(2);points(faithful$waiting,faithful$eruption,cex=0.5,col="gray")})
#(h)
plot(faithful$eruptions~faithful$waiting,col="gray",pch=2,cex=0.75,xaxs="i",yaxs="i",xlab="Waiting time",ylab="Eruption duration",main="Old Faithful Geyser")
contour(faith.dens$x,faith.dens$y,faith.dens$z,levels=seq(0.002,0.014,0.004),col="red4",add=TRUE,drawlabels=FALSE,lwd=1:4)
legend("topleft",legend=seq(0.002,0.014,0.004),lwd=1:4,col="red4",title="Kernel estimate")

