##########
## 11.2 ##
##########
#(a)
comp <- function(P,i,t=12,y,plotit=TRUE,...){
  yseq <- 1:y
  values <- P*(1+i/(100*t))^(t*yseq)
  
  if(plotit){  
    plot(yseq,values,type="s",...)
  } else {
    return(values)
  }
}
##(i)
comp(5000,4.4,y=10,plotit=F)[10]
##(ii)
comp(100,22.9,12,20,plotit=T,main="Compound interest calculator",ylab="Balance (F)",xlab="Year (y)")
##(iii)
ann <- comp(100,22.9,1,20,plotit=F)
lines(1:20,ann,lty=2,type="s")
legend("topleft",lty=c(1,2),legend=c("monthly interest","annual interest"))
#(b)
quad <- function(k1,k2,k3){
  if(any(c(missing(k1),missing(k2),missing(k3)))){
    return("At least one of k1, k2, k3 was missing")
  }
  x <- k2^2-4*k1*k3
  if(x<0){
    cat("No real roots\n")
  } else if(x==0){
    return(-k2/(2*k1))
  } else {
    return(c((-k2-x^0.5)/(2*k1),(-k2+x^0.5)/(2*k1)))
  }
}
##(i)
quad(k1=2,k2=-1,k3=-5)
quad(1,1,1)
##(ii)
quad(k1=1.3,k2=-8,k3=-3.13)
quad(2.25,-3,1)
quad(1.4,-2.2,-5.1)
quad(-5,10.11,-9.9)
##(iii)
quad(0)
