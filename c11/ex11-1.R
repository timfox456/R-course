# Ex 11-1 

# a. Write another Fibonacci sequence function, naming it myfib4. This function
# should provide an option to perform either the operations available in
# myfib2, where the sequence is simply printed to the console, or the
# operations in myfib3, where a vec- tor of the sequence is formally returned.
# Your function should take two arguments: the first, thresh, should define the
# limit of the sequence (just as in myfib2 or myfib3); the second, printme,
# should be a logical value. If TRUE, then myfib4 should just print; if FALSE,
# then myfib4 should return a vector. Confirm the correct results arise from
# the following calls:



#write the following:

myfib4 <- function(thresh) {
  # write yoour code here

}



myfib4(thresh=150,printme=TRUE) - myfib4(1000000,T)
myfib4(150,FALSE)
myfib4(1000000,printme=F)

# b. In Exercise 10.4 on page 203, you were tasked with writing a while loop to
# perform integer factorial calculations.
# 10-4 factorial while loop

mynum.fac <- 1
while(mynum>1){
  mynum.fac <- mynum.fac*mynum
  mynum <- mynum-1
}
mynum.fac
## end code


# i. Using your factorial while loop (or writing one if you didn’t do so
# earlier), write your own R function, myfac, to compute the factorial of an
# integer argument int (you may assume int will always be supplied as a
# non-negative integer). Perform a quick test of the function by computing 5
# factorial, which is 120; 12 factorial, which is 479,001,600; and 0 factorial,
# which is 1.


# ii. Write another version of your factorial function, naming it myfac2. This
# time, you may still assume int will be supplied as an integer but not that it
# will be non-negative. If negative, the function should return NaN. Test
# myfac2 on the same three values as previously, but also try using int=-6.
