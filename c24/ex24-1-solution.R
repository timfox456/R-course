##########
## 24.1 ##
##########
# Ex 24-1

# Load the MASS package and inspect the help file for the UScereal data. This
# data frame provides nutritional and other information concerning breakfast
# cereals for sale in the United States in the early 1990s.

UScereal = read.csv("uscereal.csv", stringsAsFactors=TRUE)


# a. Create a copy of the data frame; name it cereal. To ease plot- ting,
# collapse the mfr column (manufacturer) of cereal to be a factor with only
# three levels, with the corresponding labels "General Mills", "Kelloggs", and
# "Other". Also, convert the shelf variable (shelf number from floor) to a
# factor.

library("ggplot2")
#(a)
UScereal = read.csv("usceral.csv", stringsAsFactor=TRUE)
cereal <- UScereal
new.mfr <- as.numeric(UScereal$mfr)
new.mfr[new.mfr>2] <- 3
cereal$mfr <- factor(new.mfr,labels=c("General Mills","Kelloggs","Other"))
cereal$shelf <- factor(cereal$shelf)




# b. Using cereal, construct and store two ggplot objects.


#(b)
##(i)
# i. A scatterplot of calories on protein. Points should be colored according
# to shelf position and shaped according to manu- facturer. Include simple
# linear regression lines for calories on protein, split according to shelf
# position. Ensure tidy axis and legend titles.
gg1 <- ggplot(cereal,aes(x=protein,y=calories,col=shelf)) + geom_point(aes(shape=mfr)) + geom_smooth(method="lm") + labs(x="Protein",y="Calories",col="Shelf",size="Carbs",shape="Manufacturer")
gg1

# ii. A set of kernel estimates of calories, with filled color differen-
# tiating shelf positions. Use 50 percent opaque fills, and again ensure tidy
# axis and legend titles.
##(ii)
gg2 <- ggplot(cereal,aes(x=calories,fill=shelf)) + geom_density(alpha=0.5) + labs(x="Calories",y="Kernel estimate",fill="Shelf")
gg2




# c. Arrange the two plots in (b) on a single device.

#(c)
library("gridExtra")
grid.arrange(gg1,gg2)

# d. Produce a faceted graphic of calories on protein, with each panel
# corresponding to a manufacturer as defined in your cereal object. A LOESS
# smoother with a 90 percent span should be superimposed upon each scatterplot.
# In addition, the points should be colored according to sugar content, sized
# according to sodium content, and shaped according to shelf position.
#(d)

ggplot(cereal,aes(x=protein,y=calories)) +
geom_point(aes(col=sugars,size=sodium,shape=shelf)) +
geom_smooth(method="loess",span=0.9) + facet_wrap(~mfr) +
labs(x="Protein",y="Calories",col="Sugars",shape="Shelf",size="Sodium")

# e. Produce a ggplot object, named gg1, of a scatterplot of salary on the
# vertical axis against years of service on the horizontal axis. Color should
# be used to distinguish between males and females, along with sex-specific
# LOESS trends, and ensure axis and legend titles are understandable. View your
# plot.

#(e)
library("car")
gg1 <- ggplot(Salaries,aes(x=yrs.service,y=salary,col=sex)) + geom_point() + geom_smooth(method="loess") + labs(x="Years of Service",y="Salary",col="Sex")
gg1
#(f)
# f. Create the following three additional plot objects, again ensuring tidy
# axis and legend titles. Name the following gg2, gg3, and gg4, respectively:

##(i)
# i. Side-by-side boxplots of salary, split by rank. Each boxplot should be
# further split up according to sex (this can be done simply in the default
# aesthetic mapping—try assigning the sex variable to either col or fill).

gg2 <- ggplot(Salaries,aes(x=rank,y=salary,col=sex)) + geom_boxplot() + labs(x="Rank",y="Salary",col="Sex")
gg2

##(ii)
# ii. Side-by-side boxplots of salary, split by discipline, with each
# discipline split further by sex using color or fill.

gg3 <- ggplot(Salaries,aes(x=discipline,y=salary,fill=sex)) + geom_boxplot() + labs(x="Discipline",y="Salary",fill="Sex")
gg3
# iii. Kernel density estimates of salary, using 30 percent opaque fills to
# distinguish rank.
##(iii)
gg4 <- ggplot(Salaries,aes(x=salary,fill=rank)) + geom_density(alpha=0.3) + labs(x="Salary",y="Kernel estimate",fill="Rank")
gg4
#(g)
# g. Display your four plot objects (gg1, gg2, gg3, and gg4) from (e) and (f)
# in a single device.

grid.arrange(gg1,gg2,gg3,gg4)
#(h)
# h. Finally, plot the following:

# i. A series of kernel density estimates of salary using 70 per- cent opaque
# fills to distinguish between males and females, faceted by academic rank.

##(i)
ggplot(Salaries,aes(x=salary,fill=sex)) + geom_density(alpha=0.7) + facet_wrap(~rank) + labs(x="Salary",y="Kernel estimate",fill="Sex")

# ii. Scatterplots of salary on years of service, using color to dis- tinguish
# between males and females, faceted by discipline as rows and by academic rank
# as columns. Each scatterplot should have a sex-specific simple linear
# regression line with confidence band superimposed and have free horizontal
# scales.

##(ii)
ggplot(Salaries,aes(x=yrs.service,y=salary,col=sex)) + geom_point() + geom_smooth(method="lm") + facet_grid(discipline~rank,scales="free_x") + labs(x="Years of Service",y="Salary",col="Sex")


# Load the car package (downloading and installing it first if you haven’t
# already) and consider the Salaries object—a data frame detailing the salaries
# (in US dollars) of 397 academics working the United States during the
# 2008–2009 school year (Fox and Weis- berg, 2011). An inspection of the help
# file ?Salaries informs you of the present variables, which, in addition to
# the salary figure, include each academic’s rank, sex, and research discipline
# (as factors) as well as the number of years of service.

Salaries = read.csv("salaries.csv", stringAsFactors=TRUE)





