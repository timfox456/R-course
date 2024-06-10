

#########
## 3.1 ##
#########
#(a)
mymat <- matrix(data=c(4.3,3.1,8.2,8.2,3.2,0.9,1.6,6.5),nrow=4,ncol=2,byrow=TRUE)
mymat
#(b)
dim(mymat[-2,])
#(c)
mymat[,2] <- sort(x=mymat[,2])
mymat
#(d)
mymat[-4,-1]
matrix(data=mymat[-4,-1])
#(e)
mymat2 <- mymat[3:4,]
mymat2
#(f)
mymat[c(4,1),2:1] <- -0.5*diag(mymat2)

