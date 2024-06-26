##########
## 21.1 ##
##########

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

#(a)
plot(cats$Bwt,cats$Hwt,col=cats$Sex,xlab="Body weight (kg)",ylab="Heart weight (g)")
legend("topleft",legend=c("female","male"),col=c(1,2),pch=c(1,1)) # Females are black, since the levels of the factor vector cats$Sex are in the alphabetical order of "F" "M", which R interprets as 1 and 2 when this factor vector is passed to the 'col' argument of 'plot'.

# b. Fit a least-squares multiple linear regression model using heart weight as
# the response variable and the other two variables as predictors, and view a
# model summary.

cats.fit <- lm(Hwt~Bwt+Sex,data=cats)
summary(cats.fit)

##(i)
# i. Write down the equation for the fitted model and interpret the estimated
# regression coefficients for body weight and sex. Are both statistically
# significant? What does this say about the relationship between the response
# and predictors?

# "Mean heart weight" = -0.415 + 4.076*"Body weight" - 0.082*"is male"
# For cats of the same sex, the effect of an additional kg of body weight is, on average, an extra 4.076 grams of heart weight. For cats of the same body weight, the heart weight of a male is, on average, 0.082 grams lighter than that of a female.
# The model states the effect of body weight is highly statistically significant -- there is evidence to believe body weight does indeed affect heart weight. However, the effect of sex is not significant. There is no statistical evidence to suggest the coefficient for "is male" is any different to zero (when also adjusting for body weight).
# The above notes imply that the inclusion of "sex" as a predictor is statistically unnecessary when it comes to modeling the response for these data.


# ii. Report and interpret the coefficient of determination and the outcome of
# the omnibus F -test.

names(summary(cats.fit))
summary(cats.fit)$r.squared
# The coefficient of determination, 'R-squared', shows that for your fitted model, 64.5% of the variation in heart weight is able to be captured by the regression.
summary(cats.fit)$fstatistic
1-pf(129.1056,df1=2,df2=141)
# Reading from the summary output, or running the line above, the result of the omnibus F-test is a tiny p-value; effectively zero. This suggests very strong evidence against the null hypothesis (H0 is that modeling heart weight isn't improved by taking body weight and sex into account).


# c. Tilman’s cat, Sigma, is a 3.4 kg female. Use your model to esti- mate her
# mean heart weight and provide a 95 percent prediction interval.

predict(cats.fit,newdata=data.frame(Bwt=3.4,Sex="F"),interval="prediction",level=0.95)

# d. Use predict to superimpose continuous lines based on the fitted linear
# model on your plot from (a), one for male cats and one for female. What do
# you notice? Does this reflect the statistical significance (or lack thereof)
# of the parameter estimates?


plot(cats$Bwt,cats$Hwt,col=cats$Sex,xlab="Body weight (kg)",ylab="Heart weight (g)")
legend("topleft",legend=c("female","male"),col=c(1,2),pch=c(1,1))
Bwt.seq <- seq(min(cats$Bwt)-0.5,max(cats$Bwt)+0.5,length=30)
n <- length(Bwt.seq)
cats.pred <- predict(cats.fit,newdata=data.frame(Bwt=rep(Bwt.seq,2),Sex=rep(c("M","F"),each=n)))
lines(Bwt.seq,cats.pred[1:n],col=2) 
lines(Bwt.seq,cats.pred[(n+1):(2*n)])

# The two superimposed lines are positively sloped according to the coefficient for "Bwt", but extremely close together, mirroring the minimal impact (and lack of statistical significance) of "Sex".
#(e)

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


library("boot")
?nuclear
pairs(nuclear)

# f. One of the original objectives was to predict the cost of further
# construction of these power plants. Create a fit and summary of a linear
# regression model that aims to model cost by t1 and t2, two variables that
# describe different elapsed times associated with the application for and
# issue of various permits. Take note of the estimated regression coefficients
# and their significance in the fitted model.
#(f)

nuc.fit1 <- lm(cost~t1+t2,data=nuclear)
summary(nuc.fit1)

# g. Refit the model, but this time also include an effect for the date the
# construction permit was issued. Contrast the output for this new model
# against the previous one. What do you notice, and what does this information
# suggest about the relationships in the data with respect to these predictors?

nuc.fit2 <- lm(cost~t1+t2+date,data=nuclear)
summary(nuc.fit2)

# By including "date" in the linear model, this completely removes the
  # statistical significance of "t1" as seen in the previous model. In fact,
  # the coefficient for "t1" changes signs! What this implies is the previous
  # positive, significant relationship between "t1" and "cost" is actually
  # explained more by "date", owing to the positive correlation of "t1" with
  # "date", and it is "date" that should probably be used in a fitted model.
  # The "t2" predictor remains non-significant, albeit with a reduced p-value
  # in this latest model.

# h. Fit a third model for power plant cost, using the predictors for “date of
# permit issue,” “power plant capacity,” and the binary variable describing
# whether the plant was sited in the north- eastern United States. Write down
# the fitted model equation and provide 95 percent confidence intervals for
# each estimated coefficient.

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

