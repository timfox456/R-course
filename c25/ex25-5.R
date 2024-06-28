# Ex 25-5

# In Exercise 25.3 (a), you revisited the nuclear data set from the boot
# package and fitted two multiple linear regression models aiming to model mean
# construction cost by permit date issue and plant capacity—one with main
# effects only and the other including an interaction term between the two
# continuous predictors.

# a. Refit the two versions of the model and produce perspective plots of the
# response surfaces based again on a 50 × 50 evalua- tion grid, taking the
# following into account:


# – Use mfrow in a call to par to display the two perspective plots next to
# each other. In the same call to par, override the default figure margins to
# have only one line of space on each side (par is explored in this role in
# Chapter 23).

# – Use zlim to ensure both plots are displayed on the same scale of vertical
# axis, spin each one horizontally 25 degrees, and ensure detailed axis
# markings and tidy titles.

# – Is there any visual indication that the presence of the inter- action term
# has had any meaningful impact on modeling the response?

# b. Start a fresh plot. To get a better idea of the difference between the two
# surfaces, produce a perspective plot of the z-matrix obtained as the
# elementwise difference between the two individ- ual z-matrices for the two
# fitted models in (a). What, in general, is the effect of including the
# interaction term?


# Turn your attention back to the topographical information on the Auckland
# volcano, as the built-in R object volcano: an 87 × 61 matrix of elevation
# values (in meters). You first looked at this in Section 25.4.1 as a contour
# plot.

# c. Produce the most basic, default perspective plot of the volcano, using
# simple integer sequences for the x- and y-coordinates.

# d. The plot in (c) is decidedly unappealing for a number of rea- sons.
# Produce a more realistic depiction of the volcano as per the following:

# – Use a new graphics device with the margin widths reset to one, one, one,
# and four lines on the bottom, left, top, and right, respectively.

# – The help file ?volcano reveals the x- and y-coordinates to which the
# volcano z-matrix corresponds is in 10-meter units. Using scale and altering
# expand, replot the surface with the correct aspect ratio in all three axes.

# – Suppress all axis tick marks and notation using axes.

# – The facets should be colored according to 50 colors gener- ated from the
# built-in terrain.colors palette, and the facet border lines should be
# suppressed.

# – Find your choice of visually appealing viewing angle.

# – Use colorlegend from the shape package to place a color legend referencing
# elevation in meters in the space to the right of the plot. Experiment with
# the arguments to find appropriate placement and tick mark labels.

# Here’s my version of the improved plot:

# In Exercise 25.4, you looked at the spatial distribution of inten- tionally
# lit fires in a region of Spain. Ensure the spatstat package is loaded, and
# then rerun the following lines to obtain the relevant data objects:

fire <- split(clmfires)$intentional
firewin <- clmfires$window

# e. Borrow the code from Exercise 25.4 (d) and (e) to reproduce the kernel
# density estimate of this dispersion of observations, based on a 256 × 256
# evaluation grid, truncated to the study region. Then, display it as a
# perspective plot according to the following:

# – Just as with the pixel image, use 50 colors from the built-in heat.colors
# palette to color the facets by z value. Note the truncated z-matrix for this
# function contains NA values.

# – Border lines on the surface should be suppressed, and you should find your
# preferred choice of viewing angle.

# – Use scale to ensure the correct spatial aspect ratio. In doing so, you’ll
# also need to adjust the z-axis expansion by a factor of around 5,000,000 for
# the density surface to be visible along the vertical, given the natural
# scaling of the density estimate on the specified evaluation grid.

# – Employ detailed axis labeling and simply entitle the axes "X", "Y", and "Z"
# as appropriate.
