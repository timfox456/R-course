

##########
## 20.1 ##
##########


# Ex 20-1

# Here is the code for the preliminarry exercises in the book

survey <- read.csv("survey.csv")

survfit <- lm(Height~Wr.Hnd,data=survey)

survfit

plot(survey$Height~survey$Wr.Hnd,xlab="Writing handspan (cm)",ylab="Height (cm)")
abline(survfit,lwd=2)



obsA <- c(survey$Wr.Hnd[197],survey$Height[197])
obsA
obsB <- c(survey$Wr.Hnd[154],survey$Height[154])
obsB

#

names(survfit)

#

mycoefs <- coef(survfit)
mycoefs
beta0.hat <- mycoefs[1]
beta1.hat <- mycoefs[2]

#

plot(survey$Height~survey$Wr.Hnd,xlab="Writing handspan (cm)",ylab="Height (cm)")
abline(survfit,lwd=2)
segments(x0=c(obsA[1],obsB[1]),y0=beta0.hat+beta1.hat*c(obsA[1],obsB[1]),x1=c(obsA[1],obsB[1]),y1=c(obsA[2],obsB[2]),lty=2)



## 20.3.1 ##

summary(survfit)


## 20.3.2 ##

confint(survfit,level=0.95)


## 20.3.3 ##

rho.xy <- cor(survey$Wr.Hnd,survey$Height,use="complete.obs")
rho.xy^2


## 20.3.4 ##

names(summary(survfit))

#

summary(survfit)$sigma



################
# Section 20.4 #
################

## 20.4.1 ##

# no R code


## 20.4.2 ##

as.numeric(beta0.hat+beta1.hat*14.5)
as.numeric(beta0.hat+beta1.hat*24)

#

xvals <- data.frame(Wr.Hnd=c(14.5,24))
xvals
mypred.ci <- predict(survfit,newdata=xvals,interval="confidence",level=0.95)
mypred.ci

#

mypred.pi <- predict(survfit,newdata=xvals,interval="prediction",level=0.95)
mypred.pi


## 20.4.3 ##

plot(survey$Height~survey$Wr.Hnd,xlim=c(13,24),ylim=c(140,205),xlab="Writing handspan (cm)",ylab="Height (cm)")
abline(survfit,lwd=2)

#

points(xvals[,1],mypred.ci[,1],pch=8)
segments(x0=c(14.5,24),x1=c(14.5,24),y0=c(mypred.pi[1,2],mypred.pi[2,2]),y1=c(mypred.pi[1,3],mypred.pi[2,3]),col="gray",lwd=3)
segments(x0=c(14.5,24),x1=c(14.5,24),y0=c(mypred.ci[1,2],mypred.ci[2,2]),y1=c(mypred.ci[1,3],mypred.ci[2,3]),lwd=2)

#

xseq <- data.frame(Wr.Hnd=seq(12,25,length=100))
ci.band <- predict(survfit,newdata=xseq,interval="confidence",level=0.95)
pi.band <- predict(survfit,newdata=xseq,interval="prediction",level=0.95)

#

lines(xseq[,1],ci.band[,2],lty=2)
lines(xseq[,1],ci.band[,3],lty=2)
lines(xseq[,1],pi.band[,2],lty=2,col="gray")
lines(xseq[,1],pi.band[,3],lty=2,col="gray")
legend("topleft",legend=c("Fit","95% CI","95% PI"),lty=c(1,2,2),col=c("black","black","gray"),lwd=c(2,1,1))


## 20.4.4 ##

predict(survfit,newdata=data.frame(Wr.Hnd=50),interval="confidence",level=0.95)

# Exercise 20-1 


# a. Using your fitted model of student height on writing handspan, survfit,
# provide point estimates and 99 percent confidence intervals for the mean
# student height for handspans of 12, 15.2, 17, and 19.9 cm.

survfit <- lm(Height~Wr.Hnd,data=survey)
predict(survfit,newdata=data.frame(Wr.Hnd=c(12,15.2,17,19.9)),interval="confidence",level=0.99)



# b. In Section 20.1, you defined the object incomplete.obs, a numeric vector
# that provides the records of survey that were automati- cally removed from
# consideration when estimating the model parameters. Now, use the
# incomplete.obs vector along with survey and Equation (20.3) to calculate βˆ0
# and βˆ1 in R. (Remember the functions mean, sd, and cor. Ensure your answers
# match the output from survfit.)

