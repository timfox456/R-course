# Ex 18-3

# An advertisement for a skin cream claims nine out of ten women who use it
# would recommend it to a friend. A skeptical salesperson in a department store
# believes the true proportion of women users who’d recommend it, π, is much
# smaller than 0.9. She follows up with 89 random customers who had purchased
# the skin cream and asks if they would recommend it to others, to which 71
# answer yes.


# a. Set up an appropriate pair of hypotheses for this test and determine
# whether it will be valid to carry out using the normal distribution.

# b. Compute the test statistic and the p-value and state your conclu- sion for
# the test using a significance level of α = 0.1.

# c. Using your estimated sample proportion, construct a two-sided 90 percent
# confidence interval for the true proportion of women who would recommend the
# skin cream.

# The political leaders of a particular country are curious as to the
# proportion of citizens in two of its states that support the decrimi-
# nalization of marijuana. A small pilot survey taken by officials reveals that
# 97 out of 445 randomly sampled voting-age citizens residing in state 1
# support the decriminalization and that 90 out of 419 voting- age citizens
# residing in state 2 support the same notion.

# d. Letting π1 denote the true proportion of citizens in support of
# decriminalization in state 1, and π2 the same measure in state 2, conduct and
# conclude a hypothesis test under a significance level of α = 0.05 with
# reference to the following hypotheses:

# H0 : π2 − π1 = 0 
# HA : π2 − π1 != 0


# e. Compute and interpret a corresponding CI.

# Though there is standard, ready-to-use R functionality for the t-test, at the
# time of this writing, there is no similar function for the Z-test (in other
# words, the normal-based test of proportions described here) except in
# contributed packages.

# f. Your task is to write a relatively simple R function, Z.test, that can
# perform a one- or two-sample Z-test, using the following guidelines:

# – The function should take the following arguments: p1 and n1 (no default) to
# pose as the estimated proportion and sample size; p2 and n2 (both defaulting
# to NULL) that contain the second sample proportion and sample size in the
# event of a two-sample test; p0 (no default) as the null value; and
# alternative (default "two.sided") and conf.level (default 0.95), to be used
# in the same way as in t.test.

# – When conducting a two-sample test, it should be p1 that is tested as being
# smaller or larger than p2 when alternative="less" or alternative="greater",
# the same as in the use of x and y in t.test.

# – The function should perform a one-sample Z-test using p1, n1, and p0 if
# either p2 or n2 (or both) is NULL.


# – The function should contain a check for the rule of thumb to ensure the
# validity of the normal distribution in both one- and two-sample settings. If
# this is violated, the func- tion should still complete but should issue an
# appropriate warning message (see Section 12.1.1).

# – All that need be returned is a list containing the members Z (test
# statistic), P (appropriate p-value—this can be deter- mined by alternative;
# for a two-sided test, determining whether Z is positive or not can help), and
# CI (two-sided CI with respect to conf.level).

Z.test <- function(p1,n1,p2=NULL,n2=NULL,p0,alternative="two.sided",conf.level=0.95){
  # 
  # Your code here
  #
}

# g. Replicate the two examples in the text of Sections 18.3.1 and 18.3.2 using
# Z.test; ensure you reach identical results.

# h. Call Z.test(p1=0.11,n1=10,p0=0.1) to try your warning message in the
# one-sample setting.

Z.test(p1=0.11,n1=10,p0=0.1) 
