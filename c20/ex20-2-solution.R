

##########
## 20.2 ##
##########
#Ex 20-2

# Continue using the survey data frame from the package MASS for the next few
# exercises.

survey <- read.csv("survey.csv")

#(a)
# a. The survey data set has a variable named Exer, a factor with k = 3 levels
# describing the amount of physical exercise time each student gets: none,
# some, or frequent. Obtain a count of the number of students in each category
# and produce side-by-side boxplots of student height split by exercise.

table(survey$Exer)
boxplot(survey$Height~survey$Exer)
# b. Assuming independence of the observations and normality as usual, fit a
# linear regression model with height as the response variable and exercise as
# the explanatory variable (dummy coding). What’s the default reference level
# of the predictor? Produce a model summary.

survfit <- lm(Height~Exer,data=survey)
summary(survfit) 

# The reference level of the predictor defaults to the first level of the
# factor, which in this case (as is the default in R) is alphabetically
# arranged to be 'Freq'.


#(c)

# c. Draw a conclusion based on the fitted model from (b)—does it appear that
# exercise frequency has any impact on mean height? What is the nature of the
# estimated effect?

# We observe that both of the levels for which we've obtained coefficient
# estimates yield p-values that suggest evidence the coefficients are different
# to zero. The coefficient corresponding to 'some' has the smallest p-value of
# the two additive dummy levels. The negative point estimates of both estimates
# tell us that the model predicts the effect on height of being in either the
# 'none' or the 'some' categories, when compared to the 'frequent' category, is
# one of a decrease. In other words, it appears those who exercise less than
# 'frequent' are shorter on average. The shortest mean height is reserved for
# those in the 'none' exercise category; the estimated coefficient (-5.58) is
# more extreme than the coefficient for 'some' (-4.21). Overall statistical
# significance of the predictor (in terms of the effect of exercise on height)
# is supported by the global (omnibus F-test) P-value of 0.0035.

# d. Predict the mean heights of one individual in each of the three exercise
# categories, accompanied by 95 percent prediction intervals.

one.of.each <- factor(levels(survey$Exer))
one.of.each
predict(survfit,newdata=data.frame(Exer=one.of.each),interval="prediction")

# e. Do you arrive at the same result and interpretation for the
# height-by-exercise model if you construct an ANOVA table using aov?

summary(aov(Height~Exer,data=survey)) 
# Same 'global' P-value as the lm model summary. There is evidence to suggest
# mean student height differs according to exercise frequency.

# f. Is there any change to the outcome of (e) if you alter the model so that
# the reference level of the exercise variable is “none”? Would you expect
# there to be?

ExerReordered <- relevel(survey$Exer,ref="None")
levels(ExerReordered)
summary(aov(Height~ExerReordered,data=survey)) 
# There is no change to the omnibus F-test if we reorder the the reference
# level of exercise to be 'none', and nor should we expect there to be. The
# global test of a difference between the means doesn't depend on what we set
# the baseline value of the response to be.




# Now, turn back to the ready-to-use mtcars data set. One of the vari- ables in
# this data frame is qsec, described as the time in seconds it takes to race a
# quarter mile; another is gear, the number of forward gears (cars in this data
# set have either 3, 4, or 5 gears).

# g. Using the vectors straight from the data frame, fit a simple linear
# regression model with qsec as the response variable and gear as the
# explanatory variable and interpret the model summary.

carfit <- lm(qsec~gear,data=mtcars)
summary(carfit) 

# The effect of 'gear' when treated as a continuous variable is interpreted as
# a decrease in quarter-mile time of around 0.5 seconds, on average, for each
# additional forward gear. However, there is no evidence that this effect is
# different to zero, with a high P-value of 0.243 (and a similar global
# p-value) h. Explicitly convert gear to a factor vector and refit the model.
# Compare the model summary with that from (g). What do you find?

carfit2 <- lm(qsec~factor(gear),data=mtcars)
summary(carfit2) 

# The effect of 'gear' when treated as a categorical variable now appears to be
# statistically significant. Having 4 gears (as opposed to the reference level
# of 3) seems to increase the mean quarter-mile time by 1.27 seconds, having 5
# gears appears to decrease the mean quarter-mile time by 2.05 seconds. The
# global (omnibus F-test) p-value is also quite small, yielding evidence in
# support of an effect of 'gear' on 'qsec'.

# i. Explain, with the aid of a relevant plot in the same style as the right
# image of Figure 20-6, why you think there is a difference between the two
# models (g) and (h).
plot(mtcars$qsec~mtcars$gear,xlab="No. of Gears",ylab="Quarter-mile Time")
abline(carfit,lwd=2) 

# The plot indicates clearly that the difference between the two models is due
# to the fact that the relationship cannot be well explained by a continuous
# straight line. The first model therefore is incapable of realistically
# capturing the effect of changing categories in 'gear' on 'qsec'.

