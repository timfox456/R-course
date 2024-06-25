# Ex 17-2

# A casual runner records the average time it takes him to sprint 100 meters.
# He completes the dash 34 times under identical con- ditions and finds that
# the mean of these is 14.22 seconds. Assume that he knows the standard
# deviation of his runs is σX = 2.9 seconds.

# a. Construct and interpret a 90 percent confidence interval for the true mean
# time.

# b. Repeat (a), but this time, assume that the standard deviation is not known
# and that s = 2.9 is estimated from the sample. How, if at all, does this
# change the interval?


# In a particular country, the true proportion of citizens who are left handed
# or ambidextrous is unknown. A random sample of 400 people is taken, and each
# individual is asked to identify with one of three options: right-handed only,
# left-handed only, or ambidex- trous. The results show that 37 selected
# left-handed and 11 selected ambidextrous.

# c. Calculate and interpret a 99 percent CI for the true proportion of
# left-handed-only citizens.

# d. Calculate and interpret a 99 percent CI for the true proportion of
# citizens who are either left-handed or ambidextrous.

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

# f. Create a plot that draws the first 100 of your estimated confi- dence
# intervals as separate horizontal lines drawn from l to u, one on top of
# another. One way to do this is to first create an empty plot with preset x-
# and y-limits (the latter as c(1,100)) and then progressively add each line
# using lines with appropriate coordinates (this could be done using another
# for loop). As a final touch, add to the plot a red vertical line that denotes
# the true mean. Confidence intervals that do not include the true mean will
# not intersect that vertical line.