#(b)
incomplete.obs <- which(is.na(survey$Height)|is.na(survey$Wr.Hnd))
rho.xy <- cor(survey$Wr.Hnd,survey$Height,use="complete.obs")
b1 <- sd(survey$Height[-incomplete.obs])/sd(survey$Wr.Hnd[-incomplete.obs])*rho.xy
b1
b0 <- mean(survey$Height[-incomplete.obs])-b1*mean(survey$Wr.Hnd[-incomplete.obs])
b0

# c. The survey data frame has a number of other variables present aside from
# Height and Wr.Hnd. For this exercise, the end aim is to fit a simple linear
# model to predict the mean student height, but this time from their pulse
# rate, given in Pulse (continue to assume the conditions listed in Section
# 20.2 are satisfied).


# i. Fit the regression model and produce a scatterplot with the fitted line
# superimposed upon the data. Make sure you can write down the fitted model
# equation and keep the plot open.

plot(survey$Height~survey$Pulse,xlab="Pulse rate (bpm)",ylab="Height (cm)")
survfit <- lm(Height~Pulse,data=survey)
survfit # Model equation is  y = 177.86 - 0.072x
abline(survfit,lwd=2)

# ii. Identify and interpret the point estimate of the slope, as well as the
# outcome of the test associated with the hypotheses

summary(survfit) # For each additional bpm, the mean student height is estimated to decrease by 0.072cm; p-value for slope is 0.275. No evidence to reject H0. Insufficient evidence to conclude that pulse rate affects mean student height.

# H0 : β1 = 0; HA : β1 , 0. Alsofinda90percentCIforthe slope parameter.
confint(survfit,level=0.9)

# iii. Using your model, add lines for 90 percent confidence and prediction
# interval bands on the plot from (i) and add a legend to differentiate between
# the lines.

xseq <- data.frame(Pulse=seq(30,110,length=100))
survfit.ci <- predict(survfit,newdata=xseq,interval="confidence",level=0.9)
survfit.pi <- predict(survfit,newdata=xseq,interval="prediction",level=0.9)
lines(xseq[,1],survfit.ci[,2],lty=2)
lines(xseq[,1],survfit.ci[,3],lty=2)
lines(xseq[,1],survfit.pi[,2],lty=2,col="grey")
lines(xseq[,1],survfit.pi[,3],lty=2,col="grey")
legend("topleft",legend=c("90% CI","90% PI"),lty=2,col=c("black","grey"))

# iv. Create an incomplete.obs vector for the current “height on pulse” data.
# Use that vector to calculate the sample mean of the height observations that
# were used for the model fitted in (i). Then add a perfectly horizontal line
# to the plot at this mean (use color or line type options to avoid confusion
# with the other lines present). What do you notice? Does the plot support your
# conclusions from (ii)?


incomplete.obs <- which(is.na(survey$Height)|is.na(survey$Pulse))
abline(h=mean(survey$Height[-incomplete.obs]),col=2,lty=3,lwd=3) # The line sits in the middle of the CI bands without breaching them. This supports the conclusion that pulse rate is not significantly related to mean student height.

# Next, examine the help file for the mtcars data set, which you first saw in
# Exercise 13.4 on page 287. For this exercise, the goal is to model fuel
# efficiency, measured in miles per gallon (MPG), in terms of the overall
# weight of the vehicle (in thousands of pounds).

data(mtcars)


# d. Plot the data—mpg on the y-axis and wt on the x-axis.

#(d)
?mtcars
plot(mtcars$mpg~mtcars$wt,xlab="Weight (lbs/1000)",ylab="MPG")

# e. Fit the simple linear regression model. Add the fitted line to the plot from (d).

#(e)
carfit <- lm(mpg~wt,data=mtcars)
carfit
abline(carfit,lwd=2)

# f. Write down the regression equation and interpret the point estimate of the
# slope. Is the effect of wt on mean mpg estimated to be statistically
# significant?

#(f)
summary(carfit) 

# mean MPG = 37.28 - 5.34*weight # For each extra 1000lbs of weight, the mean
# MPG decreases by 5.34; p-value for slope is very small---result is
# statistically significant---strong evidence to suggest that mean MPG changes
# according to weight (for cars of this era).


# g. Produce a point estimate and associated 95 percent PI for a car that
# weighs 6,000 lbs. Do you trust the model to predict observations accurately
# for this value of the explanatory variable? Why or why not?

#(g)
predict(carfit,newdata=data.frame(wt=6),interval="prediction",level=0.95) 

# Predicting at 6000lbs seems untrustworthy. Extrapolation is far enough
# outside the range of the observed data such that the associated PI has a
# lower limit that is negative, which makes no sense in terms of the response
# variable of MPG.

