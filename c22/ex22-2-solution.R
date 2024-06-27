##########
## 22.2 ##
##########

# Ex 22-2

# In Section 22.2.2, you used the nuclear data frame in the boot package to
# illustrate forward selection, where a model was selected for cost as a
# function of main effects of date, cap, pt, and ne.

#(a)
# a. Access the data frame; fit and summarize the model described earlier.

library("boot")
nuc.fit <- lm(cost~date+cap+pt+ne,data=nuclear)
summary(nuc.fit)

#(b)

# b. Inspect the raw residuals versus fitted values and a normal QQ plot of the
# residuals and comment on your interpretations— do the assumptions
# underpinning the error component of the linear model appear satisfied in this
# case?

plot(nuc.fit,which=1)
plot(nuc.fit,which=2)

# The residuals vs. fitted plot doesn't suggest any major causes of concern:
# the points appear randomly scattered around zero with no indication of
# heteroscedasticity. However, there is one clear extreme observation, labeled
# 19, that should be kept in mind. The QQ plot also shows little cause for
# concern with fairly modest deviation of the residuals from the normal
# quantiles, though again, observation 19 departs considerably. All in all, it
# seems reasonable to assume satisfaction of the error assumptions for now (at
# the very least, there is no clearly obvious violation thereof).


# c. Determine the rule-of-thumb cutoff for influential observations based on
# the Cook’s distances. Produce a plot of the Cook’s distances and add a
# horizontal line corresponding to the cutoff. Comment on your findings.
#(c)
cutoff <- 4/nrow(nuclear)
cutoff
plot(nuc.fit,which=4)
abline(h=cutoff,lty=2)

# The Cook's distances demonstrate what you might already have expected: that
# observation 19 is highly influential. It breaches the rule-of-thumb cut-off
# of 0.125 by a considerable amount. Observation 10 is the next most
# influential, albeit one that registers a Cook's distance less than 0.125.

# d. Produce a combination diagnostic plot of the standardized residuals
# against leverage. Set the Cook’s distance contours to include the cutoff
# value from (c) as well as the default contours. Interpret the plot—how are
# any individually influential points characterized?
#(d)

plot(nuc.fit,which=5,cook.levels=c(cutoff,0.5,1))

# Observation 19 sits in a low-to-medium leverage position; it's the large
# residual for that point that pushes it past the rule-of-thumb contour. The
# same characterization can be applied to the other two labeled points that
# have more or less the same leverage (observations 10 and 12), though their
# smaller residuals mean a correspondingly lower influence.

#(e)
# e. Based on (c) and (d), you should be able to identify the record in nuclear
# exerting the largest influence on the fitted model. For the sake of argument,
# let’s assume the observation was recorded incorrectly. Refit the model from
# (a), this time omitting the offending row from the data frame. Summarize the
# model— which coefficients have changed the most? Produce the diag- nostic
# plots from (b) for the new model and compare them to the ones from earlier.

nuc.fit2 <- lm(cost~date+cap+pt+ne,data=nuclear[-19,])
summary(nuc.fit2)
plot(nuc.fit2,which=1)
plot(nuc.fit2,which=2)

# Assuming there's a good reason to remove observation 19, once done so, the
# plots of the residuals are improved in terms of satisfaction of the
# assumptions of the error component. Independence and homgeneity are
# illustrated with randomness around zero, and normality also appears
# reasonable. Points 10 and 12 are now the top two extreme points, joined by
# observation 7.

#(f)

# f. Using diabetes, fit the multiple linear model identified in the earlier
# exercise, that is, with main effects and a two-way inter- action between age
# and frame and a main effect for waist. By summarizing the fit, determine the
# number of records that contained missing values in diabetes that were deleted
# from the estimation.

diabetes <- read.csv("diabetes.csv", stringsAsFactors=TRUE)

dia.fit <- lm(chol~age*frame+waist,data=diabetes)
summary(dia.fit)


# Load the faraway package and access the diabetes data frame. In Exercise 22.1
# (g), you used stepwise AIC selection to choose a model for chol.

#(g)

# g. Produce the raw residuals versus fitted and QQ diagnostic plots for the
# model in (f). Comment on the validity of the error assumptions.

plot(dia.fit,which=1)
plot(dia.fit,which=2)

# Very similar to the interpretation of the plots in the earlier exercise (b),
# the error assumptions seem satisfied here, with randomness around zero and
# homoscedasticity seemingly valid. There are some extreme positive residuals,
# namely point 63. The QQ plot does appear to exhibit some departure from
# normality in the upper tail, with the three extreme points 63, 295 and 148
# not helping in that respect. Estimation will remain valid if normality is
# questionable, though the estmates might not be 'optimal' in a theoretical
# sense.

# h. 

# h. Investigate influential points. Make use of the familiar rule- of-thumb
# cutoff (note you’ll need to subtract the number of missing values from the
# total size of the data frame to get the effective sample size for your
# model). In the combination plot of the standardized residuals against
# leverage, use one, three, and five times the cutoff as the Cook’s distance
# contours.


#(h)
nrow(diabetes)-15
cutoff <- 4/(nrow(diabetes)-15)
cutoff
plot(dia.fit,which=5,cook.levels=c(1,3,5)*cutoff)

