##########
## 21.2 ##
##########

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
#(a)
gal <- data.frame(d=c(573,534,495,451,395,337,253),h=c(1,0.8,0.6,0.45,0.3,0.2,0.1))
plot(gal$d~gal$h,pch=19,xlab="Initial height",ylab="Distance traveled")

# b. Galileo believed there was a quadratic relationship between initial height
# and the distance traveled.

##(i)
# i. Fit an order 2 polynomial in height, with distance as the response.

gal.fit.order2 <- lm(d~h+I(h^2),data=gal)
summary(gal.fit.order2)

# ii. Fit a cubic (order 3) and a quartic (order 4) model for these data. What
# do they tell you about the nature of the relationship?

##(ii)
gal.fit.order3 <- lm(d~h+I(h^2)+I(h^3),data=gal)
summary(gal.fit.order3)
gal.fit.order4 <- lm(d~h+I(h^2)+I(h^3)+I(h^4),data=gal)
summary(gal.fit.order4)

# These models reveal that the order 3 model is significant in it's
# highest-order term, and the fit is improved in terms of the coefficient of
# determination. The same cannot be said for the order 4 model. 

#(c)
# c. Based on your models from (b), choose the one that you think best
# represents the data and plot the fitted line on the raw data. Add 90 percent
# confidence bands for mean distance traveled to the plot.

# Based on the above, out of the three fitted models, the cubic function in
# height seems preferable -- in other words, the relationship between "distance
# traveled" and "initial height" therefore appears cubic -- the quadratic model
# seems too simple, and the quartic model seems uneccessarily complex.

hseq <- seq(0.05,1.05,length=30)
gal.pred <- predict(gal.fit.order3,newdata=data.frame(h=hseq),interval="confidence",level=0.9)
lines(hseq,gal.pred[,1])
lines(hseq,gal.pred[,2],lty=2)
lines(hseq,gal.pred[,3],lty=2)

# The contributed R package faraway contains a large number of data sets that
# accompany a linear regression textbook by Faraway (2005). Install the package
# and then call library("faraway") to load it. One of the data sets is trees,
# which provides data on the dimensions of felled trees of a certain type (see,
# for example, Atkinson, 1985).

#(d)
# d. Access the data object at the prompt and plot volume against girth (the
# latter along the x-axis).

?trees
plot(trees$Volume~trees$Girth,pch=19,xlab="Girth",ylab="Volume")
#(e)
# e. Fit two models with Volume as the response: one quadratic model in Girth
# and the other based on log transformations of both Volume and Girth. Write
# down the model equations for each and comment on the similarity (or
# difference) of the fits in terms of the coefficient of determination and the
# omnibus F-test.

tree.fit1 <- lm(Volume~Girth+I(Girth^2),trees)
summary(tree.fit1) ## "Mean volume" = 10.79 - 2.09*"girth" + 0.254*"girth^2"
tree.fit2 <- lm(log(Volume)~log(Girth),trees)
summary(tree.fit2) ## "Mean log(volume)" = -2.35 + 2.20*"log(girth)"

# Coefficients of determination are similar; the quadratic model is slightly higher. Both indicate a statistically significant positive effect of girth on volume. Based on the F-test, both models are clearly better than fitting an intercept alone (i.e. girth does appear to be able to explain (mean) volume very well).



#(f)

# f. Use predict to add lines to the plot from (d) for each of the two models
# from (e). Use different line types; add a corresponding legend. Also include
# 95 percent prediction intervals, with line types matching those of the fitted
# values (note that for the model that involves log transformation of the
# response and the predic- tor, any returned values from predict will
# themselves be on the log scale; you have to back-transform these to the
# original scale using exp before the lines for that model can be
# superimposed). Comment on the respective fits and their estimated prediction
# intervals.


# variation in the response
gseq <- seq(7,21,length=30)
tree.pred1 <- predict(tree.fit1,newdata=data.frame(Girth=gseq),interval="prediction")
tree.pred2 <- predict(tree.fit2,newdata=data.frame(Girth=gseq),interval="prediction")
plot(trees$Volume~trees$Girth,pch=19,xlab="Girth",ylab="Volume")
lines(gseq,tree.pred1[,1],lwd=2)
lines(gseq,tree.pred1[,2])
lines(gseq,tree.pred1[,3])
lines(gseq,exp(tree.pred2[,1]),lwd=2,lty=2)
lines(gseq,exp(tree.pred2[,2]),lty=2)
lines(gseq,exp(tree.pred2[,3]),lty=2)
legend("topleft",legend=c("quadratic","logged"),lty=1:2)

# The fitted values of the models themselves are extremely similar. However,
# the prediction intervals tell a different story. Notably, the quadratic model
# has far wider limits for small girth values than for larger ones. On the
# other hand, the limits for the logged model are substantially wider than
# those of the quadratic model at larger girth values. Which model is
# 'better'...? It's very difficult to answer that without further
# information...


#(g)
# Lastly, turn your attention back to the mtcars data frame.

# g. Fit and summarize a multiple linear regression model to determine mean MPG
# from horsepower, weight, and displacement.

car.fit <- lm(mpg~wt+hp+disp,data=mtcars)
summary(car.fit)

#(h)

# h. In the spirit of Henderson and Velleman (1981), use I to refit the model
# in (g) in terms of GPM = 1/MPG. Which model explains a greater amount of
car.fit <- lm(I(1/mpg)~wt+hp+disp,data=mtcars)
summary(car.fit)

# Both fits to the mtcars data here provide similar levels of significance for
# the three predictors; though there is a mild yet noticeable improvement in
# the coefficient of determination for the latter model based on a response of
# GPM = 1/MPG.







