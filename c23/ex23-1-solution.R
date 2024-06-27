
##########
## 23.1 ##
##########
# Exercise 23-1

# a. In Section 20.5.4 (page 478), I gave you code showing a simple linear
# model fitted with a categorical predictor being treated as continuous (the
# mtcars data with mpg as the response and cyl as the explanatory variable).
# Reproduce the side-by-side boxplots and the scatterplot (with fitted line)
# from Figure 20-6, but this time, use mfrow to present the two plots as a
# vertical column in one device.
#(a)
par(mfrow=c(2,1))
boxplot(mtcars$mpg~mtcars$cyl,xlab="Cylinders",ylab="MPG")
carfit <- lm(mpg~cyl,data=mtcars)
plot(mtcars$mpg~mtcars$cyl,xlab="Cylinders",ylab="MPG")
abline(carfit,lwd=2)

#(b)
# b. Create the appropriate layout matrices to reproduce the follow- ing three
# plots (as they appear in a square device):

# i. ii. iii.

##(i)
lay.mat <- cbind(c(2,1,1,3),c(2,1,1,3))
lay.mat
layout(lay.mat)
layout.show(3)

##(ii)

lay.mat <- rbind(c(1,1,2,3),c(1,1,4,5))
lay.mat
layout(lay.mat)
layout.show(5)

##(iii)
lay.mat <- cbind(c(2,3,3,1),c(2,3,3,1),c(2,4,5,1))
lay.mat
layout(lay.mat)
layout.show(5)

# c. By opening a new device of dimension 9 × 4.5 inches, set the following
# layout:

# Then, produce the following combined set of plots exactly:


# To achieve this, note the following:

# – After you open the device and setting the layout, the plot margins should
# be reset to four lines, four lines, two lines, and one line of space on the
# bottom, left, top, and right, respectively.

# – After each plot, add a gray box corresponding to the figure region to
# achieve the visible partitions.

# – Plots 1 and 4 are the same as the two plots shown in Fig- ures 23-1 and 23-2.

# – Plots 2 and 3 are scatterplots showing the number of detect- ing stations
# on the y-axis, with magnitude and depth on the x-axis, respectively.

# –  Do not place main titles on any plots, and ensure the axis titles are neat
# (that is, compared to their defaults).

#(c)
dev.new(width=9,height=4.5)
lay.mat <- rbind(c(1,1,2,4),c(1,1,3,4))
layout(lay.mat)
layout.show(4)
par(mar=c(4,4,2,1))
plot(quakes$long,quakes$lat,cex=0.02*quakes$stations,xlab="Longitude",ylab="Latitude")
box(which="figure",col="gray")
plot(quakes$mag,quakes$stations,xlab="Magnitude",ylab="Stations")
box(which="figure",col="gray")
plot(quakes$depth,quakes$stations,xlab="Depth",ylab="Stations")
box(which="figure",col="gray")
hist(quakes$stations,main="",xlab="Stations")
abline(v=mean(quakes$stations),lty=2)
box(which="figure",col="gray")

#(d)
# d. Write a little R function named interactive.arrow. The purpose of this
# function is to superimpose an arrow upon any base R plot using two clicks of
# your mouse. The details are as follows:

# – The crux of your function will be the use of locator to read exactly two
# mouse clicks. You may assume a suitable active graphics device is already
# open whenever the function is called. The first click should mean the
# beginning of the arrow, and the second click should mean the tip of the arrow
# (where it’s pointing to).

# – In the function, the coordinates returned by locator should be passed to
# arrows to do the actual drawing.

# – The function should take an ellipsis as its first argument, intended to
# hold additional arguments to be passed directly to arrows.


# – The function should take an optional logical argument label, which defaults
# to NA but should be intended to have an optional character string. If label
# is not NA, then locator should be invoked once more (separately, after
# drawing the arrow) to select exactly one coordinate. That point will be
# passed to text so that the user can additionally place the character string
# given to label as an annotation (intended to be for the interactively placed
# arrow). The call to text should consistently allow completely relaxed
# clipping (in other words, any text added in this fashion will still be
# visible in the figure region and outer margins, if there are any).

# Take another look at the rightmost plot of Figure 14-6 on page 298, a
# stand-alone boxplot of the magnitude data from

# the quakes data frame. Arrows and labels were superimposed externally
# pointing out the various statistics summarized by a boxplot. Create the same
# boxplot and use interactive.arrow to annotate the same features to your own
# satisfaction (you’ll likely have to use the ellipsis to relax the clipping
# associated with each arrow). My result is given here:

interactive.arrow <- function(...,label=NA){
    arr.pts <- locator(2)
    arrows(x0=arr.pts$x[1],y0=arr.pts$y[1],x1=arr.pts$x[2],y1=arr.pts$y[2],...)
    if(!is.na(label)){
      lab.pt <- text(locator(1),label=label,xpd=NA)
    }
}
boxplot(quakes$mag)
interactive.arrow(xpd=TRUE,label="minumum")
interactive.arrow(xpd=TRUE,label="1st quartile")
interactive.arrow(xpd=TRUE,label="median")
interactive.arrow(xpd=TRUE,label="3rd quartile")
interactive.arrow(xpd=TRUE,label="maximum")
interactive.arrow(xpd=TRUE,label="outliers")



