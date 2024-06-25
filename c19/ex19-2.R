# Ex 19-2

# Bring up the quakes data frame again, which describes the loca- tions,
# magnitudes, depths, and number of observation stations that detected 1,000
# seismic events off the coast of Fiji.

# a. Use cut (see Section 4.3.3) to create a new factor vector defin- ing the
# depths of each event according to the following three categories: (0,200],
# (200,400], and (400,680].

# b. Decide whether a one-way ANOVA or a Kruskal-Wallis test is more
# appropriate to use to compare the distributions of the number of detecting
# stations, split according to the three cate- gories in (a).

# c. Perform your choice of test in (b) (assume a α = 0.01 level of sig-
# nificance) and conclude.

# Load the MASS package with a call to library("MASS") if you haven’t already
# done so in the current R session. This package includes the ready-to-use
# Cars93 data frame, which contains detailed data on 93 cars for sale in the
# United States in 1993 (Lock, 1993; Venables and Ripley, 2002).

# d. Use aggregate to compute the mean length of the 93 cars, split by two
# categorical variables: AirBags (type of airbags available—levels are Driver &
# Passenger, Driver only, and None), and Man.trans.avail (whether the car comes
# in a manual transmission—levels are Yes and No).

# e. Produce an interaction plot using the results in (d). Does there appear to
# be an interactive effect of AirBags with Man.trans.avail on the mean length
# of these cars (if you consider only these variables)?

# f. Fit a full two-way ANOVA model for the mean lengths according to the two
# grouping variables (assume satisfaction of all relevant assumptions). Is the
# interactive effect statistically significant? Is there evidence of any main
# effects?

