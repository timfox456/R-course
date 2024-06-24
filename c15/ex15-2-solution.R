

##########
## 15.2 ##
##########
#(a)
##(i) Realization of discrete random variable
##(ii) Discrete random variable
##(iii) Discrete random variable
##(iv) Continuous random variable
##(v) Realization of discrete random variable
##(vi) Continous random variable
#(b)
S.outcomes <- 1:5
##(i)
1-0.1-0.13-0.21-0.15 # Pr(S=4)
S.prob <- c(0.1,0.13,0.21,0.41,0.15)
##(ii)
cumsum(S.prob)
##(iii)
mu.S <- sum(S.prob*S.outcomes)
mu.S
##(iv)
sqrt(sum(S.prob*(S.outcomes-mu.S)^2))
##(v)
sum(S.prob[3:5])
##(vi)
barplot(S.prob,ylim=c(0,0.5),names.arg=S.outcomes,space=0,xlab="s",ylab="Pr(S = s)") ### Unimodal, asymmetric -- slight left skew
#(c)
##(i)
fw <- function(w){
  w.upper <- w>65 & w<=90
  w.lower <- w>=40 & w<=65
  
  result <- rep(0,length(w))
  result[w.upper] <- (90-w[w.upper])/625
  result[w.lower] <- (w[w.lower]-40)/625	
  return(result)
}
##(ii)
Fw <- function(w){
  w.upper <- w>65 & w<=90
  w.lower <- w>=40 & w<=65
  
  result <- rep(0,length(w))
  result[w.upper] <- (180*w[w.upper]-w[w.upper]^2-6850)/1250
  result[w.lower] <- (w[w.lower]^2-80*w[w.lower]+1600)/1250
  result[w>90] <- 1
  
  return(result)
}
##(iii)
fw(55.2)
Fw(55.2)
##(iv)
1-Fw(60)
##(v)
Fw(76.89)-Fw(60.3)
#(d)
##(i) Bimodal, symmetric
##(ii) Trimodal, asymmetric -- right skew
##(iii) Unimodal, symmetric
##(iv) Unimodal, asymmetric -- right skew

