##########
## 18.1 ##
##########
#(a)
### H0: mu = 3.5; HA: mu != 3.5 (two-sided test)
tstat <- (3.97-3.5)/(2.21/sqrt(73))
tstat
pt(-tstat,df=72)+(1-pt(tstat,df=72))
### p-value is around 0.073, this is > than alpha=0.05, therefore insufficient evidence to reject the null hypothesis. There is no evidence that the true mean cat weight is different to 3.5.
#(b)
# H0: mu = 4.3; HA: mu > 4.3 (one-sided test)
t.test(quakes$mag,mu=4.3,alternative="greater",conf.level=0.99)
# p-value very small; strong evidence to reject the null. There is evidence to suggest that the true mean magnitude is greater than 4.3.
#(c)
mean(quakes$mag)+c(-1,1)*qt(0.995,df=999)*sd(quakes$mag)/sqrt(1000)

##########
## 18.2 ##
##########
#(a)
library("MASS")
?anorexia
t.test(anorexia[,3],anorexia[,2],alternative="greater",paired=TRUE)
# p-value ~0.0023. Less than 0.05; some evidence to reject H0. There is evidence to suggest that the mean post-weight is greater than the mean pre-weight.
#(b)
t.test(anorexia[anorexia$Treat=="Cont",3],anorexia[anorexia$Treat=="Cont",2],alternative="greater",paired=TRUE)
t.test(anorexia[anorexia$Treat=="CBT",3],anorexia[anorexia$Treat=="CBT",2],alternative="greater",paired=TRUE)
t.test(anorexia[anorexia$Treat=="FT",3],anorexia[anorexia$Treat=="FT",2],alternative="greater",paired=TRUE)
# There is no statistical evidence to reject the claim that there is no difference between the pre- and post-weight means in the control group, mild evidence to reject at the 5% level for the CBL treatment, and strong evidence to reject in favor of HA for the FT treatment. It would seem that the FT treatment is the most effective based on these data.
#(c)
?PlantGrowth
control <- PlantGrowth$weight[PlantGrowth$group=="ctrl"]
treated <- PlantGrowth$weight[PlantGrowth$group!="ctrl"]
# H0: mu_control - mu_treated = 0; HA: mu_control - mu_treated < 0
max(c(sd(control),sd(treated)))/min(c(sd(control),sd(treated)))
# Ratio of (large sd) / (small sd) is less than 2 so use pooled variance according to rule-of-thumb.
#(d)
t.test(x=control,y=treated,alternative="less",var.equal=TRUE)
# Large p-value ~0.41. There is no evidence to reject H0. There is insufficient evidence to conclude that the mean treated weight is more than the mean untreated weight.
#(e)
myt.test <- function(x,y,paired=FALSE,var.equal=FALSE,...){	
  if(!paired){
    sdx <- sd(x)
    sdy <- sd(y)
    sd.big <- max(c(sdx,sdy))
    sd.small <- min(c(sdx,sdy))
    var.equal <- (sd.big/sd.small)<2
  }
  return(t.test(x=x,y=y,paired=paired,var.equal=var.equal,...))
}
#(f)
# Example 1
snacks <- c(87.7,80.01,77.28,78.76,81.52,74.2,80.71,79.5,77.87,81.94,80.7,82.32,
            75.78,80.19,83.91,79.4,77.52,77.62,81.4,74.89,82.95,73.59,77.92,77.18,
            79.83,81.23,79.28,78.44,79.01,80.47,76.23,78.89,77.14,69.94,78.54,79.7,
            82.45,77.29,75.52,77.21,75.99,81.94,80.41,77.7)
snacks2 <- c(80.22,79.73,81.1,78.76,82.03,81.66,80.97,81.32,80.12,78.98,79.21,
             81.48,79.86,81.06,77.96,80.73,80.34,80.01,81.82,79.3,79.08,79.47,
             78.98,80.87,82.24,77.22,80.03,79.2,80.95,79.17,81)
myt.test(x=snacks2,y=snacks,alternative="greater",conf.level=0.9)
# Example 2
men <- c(102,87,101,96,107,101,91,85,108,67,85,82)
women <- c(73,81,111,109,143,95,92,120,93,89,119,79,90,126,62,92,77,106,105,111)
myt.test(x=men,y=women,alternative="two.sided",conf.level=0.95)
# Example 3
rate.before <- c(52,66,89,87,89,72,66,65,49,62,70,52,75,63,65,61) 
rate.after <- c(51,66,71,73,70,68,60,51,40,57,65,53,64,56,60,59) 
myt.test(x=rate.after,y=rate.before,alternative="less",paired=TRUE,conf.level=0.95)

