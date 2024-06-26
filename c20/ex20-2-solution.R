

##########
## 20.1 ##
##########

library("MASS")
survfit <- lm(Height~Wr.Hnd,data=survey)

#(a)
predict(survfit,newdata=data.frame(Wr.Hnd=c(12,15.2,17,19.9)),interval="confidence",level=0.99)
#(b)
incomplete.obs <- which(is.na(survey$Height)|is.na(survey$Wr.Hnd))
rho.xy <- cor(survey$Wr.Hnd,survey$Height,use="complete.obs")
b1 <- sd(survey$Height[-incomplete.obs])/sd(survey$Wr.Hnd[-incomplete.obs])*rho.xy
b1
b0 <- mean(survey$Height[-incomplete.obs])-b1*mean(survey$Wr.Hnd[-incomplete.obs])
b0
#(c)

##(i)
plot(survey$Height~survey$Pulse,xlab="Pulse rate (bpm)",ylab="Height (cm)")
survfit <- lm(Height~Pulse,data=survey)
survfit # Model equation is  y = 177.86 - 0.072x
abline(survfit,lwd=2)
##(ii)
summary(survfit) # For each additional bpm, the mean student height is estimated to decrease by 0.072cm; p-value for slope is 0.275. No evidence to reject H0. Insufficient evidence to conclude that pulse rate affects mean student height.
confint(survfit,level=0.9)
##(iii)
xseq <- data.frame(Pulse=seq(30,110,length=100))
survfit.ci <- predict(survfit,newdata=xseq,interval="confidence",level=0.9)
survfit.pi <- predict(survfit,newdata=xseq,interval="prediction",level=0.9)
lines(xseq[,1],survfit.ci[,2],lty=2)
lines(xseq[,1],survfit.ci[,3],lty=2)
lines(xseq[,1],survfit.pi[,2],lty=2,col="grey")
lines(xseq[,1],survfit.pi[,3],lty=2,col="grey")
legend("topleft",legend=c("90% CI","90% PI"),lty=2,col=c("black","grey"))
##(iv)
incomplete.obs <- which(is.na(survey$Height)|is.na(survey$Pulse))
abline(h=mean(survey$Height[-incomplete.obs]),col=2,lty=3,lwd=3) # The line sits in the middle of the CI bands without breaching them. This supports the conclusion that pulse rate is not significantly related to mean student height.
#(d)
?mtcars
plot(mtcars$mpg~mtcars$wt,xlab="Weight (lbs/1000)",ylab="MPG")
#(e)
carfit <- lm(mpg~wt,data=mtcars)
carfit
abline(carfit,lwd=2)
#(f)
summary(carfit) # mean MPG = 37.28 - 5.34*weight # For each extra 1000lbs of weight, the mean MPG decreases by 5.34; p-value for slope is very small---result is statistically significant---strong evidence to suggest that mean MPG changes according to weight (for cars of this era).
#(g)
predict(carfit,newdata=data.frame(wt=6),interval="prediction",level=0.95) # Predicting at 6000lbs seems untrustworthy. Extrapolation is far enough outside the range of the observed data such that the associated PI has a lower limit that is negative, which makes no sense in terms of the response variable of MPG.

##########
## 20.2 ##
##########
library("MASS")
#(a)
table(survey$Exer)
boxplot(survey$Height~survey$Exer)
#(b)
survfit <- lm(Height~Exer,data=survey)
summary(survfit) # The reference level of the predictor defaults to the first level of the factor, which in this case (as is the default in R) is alphabetically arranged to be 'Freq'.
#(c)
# We observe that both of the levels for which we've obtained coefficient estimates yield p-values that suggest evidence the coefficients are different to zero.
# The coefficient corresponding to 'some' has the smallest p-value of the two additive dummy levels.
# The negative point estimates of both estimates tell us that the model predicts the effect on height of being in either the 'none' or the 'some' categories, when compared to the 'frequent' category, is one of a decrease. In other words, it appears those who exercise less than 'frequent' are shorter on average.
# The shortest mean height is reserved for those in the 'none' exercise category; the estimated coefficient (-5.58) is more extreme than the coefficient for 'some' (-4.21).
# Overall statistical significance of the predictor (in terms of the effect of exercise on height) is supported by the global (omnibus F-test) P-value of 0.0035.
#(d)
one.of.each <- factor(levels(survey$Exer))
one.of.each
predict(survfit,newdata=data.frame(Exer=one.of.each),interval="prediction")
#(e)
summary(aov(Height~Exer,data=survey)) # Same 'global' P-value as the lm model summary. There is evidence to suggest mean student height differs according to exercise frequency.
#(f)
ExerReordered <- relevel(survey$Exer,ref="None")
levels(ExerReordered)
summary(aov(Height~ExerReordered,data=survey)) # There is no change to the omnibus F-test if we reorder the the reference level of exercise to be 'none', and nor should we expect there to be. The global test of a difference between the means doesn't depend on what we set the baseline value of the response to be.
#(g)
carfit <- lm(qsec~gear,data=mtcars)
summary(carfit) # The effect of 'gear' when treated as a continuous variable is interpreted as a decrease in quarter-mile time of around 0.5 seconds, on average, for each additional forward gear. However, there is no evidence that this effect is different to zero, with a high P-value of 0.243 (and a similar global p-value)
#(h)
carfit2 <- lm(qsec~factor(gear),data=mtcars)
summary(carfit2) # The effect of 'gear' when treated as a categorical variable now appears to be statistically significant. Having 4 gears (as opposed to the reference level of 3) seems to increase the mean quarter-mile time by 1.27 seconds, having 5 gears appears to decrease the mean quarter-mile time by 2.05 seconds. The global (omnibus F-test) p-value is also quite small, yielding evidence in support of an effect of 'gear' on 'qsec'.
#(i)
plot(mtcars$qsec~mtcars$gear,xlab="No. of Gears",ylab="Quarter-mile Time")
abline(carfit,lwd=2) # The plot indicates clearly that the difference between the two models is due to the fact that the relationship cannot be well explained by a continuous straight line. The first model therefore is incapable of realistically capturing the effect of changing categories in 'gear' on 'qsec'.

