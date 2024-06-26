##########
## 21.2 ##
##########
#(a)
gal <- data.frame(d=c(573,534,495,451,395,337,253),h=c(1,0.8,0.6,0.45,0.3,0.2,0.1))
plot(gal$d~gal$h,pch=19,xlab="Initial height",ylab="Distance traveled")
#(b)
##(i)
gal.fit.order2 <- lm(d~h+I(h^2),data=gal)
summary(gal.fit.order2)
##(ii)
gal.fit.order3 <- lm(d~h+I(h^2)+I(h^3),data=gal)
summary(gal.fit.order3)
gal.fit.order4 <- lm(d~h+I(h^2)+I(h^3)+I(h^4),data=gal)
summary(gal.fit.order4)
# These models reveal that the order 3 model is significant in it's highest-order term, and the fit is improved in terms of the coefficient of determination. The same cannot be said for the order 4 model. 
#(c)
# Based on the above, out of the three fitted models, the cubic function in height seems preferable -- in other words, the relationship between "distance traveled" and "initial height" therefore appears cubic -- the quadratic model seems too simple, and the quartic model seems uneccessarily complex.
hseq <- seq(0.05,1.05,length=30)
gal.pred <- predict(gal.fit.order3,newdata=data.frame(h=hseq),interval="confidence",level=0.9)
lines(hseq,gal.pred[,1])
lines(hseq,gal.pred[,2],lty=2)
lines(hseq,gal.pred[,3],lty=2)
#(d)
library("faraway")
?trees
plot(trees$Volume~trees$Girth,pch=19,xlab="Girth",ylab="Volume")
#(e)
tree.fit1 <- lm(Volume~Girth+I(Girth^2),trees)
summary(tree.fit1) ## "Mean volume" = 10.79 - 2.09*"girth" + 0.254*"girth^2"
tree.fit2 <- lm(log(Volume)~log(Girth),trees)
summary(tree.fit2) ## "Mean log(volume)" = -2.35 + 2.20*"log(girth)"
# Coefficients of determination are similar; the quadratic model is slightly higher. Both indicate a statistically significant positive effect of girth on volume. Based on the F-test, both models are clearly better than fitting an intercept alone (i.e. girth does appear to be able to explain (mean) volume very well).
#(f)
gseq <- seq(7,21,length=30)
tree.pred1 <- predict(tree.fit1,newdata=data.frame(Girth=gseq),interval="prediction")
tree.pred2 <- predict(tree.fit2,newdata=data.frame(Girth=gseq),interval="prediction")
plot(trees$Volume~trees$Girth,pch=19,xlab="Girth",ylab="Volume")
lines(gseq,tree.pred1[,1],lwd=2)
lines(gseq,tree.pred1[,2])
lines(gseq,tree.pred1[,3])
lines(gseq,exp(tree.pred2[,1]),lwd=2,lty=2)
lines(gseq,exp(tree.pred2[,2]),lty=2)
lines(gseq,exp(tree.pred2[,3]),lty=2)
legend("topleft",legend=c("quadratic","logged"),lty=1:2)
# The fitted values of the models themselves are extremely similar. However, the prediction intervals tell a different story. Notably, the quadratic model has far wider limits for small girth values than for larger ones. On the other hand, the limits for the logged model are substantially wider than those of the quadratic model at larger girth values. Which model is 'better'...? It's very difficult to answer that without further information...
#(g)
library("MASS")
car.fit <- lm(mpg~wt+hp+disp,data=mtcars)
summary(car.fit)
#(h)
car.fit <- lm(I(1/mpg)~wt+hp+disp,data=mtcars)
summary(car.fit)
# Both fits to the mtcars data here provide similar levels of significance for the three predictors; though there is a mild yet noticeable improvement in the coefficient of determination for the latter model based on a response of GPM = 1/MPG.

