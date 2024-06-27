# Ex 22-2

# In Section 22.2.2, you used the nuclear data frame in the boot package to
# illustrate forward selection, where a model was selected for cost as a
# function of main effects of date, cap, pt, and ne.

# a. Access the data frame; fit and summarize the model described earlier.

# b. Inspect the raw residuals versus fitted values and a normal QQ plot of the
# residuals and comment on your interpretations— do the assumptions
# underpinning the error component of the linear model appear satisfied in this
# case?

# c. Determine the rule-of-thumb cutoff for influential observations based on
# the Cook’s distances. Produce a plot of the Cook’s distances and add a
# horizontal line corresponding to the cutoff. Comment on your findings.

# d. Produce a combination diagnostic plot of the standardized residuals
# against leverage. Set the Cook’s distance contours to include the cutoff
# value from (c) as well as the default contours. Interpret the plot—how are
# any individually influential points characterized?

# e. Based on (c) and (d), you should be able to identify the record in nuclear
# exerting the largest influence on the fitted model. For the sake of argument,
# let’s assume the observation was recorded incorrectly. Refit the model from
# (a), this time omitting the offending row from the data frame. Summarize the
# model— which coefficients have changed the most? Produce the diag- nostic
# plots from (b) for the new model and compare them to the ones from earlier.

# Load the faraway package and access the diabetes data frame. In Exercise 22.1
# (g), you used stepwise AIC selection to choose a model for chol.

# f. Using diabetes, fit the multiple linear model identified in the earlier
# exercise, that is, with main effects and a two-way inter- action between age
# and frame and a main effect for waist. By summarizing the fit, determine the
# number of records that contained missing values in diabetes that were deleted
# from the estimation.

# g. Produce the raw residuals versus fitted and QQ diagnostic plots for the
# model in (f). Comment on the validity of the error assumptions.

