##########
## 10.6 ##
##########
#(a)
foo <- 5
bar <- c(2,3,1.1,4,0,4.1,3)
##(i)
loop2.result <- rep(NA,length(bar))
condition <- TRUE
counter <- 1
while(condition){
  temp <- foo/bar[counter]
  if(is.finite(temp)){
    loop2.result[counter] <- temp
  } else {
    condition <- FALSE
  }
  counter <- counter+1
}
loop2.result
##(ii)
loop3.result <- ifelse(is.finite(foo/bar),foo/bar,NA)
loop3.result
#(b)
mynumbers <- c(4,5,1,2,6,2,4,6,6,2)
##(i)
mylist <- list()
for(i in 1:length(mynumbers)){
  if(mynumbers[i]<=5){
    mylist[[i]] <- diag(mynumbers[i])
  } else {
    break
  }
}
mylist
##(ii)
mylist <- list()
counter <- 0
repeat{
  counter <- counter+1
  if(counter<=length(mynumbers)){
    if(mynumbers[counter]<=5){
      mylist[[counter]] <- diag(mynumbers[counter])
    } else {
      break
    }
  } else {
    break
  }
}
mylist
#(c)
counter <- 0
reslist <- list()
for(i in 1:length(matlist1)){
  for(j in 1:length(matlist2)){
    counter <- counter+1
    if(ncol(matlist1[[i]])!=nrow(matlist2[[j]])){
      reslist[[counter]] <- "not possible"
      next
    }
    reslist[[counter]] <- matlist1[[i]]%*%matlist2[[j]]
  }
}
reslist
##(i)
matlist1 <- list(matrix(1:4,2,2),matrix(1:4),matrix(1:8,4,2))
matlist2 <- matlist1
##(ii)
matlist1 <- list(matrix(1:4,2,2),matrix(2:5,2,2),matrix(1:16,4,2))
matlist2 <- list(matrix(1:8,2,4),matrix(10:7,2,2),matrix(9:2,4,2))


