

#########
## 6.3 ##
#########

# a. Identify the class of the following objects. For each object, also state whether the class is explicitly or implicitly defined.


# i. foo <- array(data=1:36,dim=c(3,3,4))

foo <- array(data=1:36,dim=c(3,3,4))
foo
class(foo)
attributes(foo) #implicit

# ii. bar <- as.vector(foo)

bar <- as.vector(foo)
bar
class(bar)
attributes(bar) #implicit

# iii. baz <- as.character(bar)

baz <- as.character(bar)
baz
class(baz)
attributes(baz) #implicit

# iv. qux <- as.factor(baz)
qux <- as.factor(baz)
qux
class(qux)
attributes(qux) #explicit

# v. quux <- bar+c(-0.1,0.1)
quux <- bar+c(-0.1,0.1)
quux
class(quux)
attributes(quux) #implicit

# b. For each object defined in (a), find the sum of the result of calling
# is.numeric and is.integer on it separately. For example,
# is.numeric(foo)+is.integer(foo) would compute the sum for (i). Turn the
# collection of five results into a factor with levels 0, 1, and 2, identified
# by the results themselves. Compare this factor vector with the result of
# coercing it to a numeric vector.

foo.sum <- is.numeric(foo)+is.integer(foo)
bar.sum <- is.numeric(bar)+is.integer(bar)
baz.sum <- is.numeric(baz)+is.integer(baz)
qux.sum <- is.numeric(qux)+is.integer(qux)
quux.sum <- is.numeric(quux)+is.integer(quux)
myfac <- factor(x=c(foo.sum,bar.sum,baz.sum,qux.sum,quux.sum),levels=c(0,1,2))
myfac
as.numeric(myfac)

# c. Turn the following:

#       [,1] [,2] [,3] [,4]
# [1,]    2    5    8   11
# [2,]    3    6    9   12
# [3,]    4    7   10   13

# foo <- matrix(data=2:13,nrow=3,ncol=4)

 # into this:

# [1] "2"  "5"  "8"  "11" "3"  "6"  "9"  "12" "4"  "7"  "10" "13"

foo <- matrix(data=2:13,nrow=3,ncol=4)
foo
as.character(as.vector(t(foo)))

# d. Store the following matrix:

#      [,1] [,2] [,3]
# [1,]   34    0    1
# [2,]   23    1    2
# [3,]   33    1    1
# [4,]   42    0    1
# [5,]   41    0    2

#(d)
foo <- cbind(c(34,23,33,42,41),c(0,1,1,0,0),c(1,2,1,1,2))
foo

# Then, do the following:

# i. Coerce the matrix to a data frame.
foo <- as.data.frame(foo)
foo

# ii. As a data frame, coerce the second column to be logical-valued.
foo[,2] <- as.logical(foo[,2])
foo

# iii. As a data frame, coerce the third column to be factor-valued.
foo[,3] <- as.factor(foo[,3])
foo
foo$V3
