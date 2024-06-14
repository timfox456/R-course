# Ex 10-5

# a. Continuing on from the most recent exaAmple in the text, write an implicit
# loop that calculates the product of all the column elements of the matrix
# returned by the call to :

apply(foo,1,sort,decreasing=TRUE)

# b. Convert the following for loop to an implicit loop that does exactly the same thing:

matlist <- list(matrix(c(T,F,T,T),2,2),
                matrix(c("a","c","b","z","p","q"),3,2),
                matrix(1:8,2,4))
matlist

for(i in 1:length(matlist)){
    matlist[[i]] <- t(matlist[[i]])
} matlist


# In R, store the following 4 × 4 × 2 × 3 array as the object qux: 

qux <- array(96:1,dim=c(4,4,2,3))

# That is, it is a four-dimensional array comprised of three blocks, with each
# block being an array made up of two layers of 4 × 4 matrices. Then, do the
# following:

# i. Write an implicit loop that obtains the diagonal elements of all
# second-layer matrices only to produce the following matrix:

#     [,1] [,2] [,3]
# [1,]   80   48   16
# [2,]   75   43   11
# [3,]   70   38    6
# [4,]   65   33    1





# ii. Write an implicit loop that will return the dimensions of each of the
# three matrices formed by accessing the fourth column of every matrix in qux,
# regardless of layer or block, wrapped by another implicit loop that finds the
# row sums of that returned structure, resulting simply in the following
# vector:

# [1] 12 6
