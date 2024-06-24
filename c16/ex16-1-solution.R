##########
## 16.1 ##
##########
#(a)
# A forested nature reserve has 13 bird-viewing platforms scattered throughout
# a large block of land. The naturalists claim that at any point in time, there
# is a 75 percent chance of seeing birds at each platform. Suppose you walk
# through the reserve and visit every platform. If you assume that all relevant
# conditions are sat- isfied, let X be a binomial random variable representing
# the total number of platforms at which you see birds.

# a. Visualize the probability mass function of the binomial distribu- tion of interest.
barplot(dbinom(x=0:13,size=13,prob=0.75),names.arg=0:13,space=0,xlab="x",ylab="Pr(X = x)")
# b. What is the probability you see birds at all sites?

dbinom(13,13,0.75)
#(c)
# c. What is the probability you see birds at more than 9 platforms?

1-pbinom(q=9,13,0.75)

# d. What is the probability of seeing birds at between 8 and 11 platforms (inclusive)? Confirm your answer by using only the d-function and then again using only the p-function.

sum(dbinom(8:11,13,0.75))
pbinom(11,13,0.75)-pbinom(7,13,0.75)

# e. Say that, before your visit, you decide that if you see birds at fewer than 9 sites, you’ll make a scene and demand your entry fee back. What’s the probability of your embarrassing yourself in this way?

#(e)
pbinom(8,13,0.75)

# f. Simulate realizations of X that represent 10 different visits to the
# reserve; store your resulting vector as an object.

visits <- rbinom(10,13,0.75)
visits

#(g)

# g. Compute the mean and standard deviation of the distribution of interest.
mu.X <- 13*0.75
mu.X
sigma.X <- sqrt(mu.X*0.25)
sigma.X


