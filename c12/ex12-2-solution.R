
##########
## 12.2 ##
##########

# a. Modify prog_test from Section 12.2.1 to include an ellipsis in its
# argument list, intended to take values for the additional argu- ments in
# txtProgressBar; name the new function prog_test_fancy. Time how long it takes
# a call to prog_test_fancy to execute. Set 50 as n, instruct the progress bar
# (through the ellipsis) to use style=3, and set the bar character to be "r".

prog_test_fancy <- function(n,...){
  result <- 0
  progbar <- txtProgressBar(min=0,max=n,...)
  for(i in 1:n){
    result <- result + 1
    Sys.sleep(0.5)
    setTxtProgressBar(progbar,value=i)
  }
  close(progbar)
  return(result)
}
ence <- Sys.time()
prog_test_fancy(50,style=3,char="r")
differ <- Sys.time()
differ-ence

# b. In Section 12.1.2, you defined a function named myfibvectorTRY (which
# itself calls myfibrec2 from Section 12.1.1) to return mul- tiple terms from
# the Fibonacci sequence based on a supplied “term vector” nvec. Write a new
# version of myfibvectorTRY that includes a progress bar of style=3 and a
# character of your choos- ing that increments at each pass of the internal for
# loop. Then, do the following:


nvec=c(3,2,7,0,9,13)


## Complete the function myfibrec2 here: 

myfibrec2 <- function(n){
  if(n<0){
    warning("Assuming you meant 'n' to be positive -- doing that instead")
    n <- n*-1
  } else if(n==0){
    stop("'n' is uninterpretable at 0")
  }
  
  if(n==1||n==2){
    return(1)
  } else {
    return(myfibrec2(n-1)+myfibrec2(n-2))
  }
}

myfibvectorTRY2 <- function(nvec){
  nterms <- length(nvec)
  result <- rep(0,nterms)
  progbar <- txtProgressBar(min=0,max=nterms,style=3,char="-")
  for(i in 1:nterms){
    attempt <- try(myfibrec2(nvec[i]),silent=T)
    if(class(attempt)=="try-error"){
      result[i] <- NA
    } else {
      result[i] <- attempt
    }
    setTxtProgressBar(progbar,value=i)
  }
  close(progbar)
  return(result)
}
##(i)
# i. Use your new function to reproduce the results from the text where

myfibvectorTRY2(nvec=c(3,2,7,0,9,13))

# ii. Time how long it takes to use your new function to return the first 35
# terms of the Fibonacci sequence. What do you notice, and what does this say
# about your recursive Fibonacci functions?

t1 <- Sys.time()
myfibvectorTRY2(1:35)
t2 <- Sys.time()
t2-t1
### This takes almost 1 minute on my machine... execution slows down as the recursion gets deeper... recursion perhaps not so good for computing Fibonacci sequence

# c. Remain with the Fibonacci sequence. Write a stand-alone for loop that can
# compute, and store in a vector, the same first 35 terms as in (b)(ii). Time
# it. Which approach would you prefer?

t1 <- Sys.time()
fibvec <- c(1,1,rep(NA,33)) 
for(i in 3:35){
  fibvec[i] <- fibvec[i-2]+fibvec[i-1]
}
fibvec
t2 <- Sys.time()
t2-t1
### This is substantially quicker than recursion!


