
##########
## 25.5 ##
##########
library("boot")
#(a)
nuc.fit1 <- lm(cost~cap+date,data=nuclear)
nuc.fit2 <- lm(cost~cap*date,data=nuclear)
capseq <- seq(min(nuclear$cap),max(nuclear$cap),length=50)
datseq <- seq(min(nuclear$date),max(nuclear$date),length=50)
capdat <- expand.grid(cap=capseq,date=datseq)
nuc.pred1 <- matrix(predict(nuc.fit1,newdata=capdat),50,50)
nuc.pred2 <- matrix(predict(nuc.fit2,newdata=capdat),50,50)
par(mfrow=c(2,1),mar=rep(1,4))
persp(x=capseq,y=datseq,z=nuc.pred1,theta=25,zlim=range(c(nuc.pred1,nuc.pred2)),ticktype="detailed",xlab="Capacity",ylab="Permit issue date",zlab="Predicted cost")
persp(x=capseq,y=datseq,z=nuc.pred2,theta=25,zlim=range(c(nuc.pred1,nuc.pred2)),ticktype="detailed",xlab="Capacity",ylab="Permit issue date",zlab="Predicted cost")
# As expected based on earlier results, there's barely any visual differences between the two surfaces. Inclusion of the interaction term, as evidenced by extremely large p-values, has no tangible effect on modeling the response.
#(b)
par(mfrow=c(1,1),mar=rep(1,4)) #(reset to default)
persp(x=capseq,y=datseq,z=nuc.pred2-nuc.pred1,theta=75,ticktype="detailed")
# The main impact of including the interaction term seems to be a discrepancy (when compared with the main-effect-only model) at the later dates (approx. 1970-71) as you increase plant capacity.
#(c)
vr <- nrow(volcano)
vc <- ncol(volcano)
persp(x=1:vr,y=1:vc,z=volcano)
#(d)
dev.new()
par(mar=c(1,1,1,5))
vm <- (volcano[-1,-1]+volcano[-1,-vc]+volcano[-vr,-1]+volcano[-vr,-vc])/4
tcols <- terrain.colors(50)
volcol <- tcols[cut(vm,breaks=seq(min(volcano),max(volcano),length=51),include.lowest=TRUE)]
persp(1:vr,1:vc,volcano,col=volcol,border=NA,theta=-30,phi=15,scale=FALSE,expand=0.1,axes=FALSE)
library("shape")
colorlegend(tcols,zlim=range(volcano),zval=seq(100,180,20),posx=c(0.83,0.86),posy=c(0.4,0.7),main="Elevation (m)")
#(e)
library("spatstat")
library("MASS")
fire <- split(clmfires)$intentional
firewin <- clmfires$window
firewin.xr <- firewin$xrange
firewin.yr <- firewin$yrange
fire.dens <- kde2d(x=fire$x,fire$y,n=256,lims=c(firewin.xr,firewin.yr))
fire.xy <- expand.grid(fire.dens$x,fire.dens$y)
fire.outside <- !inside.owin(x=fire.xy[,1],y=fire.xy[,2],w=firewin)
fire.dens$z[fire.outside] <- NA
fm <- (fire.dens$z[-1,-1]+fire.dens$z[-1,-256]+fire.dens$z[-256,-1]+fire.dens$z[-256,-256])/4
hcols <- heat.colors(50)
firecols <- hcols[cut(fm,breaks=seq(min(fm,na.rm=TRUE),max(fm,na.rm=TRUE),length=51),include.lowest=TRUE)]
persp(fire.dens$x,fire.dens$y,fire.dens$z,col=firecols,theta=10,phi=30,border=NA,scale=FALSE,expand=5e+6,ticktype="detailed",xlab="X",ylab="Y",zlab="Z")
#(f)
persprot <- function(...,skip=1){
  for(i in seq(90,20,by=-skip)){
    persp(phi=i,theta=0,...)
  }
  for(i in seq(0,360,by=skip)){
    persp(phi=20,theta=i,...)
  }
}
persprot(skip=10,fire.dens$x,fire.dens$y,fire.dens$z,col=firecols,border=NA,scale=FALSE,expand=5e+6,ticktype="detailed",xlab="X",ylab="Y",zlab="Z")

