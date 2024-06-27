##########
## 21.3 ##
##########

# Ex 21.3

# Return your attention to the cats data frame in package MASS. In the first
# few problems in Exercise 21.1, you fitted the main-effect-only model to
# predict the heart weights of domestic cats by total body weight and sex.

# a. Fit the model again, and this time include an interaction between the two
# predictors. Inspect the model summary. What do you notice in terms of the
# parameter estimates and their significance when compared to the earlier
# main-effect-only version?


cats <- read.csv("cats.csv")

#(a)
cat.fit <- lm(Hwt~Bwt*Sex,data=cats)
summary(cat.fit)

# The main-effects-only version of the model had a mild negative effect of "sex
# male", and it was not significant. In this version, the effect of being male
# is more extreme, and the p-value is far smaller, now providing weak evidence
# of significance. The interactive term for the slope of 'Bwt' for a male is
# reduced somewhat compared to females (estimated parameter is negative).

# b. Produce a scatterplot of heart weight on body weight, using different
# point characters or colors to distinguish the obser- vations according to
# sex. Use abline to add two lines denoting the fitted model. How does this
# plot differ from the one in Exercise 21.1 (d)?

plot(cats$Bwt,cats$Hwt,col=cats$Sex,ylab="Heart weight (g)",xlab="Body weight (kg)")
legend("topleft",legend=c("Female","Male"),col=1:2,pch=1)
cat.coefs <- coef(cat.fit)
abline(coef=cat.coefs[1:2])
abline(coef=c(sum(cat.coefs[c(1,3)]),sum(cat.coefs[c(2,4)])),col=2)

# Lines of the fitted model are no longer parallel; the effect of the weakly significant interaction is apparent.

# c. Predict the heart weight of Tilman’s cat using the new model (remember
# that Sigma is a 3.4 kg female) accompanied by a 95 percent prediction
# interval. Compare it to the main-effects- only model from the earlier
# exercise.
#(c)
predict(cat.fit,newdata=data.frame(Bwt=3.4,Sex="F"),interval="prediction",level=0.95)

# Sigma's heart weight predicted from the new model is around 1.5 grams lighter
# than predicted from the main-effects-only model in the earlier exercise. The
# prediction interval is set accordingly lower as well, but is also wider than
# the interval from earlier.

# d. Access the data object at the prompt and plot volume against girth (the
# latter along the x-axis).


#(d)
tree.fit1 <- lm(Volume~Girth+Height,data=trees)
summary(tree.fit1)
tree.fit2 <- lm(Volume~Girth*Height,data=trees)
summary(tree.fit2)
#(e)

# e. Repeat (d), but this time use the log transformation of all vari- ables.
# What do you notice about the significance of the interac- tion between the
# untransformed and transformed models? What does this suggest about the
# relationships in the data?

# original scaleo
tree.fit3 <- lm(log(Volume)~log(Girth)+log(Height),data=trees)
summary(tree.fit3)
tree.fit4 <- lm(log(Volume)~log(Girth)*log(Height),data=trees)
summary(tree.fit4)

# The interactive effect is highly significant in the untransformed model from
# (d), but completely non-significant after log-transformation of all present
# variables. This suggests that 'straight-line' relationships are not the best
# way to model these data (you can experiment with plots if you wish), and that
# we must account for curvature in the response surface by either working with
# transformed data or including the two-way interaction between the two
# untransformed continuous predictors. Once more, it is difficult to decide on
# which approach ought to be preferred -- we need to know more about the nature
# of the data themselves in context, as well as the ultimate purpose of the
# fitted model.

# Turn back to the mtcars data set and remind yourself of the variables in the help file ?mtcars.

# f. Fit a linear model for mpg based on a two-way interaction between hp and
# factor(cyl) and their main effects, as well as a main effect for wt. Produce
# a summary of the fit.

#(f)


car.fit <- lm(mpg~factor(cyl)*hp+wt,data=mtcars)
summary(car.fit)

# g. Interpret the estimated coefficients for the interaction between
# horsepower and the (categorical) number of cylinders.

coef(car.fit)
# The interactive effect is between a continuous (hp) and a categorical (factor(cyl)) predictor. As such, each of the two estimated coefficents can be interpreted as the change in the slope of hp for each of the non-reference levels of factor(cyl).
coef(car.fit)[4] # When the car has 4 cylinders (reference level), the slope for hp is -0.0995 (to 4 decimal places)
coef(car.fit)[4] + coef(car.fit)[6] # When the car has 6 cylinders, the slope for hp is -0.0995 + 0.0781 = -0.0214 (to 4 decimal places)
coef(car.fit)[4] + coef(car.fit)[7] # When the car has 8 cylinders, the slope for hp is -0.0995 + 0.0860 = -0.0135 (to 4 decimal places)

# This model suggests that as hp increases, mean MPG decreases (for a fixed
# wt). However, in comparison to 4-cylinder cars, mean MPG is estimated to
# decrease at a slower rate with an increasing hp for both 6- and 8-cylinder
# cars (since the positive additive terms to the baseline slope of -0.0995
# still provide negative slopes in hp, but ones that are closer to zero).

#(h)
# h. Suppose you’re keen on purchasing a 1970s performance car. Your mother
# advises you to purchase a “practical and economi- cal” car that’s capable of
# an average MPG value of at least 25. You see three vehicles advertised: car 1
# is a four-cylinder, 100 horse- power car that weighs 2100 lbs; car 2 is an
# eight-cylinder, 210 horsepower car that weighs 3900 lbs; and car 3 is a
# six-cylinder, 200 horsepower car that weighs 2900 lbs.

# i. Use your model to predict the mean MPG for each of the three cars; provide
# 95 percent confidence intervals. Based on your point estimates only, which
# car would you propose to your mother?


##(i)
predict(car.fit,newdata=data.frame(wt=c(2.1,3.9,2.9),hp=c(100,210,200),cyl=c(4,8,6)),interval="confidence",level=0.95)
# The first car is the only car that has a point estimate of mean MPG that is higher than your mother's demand of 25, so this would be the initial choice.

# ii. You still want the most gas-guzzling car you can own with your mother’s
# blessing, so you decide to be sneaky and base your decision on what the
# confidence intervals tell you instead. Does this change your choice of
# vehicle?

##(ii)

# Although the point estimate for Car 3 is much less than 25, looking at the
# confidence intervals you can see that the interval for Car 3 includes 25. So,
# you could argue to your mother that you're 95% confident that the true mean
# MPG of a car like Car 3 lies somewhere in that interval; in particular, your
# model suggests no evidence against the hypothesis that the true mean MPG of
# such a car is equal to 25. Of course, the interval also includes possible
# true values that are far worse than 25... but you don't need to tell your
# mother that.


