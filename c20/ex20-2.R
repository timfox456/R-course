#Ex 20-2

# Continue using the survey data frame from the package MASS for the next few exercises.

# a. The survey data set has a variable named Exer, a factor with k = 3 levels
# describing the amount of physical exercise time each student gets: none,
# some, or frequent. Obtain a count of the number of students in each category
# and produce side-by-side boxplots of student height split by exercise.

# b. Assuming independence of the observations and normality as usual, fit a
# linear regression model with height as the response variable and exercise as
# the explanatory variable (dummy coding). What’s the default reference level
# of the predictor? Produce a model summary.

# c. Draw a conclusion based on the fitted model from (b)—does it appear that
# exercise frequency has any impact on mean height? What is the nature of the
# estimated effect?

# d. Predict the mean heights of one individual in each of the three exercise
# categories, accompanied by 95 percent prediction intervals.

# e. Do you arrive at the same result and interpretation for the
# height-by-exercise model if you construct an ANOVA table using aov?

# f. Is there any change to the outcome of (e) if you alter the model so that
# the reference level of the exercise variable is “none”? Would you expect
# there to be?

# Now, turn back to the ready-to-use mtcars data set. One of the vari- ables in
# this data frame is qsec, described as the time in seconds it takes to race a
# quarter mile; another is gear, the number of forward gears (cars in this data
# set have either 3, 4, or 5 gears).

# g. Using the vectors straight from the data frame, fit a simple linear
# regression model with qsec as the response variable and gear as the
# explanatory variable and interpret the model summary.

# h. Explicitly convert gear to a factor vector and refit the model. Compare
# the model summary with that from (g). What do you find?

# i. Explain, with the aid of a relevant plot in the same style as the right
# image of Figure 20-6, why you think there is a difference between the two
# models (g) and (h).
