
##########
## 25.1 ##
##########
library("car")
#(a)
cols1 <- colorRampPalette(c("black","red","yellow2"))
cols2 <- colorRamp(c("black","red","yellow2"))
#(b)
##(i)
rank.pchs <- c(19,17,15)[as.numeric(Salaries$rank)]
##(ii)
sex.cexs <- c(1,1.5)[as.numeric(Salaries$sex)]
#(c)
normalize <- function(datavec){
  lo <- min(datavec,na.rm=TRUE)
  up <- max(datavec,na.rm=TRUE)
  datanorm <- (datavec-lo)/(up-lo)
  return(datanorm)
}
phd.norm <- normalize(Salaries$yrs.since.phd)
phd.cols <- rgb(cols2(phd.norm),maxColorValue=255)
#(d)
phd.cols[Salaries$sex=="Female"] <- adjustcolor(phd.cols[Salaries$sex=="Female"],alpha=0.9)
phd.cols[Salaries$sex=="Male"] <- adjustcolor(phd.cols[Salaries$sex=="Male"],alpha=0.3)
#(e)
par(mar=c(5,4,4,6))
plot(Salaries$salary~Salaries$yrs.service,col=phd.cols,pch=rank.pchs,cex=sex.cexs,xlab="Years of service",ylab="Salary")
#(f)
legend(-5,265000,legend=levels(Salaries$rank),title="Rank",pch=c(19,17,15),xpd=TRUE,horiz=TRUE)
legend(40,265000,legend=levels(Salaries$sex),title="Sex",pch=c(19,19),pt.cex=c(1,1.5),col=c(adjustcolor("red",0.9),adjustcolor("red",0.3)),xpd=TRUE,horiz=T)
#(g)
library("shape")
colorlegend(col=cols1(50),zlim=range(Salaries$yrs.since.phd),zval=seq(10,50,10),main="Years since\nPhD")
#(h)
tcols <- terrain.colors(25)
fillcols <- c(tcols,tcols[25:1])
#(i)
nvals <- 51
vals <- seq(-3,3,length=nvals)
normvals <- dnorm(vals)
#(j)
plot(vals,normvals,type="l",xaxs="i",yaxs="i",xlab="",ylab="",bty="L",xaxt="n",main="N(0,1) density")
#(k)
for(i in 1:(nvals-1)){
  polygon(x=rep(vals[c(i,i+1)],each=2),y=c(0,normvals[c(i,i+1)],0),border=NA,col=fillcols[i])
}
#(l)
library("shape")
colorlegend(fillcols,zlim=range(vals),zval=-3:3,main="SD from mean")

