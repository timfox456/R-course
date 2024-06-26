##########
## 21.3 ##
##########

cats <- read.csv("cats.csv")

#(a)
cat.fit <- lm(Hwt~Bwt*Sex,data=cats)
summary(cat.fit)

# The main-effects-only version of the model had a mild negative effect of "sex
# male", and it was not significant. In this version, the effect of being male
# is more extreme, and the p-value is far smaller, now providing weak evidence
# of significance. The interactive term for the slope of 'Bwt' for a male is
# reduced somewhat compared to females (estimated parameter is negative).

#(b)
plot(cats$Bwt,cats$Hwt,col=cats$Sex,ylab="Heart weight (g)",xlab="Body weight (kg)")
legend("topleft",legend=c("Female","Male"),col=1:2,pch=1)
cat.coefs <- coef(cat.fit)
abline(coef=cat.coefs[1:2])
abline(coef=c(sum(cat.coefs[c(1,3)]),sum(cat.coefs[c(2,4)])),col=2)
# Lines of the fitted model are no longer parallel; the effect of the weakly significant interaction is apparent.
#(c)
predict(cat.fit,newdata=data.frame(Bwt=3.4,Sex="F"),interval="prediction",level=0.95)

# Sigma's heart weight predicted from the new model is around 1.5 grams lighter
# than predicted from the main-effects-only model in the earlier exercise. The
# prediction interval is set accordingly lower as well, but is also wider than
# the interval from earlier.

#(d)
library("faraway")
tree.fit1 <- lm(Volume~Girth+Height,data=trees)
summary(tree.fit1)
tree.fit2 <- lm(Volume~Girth*Height,data=trees)
summary(tree.fit2)
#(e)
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

#(f)
car.fit <- lm(mpg~factor(cyl)*hp+wt,data=mtcars)
summary(car.fit)
#(g)
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
##(i)
predict(car.fit,newdata=data.frame(wt=c(2.1,3.9,2.9),hp=c(100,210,200),cyl=c(4,8,6)),interval="confidence",level=0.95)
# The first car is the only car that has a point estimate of mean MPG that is higher than your mother's demand of 25, so this would be the initial choice.
##(ii)

# Although the point estimate for Car 3 is much less than 25, looking at the
# confidence intervals you can see that the interval for Car 3 includes 25. So,
# you could argue to your mother that you're 95% confident that the true mean
# MPG of a car like Car 3 lies somewhere in that interval; in particular, your
# model suggests no evidence against the hypothesis that the true mean MPG of
# such a car is equal to 25. Of course, the interval also includes possible
# true values that are far worse than 25... but you don't need to tell your
# mother that.

