##########
## 10.5 ##
##########
#(a)
foo <- matrix(1:12,4,3)
apply(apply(foo,1,sort,decreasing=TRUE),2,prod)
#(b)
matlist <- list(matrix(c(T,F,T,T),2,2),matrix(c("a","c","b","z","p","q"),3,2),matrix(1:8,2,4))
matlist
for(i in 1:length(matlist)){
  matlist[[i]] <- t(matlist[[i]])
}
matlist
matlist <- list(matrix(c(T,F,T,T),2,2),matrix(c("a","c","b","z","p","q"),3,2),matrix(1:8,2,4))
matlist
matlist <- lapply(matlist,t)
matlist
#(c)
qux <- array(96:1,dim=c(4,4,2,3))
##(i)
apply(qux[,,2,],3,diag)
##(ii)
apply(apply(qux[,4,,],3,dim),1,sum)
