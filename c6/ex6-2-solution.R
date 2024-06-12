
#########
## 6.2 ##
#########

# a. Consider the following line of code:
#    foo <- c(4.3,2.2,NULL,2.4,NaN,3.3,3.1,NULL,3.4,NA)

#(a)
foo <- c(4.3,2.2,NULL,2.4,NaN,3.3,3.1,NULL,3.4,NA)
# Decide yourself which of the following statements are true and which are
# false and then use R to confirm:

#i The length of foo is 8.
##(i)
length(x=foo)

# ii. Calling which(x=is.na(x=foo)) will not result in 4 and 8.
##(ii)
which(x=is.na(x=foo))

# iii. Checking is.null(x=foo) will provide you with the locations of the two NULL values that are present.
##(iii)
is.null(x=foo)

# iv. Executing is.na(x=foo[8])+4/NULL will not result in NA.
##(iv)
is.na(x=foo[8])+4/NULL


# b. Create and store a list containing a single member: the vector
#(b)
# c(7,7,NA,3,NA,1,1,5,NA). 
bar <- list(c(7,7,NA,3,NA,1,1,5,NA))

# Then, do the following:

# i. Name the member "alpha".
##(i)
names(bar) <- "alpha"

# ii. Confirm that the list doesn’t have a member with the name "beta" using
# the appropriate logical valued function.
##(ii)
is.null(x=bar$beta)

# iii. Add a new member called beta, which is the vector obtained by
# identifying the index positions of alpha that are NA.
##(iii)
bar$beta <- which(x=is.na(x=bar$alpha))
bar




