##########
## 19.2 ##
##########
#(a)
depth.fac <- cut(quakes$depth,breaks=c(0,200,400,680))
table(depth.fac)
#(b)
m <- tapply(quakes$stations,depth.fac,mean)
mc <- quakes$stations-m[as.numeric(depth.fac)]
hist(mc)
qqnorm(mc)
qqline(mc) # Data appear non-normal... Kruskal-Wallis preferred over parametric one-way ANOVA
#(c)
kruskal.test(quakes$stations~depth.fac) # P-value > 0.01 (just barely); retain null. Minimal evidence, at best, of a difference in median number of detecting stations according to depth.fac categories.
#(d)
library("MASS")
cars.means <- aggregate(Cars93$Length,by=list(Cars93$AirBags,Cars93$Man.trans.avail),FUN=mean)
cars.means
#(e)
interaction.plot(x.factor=cars.means[,1],trace.factor=cars.means[,2],respons=cars.means$x,trace.label="Manual avail.",xlab="Airbags",ylab="Mean length") # There is some visual indication of interactive behavior owing to the non-parallel nature of the two lines; but rememeber there are no measures of variability of the various group means displayed on this plot...
#(f)
summary(aov(Length~AirBags+Man.trans.avail+AirBags:Man.trans.avail,data=Cars93)) # No formal statistical evidence of an interactive effect. Strong evidence of main effects, however -- both 'Airbags' and 'Man.trans.avail' appear to be related to car length.

