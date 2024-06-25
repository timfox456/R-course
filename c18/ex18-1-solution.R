##########
## 18.1 ##
##########
#(a)
### H0: mu = 3.5; HA: mu != 3.5 (two-sided test)
tstat <- (3.97-3.5)/(2.21/sqrt(73))
tstat
pt(-tstat,df=72)+(1-pt(tstat,df=72))
### p-value is around 0.073, this is > than alpha=0.05, therefore insufficient evidence to reject the null hypothesis. There is no evidence that the true mean cat weight is different to 3.5.
#(b)
# H0: mu = 4.3; HA: mu > 4.3 (one-sided test)
t.test(quakes$mag,mu=4.3,alternative="greater",conf.level=0.99)
# p-value very small; strong evidence to reject the null. There is evidence to suggest that the true mean magnitude is greater than 4.3.
#(c)
mean(quakes$mag)+c(-1,1)*qt(0.995,df=999)*sd(quakes$mag)/sqrt(1000)

