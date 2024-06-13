# a. Create the following two vectors:
 #    vec1 <- c(2,1,1,3,2,1,0)
 #   vec2 <- c(3,8,2,2,0,0,0)

# Without executing them, determine which of the following if statements would
# result in the string being printed to the console. Then confirm your answers
# in R.

# i. if((vec1[1]+vec2[2])==10){ cat("Print me!") }

# ii. if(vec1[1]>=2&&vec2[1]>=2){cat("Printme!")}

# iii. if(all((vec2-vec1)[c(2,6)]<7)){ cat("Print me!") }

# iv. if(!is.na(vec2[3])){cat("Printme!")}


# b. Using vec1 and vec2 from (a), write and execute a line of code that
# multiplies the corresponding elements of the two vectors together if their
# sum is greater than 3. Otherwise, the code should simply sum the two
# elements.kj



# c. In the editor, write R code that takes a square character matrix and checks
# if any of the character strings on the diagonal (top left to bottom right)
# begin with the letter g, lowercase or upper- case. If satisfied, these
# specific entries should be overwritten with the string "HERE". Otherwise, the
# entire matrix should be replaced with an identity matrix of the same
# dimensions. Then, try your code on the following matrices, checking the
# result each time:


# i. mymat <- matrix(as.character(1:16),4,4)

# ii. mymat<-matrix(c("DANDELION","Hyacinthus","Gerbera",
# "MARIGOLD","geranium","ligularia",
# "Pachysandra","SNAPDRAGON","GLADIOLUS"),3,3)

# iii. mymat <- matrix(c("GREAT","exercises","right","here"),2,2, byrow=T)

# Hint: This requires some thought—you will find the func- tions diag from
# Section 3.2.1 and substr from Section 4.2.4 useful.

