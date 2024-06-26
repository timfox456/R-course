##########
## 21.1 ##
##########
library("MASS")
?cats
#(a)
plot(cats$Bwt,cats$Hwt,col=cats$Sex,xlab="Body weight (kg)",ylab="Heart weight (g)")
legend("topleft",legend=c("female","male"),col=c(1,2),pch=c(1,1)) # Females are black, since the levels of the factor vector cats$Sex are in the alphabetical order of "F" "M", which R interprets as 1 and 2 when this factor vector is passed to the 'col' argument of 'plot'.
#(b)
cats.fit <- lm(Hwt~Bwt+Sex,data=cats)
summary(cats.fit)
##(i)
# "Mean heart weight" = -0.415 + 4.076*"Body weight" - 0.082*"is male"
# For cats of the same sex, the effect of an additional kg of body weight is, on average, an extra 4.076 grams of heart weight. For cats of the same body weight, the heart weight of a male is, on average, 0.082 grams lighter than that of a female.
# The model states the effect of body weight is highly statistically significant -- there is evidence to believe body weight does indeed affect heart weight. However, the effect of sex is not significant. There is no statistical evidence to suggest the coefficient for "is male" is any different to zero (when also adjusting for body weight).
# The above notes imply that the inclusion of "sex" as a predictor is statistically unnecessary when it comes to modeling the response for these data.
##(ii)
names(summary(cats.fit))
summary(cats.fit)$r.squared
# The coefficient of determination, 'R-squared', shows that for your fitted model, 64.5% of the variation in heart weight is able to be captured by the regression.
summary(cats.fit)$fstatistic
1-pf(129.1056,df1=2,df2=141)
# Reading from the summary output, or running the line above, the result of the omnibus F-test is a tiny p-value; effectively zero. This suggests very strong evidence against the null hypothesis (H0 is that modeling heart weight isn't improved by taking body weight and sex into account).
#(c)
predict(cats.fit,newdata=data.frame(Bwt=3.4,Sex="F"),interval="prediction",level=0.95)
#(d)
plot(cats$Bwt,cats$Hwt,col=cats$Sex,xlab="Body weight (kg)",ylab="Heart weight (g)")
legend("topleft",legend=c("female","male"),col=c(1,2),pch=c(1,1))
Bwt.seq <- seq(min(cats$Bwt)-0.5,max(cats$Bwt)+0.5,length=30)
n <- length(Bwt.seq)
cats.pred <- predict(cats.fit,newdata=data.frame(Bwt=rep(Bwt.seq,2),Sex=rep(c("M","F"),each=n)))
lines(Bwt.seq,cats.pred[1:n],col=2) 
lines(Bwt.seq,cats.pred[(n+1):(2*n)])
# The two superimposed lines are positively sloped according to the coefficient for "Bwt", but extremely close together, mirroring the minimal impact (and lack of statistical significance) of "Sex".
#(e)
library("boot")
?nuclear
pairs(nuclear)
#(f)
nuc.fit1 <- lm(cost~t1+t2,data=nuclear)
summary(nuc.fit1)
#(g)
nuc.fit2 <- lm(cost~t1+t2+date,data=nuclear)
summary(nuc.fit2)
# By including "date" in the linear model, this completely removes the statistical significance of "t1" as seen in the previous model. In fact, the coefficient for "t1" changes signs! What this implies is the previous positive, significant relationship between "t1" and "cost" is actually explained more by "date", owing to the positive correlation of "t1" with "date", and it is "date" that should probably be used in a fitted model. The "t2" predictor remains non-significant, albeit with a reduced p-value in this latest model.
#(h)
nuc.fit3 <- lm(cost~date+cap+ne,data=nuclear)
summary(nuc.fit3) # Fitted model is "cost" = -6458 + 95.4*"date of permit issue" + 0.42*"capacity" + 126.1*"constructed in north-east"
confint(nuc.fit3) # All intervals exclude null value of zero, reflecting their significance in the model summary.
#(i)
detroit <- data.frame(Murder=c(8.6,8.9,8.52,8.89,13.07,14.57,21.36,28.03,31.49,37.39,46.26,47.24,52.33),Police=c(260.35,269.8,272.04,272.96,272.51,261.34,268.89,295.99,319.87,341.43,356.59,376.69,390.19),Unemploy=c(11,7,5.2,4.3,3.5,3.2,4.1,3.9,3.6,7.1,8.4,7.7,6.3),Guns=c(178.15,156.41,198.02,222.1,301.92,391.22,665.56,1131.21,837.6,794.9,817.74,583.17,709.59))
detroit
pairs(detroit)
# The number of police seems to be the single most telling variable for prediction of murder numbers.
#(j)
murd.fit <- lm(Murder~Police+Unemploy+Guns,data=detroit)
summary(murd.fit)
summary(murd.fit)$r.squared
# "Mean murders" = -68.85 + 0.281*"no. of police" + 0.147*"unemployment" + 0.014*"no. of gun licenses".
# After adjusting for "no. of gun licenses", and "unemployment", each additional police per 100000 population is related to a mean increase of 0.28 murders per 100000 population.
# After adjusting for "no. of police", and "unemployment", each additional gun license per 100000 population results in a mean increase of 0.014 murders per 100000 population.
# After adjusting for "no. of gun licenses", and "no. of police", each additional percentage of unemployment results in a mean increase of 0.147 murders per 100000 population.
# No, it doesn't make sense to claim that *any* of the relationships are causal, particularly based only one data set and analysis. Causality is extremely difficult to prove in general. In this case, the idea that having a larger police force 'causes' more murders, for example, is rather difficult to justify.
#(k)
summary(murd.fit)$r.squared
# Approx. 97.67% of the variability in mean murder numbers is explained by the three-predictor model (this can also be seen from the model summary).
murd.fit2 <- lm(Murder~Police+Guns,data=detroit)
summary(murd.fit2)
summary(murd.fit2)$r.squared
## The coefficient of determination has barely changed from before; approx. 97.63% of the variability in mean murder numbers is now explained by the two-predictor model. Removing the unemployment predictor variable has had little discernable impact on the model's ability to explain the variation in the murder numbers. This mirrors the non-significant nature of "unemployment rate" when it is included in the model---non-significance implies there is no evidence to suggest varying the unemployment rate will change the mean response.
#(l)
predict(murd.fit2,newdata=data.frame(Police=c(300,300),Guns=c(500,0)),interval="confidence",level=0.99)

