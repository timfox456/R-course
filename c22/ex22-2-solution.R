##########
## 22.2 ##
##########
#(a)
library("boot")
nuc.fit <- lm(cost~date+cap+pt+ne,data=nuclear)
summary(nuc.fit)
#(b)
plot(nuc.fit,which=1)
plot(nuc.fit,which=2)
# The residuals vs. fitted plot doesn't suggest any major causes of concern: the points appear randomly scattered around zero with no indication of heteroscedasticity. However, there is one clear extreme observation, labeled 19, that should be kept in mind. The QQ plot also shows little cause for concern with fairly modest deviation of the residuals from the normal quantiles, though again, observation 19 departs considerably. All in all, it seems reasonable to assume satisfaction of the error assumptions for now (at the very least, there is no clearly obvious violation thereof).
#(c)
cutoff <- 4/nrow(nuclear)
cutoff
plot(nuc.fit,which=4)
abline(h=cutoff,lty=2)
# The Cook's distances demonstrate what you might already have expected: that observation 19 is highly influential. It breaches the rule-of-thumb cut-off of 0.125 by a considerable amount. Observation 10 is the next most influential, albeit one that registers a Cook's distance less than 0.125.
#(d)
plot(nuc.fit,which=5,cook.levels=c(cutoff,0.5,1))
# Observation 19 sits in a low-to-medium leverage position; it's the large residual for that point that pushes it past the rule-of-thumb contour. The same characterization can be applied to the other two labeled points that have more or less the same leverage (observations 10 and 12), though their smaller residuals mean a correspondingly lower influence.
#(e)
nuc.fit2 <- lm(cost~date+cap+pt+ne,data=nuclear[-19,])
summary(nuc.fit2)
plot(nuc.fit2,which=1)
plot(nuc.fit2,which=2)
# Assuming there's a good reason to remove observation 19, once done so, the plots of the residuals are improved in terms of satisfaction of the assumptions of the error component. Independence and homgeneity are illustrated with randomness around zero, and normality also appears reasonable. Points 10 and 12 are now the top two extreme points, joined by observation 7.
#(f)
library("faraway")
dia.fit <- lm(chol~age*frame+waist,data=diabetes)
summary(dia.fit)
#(g)
plot(dia.fit,which=1)
plot(dia.fit,which=2)
# Very similar to the interpretation of the plots in the earlier exercise (b), the error assumptions seem satisfied here, with randomness around zero and homoscedasticity seemingly valid. There are some extreme positive residuals, namely point 63. The QQ plot does appear to exhibit some departure from normality in the upper tail, with the three extreme points 63, 295 and 148 not helping in that respect. Estimation will remain valid if normality is questionable, though the estmates might not be 'optimal' in a theoretical sense.
#(h)
nrow(diabetes)-15
cutoff <- 4/(nrow(diabetes)-15)
cutoff
plot(dia.fit,which=5,cook.levels=c(1,3,5)*cutoff)
# The size of the data set results in a relatively small rule-of-thumb influence cut-off of around 0.01. A number of points breach this mark, though the overall pattern of the standardized residuals vs. leverage appears consistent with the contours, so we shouldn't be especially concerned here. There are three points that breach the '3 times cut-off' contour. Point 63 is in a very low leverage position, but its extreme residual leads it to be highly influential. Points 4 and 148 have much smaller residuals, but their position in much higher leverage areas when compared with 63 which means they too are considered highly influential here.
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
#(j)
sparkly.fit <- lm(Price~Carat+Color+Clarity+Cert,data=diamonds)
summary(sparkly.fit)
plot(sparkly.fit,which=1)
plot(sparkly.fit,which=2)
plot(sparkly.fit,which=3)
# There seems to be clear, systematic non-linearity in the estimated residuals. This violates the linearity assumption of the trends in our data, and suggests our current model is inadequate in terms of representation of the data at hand. Based on the plots from (i), should we try modeling a log-transformation of the response?
# Normality is also affected---there is rather obvious deviation, from the distribution, particularly in the upper tail.
# Barring three extreme points, though, plots 1 and 3 don't show that the assumptions of homoscedasticity is violated---the variability of the residuals remains more or less constant.
#(k)
sparkly.fit2 <- lm(log(Price)~Carat+Color+Clarity+Cert,data=diamonds)
summary(sparkly.fit2)
plot(sparkly.fit2,which=1)
plot(sparkly.fit2,which=2)
plot(sparkly.fit2,which=3)
# Log-transformation of Price has done nothing to curb the clear, systematic, non-linear appearance of the residuals. A non-linear trend still appears very promenent.
# However, the log-transformation has reigned in the extreme points and the severity of the non-normality to a certain extent.
#(l)
sparkly.fit3 <- lm(log(Price)~Carat+I(Carat^2)+Color+Clarity+Cert,data=diamonds)
summary(sparkly.fit3)
plot(sparkly.fit3,which=1)
plot(sparkly.fit3,which=2)
plot(sparkly.fit3,which=3)
# Including an order 2 polynomial term in Carat has eliminated much of the concern of the non-linear curvature.
# Normality is more apparent now, and there's little if any concern of heteroscedasticity.
# This third model is by far the most appropriate of the three (with respect to the residual diagnostics) when it comes to modeling the cost of diamonds in light of the available data.
