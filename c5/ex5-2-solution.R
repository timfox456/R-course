#########
## 5.2 ##
#########

# Ex 5-2

# a. Create and store this data frame as dframe in your R workspace:

#     person sex funny
# 1     Stan   M  High
# 2 Francine   F   Med
# 3    Steve   M   Low
# 4    Roger   M  High
# 5   Hayley   F   Med
# 6    Klaus   M   Med


# The variables person, sex, and funny should be identical in nature to the
# variables in the mydata object studied throughout Section 5.2. That is,
# person should be a character vector, sex should be a factor with levels F and
# M, and funny should be a factor with levels Low, Med, and High.

#(a)
dframe <- data.frame(person=c("Stan","Francine","Steve","Roger","Hayley","Klaus"),sex=factor(x=c("M","F","M","M","F","M")),funny=factor(x=c("High","Med","Low","High","Med","Med"),levels=c("Low","Med","High")),stringsAsFactors=F)
dframe


# b. Stan and Francine are 41 years old, Steve is 15, Hayley is 21, and Klaus
# is 60. Roger is extremely old—1,600 years. Append these data as a new numeric
# column variable in dframe called age.

dframe$age <- c(41,41,15,1600,21,60)
dframe

# c. Use your knowledge of reordering the column variables based on column
# index positions to overwrite dframe, bringing it in line with mydata. That
# is, the first column should be person, the second column age, the third
# column sex, and the fourth column funny.

#(c)
dframe <- dframe[,c(1,4,2,3)]
dframe
# d. Turn your attention to mydata as it was left after you included the
# age.mon variable in Section 5.2.2. Create a new version of mydata called
# mydata2 by deleting the age.mon column.



# These are the mydata as it existed in the boo
mydata <- data.frame(person=c("Peter","Lois","Meg","Chris","Stewie"),
                     age=c(42,40,17,14,1),
                     sex=factor(c("M","F","F","M","M")),
                     stringsAsFactors=FALSE)
newrecord <- data.frame(person="Brian",age=7,
                           sex=factor("M",levels=levels(mydata$sex)))
mydata <- rbind(mydata,newrecord)
mydata$age.mon <- mydata$age * 12
funny <- c("High","High","Low","Med","High","Med")
funny <- factor(x=funny,levels=c("Low","Med","High"))
mydata <- cbind(mydata, funny)



#(d)
mydata2 <- mydata[,-5] #(Assuming the presence of the 'mydata' object as left in Section 5.2.2)#

# e. Now, combine mydata2 with dframe, naming the resulting object mydataframe.
#(e)
mydataframe <- rbind(mydata2,dframe)
mydataframe

# f. Write a single line of code that will extract from mydataframe just the
# names and ages of any records where the individual is female and has a level
# of funniness equal to Med OR High.
#(f)
mydataframe[mydataframe$sex=="F"&(mydataframe$funny=="Med"|mydataframe$funny=="High"),c("person","age")]

# g. Use your knowledge of handling character strings in R to extract all
# records from mydataframe that correspond to people whose names start with S.
# Hint: Recall substr from Section 4.2.4 (note that substr can be applied to a
# vector of multiple character strings).
#(g)
mydataframe[substr(x=mydataframe$person,start=1,stop=1)=="S",]
