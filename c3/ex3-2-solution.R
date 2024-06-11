
#########
## 3.2 ##
#########
#(a)
2/7*(cbind(c(1,2,7),c(2,4,6))-cbind(c(10,30,50),c(20,40,60)))
#(b)
A <- matrix(data=c(1,2,7))
B <- matrix(data=c(3,4,8))
##(i) Not possible
##(ii)
t(A)%*%B
##(iii)
t(B)%*%(A%*%t(A))
##(iv) Not possible
##(v)
solve(B%*%t(B)+A%*%t(A)-100*diag(3))
#(c)
A <- rbind(c(2,0,0,0),c(0,3,0,0),c(0,0,5,0),c(0,0,0,-1))
solve(A)%*%A-diag(4)