##########
## 21.2 ##
##########
#(a)
gal <- data.frame(d=c(573,534,495,451,395,337,253),h=c(1,0.8,0.6,0.45,0.3,0.2,0.1))
plot(gal$d~gal$h,pch=19,xlab="Initial height",ylab="Distance traveled")
#(b)
##(i)
gal.fit.order2 <- lm(d~h+I(h^2),data=gal)
summary(gal.fit.order2)
##(ii)
gal.fit.order3 <- lm(d~h+I(h^2)+I(h^3),data=gal)
summary(gal.fit.order3)
gal.fit.order4 <- lm(d~h+I(h^2)+I(h^3)+I(h^4),data=gal)
summary(gal.fit.order4)
# These models reveal that the order 3 model is significant in it's highest-order term, and the fit is improved in terms of the coefficient of determination. The same cannot be said for the order 4 model. 
#(c)
# Based on the above, out of the three fitted models, the cubic function in height seems preferable -- in other words, the relationship between "distance traveled" and "initial height" therefore appears cubic -- the quadratic model seems too simple, and the quartic model seems uneccessarily complex.
hseq <- seq(0.05,1.05,length=30)
gal.pred <- predict(gal.fit.order3,newdata=data.frame(h=hseq),interval="confidence",level=0.9)
lines(hseq,gal.pred[,1])
lines(hseq,gal.pred[,2],lty=2)
lines(hseq,gal.pred[,3],lty=2)
#(d)
library("faraway")
?trees
plot(trees$Volume~trees$Girth,pch=19,xlab="Girth",ylab="Volume")
#(e)
tree.fit1 <- lm(Volume~Girth+I(Girth^2),trees)
summary(tree.fit1) ## "Mean volume" = 10.79 - 2.09*"girth" + 0.254*"girth^2"
tree.fit2 <- lm(log(Volume)~log(Girth),trees)
summary(tree.fit2) ## "Mean log(volume)" = -2.35 + 2.20*"log(girth)"
# Coefficients of determination are similar; the quadratic model is slightly higher. Both indicate a statistically significant positive effect of girth on volume. Based on the F-test, both models are clearly better than fitting an intercept alone (i.e. girth does appear to be able to explain (mean) volume very well).
#(f)
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
# The fitted values of the models themselves are extremely similar. However, the prediction intervals tell a different story. Notably, the quadratic model has far wider limits for small girth values than for larger ones. On the other hand, the limits for the logged model are substantially wider than those of the quadratic model at larger girth values. Which model is 'better'...? It's very difficult to answer that without further information...
#(g)
library("MASS")
car.fit <- lm(mpg~wt+hp+disp,data=mtcars)
summary(car.fit)
#(h)
car.fit <- lm(I(1/mpg)~wt+hp+disp,data=mtcars)
summary(car.fit)
# Both fits to the mtcars data here provide similar levels of significance for the three predictors; though there is a mild yet noticeable improvement in the coefficient of determination for the latter model based on a response of GPM = 1/MPG.

