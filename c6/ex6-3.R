#########
## 6.3 ##
#########

# a. Identify the class of the following objects. For each object, also state whether the class is explicitly or implicitly defined.

# i. foo <- array(data=1:36,dim=c(3,3,4))

# ii. bar <- as.vector(foo)

# iii. baz <- as.character(bar)

# iv. qux <- as.factor(baz)

# v. quux <- bar+c(-0.1,0.1)

# b. For each object defined in (a), find the sum of the result of calling
# is.numeric and is.integer on it separately. For example,
# is.numeric(foo)+is.integer(foo) would compute the sum for (i). Turn the
# collection of five results into a factor with levels 0, 1, and 2, identified
# by the results themselves. Compare this factor vector with the result of
# coercing it to a numeric vector.

# c. Turn the following:

#       [,1] [,2] [,3] [,4]
# [1,]    2    5    8   11
# [2,]    3    6    9   12
# [3,]    4    7   10   13

# foo <- matrix(data=2:13,nrow=3,ncol=4)

 # into this:

# [1] "2"  "5"  "8"  "11" "3"  "6"  "9"  "12" "4"  "7"  "10" "13"

# d. Store the following matrix:

#      [,1] [,2] [,3]
# [1,]   34    0    1
# [2,]   23    1    2
# [3,]   33    1    1
# [4,]   42    0    1
# [5,]   41    0    2


# Then, do the following:

# i. Coerce the matrix to a data frame.

# ii. As a data frame, coerce the second column to be logical-valued.

# iii. As a data frame, coerce the third column to be factor-valued.
