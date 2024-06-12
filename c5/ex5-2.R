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

# b. Stan and Francine are 41 years old, Steve is 15, Hayley is 21, and Klaus
# is 60. Roger is extremely old—1,600 years. Append these data as a new numeric
# column variable in dframe called age.

# c. Use your knowledge of reordering the column variables based on column
# index positions to overwrite dframe, bringing it in line with mydata. That
# is, the first column should be person, the second column age, the third
# column sex, and the fourth column funny.

# d. Turn your attention to mydata as it was left after you included the
# age.mon variable in Section 5.2.2. Create a new version of mydata called
# mydata2 by deleting the age.mon column.

# e. Now, combine mydata2 with dframe, naming the resulting object mydataframe.

# f. Write a single line of code that will extract from mydataframe just the
# names and ages of any records where the individual is female and has a level
# of funniness equal to Med OR High.

# g. Use your knowledge of handling character strings in R to extract all
# records from mydataframe that correspond to people whose names start with S.
# Hint: Recall substr from Section 4.2.4 (note that substr can be applied to a
# vector of multiple character strings).
