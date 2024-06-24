## Ex 14-1

# Recall the built-in InsectSprays data frame, containing counts of insects on
# various agricultural units treated with one of six sprays.


# a. Produce a histogram of the counts of insects using base R graphics.


# b. Obtain the total number of insects found according to each spray (this was
# also asked in Exercise 13.2 (f) on page 273). Then, use base R graphics to
# produce a vertical barplot and a pie chart of these totals, labeling each
# plot appropriately.


# c. Use ggplot2 functionality to generate side-by-side boxplots of the counts
# of insects according to each spray type and include appropriate axis labels
# and a title.


# Yet another of R’s useful ready-to-use data sets is USArrests, contain- ing
# data on the number of arrests for murder, rape, and assault per 100,000
# individuals in each of the 50 states of the United States, recorded in 1973
# (see, for example, McNeil, 1977). It also includes a variable giving the
# percentage of urban-based population in each state. Briefly inspect the data
# frame object and the accompanying documentation ?USArrests. Then complete the
# following:


# d. Use ggplot2 functionality to generate a right-exclusive histogram of the
# proportion of urban population for the states. Set your breaks to be 10 units
# each, between 0 and 100. Have the histo- gram show the first quartile, the
# median, and the third quartile; then provide a matching legend. Use colors as
# you like and include appropriate axis annotation.


# e. The code t(as.matrix(USArrests[,-3])) creates a matrix of the USArrests
# data without the urban population column, and the built-in R object state.abb
# provides the two-letter state abbrevia- tions, in alphabetical order, as a
# character vector. Use these two structures and base R graphics to produce a
# horizontal, stacked barplot with the horizontal bars labeled with state
# abbreviations and with each bar split according to the type of crime (murder,
# rape, and assault). Include a legend.

# f. Define a new factor vector urbancat that is set to 1 if the corre-
# sponding state has an urban population percentage greater than the median
# percentage and is set to 0 otherwise.

# g. Create a new copy of USArrests in your workspace, after deleting the
# UrbanPop column, leaving just the three crime rate variables. Then insert a
# new, fourth column in this object with urbancat.

# h. Use the data frame from (g) to produce a scatterplot matrix and other
# associated plots of the three crime rates against one another via GGally
# functionality. Use color to split the crime rates according to the two levels
# of urbancat.

# Return to the built-in quakes data set.

# i . Create a factor vector corresponding to the magnitudes. Each entry should
# assume one of three categories based on breaks marked by the minimum
# magnitude, the 13 th quantile, the 23 th quantile, and the maximum magnitude.

# j. Re-create the plot shown next, where low-, medium-, and high- magnitude
# events, according to your factor vector from (i), are plotted with pch being
# assigned 1, 2, and 3, respectively.

# k. Add a legend to the plot from (j) to reference the three pch values.

