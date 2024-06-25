##########
## 18.2 ##
##########
#(a)
library("MASS")
?anorexia
t.test(anorexia[,3],anorexia[,2],alternative="greater",paired=TRUE)
# p-value ~0.0023. Less than 0.05; some evidence to reject H0. There is evidence to suggest that the mean post-weight is greater than the mean pre-weight.
#(b)
t.test(anorexia[anorexia$Treat=="Cont",3],anorexia[anorexia$Treat=="Cont",2],alternative="greater",paired=TRUE)
t.test(anorexia[anorexia$Treat=="CBT",3],anorexia[anorexia$Treat=="CBT",2],alternative="greater",paired=TRUE)
t.test(anorexia[anorexia$Treat=="FT",3],anorexia[anorexia$Treat=="FT",2],alternative="greater",paired=TRUE)
# There is no statistical evidence to reject the claim that there is no difference between the pre- and post-weight means in the control group, mild evidence to reject at the 5% level for the CBL treatment, and strong evidence to reject in favor of HA for the FT treatment. It would seem that the FT treatment is the most effective based on these data.
#(c)
?PlantGrowth
control <- PlantGrowth$weight[PlantGrowth$group=="ctrl"]
treated <- PlantGrowth$weight[PlantGrowth$group!="ctrl"]
# H0: mu_control - mu_treated = 0; HA: mu_control - mu_treated < 0
max(c(sd(control),sd(treated)))/min(c(sd(control),sd(treated)))
# Ratio of (large sd) / (small sd) is less than 2 so use pooled variance according to rule-of-thumb.
#(d)
t.test(x=control,y=treated,alternative="less",var.equal=TRUE)
# Large p-value ~0.41. There is no evidence to reject H0. There is insufficient evidence to conclude that the mean treated weight is more than the mean untreated weight.
#(e)
myt.test <- function(x,y,paired=FALSE,var.equal=FALSE,...){	
  if(!paired){
    sdx <- sd(x)
    sdy <- sd(y)
    sd.big <- max(c(sdx,sdy))
    sd.small <- min(c(sdx,sdy))
    var.equal <- (sd.big/sd.small)<2
  }
  return(t.test(x=x,y=y,paired=paired,var.equal=var.equal,...))
}
#(f)
# Example 1
snacks <- c(87.7,80.01,77.28,78.76,81.52,74.2,80.71,79.5,77.87,81.94,80.7,82.32,
            75.78,80.19,83.91,79.4,77.52,77.62,81.4,74.89,82.95,73.59,77.92,77.18,
            79.83,81.23,79.28,78.44,79.01,80.47,76.23,78.89,77.14,69.94,78.54,79.7,
            82.45,77.29,75.52,77.21,75.99,81.94,80.41,77.7)
snacks2 <- c(80.22,79.73,81.1,78.76,82.03,81.66,80.97,81.32,80.12,78.98,79.21,
             81.48,79.86,81.06,77.96,80.73,80.34,80.01,81.82,79.3,79.08,79.47,
             78.98,80.87,82.24,77.22,80.03,79.2,80.95,79.17,81)
myt.test(x=snacks2,y=snacks,alternative="greater",conf.level=0.9)
# Example 2
men <- c(102,87,101,96,107,101,91,85,108,67,85,82)
women <- c(73,81,111,109,143,95,92,120,93,89,119,79,90,126,62,92,77,106,105,111)
myt.test(x=men,y=women,alternative="two.sided",conf.level=0.95)
# Example 3
rate.before <- c(52,66,89,87,89,72,66,65,49,62,70,52,75,63,65,61) 
rate.after <- c(51,66,71,73,70,68,60,51,40,57,65,53,64,56,60,59) 
myt.test(x=rate.after,y=rate.before,alternative="less",paired=TRUE,conf.level=0.95)

