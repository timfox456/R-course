
##########
## 19.1 ##
##########

# Consider the following data:

# These figures provide the depths (in centimeters) at which important
# archaeological finds were made at four sites in New Mex- ico (see Woosley and
# Mcintyre, 1996). Store these data in your R workspace, with one vector
# containing depth and the other vector containing the site of each
# observation.

mim <- c(93,120,65,105,115,82,99,87,100,90,78,95,93,88,110,85,45,80,28,75,70,65,55,50,40,100,75,65,40,73,65,50,30,45,50,45,55,96,58,95,90,65,80,85,95,82)
site <- c(rep("I",15),rep("II",10),rep("III",12),rep("IV",9))

# a. Produce side-by-side boxplots of the depths split by group, and use
# additional points to mark the locations of the sample means.
boxplot(mim~site)
mim.means <- tapply(mim,INDEX=site,FUN=mean)
points(1:4,mim.means,pch=4)


# b. Assuming independence, execute diagnostic checks for normal- ity and
# equality of variances.
mim.meancen <- mim-rep(mim.means,table(site))
qqnorm(mim.meancen)
qqline(mim.meancen) # Seems consistent with normality based on a visual inspection.
sds <- tapply(mim,INDEX=site,FUN=sd)
max(sds)/min(sds) # Less than 2 so variances can be assumed equal according to the rule-of-thumb.


# c. Perform and conclude a one-way ANOVA test for evidence of a difference
# between the means. In Section 14.4, you looked at the data set providing
# measurements on petal and sepal sizes for three species of iris flowers. This
# is avail- able in R as iris. d. Based on diagnostic checks for normality and
# equality of vari- ances, decide which of the four outcome measurements (sepal
# length/width and petal length/width) would be suitable for ANOVA (using the
# species as the group variable).

summary(aov(mim~site)) # Small p-value. Very strong evidence against H0. There is evidence to reject the null and conclude there is a difference in the mean depths of the finds across the four sites.
#(d)
m <- tapply(iris$Sepal.Length,iris$Species,mean)
mc <- iris$Sepal.Length-m[as.numeric(iris$Species)]
qqnorm(mc)
qqline(mc) # Looks approximately normal.
tapply(iris$Sepal.Length,iris$Species,sd) # max(sd)/min(sd) < 2 so variances may be assumed equal.
m <- tapply(iris$Sepal.Width,iris$Species,mean)
mc <- iris$Sepal.Width-m[as.numeric(iris$Species)]
qqnorm(mc)
qqline(mc) # Looks approximately normal.
tapply(iris$Sepal.Width,iris$Species,FUN=sd) # max(sd)/min(sd) < 2 so variances may be assumed equal.
m <- tapply(iris$Petal.Length,iris$Species,mean)
mc <- iris$Petal.Length-m[as.numeric(iris$Species)]
qqnorm(mc)
qqline(mc) # Looks approximately normal; some deviation though.
tapply(iris$Petal.Length,iris$Species,sd) # max(sd)/min(sd) > 2 so variances may not be assumed equal.
m <- tapply(iris$Petal.Width,iris$Species,mean)
mc <- iris$Petal.Width-m[as.numeric(iris$Species)]
qqnorm(mc)
qqline(mc) # Looks approximately normal.
tapply(iris$Petal.Width,iris$Species,FUN=sd) # max(sd)/min(sd) > 2 so variances may not be assumed equal.

# e. Carry out one-way ANOVA for any suitable measurement variables.
summary(aov(Sepal.Length~Species,data=iris))
summary(aov(Sepal.Width~Species,data=iris))
# Both p-values are very small. Strong evidence to reject H0 and conclude that the mean sepal lengths and widths do vary according to species.



