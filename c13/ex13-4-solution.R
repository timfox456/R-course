

##########
## 13.4 ##
##########
#(a)
w <- c(55,85,75,42,93,63,58,75,89,67)
h <- c(161,185,174,154,188,178,170,167,181,178)
cor(w,h)
#(b)
##(i)
mtcars
?mtcars
##(ii)
plot(mtcars$hp,mtcars$qsec,xlab="horsepower",ylab="1/4 mile time")
cor(mtcars$hp,mtcars$qsec)
##(iii)
tran <- factor(mtcars$am,labels=c("auto","manual"))
##(iv)
library(ggplot2)
qplot(mtcars$hp,mtcars$qsec,col=tran,xlab="horsepower",ylab="1/4 mile time")
##(v)
cor(mtcars$hp[tran=="manual"],mtcars$qsec[tran=="manual"])
cor(mtcars$hp[tran=="auto"],mtcars$qsec[tran=="auto"]) ### Separated by transmission type, correlations are more extreme than when pooled. Manual cars have a slightly more extreme negative correlation between the two variables than automatic cars.
#(c)
##(i)
sunchicks <- chickwts$weight[chickwts$feed=="sunflower"]
plot(sunchicks,rep(0,length(sunchicks)),yaxt="n",bty="n",xlab="sunflower chick weights",ylab="")
abline(h=0,col="gray",lty=2)
##(ii)
sd(sunchicks)
IQR(sunchicks)
##(iii)
sd(sunchicks[-which(sunchicks==min(sunchicks))])
IQR(sunchicks[-which(sunchicks==min(sunchicks))]) ### Both measures of spread decrease with the deletion of the lowest weight; though the sd is affected more than the IQR...

