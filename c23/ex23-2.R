# Exercise 23-2

# For the following tasks, you’ll work with the diamond-pricing data as
# analyzed by Chu (2001). You’ll need an Internet connection for this. Read the
# data in and name the columns as you’ve done previously with the following:

dia.url <- "http://www.amstat.org/publications/jse/v9n2/4cdata.txt"
diamonds <- read.table(dia.url)
names(diamonds) <- c("Carat","Color","Clarity","Cert","Price")

# a. Open a new graphics device of 6 × 6 inches. Initialize the margin spacing
# to be zero, four, two, and zero lines on the bottom, left, top, and right of
# the plot region, respectively. Then, complete the following:

# i. Produce side-by-side boxplots of the diamond prices in Singapore dollars
# (SGD$) split by certification. Suppress all axes and the surrounding box—note
# that the boxplot command requires you to set frame=FALSE for suppressing the
# box (as opposed to bty="n" in plot). Use the same command to provide an
# appropriate title.

# ii. Next, insert a vertical axis. The axis should have tick marks ranging
# from SGD$0 to SGD$18000, progressing in steps of SGD$2000. However, the axis
# should be clipped to the plotting region. The axis tick marks should point
# inward and be one line in length. The axis labels should sit only half a line
# away from the axis and should be horizontally readable.

# iii. Finally, use locator in conjunction with text to add an appro- priate
# title sitting at the top of the y-axis; note that clipping will need to be
# relaxed. Use the same approach to add text, sitting inside each boxplot,
# denoting the corresponding certification (GIA, HRD, or IGI). My version of
# the plot looks like this:

# Now, open a new graphics device of 8 × 7 inches. Set the figure margins to be
# two, five, three, and five lines on the bottom, left, top, and right,
# respectively. Also allow one line of outer margin space on each side other
# than the bottom, which should get two lines of outer margin.

# i. Produce a scatterplot of diamond price on the vertical axis and carat
# weight on the horizontal axis. Use the colors red, green, and blue to
# distinguish the points according to certification. Suppress all axes, boxes,
# labels, and titles in the initial plot, but then add a U-shaped box.

# ii. Add the horizontal axis. Use axis to place tick marks at an evenly spaced
# sequence of carat values between 0.2 and 1.1, in steps of 0.1. Use a bold,
# italic, sans-style font for the labels and adjust the labels to be only half
# a line from the axis. Then add smaller, outward-facing tick marks between the
# existing ones. To do this, make a second call to the axis function and place
# the ticks at a sequence of values from 0.15 to 1.05 at steps of 0.1. Set
# these secondary tick marks to have a length of one-quarter of a line and
# suppress the axis labels.

# iii. Add the vertical axes. On the left, ticks should appear at
# SGD$1000–17000. Labels should be horizontally readable and in the same font
# style as the horizontal axis. On the right, axis ticks should be made in the
# equivalent of US dollars (USD$) at the sequence USD$1000–11000 in steps of
# USD$1000 and should be labeled as such. To do this, use the conversion USD$ =
# 1.37 × SGD$. Label orientation and font should match the other axes.

# iv. Fit a linear model of price on a quadratic polynomial of carat weight for
# the data. Provide a prediction of the model for a sequence of carat values
# spanning the range of the observed values; include estimation of a 95 percent
# prediction interval. Use this information to superimpose a gray solid line
# for the fitted values and gray dashed lines for the prediction interval upon
# the scatterplot.

# v. Set up expression objects for labeling the approximate US dollar
# conversion and the regression equation. Name the conversion expr1; it should
# look something like USD$ ≈ 1.37 × SGD$. The regression equation should look
# similar to Price = β0 + β1Carat + β2Carat2; name it expr2.

# vi. Use mtext to add an appropriate main title and titles for all three
# individual axes. You may need to experiment a little with line depth for each
# one, as well as whether to write in the outer margin or the figure margin,
# depending on your own spacing preference. The rightmost axis title should
# make use of expr1.

# vii. Either via trial and error to find appropriate coordinates or by using
# the interactive.arrow function from Exercise 23.1, place an arrow pointing to
# the fitted polynomial regression line and label it with expr2.

# viii. Finally, use a call to locator to place a legend in any appro- priate
# location, referencing the color of the points according to the appropriate
# certification. My version of the plot looks like this:
