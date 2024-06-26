# Ex 10-2

# a. Write an explicit stacked set of if statements that does the same thing as
# the integer version of the switch function illustrated earlier. Test it with
# mynum <- 3 and mynum <- 0, as in the text.

# b. Suppose you are tasked with computing the precise dosage amounts of a
# certain drug in a collection of hypothetical sci- entific experiments. These
# amounts depend upon some pre- determined set of “dosage thresholds” (lowdose,
# meddose, and highdose), as well as a predetermined dose level factor vector
# named doselevel. Look at the following items (i–iv) to see the intended form
# of these objects. Then write a set of nested if statements that produce a new
# numeric vector called dosage, according to the following rules:

#  -  First, if there are any instances of "High" in doselevel, per- form the
#     following operations:

#    * Check if lowdose is greater than or equal to 10. If so, overwrite
#      lowdose with 10; otherwise, overwrite lowdose by itself divided by 2.

#    * Check if meddose is greater than or equal to 26. If so, overwrite
#      meddose by 26.

#    * Check if highdose is less than 60. If so, overwrite highdose with 60;
#       otherwise, overwrite highdose by itself multiplied by 1.5.

#    * Create a vector named dosage with the value of lowdose repeated (rep) to
#      match the length of doselevel. Overwrite the elements in dosage
#      corresponding to the index positions of instances of "Med" in doselevel by
#      meddose.

#    * Overwrite the elements in dosage corresponding to the index positions of 
#      instances of "High" in doselevel by highdose.

# – Otherwise (in other words, if there are no instances of "High" in doselevel), perform the following operations:

#   * Create a new version of doselevel, a factor vector with levels "Low" and
#     "Med" only, and label these with "Small" and "Large", respectively (refer to
#     Section 4.3 for details or see ?factor).


# Check to see if lowdose is less than 15 AND meddose is less than 35. If so,
# overwrite lowdose by itself multiplied by 2 and overwrite meddose by itself
# plus highdose.

# Create a vector named dosage, which is the value of lowdose repeated (rep) to
# match the length of doselevel. Overwrite the elements in dosage corresponding
# to the index positions of instances of "Large" in doselevel by meddose.

# Now, confirm the following:

# i. Given
lowdose <- 12.5
meddose <- 25.3
highdose <- 58.1

doselevel <- factor(c("Low","High","High","High","Low","Med",
  "Med"),levels=c("Low","Med","High"))

# the result of dosage after running the nested if statements is as follows:

dosage
# [1] 10.0 60.0 60.0 60.0 10.0 25.3 25.3

# ii. Using the same lowdose, meddose, and highdose thresholds as in (i), given

doselevel <- factor(c("Low","Low","Low","Med","Low","Med",
  "Med"),levels=c("Low","Med","High"))

# the result of dosage after running the nested if statements is as follows:

dosage
# [1] 25.0 25.0 25.0 83.4 25.0 83.4 83.4

#Also, doselevel has been overwritten as follows:

doselevel
#   [1] Small Small Small Large Small Large Large
#    Levels: Small Large

# iii. Given

lowdose <- 9
meddose <- 49
highdose <- 61
doselevel <- factor(c("Low","Med","Med"), levels=c("Low","Med","High"))

# the result of dosage after running the nested if statements is as follows:

dosage

# [1]  9 49 49
# Also, doselevel has been overwritten as follows:

doselevel

# [1] Small Large Large
# Levels: Small Large

# iv. Using the same lowdose, meddose, and highdose thresholds as (iii), as
# well as the same doselevel as (i), the result of dosage after running the
# nested if statements is as follows:

 dosage
#[ 1]  4.5 91.5 91.5 91.5  4.5 26.0 26.0

# c. Assume the object mynum will only ever be a single integer between 0 and
# 9. Use ifelse and switch to produce a command that takes in mynum and returns
# a matching character string for all possible values 0, 1, . . . , 9. Supplied
# with 3, for example, it should return "three"; supplied with 0, it should
# return "zero".