##########
## 18.3 ##
##########
#(a)
# H0: p=0.9; HA: p<0.9
n <- 89
n*0.9
n*0.1
# Both np and n(p-1) > 5 so OK to continue with normal distribution according to the rule-of-thumb.
#(b)
p.hat <- 71/n
p.hat
Z <- (p.hat-0.9)/(sqrt(0.9*0.1/n))
Z
pnorm(Z)
prop.test(x=71,n=n,p=0.9,alternative="less",conf.level=0.9,correct=FALSE)
# p-value very small; less than 0.1. There is evidence to reject H0 and conclude the true proportion of women who would recommend in samples of size 89 is less than 0.9.
#(c)
p.hat+c(-1,1)*qnorm(0.95)*sqrt(p.hat*(1-p.hat)/n)
#(d)
x1 <- 97
n1 <- 445
p.hat1 <- x1/n1
p.hat1
x2 <- 90
n2 <- 419
p.hat2 <- x2/n2
p.hat2
p.star <- (x1+x2)/(n1+n2)
p.star
Z <- (p.hat2-p.hat1)/sqrt(p.star*(1-p.star)*(1/n1+1/n2))
Z
2*pnorm(Z)
# p-value is very large; much greater than 0.05. No evidence to reject H0. Retain H0 and conclude there is no evidence to suggest the proportion of citizens who support decriminalization varies between the two states.
#(e)
(p.hat2-p.hat1)+c(-1,1)*qnorm(0.975)*sqrt(p.star*(1-p.star)*(1/n1+1/n2))
# We are 95% confident that the true difference in the proportion of support between State 2 and State 1 lies somewhere between -0.058 and 0.051. CI includes zero; reflects the same result as the hypothesis (no evidence of a difference).
#(f)
Z.test <- function(p1,n1,p2=NULL,n2=NULL,p0,alternative="two.sided",conf.level=0.95){
  if(is.null(p2)||is.null(n2)){
    cat("One-sample Z-test.\n")
    if(p1*n1<=5||n1*(1-p1)<=5){
      warning("Normal distribution may not be valid; np or n(1-p) <= 5 detected.")
    }
    Z <- (p1-p0)/sqrt(p0*(1-p0)/n1)
    CI <- (p1)+c(-1,1)*qnorm(conf.level+(1-conf.level)/2)*sqrt(p0*(1-p0)/n1)
  } else {
    cat("Two-sample Z-test.\n")
    if(p1*n1<=5||n1*(1-p1)<=5||p2*n2<=5||n2*(1-p2)<=5){
      warning("Normal distribution may not be valid; np or n(1-p) <= 5 detected.")
    }
    p.star <- (p1*n1+p2*n2)/(n1+n2)
    Z <- (p1-p2-p0)/sqrt(p.star*(1-p.star)*(1/n1+1/n2))
    CI <- sort((p1-p2)+c(-1,1)*qnorm(conf.level+(1-conf.level)/2)*sqrt(p.star*(1-p.star)*(1/n1+1/n2)))
  }
  
  P <- pnorm(Z)
  if(alternative=="greater"){
    P <- 1-P
  } else if(alternative=="two.sided"){
    if(Z<0){
      P <- 2*P
    } else {
      P <- 2*(1-P)
    }
  }
  return(list(Z=Z,P=P,CI=CI))
}
#(g)
# Example 1
sick <- c(0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,1,1,1,0,0,0,1)
Z.test(p1=mean(sick),n1=length(sick),p0=0.2,alternative="two.sided",conf.level=0.95)
# Example 2
x1 <- 180
n1 <- 233
p.hat1 <- x1/n1
x2 <- 175
n2 <- 197
p.hat2 <- x2/n2
Z.test(p.hat2,n2,p.hat1,n1,p0=0,alternative="greater",conf.level=0.95) # ...or you could flip the order of differencing and use alternative="less"
#(h)
Z.test(p1=0.11,n1=10,p0=0.1)

##########
## 18.4 ##
##########
#(a) H0: No relationship between hair and eye color; HA: There is a relationship.
?HairEyeColor
chisq.test(x=HairEyeColor[,,1]+HairEyeColor[,,2])
# Very small P-value. Very strong evidence against the null. Reject H0 and conclude there does appear to be a relationship between hair and eye color of statistics students.
#(b) H0: p1=p2=p3=1/3; HA: H0 is incorrect
library("car")
data(Duncan)
?Duncan
jobtype <- Duncan$type
jobtype.tab <- table(jobtype)
jobtype.tab
chisq.test(jobtype.tab)
##(i) With a significance level of 0.05 and a p-value of 0.015, there is weak evidence to reject H0 and we therefore conclude that the three job types do not appear to be unifomly represented in the data set.
##(ii) With a significance level of 0.01 and a P-value of 0.015, there is no evidence to reject H0 and we therefore conclude that the three job types appear to be unifomly represented in the data set. 

