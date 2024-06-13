
#########
## 9.2 ##
#########

# a. Use positional matching with seq to create a sequence of values between −4
# and 4 that progresses in steps of 0.2.

seq(-4,4,0.2)

# b. In each of the following lines of code, identify which style of argument
# matching is being used: exact, partial, positional, or mixed. If mixed,
# identify which arguments are specified in each style.

# i. array(8:1,dim=c(2,2,2))
array(8:1,dim=c(2,2,2)) # MIXED: 'data' positional, 'dim' exact.

# ii. rep(1:2,3)

rep(1:2,3) # POSITIONAL

# iii. seq(from=10,to=8,length=5)

seq(from=10,to=8,length=5) # MIXED: 'from' and 'to' exact, 'length.out' partial.

# iv. sort(decreasing=T,x=c(2,1,1,2,0.3,3,1.3)) v. which(matrix(c(T,F,T,T),2,2))

sort(decreasing=T,x=c(2,1,1,2,0.3,3,1.3)) # EXACT
##(v)

which(matrix(c(T,F,T,T),2,2)) # POSITIONAL

# vi. which(matrix(c(T,F,T,T),2,2),a=T)

which(matrix(c(T,F,T,T),2,2),a=T) # MIXED: 'x', 'data', 'nrow', 'ncol' positional, 'arr.ind' partial

# c. Suppose you explicitly ran the plotting function plot.default and supplied
# values to arguments tagged type, pch, xlab, ylab, lwd, lty, and col. Use the
# function documentation to determine which of these arguments fall under the
# umbrella of the ellipsis.

# 'pch', 'lwd', 'lty' and 'col' are part of the ellipsis.
