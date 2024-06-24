

##########
## 17.1 ##
##########
# A teacher wants to test all of the 10th-grade students at his school to gauge
# their basic mathematical understanding, but the photocopier breaks after
# making only six copies of the test. With no other choice, he chooses six
# students at random to take the test. Their results, recorded as a score out
# of 65, have a sample mean of 41.1. The standard deviation of the marks of
# this test is known to be 11.3.

xbar <- 41.1

# a. Find the standard error associated with the mean test score.

se <- 11.3/sqrt(6)
se

# b. Assuming the scores themselves are normally distributed, evalu- ate the
# probability that the mean score lies between 45 and 55 if the teacher took
# another sample of the same size.

pnorm(55,mean=41.1,sd=se)-pnorm(45,mean=41.1,sd=se)

# c. A student who gets less than half the questions correct receives a failing
# grade (F). Find the probability that the average score is an F based on
# another sample of the same size.

pnorm(32.5,41.1,se)

# A marketing company wants to find out which of two energy drinks teenagers
# prefer—drink A or drink B. It surveys 140 teens, and the results indicate
# that only 35 percent prefer drink A.

#(d)
# d. Use a quick check to decide whether it is valid to use the nor- mal
# distribution to represent the sampling distribution of this proportion.
140*0.35
140*(1-0.35) # Both are > 5 so rule-of-thumb says using the normal distribution to represent the sampling distribution of the sample proportion is okay.

# e. What is the probability that in another sample of the same size, the
# proportion of teenagers who prefer drink A is greater than 0.4?

1-pnorm(0.4,mean=0.35,sd=sqrt(0.35*0.65/140))

# f. Find the two values of this sampling distribution that identify the central 80 percent of values of the proportion of interest.
qnorm(0.9,0.35,sqrt(0.35*0.65/140)) # Upper limit - tail above this value has probability 0.1
qnorm(0.1,0.35,sqrt(0.35*0.65/140)) # Lower limit - tail below this value has probability 0.1. Together, these two limits therefore mark of a central area under the curve of exactly 0.8.

#In Section 16.2.4, the time between cars passing an individual’s location was
#modeled using an exponential distribution. Say that on the other side of town,
#her friend is curious about a similar problem. Standing outside her house, she
#records 63 individual times between cars passing. These sampled times have a
#mean of x ̄ = 37.8 seconds with a standard deviation of s = 34.51 seconds.

#(g)

# Even though raw data are not normal, sample size is large (n>30 by rule-of-thumb). Standard deviation estimated from sample, so sampling distribution for the mean should be a t-distribution with 63-1=62 df.
se <- 34.51/sqrt(63)
se
#(h)

# The friend inspects a histogram of her raw measurements and notices that her
# raw data are heavily right-skewed. Briefly identify and describe the nature
# of the sampling distribution with respect to the sample mean and calculate
# the appropriate standard error.

# h. Using the standard error from (g) and the appropriate probabil- ity
# distribution, calculate the probability that in another sample of the same
# size, the sample mean time between cars passing is as follows:

# i. More than 40 seconds

##(i)
1-pt((40-37.8)/se,df=62)

# ii. Less than half a minute
pt((30-37.8)/se,df=62)

# iii. Between the given sample mean and 40 seconds
pt((40-37.8)/se,df=62)-0.5






