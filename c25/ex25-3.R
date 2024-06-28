# Ex 25-3

# Remember that you inspected various multiple linear regression models of the
# cost of nuclear power plant construction in Chapters 21 and 22. The goal now
# will be to visually assess the impact of including/excluding an interactive
# term between two continuous predictors using contours. Revisit the nuclear
# data set, available when you load the boot package, and bring up the help
# file to refresh your memory of the variables present.

# a. Fit and summarize two linear models with construction cost as the response
# variable according to the following guidelines:

# i. The first should account for main effects of the two predic- tors
# concerning the date of issue of the construction permit and plant capacity.

# ii. The second, in addition to the two main effects, should include an
# interaction between permit issue date and capacity.

# b. Set up appropriate z-matrices for plotting each of these response
# surfaces. Each one should be based on a 50 × 50 evaluation grid constructed
# using evenly spaced sequences in the capacity and date variables.

# c. Specify mfrow in par so that you can display default contour plots for the
# two response surfaces from (a)(i) and (a)(ii) next to one another. Do they
# appear similar? Does this tie in with the statistical significance (or lack
# thereof) of the interaction term in (a)(ii)?

# d. To directly compare the two surfaces, use your choice of built-in color
# palette to produce a filled contour plot of the main-effects- only model and
# superimpose the contour lines of the interactive model on it. Take note of
# the following:

# – This plot is achieved in a single call to filled.contour. Recall the
# special way you use plot.axes to draw additional features on an existing
# color-filled contour plot.

# – The contour lines of the interactive model can be added with an appropriate
# call to contour. Recall the use of the optional argument add.

# – The superimposed contours should be dashed lines of double thickness.

# – The x- and y-axes should be included and given tidy titles.

# – Add some brief text describing the filled contours versus the contour
# lines, with reference to the two versions of the construction cost model and
# with an additional call to text that makes use of a single mouse-clicked
# location from locator (see Section 23.3). Note that this call will need to
# fully relax clipping for the text to be visible in any of the margins.

# e. Another built-in data frame in R, faithful, contains observations of
# waiting times and durations of eruptions of the Old Faithful geyser in
# Yellowstone National Park, Wyoming. See the docu- mentation in ?faithful for
# details. Plot the data with duration on the y-axis and waiting time on the
# x-axis.

# f. Estimate the bivariate density of these data via KDE using a 100 × 100
# evaluation grid and produce a default contour plot thereof.

# g. Create a filled contour plot of the kernel estimate using a cus- tom
# palette that ranges from "darkblue" to "hotpink"; include the raw data as
# half-size gray points. Label the axes and titles appropriately.

# h. Replot the raw data as gray, 3/4-sized, type 2 point characters; set the
# style of the axes to restrict to exactly the ranges of the observed data; and
# ensure tidy axis titles and a main title. To this plot, add the contour lines
# of the density estimate at the specific levels obtained in a sequence from
# 0.002 to 0.014 in steps of 0.004. Suppress the labeling of the contours. The
# contour lines should be dark red and increase in line width thickness for
# higher levels of the density. Add a legend referencing the density level at
# each of these lines.
