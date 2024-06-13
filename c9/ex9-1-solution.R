
#########
## 9.1 ##
#########
# a. Identify the first 20 items contained in the built-in and auto- matically
# loaded methods package. How many items are there in total?

ls("package:methods")[1:20]
length(ls("package:methods"))
# b. Determine the environment that owns each of the following functions:

# i. read.table 
environment(read.table)

# ii. data
environment(data)

# iii. matrix

environment(matrix)

# iv. jpeg
environment(jpeg)

#c. Use ls and a test for character string equality to confirm the function
#smoothScatter is part of the graphics package.
any(ls("package:graphics")=="smoothScatter")



