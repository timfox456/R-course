##########
## 10.4 ##
##########
#(a)
##(i)
mylist <- list()
counter <- 1
mynumbers <- c(2,2,2,2,5,2)
mycondition <- mynumbers[counter]<=5
mycondition
while(mycondition){
  mylist[[counter]] <- diag(mynumbers[counter])
  counter <- counter+1
  if(counter<=length(mynumbers)){
    mycondition <- mynumbers[counter]<=5
  } else {
    mycondition <- FALSE
  }
}
mylist
##(ii)
mylist <- list()
counter <- 1
mynumbers <- 2:20
mycondition <- mynumbers[counter]<=5
mycondition
while(mycondition){
  mylist[[counter]] <- diag(mynumbers[counter])
  counter <- counter+1
  if(counter<=length(mynumbers)){
    mycondition <- mynumbers[counter]<=5
  } else {
    mycondition <- FALSE
  }
}
mylist
##(iii) below, the loop braced-area code won't even be entered -- the first element of 'mynumbers' is greater than 5 -- resulting list will be empty
mylist <- list()
counter <- 1
mynumbers <- c(10,1,10,1,2)
mycondition <- mynumbers[counter]<=5
mycondition
while(mycondition){
  mylist[[counter]] <- diag(mynumbers[counter])
  counter <- counter+1
  if(counter<=length(mynumbers)){
    mycondition <- mynumbers[counter]<=5
  } else {
    mycondition <- FALSE
  }
}
mylist
#(b)
mynum.fac <- 1
while(mynum>1){
  mynum.fac <- mynum.fac*mynum
  mynum <- mynum-1
}
mynum.fac
##(i)
mynum <- 5
##(ii)
mynum <- 12
##(iii)
mynum <- 0
#(c)
mystring <- "R fever"
mystring <- "beautiful"
mystring <- "ECCENTRIC"
mystring <- "ElAbOrAte"
mystring <- "eeeeek!"
#--#
index <- 1
ecount <- 0
result <- mystring
while(ecount<2 && index<=nchar(mystring)){
  temp.char <- substr(mystring,index,index)	
  if(temp.char=="e"||temp.char=="E"){
    ecount <- ecount+1
  }
  if(ecount==2){
    result <- substr(mystring,1,index-1)
  }
  index <- index + 1
}
result

