##########
## 11.1 ##
##########
#(a)
myfib4 <- function(thresh,printme){
  if(printme){
    fib.a <- 1
    fib.b <- 1
    cat(fib.a,", ",fib.b,", ",sep="")
    repeat{
      temp <- fib.a+fib.b
      fib.a <- fib.b
      fib.b <- temp
      cat(fib.b,", ",sep="")
      if(fib.b>thresh){
        cat("BREAK NOW...")
        break
      }
    }
  } else {
    fibseq <- c(1,1)
    counter <- 2
    repeat{
      fibseq <- c(fibseq,fibseq[counter-1]+fibseq[counter])
      counter <- counter+1
      if(fibseq[counter]>thresh){
        break
      }
    }
    return(fibseq)
  }
}
myfib4(thresh=150,printme=TRUE)
myfib4(1000000,T)
myfib4(150,FALSE)
myfib4(1000000,printme=F)
#(b)
##(i)
myfac <- function(int){
  result <- 1
  while(int>1){
    result <- result*int
    int <- int-1
  }
  return(result)
}
myfac(5)
myfac(12)
myfac(0)
##(ii)
myfac2 <- function(int){
  if(int<0){
    return(NaN)
  }
  result <- 1
  while(int>1){
    result <- result*int
    int <- int-1
  }
  return(result)
}
myfac2(5)
myfac2(12)
myfac2(0)
myfac2(-6)

