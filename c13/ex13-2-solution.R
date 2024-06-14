##########
## 13.2 ##
##########
# a. Obtain, rounded to two decimal places, the proportion of seis- mic events
# in the quakes data frame that occurred at a depth of 300 km or deeper.

round(mean(quakes$depth>=300),2)

# b. Remaining with the quakes data set, calculate the mean and median
# magnitudes of the events that occurred at a depth of 300 km or deeper

mean(quakes$mag[quakes$depth>=300])
median(quakes$mag[quakes$depth>=300])

# c. Using the chickwts data set, write a for loop that gives you the mean
# weight of chicks for each feed type—the same as the results given by the
# tapply function in Section 13.2.1. Display the results rounded to one decimal
# place and, when printing, ensure each mean is labeled with the appropriate
# feed type.

for(i in levels(chickwts$feed)){
  cat(i,": ",round(mean(chickwts$weight[chickwts$feed==i]),1)," grams\n",sep="")
}

# Another ready-to-use data set (in the automatically loaded datasets package)
# is InsectSprays. It contains data on the number of insects found on various
# agricultural units, as well as the type of insect spray that was used on each
# unit. Ensure you can access the data frame at the prompt; then study the help
# file ?InsectSprays to get an idea of R’s representation of the two variables.



# d. Identify the two variable types in InsectSprays (as per the defini- tions
# in Section 13.1.1 and Section 13.1.2).

#(d) count: numeric-discrete; spray: categorical-nominal

# e. Calculate the modes of the distribution of insect counts, regard- less of
# spray type.

Ctab <- table(InsectSprays$count)
Ctab[Ctab==max(Ctab)]

# f. Use tapply to report the total insect counts by each spray type.

tapply(InsectSprays$count,INDEX=InsectSprays$spray,FUN=sum)

# g. Using the same kind of for loop as in (c), compute the percent- age of
# agricultural units in each spray type group that had at least five bugs on
# them. When printing to the screen, round the percentages to the nearest whole
# number.

for(i in levels(InsectSprays$spray)){
  cat("Spray ",i,"; at least 5 bugs: ",round(mean(InsectSprays$count[InsectSprays$spray==i]>=5)*100,0),"% \n",sep="")
}

# h. Obtain the same numeric results as in (g), with rounding, but use tapply
# and a disposable function.

tapply(InsectSprays$count,INDEX=InsectSprays$spray,FUN=function(x) round(mean(x>=5)*100,0))

