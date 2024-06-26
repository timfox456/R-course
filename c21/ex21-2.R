
# Ex 21-2


# The following table presents data collected in one of Galileo’s famous “ball”
# experiments, in which he rolled a ball down a ramp of different heights and
# measured how far it traveled from the base of the ramp. For more on this and
# other interesting examples, look at “Teaching Statistics with Data of
# Historic Significance” by Dickey and Arnold (1995).


 gal <- data.frame(d=c(573,534,495,451,395,337,253),h=c(1,0.8,0.6,0.45,0.3,0.2,0.1))

#   d   h
# 1 573 1.00
# 2 534 0.80
# 3 495 0.60
# 4 451 0.45
# 5 395 0.30
# 6 337 0.20
# 7 253 0.10



# a. Create a data frame in R based on this table and plot the data points with
# distance on the y-axis.

# b. Galileo believed there was a quadratic relationship between initial height
# and the distance traveled.

# i. Fit an order 2 polynomial in height, with distance as the response.

# ii. Fit a cubic (order 3) and a quartic (order 4) model for these data. What
# do they tell you about the nature of the relationship?

# c. Based on your models from (b), choose the one that you think best
# represents the data and plot the fitted line on the raw data. Add 90 percent
# confidence bands for mean distance traveled to the plot.

# The contributed R package faraway contains a large number of data sets that
# accompany a linear regression textbook by Faraway (2005). Install the package
# and then call library("faraway") to load it. One of the data sets is trees,
# which provides data on the dimensions of felled trees of a certain type (see,
# for example, Atkinson, 1985).

# d. Access the data object at the prompt and plot volume against girth (the
# latter along the x-axis).

# e. Fit two models with Volume as the response: one quadratic model in Girth
# and the other based on log transformations of both Volume and Girth. Write
# down the model equations for each and comment on the similarity (or
# difference) of the fits in terms of the coefficient of determination and the
# omnibus F-test.

# f. Use predict to add lines to the plot from (d) for each of the two models
# from (e). Use different line types; add a corresponding legend. Also include
# 95 percent prediction intervals, with line types matching those of the fitted
# values (note that for the model that involves log transformation of the
# response and the predic- tor, any returned values from predict will
# themselves be on the log scale; you have to back-transform these to the
# original scale using exp before the lines for that model can be
# superimposed). Comment on the respective fits and their estimated prediction
# intervals.


# Lastly, turn your attention back to the mtcars data frame.

# g. Fit and summarize a multiple linear regression model to determine mean MPG
# from horsepower, weight, and displacement.

# h. In the spirit of Henderson and Velleman (1981), use I to refit the model
# in (g) in terms of GPM = 1/MPG. Which model explains a greater amount of
# variation in the response
