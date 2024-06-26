

# Ex 17-2

# A casual runner records the average time it takes him to sprint 100 meters.
# He completes the dash 34 times under identical con- ditions and finds that
# the mean of these is 14.22 seconds. Assume that he knows the standard
# deviation of his runs is σX = 2.9 seconds.

x.bar <- 14.22
sigma <- 2.9

# a. Construct and interpret a 90 percent confidence interval for the true mean
# time.

#(a)
x.bar+c(-1,1)*qnorm(0.95)*sigma/sqrt(34) # When sd is known, sampling distribution of sample mean is normal. 90% confident that the true mean run time lies somewhere between 13.40 and 15.04 seconds (rounded 2 d.p.)

#(b)
# b. Repeat (a), but this time, assume that the standard deviation is not known
# and that s = 2.9 is estimated from the sample. How, if at all, does this
# change the interval?

x.bar+c(-1,1)*qt(0.95,df=33)*sigma/sqrt(34) # When sd is estimated from sample, sampling distribution is t with n-1 df. This means more extreme critical values and wider 90% CI when compared to normal version.


# In a particular country, the true proportion of citizens who are left handed
# or ambidextrous is unknown. A random sample of 400 people is taken, and each
# individual is asked to identify with one of three options: right-handed only,
# left-handed only, or ambidex- trous. The results show that 37 selected
# left-handed and 11 selected ambidextrous.

# c. Calculate and interpret a 99 percent CI for the true proportion of
# left-handed-only citizens.

#(c)
p.hat <- 37/400
p.hat
p.hat+c(-1,1)*qnorm(0.995)*sqrt(p.hat*(1-p.hat)/400) # 99% confident that the true proportion of left-handedness only is somwhere between 0.055 and 0.130 (rounded 3 d.p.)

# d. Calculate and interpret a 99 percent CI for the true proportion of
# citizens who are either left-handed or ambidextrous.

#(d)
p.hat <- (37+11)/400
p.hat
p.hat+c(-1,1)*qnorm(0.995)*sqrt(p.hat*(1-p.hat)/400) # 99% confident that the true proportion of left-handed or ambidextrous citizens is somwhere between 0.078 and 0.162 (rounded 3 d.p.)

# In Section 17.2.4, the technical interpretation of a CI with respect to its
# confidence level was described as the proportion of many similar intervals
# (that is, when calculated for samples of the same size from the same
# population) that contain the true value of the parameter of interest.

# Your task is to write an example to demonstrate this behavior of confidence
# intervals using simulation. To do so, follow these instructions:

# – Set up a matrix (see Chapter 3) filled with NAs (Chapter 6) that has 5,000
# rows and 3 columns.

# – Use skills from Chapter 10 to write a for loop that, at each of 5,000
# iterations, generates a random sample of size 300 from an exponential
# distribution with rate parameter λe = 0.1 (Section 16.2.4).

# – Evaluate the sample mean and sample standard deviation of each sample, and
# use these quantities with the critical values from the appropriate sampling
# distribution to calculate a 95 percent CI for the true mean of the
# distribution.

# – Within the for loop, the matrix should now be filled, row by row, with your
# results. The first column will contain the lower limit, the second will
# contain the upper limit, and the third column will be a logical value that is
# TRUE if the corresponding interval contains the true mean of 1/λe and that is
# FALSE otherwise.

# – When the loop is completed, compute the proportion of TRUEs in the third
# column of the filled matrix. You should find that this proportion is close to
# 0.95; this will vary ran- domly each time you rerun the loop.

#(e)
ci.mat <- matrix(NA,5000,3)
n <- 300
lambda.e <- 0.1
mu <- 1/lambda.e
for(i in 1:5000){
  samp <- rexp(n,rate=lambda.e)
  samp.ci <- mean(samp)+c(-1,1)*qt(0.975,n-1)*sd(samp)/sqrt(n)
  ci.mat[i,1:2] <- samp.ci
  ci.mat[i,3] <- mu>=samp.ci[1] && mu<=samp.ci[2]
}
mean(ci.mat[,3])

# f. Create a plot that draws the first 100 of your estimated confi- dence
# intervals as separate horizontal lines drawn from l to u, one on top of
# another. One way to do this is to first create an empty plot with preset x-
# and y-limits (the latter as c(1,100)) and then progressively add each line
# using lines with appropriate coordinates (this could be done using another
# for loop). As a final touch, add to the plot a red vertical line that denotes
# the true mean. Confidence intervals that do not include the true mean will
# not intersect that vertical line.

#(f)
plot(ci.mat[1,1:2],c(1,1),xlim=range(ci.mat[,1:2]),ylim=c(1,100),type="l",xlab="",ylab="")
for(i in 2:100){
  lines(ci.mat[i,1:2],c(i,i))
}
abline(v=mu,col=2)
