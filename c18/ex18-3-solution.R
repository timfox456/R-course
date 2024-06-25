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

