# #Ex 18-2

# In the package MASS you’ll find the data set anorexia, which contains data on
# pre- and post-treatment weights (in pounds) of 72 young women suffering from
# the disease, obtained from Hand et al. (1994). One group of women is the
# control group (in other words, no inter- vention), and the other two groups
# are the cognitive behavioral program and family support intervention program
# groups. Load the library and ensure you can access the data frame and
# understand its contents. Let μd denote the mean difference in weight,
# computed as (post-weight − pre-weight).

# a. Regardless of which treatment group the participants fall into, conduct
# and conclude an appropriate hypothesis test with α = 0.05 for the entire set
# of weights for the following hypotheses:

anorexia = read.csv("anorexia.csv")
t.test(anorexia[,3],anorexia[,2],alternative="greater",paired=TRUE)

# H0 : μd = 0 
# HA : μd > 0

# b. Next, conduct three separate hypothesis tests using the same defined
# hypotheses, based on which treatment group the partici- pants fall into. What
# do you notice?

# Another ready-to-use data set in R is PlantGrowth (Dobson, 1983), which
# records a continuous measure of the yields of a certain plant, looking at the
# potential effect of two supplements administered during growth to increase
# the yield when compared to a control group with no supplement.

?PlantGrowth

# c. Set up hypotheses to test whether the mean yield for the control group is
# less than the mean yield from a plant given either of the treatments.
# Determine whether this test should proceed using a pooled estimate of the
# variance or whether Welch’s t-test would be more appropriate.

# d. Conduct the test and make a conclusion (assuming normality of the raw
# observations).


#(e)

# e. Your task is to write a wrapper function that calls t.test after deciding
# whether it should be executed with var.equal=FALSE according to the rule of
# thumb. Use the following guidelines:

# – Your function should take four defined arguments: x and y with no defaults,
# to be treated in the same way as the same arguments in t.test; and var.equal
# and paired, with defaults that are the same as the defaults of t.test.

# – An ellipsis (Section 9.2.5) should be included to represent any additional
# arguments to be passed to t.test.

# – Upon execution, the function should determine whether paired=FALSE.

# If paired is TRUE, then there is no need to proceed with the check of a
# pooled variance.

# If paired is FALSE, then the function should determine the value for
# var.equal automatically by using the rule of thumb.

# – If the value of var.equal was set automatically, you can assume it will override any value of this argument initially supplied by the user.
# – Then, call t.test appropriately.

myt.test <- function(x,y,paired=FALSE,var.equal=FALSE,...){	
  # Your code here
}

#f. Try your new function on all three examples in the text of Sec- tion
#18.2.2, ensuring you reach identical results.

#(f)
# Example 1
snacks <- c(87.7,80.01,77.28,78.76,81.52,74.2,80.71,79.5,77.87,81.94,80.7,82.32,
            75.78,80.19,83.91,79.4,77.52,77.62,81.4,74.89,82.95,73.59,77.92,77.18,
            79.83,81.23,79.28,78.44,79.01,80.47,76.23,78.89,77.14,69.94,78.54,79.7,
            82.45,77.29,75.52,77.21,75.99,81.94,80.41,77.7)
snacks2 <- c(80.22,79.73,81.1,78.76,82.03,81.66,80.97,81.32,80.12,78.98,79.21,
             81.48,79.86,81.06,77.96,80.73,80.34,80.01,81.82,79.3,79.08,79.47,
             78.98,80.87,82.24,77.22,80.03,79.2,80.95,79.17,81)
myt.test(x=snacks2,y=snacks,alternative="greater",conf.level=0.9)
# Example 2
men <- c(102,87,101,96,107,101,91,85,108,67,85,82)
women <- c(73,81,111,109,143,95,92,120,93,89,119,79,90,126,62,92,77,106,105,111)
myt.test(x=men,y=women,alternative="two.sided",conf.level=0.95)
# Example 3
rate.before <- c(52,66,89,87,89,72,66,65,49,62,70,52,75,63,65,61) 
rate.after <- c(51,66,71,73,70,68,60,51,40,57,65,53,64,56,60,59) 
myt.test(x=rate.after,y=rate.before,alternative="less",paired=TRUE,conf.level=0.95)

