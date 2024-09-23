

##########
## 16.2 ##
##########
#(a)
1-ppois(100,107)
#(b)
dpois(0,107)
#(c)
barplot(dpois(x=60:150,lambda=107),names.arg=60:150,space=0,xlab="x",ylab="Pr(X = x)")
#(d)
traffic <- rpois(n=260,107)
hist(traffic,xlim=c(60,150))
