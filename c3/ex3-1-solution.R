

#########
## 3.1 ##
#########
# a. Construct and store a 4 × 2 matrix that’s filled row-wise with the values 4.3, 3.1, 8.2, 8.2, 3.2, 0.9, 1.6, and 6.5, in that order.

mymat <- matrix(data=c(4.3,3.1,8.2,8.2,3.2,0.9,1.6,6.5),nrow=4,ncol=2,byrow=TRUE)
mymat

# b. Confirm the dimensions of the matrix from (a) are 3 × 2 if you remove any one row.

dim(mymat[-2,])


# c. Overwrite the second column of the matrix from (a) with that same column sorted from smallest to largest.

mymat[,2] <- sort(x=mymat[,2])
mymat

# d. What does R return if you delete the fourth row and the first col- umn from (c)? Use matrix to ensure the result is a single-column matrix, rather than a vector.

mymat[-4,-1]
matrix(data=mymat[-4,-1])

# e. Store the bottom four elements of (c) as a new 2 × 2 matrix.

mymat2 <- mymat[3:4,]
mymat2

# f. Overwrite, in this order, the elements of (c) at positions (4,2), (1,2), (4,1), and (1,1) with −12 of the two values on the diagonal of (e).

mymat[c(4,1),2:1] <- -0.5*diag(mymat2)






  
