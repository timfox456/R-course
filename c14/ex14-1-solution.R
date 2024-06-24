

##########
## 14.1 ##
##########
## Ex 14-1

# Recall the built-in InsectSprays data frame, containing counts of insects on
# various agricultural units treated with one of six sprays.


library("ggplot2")
library("GGally")
# a. Produce a histogram of the counts of insects using base R graphics.
hist(InsectSprays$count)

# b. Obtain the total number of insects found according to each spray (this was
# also asked in Exercise 13.2 (f) on page 273). Then, use base R graphics to
# produce a vertical barplot and a pie chart of these totals, labeling each
# plot appropriately.

inspray <- levels(InsectSprays$spray)
incount <- tapply(InsectSprays$count,INDEX=InsectSprays$spray,FUN=sum)
barplot(incount,names.arg=inspray,xlab="Spray",ylab="Total insects",main="Barplot of number of insects\naccording to spray type",col="pink")
pie(incount,labels=inspray,main="Abundance of insects\naccording to spray type")

# c. Use ggplot2 functionality to generate side-by-side boxplots of the counts
# of insects according to each spray type and include appropriate axis labels
# and a title.

qplot(InsectSprays$spray,InsectSprays$count,geom="boxplot",xlab="Spray",ylab="# of insects",main="Boxplots of insect counts\naccording to spray type")

# Yet another of R’s useful ready-to-use data sets is USArrests, contain- ing
# data on the number of arrests for murder, rape, and assault per 100,000
# individuals in each of the 50 states of the United States, recorded in 1973
# (see, for example, McNeil, 1977). It also includes a variable giving the
# percentage of urban-based population in each state. Briefly inspect the data
# frame object and the accompanying documentation ?USArrests. Then complete the
# following:

# d. Use ggplot2 functionality to generate a right-exclusive histogram of the
# proportion of urban population for the states. Set your breaks to be 10 units
# each, between 0 and 100. Have the histo- gram show the first quartile, the
# median, and the third quartile; then provide a matching legend. Use colors as
# you like and include appropriate axis annotation.

USArrests
?USArrests
qplot(USArrests[,3],geom="blank",main="US states urban population",xlab="proportion urban") + geom_histogram(color="blue",fill="white",breaks=seq(0,100,10),closed="right") + geom_vline(mapping=aes(xintercept=c(quantile(USArrests[,3],0.25),median(USArrests[,3]),quantile(USArrests[,3],0.75)),linetype=factor(c("1st Q","median","3rd Q"))),show.legend=TRUE) + scale_linetype_manual(values=3:5) + labs(linetype="")

# e. The code t(as.matrix(USArrests[,-3])) creates a matrix of the USArrests
# data without the urban population column, and the built-in R object state.abb
# provides the two-letter state abbrevia- tions, in alphabetical order, as a
# character vector. Use these two structures and base R graphics to produce a
# horizontal, stacked barplot with the horizontal bars labeled with state
# abbreviations and with each bar split according to the type of crime (murder,
# rape, and assault). Include a legend.

ustab <- t(as.matrix(USArrests[,-3]))
barplot(ustab,names.arg=state.abb,horiz=T,las=1,legend.text=c("murder","rape","assault"),main="USA arrests per 100000\nby state and serious crime")
#(f)
# f. Define a new factor vector urbancat that is set to 1 if the corre-
# sponding state has an urban population percentage greater than the median
# percentage and is set to 0 otherwise.

urbancat <- rep(1,50)
urbancat[USArrests$UrbanPop<=median(USArrests$UrbanPop)] <- 0
urbancat <- factor(urbancat)
#(g)
# g. Create a new copy of USArrests in your workspace, after deleting the
# UrbanPop column, leaving just the three crime rate variables. Then insert a
# new, fourth column in this object with urbancat.

myUSArrests <- USArrests[,-3]
myUSArrests$urbancat <- urbancat
#(h)
# h. Use the data frame from (g) to produce a scatterplot matrix and other
# associated plots of the three crime rates against one another via GGally
# functionality. Use color to split the crime rates according to the two levels
# of urbancat.
ggpairs(myUSArrests,aes(col=urbancat),axisLabels="internal")

# Return to the built-in quakes data set.

# i . Create a factor vector corresponding to the magnitudes. Each entry should
# assume one of three categories based on breaks marked by the minimum
# magnitude, the 13 th quantile, the 23 th quantile, and the maximum magnitude.

#(i)
magquan <- quantile(quakes$mag,c(1/3,2/3))
magfac <- cut(quakes$mag,breaks=c(min(quakes$mag),magquan[1],magquan[2],max(quakes$mag)),include.lowest=TRUE)

# j. Re-create the plot shown next, where low-, medium-, and high- magnitude
# events, according to your factor vector from (i), are plotted with pch being
# assigned 1, 2, and 3, respectively.

plot(quakes[,2],quakes[,1],pch=(1:3)[magfac],xlab="Longitude",ylab="Latitude")

# k. Add a legend to the plot from (j) to reference the three pch values.

legend("bottomleft",legend=levels(magfac),pch=1:3)








