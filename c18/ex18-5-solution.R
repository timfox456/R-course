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

