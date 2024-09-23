##########
## 16.5 ##
##########
#(a)
##(i)
lambda.day <- 3500/365.25
lambda.day
##(ii)
xvals <- seq(0,1,length=100)
plot(xvals,dexp(xvals,lambda.day),type="l",xlab="x",ylab="f(x)",main="EXP(0.89) distribution")
abline(h=0,col="gray")
abline(v=0,col="gray")
##(iii)
pexp(0.5/24,rate=lambda.day)
##(iv)
qexp(1-0.1,rate=lambda.day)*24
#(b)
##(i)
pexp(5,1/11)
##(ii)
pexp(6,1/9)
##(iii)
1-pexp(15,1/11)
1-pexp(15,1/9)
