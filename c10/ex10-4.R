# Ex 10-4

# a. Based on the most recent example of storing identity matrices in a list,
# determine what the resulting mylist would look like for each of the following
# possible mynumbers vectors, without executing anything:

# i. mynumbers <- c(2,2,2,2,5,2) 

# ii. mynumbers<-2:20

# iii. mynumbers <- c(10,1,10,1,2)

# Then, confirm your answers in R (note you’ll also have to reset the initial
# values of mylist, counter, and mycondition each time, just as in the text).

# b. For this problem, I’ll introduce the factorial operator. The fac- torial
# of a non-negative integer x, expressed as x!, refers to x multiplied by the
# product of all integers less than x, down to 1. Formally, it is written like
# this:

# “x factorial” = x! = x × (x − 1) × (x − 2) × . . . × 1 

# Note that there is a special case of zero factorial, which is always 1. That
# is:

# 0! = 1

# For example, to work out 3 factorial, you compute the following:

# 3×2×1=6

# To work out 7 factorial, you compute the following:

# 7 × 6 × 5 × 4 × 3 × 2 × 1 = 5040

# Write a while loop that computes and stores as a new object the factorial of
# any non-negative integer mynum by decrementing mynum by 1 at each repetition
# of the braced code.

# Using your loop, confirm the following:

# i. That the result of using mynum <- 5 is 120

# ii. That using mynum <- 12 yields 479001600

# iii. That having mynum <- 0 correctly returns 1

# Consider the following code, where the operations in the braced area of the while loop have been omitted:

mystring <- "R fever"
index <- 1
ecount <- 0
result <- mystring
while(ecount<2 && index<=nchar(mystring)){
    # several omitted operations #
}
result

# Your task is to complete the code in the braced area so it inspects mystring
# character by character until it reaches the second instance of the letter e
# or the end of the string, whichever comes first. The result object should be
# the entire character string if there is no second e or the character string
# made up of all the characters up to, but not including, the sec- ond e if
# there is one. For example, mystring <- "R fever" should provide result as "R
# fev". This must be achieved by following these operations in the braces:


# 1. Use substr (Section 4.2.4) to extract the single character of mystring at
# position index.


# 2. Use a check for equality to determine whether this single- character
# string is either "e" OR "E". If so, increase ecount by 1.


# 3. Next, perform a separate check to see whether ecount is equal to 2. If so,
# use substr to set result equal to the characters between 1 and index-1
# inclusive.


# 4. Increment index by 1.

# Test your code—ensure the previous result for mystring <- "R fever".
# Furthermore, confirm the following:

# * Using mystring <- "beautiful" provides result as "beautiful" 

# * Using mystring <- "ECCENTRIC" provides result as "ECC" 

# * Using mystring <- "ElAbOrAte" provides result as "ElAbOrAt" 

# * Using mystring <- "eeeeek!" provides result as "e"
