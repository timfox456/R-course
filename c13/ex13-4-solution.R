

##########
## 13.4 ##
##########
# 13.4

# a. In Exercise 7.1 (b) on page 139, you plotted height against weight
# measurements. Compute the correlation coefficient based on the observed data
# of these two variables.

w <- c(55,85,75,42,93,63,58,75,89,67)
h <- c(161,185,174,154,188,178,170,167,181,178)
cor(w,h)

# b. Another of R’s built-in, ready-to-use data sets is mtcars, contain- ing a
# number of descriptive details on performance aspects of 32 automobiles.

# i. Ensure you can access this data frame by entering mtcars at the prompt.
# Then inspect its help file to get an idea of the types of data present.
##(i)

mtcars
?mtcars

# ii. Two of the variables describe a vehicle’s horsepower and shortest time
# taken to travel a quarter-mile distance. Using base R graphics, plot these
# two data vectors with horsepower on the x-axis and compute the correlation
# coefficient.

plot(mtcars$hp,mtcars$qsec,xlab="horsepower",ylab="1/4 mile time")
cor(mtcars$hp,mtcars$qsec)

# iii. Identify the variable in mtcars that corresponds to transmis- sion type.
# Use your knowledge of factors in R to create a new factor from this variable
# called tranfac, where manual cars should be labeled "manual" and automatic
# cars "auto".

##(iii)
tran <- factor(mtcars$am,labels=c("auto","manual"))

# iv. Now, use qplot from ggplot2 in conjunction with tranfac to produce the
# same scatterplot as in (ii) so that you’re able to visually differentiate
# between manual and automatic cars.

library(ggplot2)
qplot(mtcars$hp,mtcars$qsec,col=tran,xlab="horsepower",ylab="1/4 mile time")

# v. Finally, compute separate correlation coefficients for horse- power and
# quarter-mile time based on the transmission of the vehicles and, comparing
# these estimates with the overall value from (ii), briefly comment on what you
# note.
cor(mtcars$hp[tran=="manual"],mtcars$qsec[tran=="manual"])
cor(mtcars$hp[tran=="auto"],mtcars$qsec[tran=="auto"]) ### Separated by transmission type, correlations are more extreme than when pooled. Manual cars have a slightly more extreme negative correlation between the two variables than automatic cars.


# c. Return to chickwts to complete the following tasks:

# i. Produce a plot like the left panel of Figure 13-7, based on the weights of
# chicks on the sunflower diet only. Note that one of the sunflower-fed chicks
# has a far lower weight than the others.

sunchicks <- chickwts$weight[chickwts$feed=="sunflower"]
plot(sunchicks,rep(0,length(sunchicks)),yaxt="n",bty="n",xlab="sunflower chick weights",ylab="")
abline(h=0,col="gray",lty=2)

# ii. Compute the standard deviation and IQR of the weights of the
# sunflower-fed chicks.
sd(sunchicks)
IQR(sunchicks)

# iii. Now, suppose you’re told that the lowest weight of the sunflower-fed
# chicks was caused by a certain illness, irrele- vant to your research. Delete
# this observation and recalculate the standard deviation and IQR of the
# remaining sunflower chicks. Briefly comment on the difference in calculated
# values.

sd(sunchicks[-which(sunchicks==min(sunchicks))])
IQR(sunchicks[-which(sunchicks==min(sunchicks))]) ### Both measures of spread decrease with the deletion of the lowest weight; though the sd is affected more than the IQR...








