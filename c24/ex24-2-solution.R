##########
## 24.2 ##
##########
# Ex 24-2

# Ensure the car and ggvis packages are loaded. Revisit the Salaries data frame
# you looked at in Exercise 24.1; inspect the help file ?Salaries to remind
# yourself of the present variables.

# a. Produce an interactive scatterplot of salary on the vertical axis and the
# years of service on the horizontal axis. Employ radio but- tons to color
# points according to either academic rank, research discipline, or sex. Use
# pipes to add_legend and add_axis to omit a legend title and to tidy up the
# axis titles, respectively.
library("ggvis")
?Salaries
#(a)

salfill <- input_radiobuttons(c("Rank"="rank","Discipline"="discipline","Sex"="sex"),map=as.name,label="Color points by...")

Salaries %>% ggvis(x=~yrs.service,y=~salary,fill=salfill) %>% layer_points() %>% add_legend("fill",title="") %>% 
  add_axis("x",title="Years of service") %>% add_axis("y",title="Salary")

#(b)

# b. A pipe to layer_densities (which you’ve not yet met) is used to produce
# kernel density estimates, similar to those appearing in Figure 24-5.

# i. Use ggvis to create a static plot of kernel density estimates of salary
# distributions, split up according to academic rank.

# To do this, assign the salary variable to x and the rank variable to fill,
# followed by a pipe to group_by to explicitly instruct grouping by the rank
# variable. Lastly, piping to layer_densities (just use all default argument
# values in this instance) will generate the graphic. Your result should
# resemble the gg4 object from Exercise 24.1.
##(i)
Salaries %>% ggvis(x=~salary,fill=~rank) %>% group_by(rank) %>% layer_densities()

# ii. Just like the width argument to layer_histograms is used to con- trol the
# appearance of a histogram, the adjust argument in layer_densities is used to
# control the degree of smoothness of the kernel estimates. Reproduce the
# rank-specific kernel estimates from the previous plot, but this time, the
# graphic should be interactive—implement a slider button with a range of 0.2
# to 2 and a label of "Smoothness" to control the smoothing adjustment. At your
# discretion, either suppress or clarify the axis and legend titles of the
# result.
##(ii)
Salaries %>% ggvis(x=~salary,fill=~rank) %>% group_by(rank) %>% layer_densities(adjust=input_slider(0.1,2,label="Smoothness")) %>% add_axis("x",title="Salary") %>% add_axis("y",title="Kernel estimate") %>% add_legend("fill",title="Rank")

# Ensure you have the MASS package loaded, once more gaining access to the
# UScereal data frame. If you haven’t already done so, inspect the help file
# ?UScereal and re-create the cereal object exactly as specified in Exercise
# 24.1 (a). Then do the following:

# c. Set up an object for radio buttons to choose among the man- ufacturer, the
# shelf, and the vitamins variables. Make sure the labels for each radio button
# are clear, and set up an appropriate title label for what will form the
# collection of options to color the points. Name the object filler.

#(c)

cereal <- UScereal
new.mfr <- as.numeric(UScereal$mfr)
new.mfr[new.mfr>2] <- 3
cereal$mfr <- factor(new.mfr,labels=c("General Mills","Kelloggs","Other"))
cereal$shelf <- factor(cereal$shelf)
filler <- input_radiobuttons(c("Manufacturer"="mfr","Shelf"="shelf","Vitamins"="vitamins"),map=as.name,label="Color points by...")
sizer <- input_slider(10,300,label="Point size:")
opacityer <- input_slider(0.1,1,label="Opacity:")

# d. Borrowing the sizer and opacityer objects created in Section 24.4 and
# using the object you just created in (c) to control fill, create an
# interactive scatterplot of calories on protein. Tidy up the axis titles and
# suppress the legend title for the point color fill. The result should
# essentially be the same, in terms of functionality, as the graphic appearing
# as the topmost screenshot in Figure 24-8.

#(d)
cereal %>%
  ggvis(x=~protein,y=~calories,fill=filler,size:=sizer,opacity:=opacityer) %>%
  layer_points() %>% add_axis("x",title="Protein") %>%
  add_axis("y",title="Calories") %>% add_legend("fill",title="")

#(e)
# e. Create a new object for the same radio buttons as specified in (c) that
# will control the shape of the points (in other words, the characters used to
# plot points). Modify the title label accordingly. Name this object shaper.

shaper <- input_radiobuttons(c("Manufacturer"="mfr","Shelf"="shelf","Vitamins"="vitamins"),map=as.name,label="Shape points by...")

#(f)
# f. Finally, re-create the interactive scatterplot of calories on protein
# exactly as in (d), but this time additionally assigning shaper from (e) to
# the shape modifier in your call to ggvis. To prevent the legends for the two
# sets of radio buttons from overlapping each other, you need to add the
# following pipes to your code:

add_legend("shape",title="", properties=legend_props(legend=list(y=100)))
set_options(duration=0)

# The first simply moves the legend for the shape modifier vertically downward,
# and the second eliminates the slight “ani- mation delay” that occurs by
# default when switching between options in the interactive graphic. Once more,
# use additional calls to add_axis and add_legend to clarify or suppress axis
# and legend titles.

cereal %>%
  ggvis(x=~protein,y=~calories,fill=filler,shape=shaper,opacity:=opacityer,size:=sizer) %>% 
  layer_points() %>% add_axis("x",title="Protein") %>%
  add_axis("y",title="Calories") %>% add_legend("fill",title="") %>%
  add_legend("shape",title="",properties=legend_props(legend=list(y=100))) %>%
  set_options(duration=0)