##########
## 21.3 ##
##########
library("MASS")
#(a)
cat.fit <- lm(Hwt~Bwt*Sex,data=cats)
summary(cat.fit)
# The main-effects-only version of the model had a mild negative effect of "sex male", and it was not significant. In this version, the effect of being male is more extreme, and the p-value is far smaller, now providing weak evidence of significance. The interactive term for the slope of 'Bwt' for a male is reduced somewhat compared to females (estimated parameter is negative).
#(b)
plot(cats$Bwt,cats$Hwt,col=cats$Sex,ylab="Heart weight (g)",xlab="Body weight (kg)")
legend("topleft",legend=c("Female","Male"),col=1:2,pch=1)
cat.coefs <- coef(cat.fit)
abline(coef=cat.coefs[1:2])
abline(coef=c(sum(cat.coefs[c(1,3)]),sum(cat.coefs[c(2,4)])),col=2)
# Lines of the fitted model are no longer parallel; the effect of the weakly significant interaction is apparent.
#(c)
predict(cat.fit,newdata=data.frame(Bwt=3.4,Sex="F"),interval="prediction",level=0.95)
# Sigma's heart weight predicted from the new model is around 1.5 grams lighter than predicted from the main-effects-only model in the earlier exercise. The prediction interval is set accordingly lower as well, but is also wider than the interval from earlier.
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
# The interactive effect is highly significant in the untransformed model from (d), but completely non-significant after log-transformation of all present variables. This suggests that 'straight-line' relationships are not the best way to model these data (you can experiment with plots if you wish), and that we must account for curvature in the response surface by either working with transformed data or including the two-way interaction between the two untransformed continuous predictors. Once more, it is difficult to decide on which approach ought to be preferred -- we need to know more about the nature of the data themselves in context, as well as the ultimate purpose of the fitted model.
#(f)
car.fit <- lm(mpg~factor(cyl)*hp+wt,data=mtcars)
summary(car.fit)
#(g)
coef(car.fit)
# The interactive effect is between a continuous (hp) and a categorical (factor(cyl)) predictor. As such, each of the two estimated coefficents can be interpreted as the change in the slope of hp for each of the non-reference levels of factor(cyl).
coef(car.fit)[4] # When the car has 4 cylinders (reference level), the slope for hp is -0.0995 (to 4 decimal places)
coef(car.fit)[4] + coef(car.fit)[6] # When the car has 6 cylinders, the slope for hp is -0.0995 + 0.0781 = -0.0214 (to 4 decimal places)
coef(car.fit)[4] + coef(car.fit)[7] # When the car has 8 cylinders, the slope for hp is -0.0995 + 0.0860 = -0.0135 (to 4 decimal places)
# This model suggests that as hp increases, mean MPG decreases (for a fixed wt). However, in comparison to 4-cylinder cars, mean MPG is estimated to decrease at a slower rate with an increasing hp for both 6- and 8-cylinder cars (since the positive additive terms to the baseline slope of -0.0995 still provide negative slopes in hp, but ones that are closer to zero).
#(h)
##(i)
predict(car.fit,newdata=data.frame(wt=c(2.1,3.9,2.9),hp=c(100,210,200),cyl=c(4,8,6)),interval="confidence",level=0.95)
# The first car is the only car that has a point estimate of mean MPG that is higher than your mother's demand of 25, so this would be the initial choice.
##(ii)
# Although the point estimate for Car 3 is much less than 25, looking at the confidence intervals you can see that the interval for Car 3 includes 25. So, you could argue to your mother that you're 95% confident that the true mean MPG of a car like Car 3 lies somewhere in that interval; in particular, your model suggests no evidence against the hypothesis that the true mean MPG of such a car is equal to 25. Of course, the interval also includes possible true values that are far worse than 25... but you don't need to tell your mother that.