##########
## 18.5 ##
##########
#(a)
typeI.mean <- function(mu0,sigma,n,alpha,test="two.sided",ITERATIONS=10000){
  tstats <- rep(NA,ITERATIONS)
  for(i in 1:ITERATIONS){
    temporary.sample <- rnorm(n=n,mean=mu0,sd=sigma)
    temporary.mean <- mean(temporary.sample)
    temporary.sd <- sd(temporary.sample)
    tstats[i] <- (temporary.mean-mu0)/(temporary.sd/sqrt(n))
  }
  pvals <- pt(tstats,df=n-1)
  if(test=="less"){
    return(mean(pvals<alpha))
  } else if(test=="greater"){
    return(mean((1-pvals)<alpha))
  } else if(test=="two.sided"){
    result <- pvals
    result[tstats>0] <- 1-pvals[tstats>0]
    return(mean(result<alpha/2))
  } else {
    stop("'test' argument not recognised")
  }
}
##(i)
typeI.mean(mu0=0,sigma=1,n=40,alpha=0.05,test="less")
typeI.mean(mu0=0,sigma=1,n=40,alpha=0.05,test="greater")
typeI.mean(mu0=0,sigma=1,n=40,alpha=0.05,test="two.sided")
##(ii)
typeI.mean(mu0=-4,sigma=0.3,n=60,alpha=0.01,test="less")
typeI.mean(mu0=-4,sigma=0.3,n=60,alpha=0.01,test="greater")
typeI.mean(mu0=-4,sigma=0.3,n=60,alpha=0.01,test="two.sided")
#(b)
typeII.mean <- function(mu0,muA,sigma,n,alpha,test="two.sided",ITERATIONS=10000){
  tstats <- rep(NA,ITERATIONS)
  for(i in 1:ITERATIONS){
    temporary.sample <- rnorm(n=n,mean=muA,sd=sigma)
    temporary.mean <- mean(temporary.sample)
    temporary.sd <- sd(temporary.sample)
    tstats[i] <- (temporary.mean-mu0)/(temporary.sd/sqrt(n))
  }
  pvals <- pt(tstats,df=n-1)
  if(test=="less"){
    return(mean(pvals>=alpha))
  } else if(test=="greater"){
    return(mean((1-pvals)>=alpha))
  } else if(test=="two.sided"){
    result <- pvals
    result[tstats>0] <- 1-pvals[tstats>0]
    return(mean(result>=alpha/2))
  } else {
    stop("'test' argument not recognised")
  }
}
##(i)
typeII.mean(mu0=-3.2,muA=-3.3,sigma=0.1,n=25,alpha=0.05,test="two.sided")
##(ii)
typeII.mean(mu0=8994,muA=5600,sigma=3888,n=9,alpha=0.01,test="less")
##(iii)
typeII.mean(mu0=0.44,muA=0.4,sigma=2.4,n=68,alpha=0.05,test="greater")

##########
## 18.6 ##
##########
#(a)
power.mean <- function(nvec,...){
  nlen <- length(nvec)
  result <- rep(NA,nlen)
  pbar <- txtProgressBar(min=0,max=nlen,style=3)
  for(i in 1:nlen){
    result[i] <- 1-typeII.mean(n=nvec[i],...)
    setTxtProgressBar(pbar,i)
  }
  close(pbar)
  return(result)
}
##(i)
power.mean(nvec=50,mu0=10,muA=10.5,sigma=0.9,alpha=0.01,test="two.sided")
##(ii)
power.mean(nvec=44,mu0=80,muA=78.5,sigma=3.1,alpha=0.05,test="less") #Yes, seems statistically powerful.
power.mean(nvec=44,mu0=80,muA=78.5,sigma=3.1,alpha=0.01,test="less") #No, power appears less than 80%, but only just...
#(b)
sample.sizes <- 5:100
pow <- power.mean(nvec=sample.sizes,mu0=80,muA=78.5,sigma=3.1,alpha=0.05,test="less")
minimum.n <- sample.sizes[min(which(pow>=0.8))]
minimum.n
pow2 <- power.mean(nvec=sample.sizes,mu0=80,muA=78.5,sigma=3.1,alpha=0.01,test="less")
minimum.n2 <- sample.sizes[min(which(pow2>=0.8))]
minimum.n2
plot(sample.sizes,pow,xlab="sample size n",ylab="simulated power")
points(sample.sizes,pow2,col="grey")
abline(h=0.8,lty=2)
abline(v=c(minimum.n,minimum.n2),lty=3,col=c("black","grey"))
legend("bottomright",legend=c("alpha=0.05","alpha=0.01"),col=c("black","grey"),pch=1)

