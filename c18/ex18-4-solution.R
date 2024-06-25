##########
## 18.4 ##
##########
#(a) H0: No relationship between hair and eye color; HA: There is a relationship.
?HairEyeColor
chisq.test(x=HairEyeColor[,,1]+HairEyeColor[,,2])
# Very small P-value. Very strong evidence against the null. Reject H0 and conclude there does appear to be a relationship between hair and eye color of statistics students.
#(b) H0: p1=p2=p3=1/3; HA: H0 is incorrect
library("car")
data(Duncan)
?Duncan
jobtype <- Duncan$type
jobtype.tab <- table(jobtype)
jobtype.tab
chisq.test(jobtype.tab)
##(i) With a significance level of 0.05 and a p-value of 0.015, there is weak evidence to reject H0 and we therefore conclude that the three job types do not appear to be unifomly represented in the data set.
##(ii) With a significance level of 0.01 and a P-value of 0.015, there is no evidence to reject H0 and we therefore conclude that the three job types appear to be unifomly represented in the data set. 

