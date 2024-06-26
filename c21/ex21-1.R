
# Ex 21.1

# In the MASS package, you’ll find the data frame cats, which provides data on
#sex, body weight (in kilograms), and heart weight (in grams) for 144 household
#cats (see Venables and Ripley, 2002, for further details); you can read the
#documentation with a call to ?cats. Load the MASS package with a call to
#library("MASS"), and access the object directly by entering cats at the
#console prompt.

cats = read.csv("cats.csv")


# a. Plot heart weight on the vertical axis and body weight on the horizontal
# axis, using different colors or point characters to distinguish between male
# and female cats. Annotate your plot with a legend and appropriate axis
# labels.

# b. Fit a least-squares multiple linear regression model using heart weight as
# the response variable and the other two variables as predictors, and view a
# model summary.

# i. Write down the equation for the fitted model and interpret the estimated
# regression coefficients for body weight and sex. Are both statistically
# significant? What does this say about the relationship between the response
# and predictors?

# ii. Report and interpret the coefficient of determination and the outcome of
# the omnibus F -test.

# c. Tilman’s cat, Sigma, is a 3.4 kg female. Use your model to esti- mate her
# mean heart weight and provide a 95 percent prediction interval.


# d. Use predict to superimpose continuous lines based on the fitted linear
# model on your plot from (a), one for male cats and one for female. What do
# you notice? Does this reflect the statistical significance (or lack thereof)
# of the parameter estimates?

# The boot package (Davison and Hinkley, 1997; Canty and Ripley, 2015) is
# another library of R code that’s included with the standard installation but
# isn’t automatically loaded. Load boot with a call to library("boot"). You’ll
# find a data frame called nuclear, which contains data on the construction of
# nuclear power plants in the United States in the late 1960s (Cox and Snell,
# 1981).

# e. Access the documentation by entering ?nuclear at the prompt and examine
# the details of the variables. (Note there is a mistake for date, which
# provides the date that the construction permits were issued—it should read
# “measured in years since January 1 1900 to the nearest month.”) Use pairs to
# produce a quick scatterplot matrix of the data.

# f. One of the original objectives was to predict the cost of further
# construction of these power plants. Create a fit and summary of a linear
# regression model that aims to model cost by t1 and t2, two variables that
# describe different elapsed times associated with the application for and
# issue of various permits. Take note of the estimated regression coefficients
# and their significance in the fitted model.

# g. Refit the model, but this time also include an effect for the date the
# construction permit was issued. Contrast the output for this new model
# against the previous one. What do you notice, and what does this information
# suggest about the relationships in the data with respect to these predictors?

# h. Fit a third model for power plant cost, using the predictors for “date of
# permit issue,” “power plant capacity,” and the binary variable describing
# whether the plant was sited in the north- eastern United States. Write down
# the fitted model equation and provide 95 percent confidence intervals for
# each estimated coefficient.


# The following table gives an excerpt of a historical data set com- piled
# between 1961 and 1973. It concerns the annual murder rate in Detroit,
# Michigan; the data were originally presented and analyzed by Fisher (1976)
# and are reproduced here from Harraway (1995). In the data set you’ll find the
# number of murders, police officers, and gun licenses issued per 100,000
# population, as well as the overall unemployment rate as a percentage of the
# overall population.


# i. Create your own data frame in your R workspace and produce a scatterplot
# matrix. Which of the variables appears to be most strongly related to the
# murder rate?


# j. Fit a multiple linear regression model using the number of murders as the
# response and all other variables as predictors. Write down the model equation
# and interpret the coefficients. Is it reasonable to state that all
# relationships between the response and the predictors are causal?


# k. Identify the amount of variation in the response attributed to the joint
# effect of the three explanatory variables. Then refit the model excluding the
# predictor associated with the largest (in other words, “most nonsignificant”)
# p-value. Compare the new coefficient of determination with that of the
# previous model. Is there much difference?

# l. Use your model from (k) to predict the mean number of mur- ders per
# 100,000 residents, with 300 police officers and 500 issued gun licenses.
# Compare this to the mean response if there were no gun licenses issued and
# provide 99 percent confidence intervals for both predictions.

