
######################################
#### SUGGESTED EXERCISE SOLUTIONS ####
######################################



##########
## 13.3 ##
##########
#(a)
quantile(chickwts$weight,c(0.1,0.3,0.9))
chickvars <- tapply(chickwts$weight,INDEX=chickwts$feed,FUN=var)
chickvars[chickvars==max(chickvars)]
#(b)
##(i)
IQR(quakes$depth)
##(ii)
summary(quakes$mag[quakes$depth>=400]) ### Magnitudes at <400 have a similar amount of spread as those at >=400 (and an equivalent IQR of 0.5), but are centered at slightly higher values.
##(iii)
dmin <- min(quakes$depth)
dmax <- max(quakes$depth)
depthcat <- cut(quakes$depth,breaks=seq(dmin,dmax,length=5),include.lowest=TRUE,right=FALSE)
levels(depthcat)
##(iv)
tapply(quakes$mag,INDEX=depthcat,FUN=mean)
tapply(quakes$mag,INDEX=depthcat,FUN=sd)
##(v)
tapply(quakes$mag,INDEX=depthcat,FUN=quantile,prob=0.8)

