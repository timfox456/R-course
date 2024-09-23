##########
## 16.4 ##
##########
#(a)
mu <- 17
sigma <- 4.5
##(i)
1-pnorm(20,mu,sigma)
##(ii)
pnorm(10,mu,sigma)-pnorm(5,mu,sigma)
##(iii)
slow10 <- qnorm(1-0.1,mu,sigma)
slow10
##(iv)
xvals <- seq(mu-4*sigma,mu+4*sigma,length=200)
fx <- dnorm(xvals,mu,sigma)
xvals.sub <- xvals[xvals>=slow10]
fx.sub <- fx[xvals>=slow10]
plot(xvals,fx,type="l",main="N(17,4.5) distribution",xlab="x",ylab="f(x)")
abline(h=0,col="gray")
abline(v=slow10,lty=2)
polygon(rbind(c(slow10,0),cbind(xvals.sub,fx.sub),c(max(xvals),0)),border=NA,col="gray")
##(v)
rnorm(10,mu,sigma)
#(b)
mu <- 10
sigma <- sqrt(2)
##(i)
pnorm(11,mu,sigma)-pnorm(9.5,mu,sigma)
##(ii)
stan9.5 <- (9.5-mu)/sigma
stan9.5
stan11 <- (11-mu)/sigma
stan11
pnorm(stan11)-pnorm(stan9.5)
##(iii)
short2.5 <- qnorm(0.025,mu,sigma)
short2.5
##(iv)
(short2.5-mu)/sigma

