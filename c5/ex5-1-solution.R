#########
## 5.1 ##
#########

# a. Create a list that contains, in this order, a sequence of 20 evenly spaced
# numbers between −4 and 4; a 3 × 3 matrix of the logical vector
# c(F,T,T,T,F,T,T,F,F) filled column-wise; a character vector with the two
# strings "don" and "quixote"; and a factor vector con- taining the
# observations c("LOW","MED","LOW","MED","MED","HIGH"). Then, do the following:

#(a)
foo <- list(seq(from=-4,to=4,length=20),matrix(c(F,T,T,T,F,T,T,F,F),nrow=3,ncol=3),c("don","quixote"),factor(x=c("LOW","MED","LOW","MED","MED","HIGH")))

# i. Extract row elements 2 and 1 of columns 2 and 3, in that order, of the
# logical matrix. 

##(i)
foo[[2]][2:1,2:3]

# ii. Use sub to overwrite "quixote" with "Quixote" and "don"
# with "Don" inside the list. Then, using the newly overwritten list member,
# concatenate to the console screen the following statement exactly:

##(ii)
foo[[3]][1] <- sub(pattern="d",replacement="D",x=foo[[3]][1])
foo[[3]][2] <- sub(pattern="q",replacement="Q",x=foo[[3]][2])

# ```text
# "Windmills ATTACK!"
#  -\Don Quixote/-
# ```

cat("\"Windmills! ATTACK!\"\n\t-\\",foo[[3]][1]," ",foo[[3]][2],"/-",sep="")

# iii. Obtain all values from the sequence between −4 and 4 that are greater
# than 1.
##(iii)
foo[[1]][foo[[1]]>1]

# iv. Using which, determine which indexes in the factor vector are assigned
# the "MED" level.
##(iv)
which(x=foo[[4]]=="MED")


# b. Create a new list with the factor vector from (a) as a component named
# "facs"; the numeric vector c(3,2.1,3.3,4,1.5,4.9) as a component named
# "nums"; and a nested list comprised of the first three members of the list
# from (a) (use list slicing to obtain this), named "oldlist". Then, do the
# following:

#(b)
bar <- list(facs=foo[[4]],nums=c(3,2.1,3.3,4,1.5,4.9),oldlist=foo[1:3])

# i. Extract the elements of "facs" that correspond to elements of "nums" that
# are greater than or equal to 3.

##(i)
bar$facs[bar$nums>=3]

# ii. Add a new member to the list named "flags". This member should be a
# logical vector of length 6, obtained as a twofold repetition of the third
# column of the logical matrix in the "oldlist" component.

##(ii)
bar$flags <- rep(x=bar$oldlist[[2]][,3],times=2)

# iii. Use "flags" and the logical negation operator ! to extract the entries
# of "num" corresponding to FALSE.

##(iii)
bar$nums[!bar$flags]

# v. Overwrite the character string vector component of "oldlist" with the
# single character string "Don Quixote".

bar$oldlist[[3]] <- "Don Quixote"
