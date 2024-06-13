
##########
## 8.1 ##
##########
# 8.1

# a.
# In R’s built-in datasets library is the data frame quakes. Make sure you can
# access this object and view the corresponding help file to get an idea of
# what this data represents. Then, do the following: 

# i. Select only those records that correspond to a magnitude (mag) of greater
# than or equal to 5 and write them to a table-format file called q5.txt in an
# existing folder on your machine. Use a delimiting character of ! and do not
# include any row names.

#(a)
##(i)
write.table(x=quakes[quakes$mag>=5,],file="q5.txt",sep="!",row.names=F)

# ii. Read the file back into your R workspace, naming the object q5.dframe.
##(ii)
q5.dframe <- read.table(file="q5.txt",sep="!",header=T)

# b. We are no longer using the package car. We are loading a data frame called Duncan, which
# provides historical data on perceived job prestige in 1950.

Duncan = read.csv("duncan.csv")

# i. Write R code that will plot education on the x-axis and income on the
# y-axis, with both x- and y-axis limits fixed to be [0,100].

# Provide appropriate axis labels. For jobs with a prestige value of less than
# or equal to 80, use a black ◦ as the point character. For jobs with prestige
# greater than 80, use a blue •.

##(i)
plot(Duncan$education[Duncan$prestige<=80],Duncan$income[Duncan$prestige<=80],xlim=c(0,100),ylim=c(0,100),xlab="Education",ylab="Income")
points(Duncan$education[Duncan$prestige>80],Duncan$income[Duncan$prestige>80],pch=19,col="blue")

# ii. Add a legend explaining the difference between the two types of points
# and then save a 500 × 500 pixel .png file of the image.

png("dunc.png",width=500,height=500)
plot(Duncan$education[Duncan$prestige<=80],Duncan$income[Duncan$prestige<=80],xlim=c(0,100),ylim=c(0,100),xlab="Education",ylab="Income")
points(Duncan$education[Duncan$prestige>80],Duncan$income[Duncan$prestige>80],pch=19,col="blue")
legend("topleft",legend=c("prestige > 80","prestige <= 80"),pch=c(19,1),col=c("blue","black"))
dev.off()

# c. Create a list called exer that contains the three data sets quakes,
# q5.dframe, and Duncan. Then, do the following:

exer <- list(quakes,q5.dframe,Duncan)
# i. Write the list object directly to disk, calling it Exercise8-1.txt.
# Briefly inspect the contents of the file in a text editor.

dput(x=exer,file="Exercise8-1Data.txt")

# ii. Read Exercise8-1.txt back into your workspace; call the resulting object
# list.of.dataframes. Check that list.of.dataframes does indeed
# contain the three data frame objects.

list.of.dataframes <- dget("Exercise8-1Data.txt")
list.of.dataframes

# d. In Section 7.4.3, you created a ggplot2 graphic of 20 observations
# displayed as the bottom image of Figure 7-11 on page 144. Use ggsave to save
# a copy of this plot as a .tiff file.
x <- 1:20
y <- c(-1.49,3.37,2.59,-2.78,-3.94,-0.92,6.43,8.51,3.41,-8.23,-12.01,-6.58,2.87,14.12,9.63,-4.58,-14.78,-11.67,1.17,15.62)
ptype <- rep(NA,length(x=x))
ptype[y>=5] <- "too_big"
ptype[y<=-5] <- "too_small"
ptype[(x>=5&x<=15)&(y>-5&y<5)] <- "sweet"
ptype[(x<5|x>15)&(y>-5&y<5)] <- "standard"
ptype <- factor(x=ptype)
qplot(x,y,color=ptype,shape=ptype) + geom_point(size=4) + geom_line(mapping=aes(group=1),color="black",lty=2) + geom_hline(mapping=aes(yintercept=c(-5,5)),color="red") + geom_segment(mapping=aes(x=5,y=-5,xend=5,yend=5),color="red",lty=3) + geom_segment(mapping=aes(x=15,y=-5,xend=15,yend=5),color="red",lty=3)
ggsave(filename="elaborateqplot.tiff")



