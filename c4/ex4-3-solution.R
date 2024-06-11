
#########
## 4.3 ##
#########
#(a)
foo <- c(7,5,6,1,2,10,8,3,8,2)
##(i)
bar <- foo[foo>=5]
##(ii)
foo[-which(x=foo>=5)]
#(b)
baz <- matrix(data=bar,nrow=2,ncol=3,byrow=T)
##(i)
baz[baz==8] <- baz[1,2]^2
##(ii)
all(baz<=25&baz>4)
#(c)
qux <- array(data=c(10,5,1,4,7,4,3,3,1,3,4,3,1,7,8,3,7,3),dim=c(3,2,3))
##(i)
which(x=qux==3|qux==4,arr.ind=T)
##(ii)
qux[qux<3|qux>=7] <- 100
#(d)
foo[c(F,T)]
foo[c(0,1)]

