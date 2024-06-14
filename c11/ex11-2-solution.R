##########
## 11.2 ##
##########
#(a)

# Accruing annual compound interest is a common financial benefit for investors. Given a principal investment amount P, an interest rate per annum i (expressed as a percentage), and a frequency of interest paid per year t, the final amount F after y years is given as follows:

# F = P * ( 1 + (1/ (100 * t))) ^(t * y)

# Write a function that can compute F as per the following notes:

# - Arguments must be present for P, i, t, and y. The argument for t should
# have a default value of 12.

# - Another argument giving a logical value that determines whether to plot the
# amount F at each integer time should be included. For example, if plotit=TRUE
# (the default) and y is 5 years, the plot should show the amount F at y =
# 1,2,3,4,5.

# - If this function is plotted, the plot should always be a step- plot, so
# plot should always be called with type="s".

# - If plotit=FALSE, the final amount F should be returned as a numeric vector
# corresponding to the same integer times, as shown earlier.

# -  An ellipsis should also be included to control other details of plotting,
# if it takes place.


comp <- function(P,i,t=12,y,plotit=TRUE,...){
  yseq <- 1:y
  values <- P*(1+i/(100*t))^(t*yseq)
  
  if(plotit){  
    plot(yseq,values,type="s",...)
  } else {
    return(values)
  }
}
# Now, using your function, do the following:

# i. Work out the final amount after a 10-year investment of a principal of
# $5000, at an interest rate of 4.4 percent per annum compounded monthly.

comp(5000,4.4,y=10,plotit=F)[10]

# ii. Re-create the following step-plot, which shows the result of $100
# invested at 22.9 percent per annum, compounded monthly, for 20 years:

comp(100,22.9,12,20,plotit=T,main="Compound interest calculator",ylab="Balance (F)",xlab="Year (y)")

# Perform another calculation based on the same parameters as in (ii), but this
# time, assume the interest is compounded annually. Return and store the
# results as a numeric vector. Then, use lines to add a second step-line,
# corresponding to this annually accrued amount, to the plot created
# previously. Use a different color or line type and make use of the legend
# function so the two lines can be differentiated.

ann <- comp(100,22.9,1,20,plotit=F)
lines(1:20,ann,lty=2,type="s")
legend("topleft",lty=c(1,2),legend=c("monthly interest","annual interest"))

# b. A quadratic equation in the variable x is often expressed in the following
# form:

# k1 * x^2  + k2 * x + k3 = 0


# Here, k1, k2, and k3 are constants. Given values for these constants, you can
# attempt to find up to two real roots—values of x that satisfy the equation.
# Write a function that takes k1, k2, and k3 as arguments and finds and returns
# any solutions (as a numeric vector) in such a situation. This is achieved as
# follows:

# – Evaluate k2 − 4k1k3. If this is negative, there are no solutions, and an
# appropriate message should be printed to the console.

# – If k2 − 4*j*k1*k3 is zero, then there is one solution, computed by −k2/2*k1.

# – If (k2 − 4*k1*k3) is positive, then there are two solutions, given by 
# (−k2 − (k2 − 4k1k3)0.5)/2k1 and (−k2 + (k2 − 4k1k3)0.5)/2k1.

# – No default values are needed for the three arguments, but the function
# should check to see whether any are missing. If so, an appropriate character
# string message should be returned to the user, informing the user that the
# calcula- tions are not possible.

# Now, test your function.

quad <- function(k1,k2,k3){
  if(any(c(missing(k1),missing(k2),missing(k3)))){
    return("At least one of k1, k2, k3 was missing")
  }
  x <- k2^2-4*k1*k3
  if(x<0){
    cat("No real roots\n")
  } else if(x==0){
    return(-k2/(2*k1))
  } else {
    return(c((-k2-x^0.5)/(2*k1),(-k2+x^0.5)/(2*k1)))
  }
}

# i. Confirm the following:

# 2x^2 − x − 5 has roots 1.850781 and −1.350781.

# x^2 +x+1 has no real roots.


quad(k1=2,k2=-1,k3=-5)
quad(1,1,1)
# ii. Attempt to find solutions to the following quadratic equations:

# * 1.3x^2 − 8*x − 3.13 2.25

# * x^2 − 3*x + 1 

# * 1.4* x2 − 2.2*x − 5.1 −5

# * x^2 + 10.11*x − 9.9

quad(k1=1.3,k2=-8,k3=-3.13)
quad(2.25,-3,1)
quad(1.4,-2.2,-5.1)
quad(-5,10.11,-9.9)

# iii. Test your programmed response in the function if one of the arguments is missing.
quad(0)