# The size of the data set results in a relatively small rule-of-thumb
# influence cut-off of around 0.01. A number of points breach this mark, though
# the overall pattern of the standardized residuals vs. leverage appears
# consistent with the contours, so we shouldn't be especially concerned here.
# There are three points that breach the '3 times cut-off' contour. Point 63 is
# in a very low leverage position, but its extreme residual leads it to be
# highly influential. Points 4 and 148 have much smaller residuals, but their
# position in much higher leverage areas when compared with 63 which means they
# too are considered highly influential here.

# Recall the discussion of reading in web-based files in Section 8.2.3. There,
# you called in a data frame containing data on the prices of 308 diamonds (in
# Singapore dollars), as well as weight (in carats— continuous), color
# (categorical—six levels from D, the least yellow and the reference level, to
# I, the most yellow), clarity (categorical— five levels with IF, essentially
# flawless and the reference level, VVS1, VVS2, VS1, and VS2, with the last
# being the least clear), and certification (categorical—three levels for
# different diamond certification bodies with levels GIA as the reference, HRD
# and IGI). Seek out the freely available article by Chu (2001) for more
# information on these data. With an Internet connection, run the following
# lines, which will read in the data as the object diamonds and name each
# variable column appropriately.

dia.url <- "http://www.amstat.org/publications/jse/v9n2/4cdata.txt"
diamonds <- read.table(dia.url)
names(diamonds) <- c("Carat","Color","Clarity","Cert","Price")

# i. Using either base R graphics or ggplot2, to get a feel for the data,
# produce a scatterplot of the price on the y-axis and carat weight on the
# x-axis. Experiment with using plotting color to split the points according to
# the following:

# – Diamond clarity
# – Diamond color
# – Diamond certification

#(i)
dia.url <- "http://www.amstat.org/publications/jse/v9n2/4cdata.txt"
diamonds <- read.table(dia.url)
names(diamonds) <- c("Carat","Color","Clarity","Cert","Price")
plot(diamonds$Carat,diamonds$Price,pch=19,col=as.numeric(diamonds$Clarity))
legend("topleft",legend=levels(diamonds$Clarity),col=1:length(levels(diamonds$Clarity)),pch=19)
plot(diamonds$Carat,diamonds$Price,pch=19,col=as.numeric(diamonds$Color))
legend("topleft",legend=levels(diamonds$Color),col=1:length(levels(diamonds$Color)),pch=19)
plot(diamonds$Carat,diamonds$Price,pch=19,col=as.numeric(diamonds$Cert))
legend("topleft",legend=levels(diamonds$Cert),col=1:length(levels(diamonds$Cert)),pch=19)

# j. Fit a multiple linear model with Price as the response and main effects
# for the other variables as the predictors. Summarize the model and produce
# the three diagnostic plots that tell you about the assumptions surrounding
# the error term. Comment on the plots—are you satisfied that this is an
# appropriate model for the diamond prices? Why or why not?

#(j)
sparkly.fit <- lm(Price~Carat+Color+Clarity+Cert,data=diamonds)
summary(sparkly.fit)
plot(sparkly.fit,which=1)
plot(sparkly.fit,which=2)
plot(sparkly.fit,which=3)

# There seems to be clear, systematic non-linearity in the estimated residuals.
# This violates the linearity assumption of the trends in our data, and
# suggests our current model is inadequate in terms of representation of the
# data at hand. Based on the plots from (i), should we try modeling a
# log-transformation of the response?

# Normality is also affected---there is rather obvious deviation, from the
# distribution, particularly in the upper tail.

# Barring three extreme points, though, plots 1 and 3 don't show that the
# assumptions of homoscedasticity is violated---the variability of the
# residuals remains more or less constant.

# k. Repeat (j) but use the log transformation of Price. Again, inspect and
# comment on the validity of the error assumptions.

#(k)
sparkly.fit2 <- lm(log(Price)~Carat+Color+Clarity+Cert,data=diamonds)
summary(sparkly.fit2)
plot(sparkly.fit2,which=1)
plot(sparkly.fit2,which=2)
plot(sparkly.fit2,which=3)

# Log-transformation of Price has done nothing to curb the clear, systematic,
# non-linear appearance of the residuals. A non-linear trend still appears very
# promenent. However, the log-transformation has reigned in the extreme points
# and the severity of the non-normality to a certain extent.

# l. Repeat (k), but in modeling the log-price, this time include an additional
# quadratic term for Carat (refer to Section 21.4.1 for details on polynomial
# transformations). How do the residual diagnostics look now?

#(l)
sparkly.fit3 <- lm(log(Price)~Carat+I(Carat^2)+Color+Clarity+Cert,data=diamonds)
summary(sparkly.fit3)
plot(sparkly.fit3,which=1)
plot(sparkly.fit3,which=2)
plot(sparkly.fit3,which=3)
# Including an order 2 polynomial term in Carat has eliminated much of the concern of the non-linear curvature.
# Normality is more apparent now, and there's little if any concern of heteroscedasticity.

# This third model is by far the most appropriate of the three (with respect to
# the residual diagnostics) when it comes to modeling the cost of diamonds in
# light of the available data.



