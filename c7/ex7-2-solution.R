#########
## 7.2 ##
#########
w <- c(55,85,75,42,93,63,58,75,89,67)
h <- c(161,185,174,154,188,178,170,167,181,178)
s <- factor(c("female","male","male","female","male","male","female","male","male","female"))
qplot(w,h,color=s,shape=s,xlab="Weight (kg)",ylab="Height (cm)",main="Height against weight for 10 people") + geom_point(size=4)

