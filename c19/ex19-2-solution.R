##########
## 19.2 ##
##########
#(a)
# Bring up the quakes data frame again, which describes the loca- tions,
# magnitudes, depths, and number of observation stations that detected 1,000
# seismic events off the coast of Fiji.

# a. Use cut (see Section 4.3.3) to create a new factor vector defin- ing the
# depths of each event according to the following three categories: (0,200],
# (200,400], and (400,680].

depth.fac <- cut(quakes$depth,breaks=c(0,200,400,680))
table(depth.fac)

# b. Decide whether a one-way ANOVA or a Kruskal-Wallis test is more
# appropriate to use to compare the distributions of the number of detecting
# stations, split according to the three cate- gories in (a).

m <- tapply(quakes$stations,depth.fac,mean)
mc <- quakes$stations-m[as.numeric(depth.fac)]
hist(mc)
qqnorm(mc)
qqline(mc) # Data appear non-normal... Kruskal-Wallis preferred over parametric one-way ANOVA


# c. Perform your choice of test in (b) (assume a α = 0.01 level of sig-
# nificance) and conclude.

kruskal.test(quakes$stations~depth.fac) # P-value > 0.01 (just barely); retain null. Minimal evidence, at best, of a difference in median number of detecting stations according to depth.fac categories.

#(d)

# Load the MASS package with a call to library("MASS") if you haven’t already
# done so in the current R session. This package includes the ready-to-use
# Cars93 data frame, which contains detailed data on 93 cars for sale in the
# United States in 1993 (Lock, 1993; Venables and Ripley, 2002).

# d. Use aggregate to compute the mean length of the 93 cars, split by two
# categorical variables: AirBags (type of airbags available—levels are Driver &
# Passenger, Driver only, and None), and Man.trans.avail (whether the car comes
# in a manual transmission—levels are Yes and No).

library("MASS")
cars.means <- aggregate(Cars93$Length,by=list(Cars93$AirBags,Cars93$Man.trans.avail),FUN=mean)
cars.means

# e. Produce an interaction plot using the results in (d). Does there appear to
# be an interactive effect of AirBags with Man.trans.avail on the mean length
# of these cars (if you consider only these variables)?

#(e)
interaction.plot(x.factor=cars.means[,1],trace.factor=cars.means[,2],respons=cars.means$x,trace.label="Manual avail.",xlab="Airbags",ylab="Mean length") # There is some visual indication of interactive behavior owing to the non-parallel nature of the two lines; but rememeber there are no measures of variability of the various group means displayed on this plot...

#(f)

# f. Fit a full two-way ANOVA model for the mean lengths according to the two
# grouping variables (assume satisfaction of all relevant assumptions). Is the
# interactive effect statistically significant? Is there evidence of any main
# effects?
summary(aov(Length~AirBags+Man.trans.avail+AirBags:Man.trans.avail,data=Cars93)) # No formal statistical evidence of an interactive effect. Strong evidence of main effects, however -- both 'Airbags' and 'Man.trans.avail' appear to be related to car length.

# Ex 19-2


