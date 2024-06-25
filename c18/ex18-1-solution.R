##########
## 18.1 ##
##########
#(a)
 # Adult domestic cats of a certain breed are said to have an average weight of
# 3.5 kilograms. A feline enthusiast disagrees and collects a sample of 73
# weights of cats of this breed. From her sample, she calculates a mean of 3.97
# kilograms and a standard deviation of 2.21 kilograms. Perform a hypothesis
# test to test her claim that the true mean weight μ is not 3.5 kilograms by
# setting up the appropriate hypothesis, carrying out the analysis, and
# interpret- ing the p-value (assume the significance level is α = 0.05).
### H0: mu = 3.5; HA: mu != 3.5 (two-sided test)
tstat <- (3.97-3.5)/(2.21/sqrt(73))
tstat
pt(-tstat,df=72)+(1-pt(tstat,df=72))
### p-value is around 0.073, this is > than alpha=0.05, therefore insufficient evidence to reject the null hypothesis. There is no evidence that the true mean cat weight is different to 3.5.
#(b)
# b. Suppose it was previously believed that the mean magnitude of seismic
# events off the coast of Fiji is 4.3 on the Richter scale. Use the data in the
# mag variable of the ready-to-use quakes data set, providing 1,000 sampled
# seismic events in that area, to test the claim that the true mean magnitude
# is in fact greater than 4.3. Set up appropriate hypotheses, use t.test
# (conduct the test at a significance level of α = 0.01), and draw a
# conclusion.

# H0: mu = 4.3; HA: mu > 4.3 (one-sided test)
t.test(quakes$mag,mu=4.3,alternative="greater",conf.level=0.99)
# p-value very small; strong evidence to reject the null. There is evidence to suggest that the true mean magnitude is greater than 4.3.

#(c)
# c. Manually compute a two-sided confidence interval for the true mean of (b).
mean(quakes$mag)+c(-1,1)*qt(0.995,df=999)*sd(quakes$mag)/sqrt(1000)



