# Ex 10-6

# a. Using the same objects from Section 10.3.1,

foo <- 5
bar <- c(2,3,1.1,4,0,4.1,3)

# do the following:

# i. Write a while loop -- without using break or next -- that will reach
# exactly the same result as the break example in Sec- tion 10.3.1. That is,
# produce the same vector as loop2.result in the text.

# ii. Obtain the same result as loop3.result, the example concern- ing next,
# using an ifelse function instead of a loop.

# b. To demonstrate while loops in Section 10.2.2, you used the vector

mynumbers <- c(4,5,1,2,6,2,4,6,6,2)

# to progressively fill mylist with identity matrices whose dimen- sions
# matched the values in mynumbers. The loop was instructed to stop when it
# reached the end of the numeric vector or a number that was greater than 5.

# i. Write a for loop using a break declaration that does the same thing.

# ii. Write a repeat statement that does the same thing.

# c. Suppose you have two lists, matlist1 and matlist2, both filled with
# numeric matrices as their members. Assume that all mem- bers have finite,
# nonmissing values, but do not assume that the dimensions of the matrices are
# the same throughout. Write a nested pair of for loops that aim to create a
# result list, reslist, of all possible matrix products (refer to Section
# 3.3.5) of the members of the two lists according to the following guidelines:

# - The matlist1 object should be indexed/searched in the outer loop, and the
# matlist2 object should be indexed/searched in the inner loop.


# - You’re interested only in the possible matrix products of the members of
# matlist1 with the members of matlist2 in that order.

# - If a particular multiple isn’t possible (that is, if the ncol of a member
# of matlist1 doesn’t match the nrow of a member of matlist2), then you should
# skip that multiplication, store the string "not possible" at the relevant
# position in reslist, and proceed directly to the next matrix multiplication.

# - You can define a counter that is incremented at each com- parison (inside
# the inner loop) to keep track of the current position of reslist.

# Note, therefore, that the length of reslist will be equal to
# length(matlist1)*length(matlist2). Now, confirm the following results:

# i. If you have

matlist1 <- list(matrix(1:4,2,2),matrix(1:4),matrix(1:8,4,2))
matlist2 <- matlist1

#then all members of reslist should be "not possible" apart
#from members [[1]] and [[7]].

ii. If you have

atlist1 <- list(matrix(1:4,2,2),matrix(2:5,2,2), matrix(1:16,4,2))
atlist2 <- list(matrix(1:8,2,4),matrix(10:7,2,2), matrix(9:2,4,2))

#then only the "not possible" members of reslist should be [[3]], [[6]], and [[9]].
