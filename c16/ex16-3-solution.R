

##########
## 16.3 ##
##########
a <- 3
b <- 70
#(a)
punif(q=5.5,min=a,max=b)
#(b)
qunif(p=1-0.15,min=a,max=b)
#(c)
mu.X <- (a+b)/2 #mean
mu.X
sigma.X <- sqrt((b-a)^2/12) #sd
sigma.X
#(d)
punif(mu.X+0.5*sigma.X,a,b) - punif(mu.X-0.5*sigma.X,a,b)
#(e)
X.dens <- dunif(mu.X,a,b)
X.dens
plot(c(a,b),rep(X.dens,2),type="o",pch=19,xlim=c(a-1,b+1),ylim=c(0,X.dens),ylab="f(x)",xlab="x")
abline(h=0,lty=2)
segments(c(a-5,b+5,a,b),rep(0,4),rep(c(a,b),2),rep(c(0,X.dens),each=2),lty=rep(1:2,each=2))
points(c(a,b),c(0,0))
#(f)
sim1 <- runif(10,a,b)
sim1
quan1 <- quantile(sim1,prob=1-0.15)
quan1
sim2 <- runif(1000,a,b)
quan2 <- quantile(sim2,prob=1-0.15)
quan2      ### Overall, both estimates seem to be centered on the 'true' value from (b), but those based on sim1 (the smaller samples) are more variable.

