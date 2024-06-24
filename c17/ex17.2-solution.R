
##########
## 17.2 ##
##########
x.bar <- 14.22
sigma <- 2.9
#(a)
x.bar+c(-1,1)*qnorm(0.95)*sigma/sqrt(34) # When sd is known, sampling distribution of sample mean is normal. 90% confident that the true mean run time lies somewhere between 13.40 and 15.04 seconds (rounded 2 d.p.)
#(b)
x.bar+c(-1,1)*qt(0.95,df=33)*sigma/sqrt(34) # When sd is estimated from sample, sampling distribution is t with n-1 df. This means more extreme critical values and wider 90% CI when compared to normal version.
#(c)
p.hat <- 37/400
p.hat
p.hat+c(-1,1)*qnorm(0.995)*sqrt(p.hat*(1-p.hat)/400) # 99% confident that the true proportion of left-handedness only is somwhere between 0.055 and 0.130 (rounded 3 d.p.)
#(d)
p.hat <- (37+11)/400
p.hat
p.hat+c(-1,1)*qnorm(0.995)*sqrt(p.hat*(1-p.hat)/400) # 99% confident that the true proportion of left-handed or ambidextrous citizens is somwhere between 0.078 and 0.162 (rounded 3 d.p.)
#(e)
ci.mat <- matrix(NA,5000,3)
n <- 300
lambda.e <- 0.1
mu <- 1/lambda.e
for(i in 1:5000){
  samp <- rexp(n,rate=lambda.e)
  samp.ci <- mean(samp)+c(-1,1)*qt(0.975,n-1)*sd(samp)/sqrt(n)
  ci.mat[i,1:2] <- samp.ci
  ci.mat[i,3] <- mu>=samp.ci[1] && mu<=samp.ci[2]
}
mean(ci.mat[,3])
#(f)
plot(ci.mat[1,1:2],c(1,1),xlim=range(ci.mat[,1:2]),ylim=c(1,100),type="l",xlab="",ylab="")
for(i in 2:100){
  lines(ci.mat[i,1:2],c(i,i))
}
abline(v=mu,col=2)

