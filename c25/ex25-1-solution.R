
##########
## 25.1 ##
##########
# Ex 25-1

# Ensure the car package is loaded. Revisit the Salaries data frame you looked
# at in Exercises 24.1 (page 622) and 24.2 (page 628) and take a look at the
# help file ?Salaries to remind yourself of the variables. Your task is to use
# color, point size, opacity, and point character type to reflect “years since
# Ph.D.,” “sex,” and “rank” in a scatterplot of “salary” against “years of
# service,” by completing the following steps:

# a. Set up a custom color palette that goes from "black" to "red" to
# "yellow2". Create two versions of this palette—one that expects a number of
# colors and one that expects a vector of normalized values between 0 and 1.

#(a)
cols1 <- colorRampPalette(c("black","red","yellow2"))
cols2 <- colorRamp(c("black","red","yellow2"))



# b. Create two vectors that will control point character and character
# expansion following the guidelines in (i) and (ii). Each of these can be
# achieved in a single line by vector subsetting/repetition based on a numeric
# coercion of the corresponding factor vector in the data frame.

#(b)
##(i)
# i. Use the point characters 19, 17, and 15 to reference the three increasing
# academic ranks in that order.

rank.pchs <- c(19,17,15)[as.numeric(Salaries$rank)]

##(ii)
# ii. Use a character expansion of 1 for females and a character expansion of
# 1.5 for males.

sex.cexs <- c(1,1.5)[as.numeric(Salaries$sex)]

# c. Use the normalize function defined in Section 25.1.4 to create
# a [0,1] normalized version of the range of values of the “years since Ph.D.”
# variable. Then use the appropriate palette from (a) along with rgb to convert
# these to the required hex codes.

normalize <- function(datavec){
  lo <- min(datavec,na.rm=TRUE)
  up <- max(datavec,na.rm=TRUE)
  datanorm <- (datavec-lo)/(up-lo)
  return(datanorm)
}

phd.norm <- normalize(Salaries$yrs.since.phd)
phd.cols <- rgb(cols2(phd.norm),maxColorValue=255)

# d. Modify the vector of colors you just created in (c), adjusting opacity.
# Colors in the vector that correspond to females should be reduced to 90
# percent opacity; colors that correspond to males should be reduced to 30
# percent opacity.

#(d)
phd.cols[Salaries$sex=="Female"] <- adjustcolor(phd.cols[Salaries$sex=="Female"],alpha=0.9)
phd.cols[Salaries$sex=="Male"] <- adjustcolor(phd.cols[Salaries$sex=="Male"],alpha=0.3)

# e. Now, start the plot; alter the default figure margins to be 5, 4, 4, and 6
# lines wide on the bottom, left, top, and right, respectively. Plot salary on
# the y-axis against years of service on the x-axis. Set the corresponding
# point colors according to your vector from (d) and the point characters and
# character expansion according to your vectors from (b). Tidy up the x-axis
# and y-axis titles.

#(e)
par(mar=c(5,4,4,6))
plot(Salaries$salary~Salaries$yrs.service,col=phd.cols,pch=rank.pchs,cex=sex.cexs,xlab="Years of service",ylab="Salary")

#(f)
# f. Incorporate two separate legends following the guidelines in (i) and (ii).
# Both legends should be horizontal, and you should relax clipping to allow
# their placement in figure margins (refer to Section 23.2.3).

# i. Place the first legend at the user coordinate given by x=-5 and y=265000.
# It should use the levels of the “rank” factor vector as the referencing text
# and pair these with the corre- sponding pch symbols as assigned. Include an
# appropriate title for the legend.

legend(-5,265000,legend=levels(Salaries$rank),title="Rank",pch=c(19,17,15),xpd=TRUE,horiz=TRUE)

# ii. The second legend should be placed next to the first, using an
# x-coordinate of 40 and the same y-coordinate value. This legend should show
# two points, both red and of type 19, but reference the two levels of sex by
# altering the charac- ter expansion and opacity of these to reference points
# as assigned.
legend(40,265000,legend=levels(Salaries$sex),title="Sex",pch=c(19,19),pt.cex=c(1,1.5),col=c(adjustcolor("red",0.9),adjustcolor("red",0.3)),xpd=TRUE,horiz=T)

# g. Lastly, ensure the shape package is loaded and use the colorlegend
# function along with 50 colors generated from the appropriate palette from (a)
# to reference “years since Ph.D.” You can leave the horizontal and vertical
# placements of the legend at their default values. The zlim range should
# simply be set to match the range of the observed data, and the tick mark
# values set via zval should be a sequence between 10 and 50, increasing in
# steps of 10. Include an appropriate title for the color legend.
#(g)
library("shape")
colorlegend(col=cols1(50),zlim=range(Salaries$yrs.since.phd),zval=seq(10,50,10),main="Years since\nPhD")

# After all this, my version of this plot is given here:

# Your next task is a little different. The goal is to plot a standard nor- mal
# probability density function but use color to shade in polygons underneath
# the curve to denote “distance from mean.” To achieve this, complete the
# following:

# h. Generate a vector of exactly 25 colors from the built-in palette
# terrain.colors and name it tcols. Then, using a reversed version of it
# obtained via tcols[25:1], append the two vectors together to form a new
# vector of length 50 containing the first 25 colors shading one way and then
# the same 25 shading the opposite way.

#(h)
tcols <- terrain.colors(25)
fillcols <- c(tcols,tcols[25:1])

# i. Next, create and store an evenly spaced sequence of exactly 51 values
# between −3 and 3 inclusive; name it vals. Use dnorm to calculate and store
# the corresponding 51 values of the standard normal density curve; name it
# normvals.

#(i)
nvals <- 51
vals <- seq(-3,3,length=nvals)
normvals <- dnorm(vals)
#(j)
# j. Draw the normal density curve by plotting the values in (i) as a line
# (recall type="l"). In the same call to plot, use knowledge from Chapter 23 to
# set both the x-axis and y-axis styles to be of type "i"; suppress both axis
# titles with empty strings; change the surrounding box to be an L shape; and
# suppress the drawing of the x-axis. Give the plot a suitable main title.

plot(vals,normvals,type="l",xaxs="i",yaxs="i",xlab="",ylab="",bty="L",xaxt="n",main="N(0,1) density")
#(k)

# k. To shade the different colors underneath the curve, use a for loop,
# iterating through the integers 1 to 50. At each iter- ation, the loop should
# call polygon (refer to Section 15.2.3). Assuming your indexer is i, the
# vertices of each polygon should be formed by the vectors
# vals[rep(c(i,i+1),each=2)] and c(0,normvals[c(i,i+1)],0). Each polygon should
# suppress its border and be colored according to the relevant ith entry in
# your color vector of length 50 created in (h).

for(i in 1:(nvals-1)){
  polygon(x=rep(vals[c(i,i+1)],each=2),y=c(0,normvals[c(i,i+1)],0),border=NA,col=fillcols[i])
}


# l. Lastly, ensure the shape package has been loaded and use your length 50
# color vector to produce a color legend with default placement to reference
# “distance from mean.” You can easily set the zlim and zval arguments in the
# call to colorlegend using vals. Include an appropriate title for the legend.
# For reference, my result is given here:
#(l)
library("shape")
colorlegend(fillcols,zlim=range(vals),zval=-3:3,main="SD from mean")






