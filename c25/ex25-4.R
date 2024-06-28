# ex 25-4

# Revisit the built-in airquality data set and take a look at the help file to
# refresh your memory of the variables present. Create a copy of the data
# frame: select the columns pertaining to daily temperature, wind speed, and
# ozone level and use na.omit to remove any records with missing values.

# a. From your explorations of these data in Chapter 24, there appears to be an
# association among daily temperature, wind speed, and ozone level. Fit a
# multiple linear regression model that aims to predict mean temperature based
# on the wind speed and ozone level, including an interactive effect. Summarize
# the resulting object.

# b. Using the model from (a), construct a z-matrix of predicted mean daily
# temperature based on a 50 × 50 evaluation grid in both wind speed and ozone.

# c. Create a pixel image of the response surface, superimposing the raw
# observations as per the following:

# – A graphics device should be initialized based on bottom, left, top, and
# right margin lines of 5, 4, 4, and 6, respectively.

# – 20 colors from the built-in topo.colors palette should be used to produce
# the image; include tidy axis titles.

# – Revisit the normalize function defined in Section 25.1.4 and use the
# built-in function gray to generate a vector of gray colors (refer to Section
# 25.1.2) based on the normalized raw temperature observations. Superimpose the
# raw observa- tions based on wind speed and ozone onto the pixel image, using
# the gray color vector to indicate the corresponding temperature observations.

# – Two separate calls should then be made to colorlegend of the shape package.
# The first should appear in the space on the right margin, referencing the
# surface itself. The second should use the built-in gray.colors function,
# setting the optional arguments start=0 and end=1, to generate 10 shades of
# gray for use in the legend that references the raw temperature observations
# of the superimposed points. This legend should reside on top of the pixel
# image itself, in the upper-right quadrant where there are no raw
# observations.

# – Both legends should have appropriate titles, and you may need to experiment
# a little with the posx and posy arguments to find satisfactory placement.

# In Section 25.5.2, you used the chorley data set in creating a pixel image
# truncated to a subset of the overall rectangular evaluation grid. Ensure
# spatstat is loaded in your current R session and execute the following two
# lines:

fire = split(clmfires)$intentional
firewin = clmfires$window

# This extracts the 1,786 locations of fires recorded as intentionally lit in a
# particular region of Spain. The spatial coordinates can be extracted as the
# $x and $y members of fire, and the geographical region itself is stored as a
# polygon in firewin (of the same class as the chorley$window object you looked
# at earlier). See the documentation obtained with ?clmfires for further
# details.

# d. Using the total x- and y-range of the study region, use kde2d from the
# MASS package to calculate a bivariate kernel estimate of the probability
# density function of the spatial dispersion of intentionally lit fires. The
# KDE surface should be calculated based on a 256 × 256 evaluation grid.

# e. Identify all points on the rectangular evaluation grid that fall outside
# the geographical region using expand.grid in conjunction with inside.owin.
# Set all corresponding pixels of the density surface to NA.

# f. Construct a pixel image of the truncated density, as per the following:

# – The graphics device should have three lines of space on the bottom, left,
# and top of the plot region and should have seven lines on the right.

# – In producing the image itself, you should use 50 colors generated from the
# built-in heat.colors palette. A one-to-one aspect ratio should be maintained,
# the axis titles should be suppressed, and the box type set to be an L shape.

# – The geographical study region should be superimposed onto the image using a
# double-width line.

# – Using colorlegend from shape, a color legend referencing the density with
# an appropriate title should be placed to the right of the image. You’ll need
# to experiment with the posx argument for placement. Label the legend at a
# sequence from 5e-6 to 35e-6 in steps of 5e-6 (refer to Section 2.1.3 for an
# explanation of e-notation); also, ensure these labels are able to display up
# to six decimal places of precision.

