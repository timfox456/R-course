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

# Now, using your function, do the following:

# i. Work out the final amount after a 10-year investment of a principal of
# $5000, at an interest rate of 4.4 percent per annum compounded monthly.

# ii. Re-create the following step-plot, which shows the result of $100
# invested at 22.9 percent per annum, compounded monthly, for 20 years:


# Perform another calculation based on the same parameters as in (ii), but this
# time, assume the interest is compounded annually. Return and store the
# results as a numeric vector. Then, use lines to add a second step-line,
# corresponding to this annually accrued amount, to the plot created
# previously. Use a different color or line type and make use of the legend
# function so the two lines can be differentiated.

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

# i. Confirm the following:

# 2x^2 − x − 5 has roots 1.850781 and −1.350781.

# x^2 +x+1 has no real roots.

# ii. Attempt to find solutions to the following quadratic equations:

# * 1.3x^2 − 8*x − 3.13 2.25

# * x^2 − 3*x + 1 

# * 1.4* x2 − 2.2*x − 5.1 −5

# * x^2 + 10.11*x − 9.9


# iii. Test your programmed response in the function if one of the arguments is missing.
