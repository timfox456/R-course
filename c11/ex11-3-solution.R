##########
## 11.3 ##
##########
#(a)
foo <- list("a",c("b","c","d","e"),"f",c("g","h","i"))
lapply(foo,function(x) paste(x,"!",sep=""))
#(b)
facrec <- function(x){
  if(x==0){
    return(1)
  } else {
    return(x*facrec(x-1))
  }
}
##(i)
facrec(5)
##(ii)
facrec(12)
##(iii)
facrec(0)
#(c)
geolist <- function(x){
  geo <- function(nums){
    return(prod(nums)^(1/length(nums)))
  }
  
  for(i in 1:length(x)){
    if(!is.matrix(x[[i]])){
      x[[i]] <- geo(x[[i]])
    } else {
      x[[i]] <- apply(x[[i]],1,geo)
    }
  }
  return(x)
}
##(i)
foo <- list(1:3,matrix(c(3.3,3.2,2.8,2.1,4.6,4.5,3.1,9.4),4,2),matrix(c(3.3,3.2,2.8,2.1,4.6,4.5,3.1,9.4),2,4))
geolist(foo)
##(ii)
bar <- list(1:9,matrix(1:9,1,9),matrix(1:9,9,1),matrix(1:9,3,3))
geolist(bar)
