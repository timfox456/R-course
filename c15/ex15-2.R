## Ex 15-2

# a. For each of the following definitions, identify whether it’s best
# described as a random variable or as a realization of a random variable.
# Furthermore, identify whether each statement describes a continuous or a
# discrete quantity.

#(a)

# i. The number of coffees x made by your local shop on June 3, 2016
##(i) Realization of discrete random variable

# ii. The number of coffees X made by your local shop on any given day
##(ii) Discrete random variable

# iii. Y,whetherornotitrainstomorrow
##(iii) Discrete random variable

# iv. Z, the amount of rain that falls tomorrow
##(iv) Continuous random variable

# v. How many crumbs k on your desk right now
##(v) Realization of discrete random variable

# vi. Total collective weight W of the crumbs on your desk at any specified time
##(vi) Continous random variable

# b. Suppose you construct the following table providing probabilities
# associated with the random variable S, the total stars given to any movie in
# a particular genre by a certain critic:

# s12345 Pr(S = s) 0.10 0.13 0.21 ??? 0.15

# i. Assuming this table describes the complete set of outcomes, evaluate the
# missing probability Pr(S = 4).
#(b)
S.outcomes <- 1:5
1-0.1-0.13-0.21-0.15 # Pr(S=4)
S.prob <- c(0.1,0.13,0.21,0.41,0.15)

# ii. Obtain the cumulative probabilities.
##(ii)
cumsum(S.prob)

# iii. What is the mean of S, the expected number of stars this critic will
# award any given movie in this genre?

##(iii)
mu.S <- sum(S.prob*S.outcomes)
mu.S

# iv. What is the standard deviation of S?

##(iv)
sqrt(sum(S.prob*(S.outcomes-mu.S)^2))
# v. What is the probability that any given movie in this genre will be given at least three stars?
##(v)
sum(S.prob[3:5])

# vi. Visualize, and briefly comment on the appearance of, the probability mass function.
barplot(S.prob,ylim=c(0,0.5),names.arg=S.outcomes,space=0,xlab="s",ylab="Pr(S = s)") ### Unimodal, asymmetric -- slight left skew

# c. Return to the picnic temperature example based on the random variable W
# defined in Section 15.2.3.

# i. Write an R function to return f (w) as per Equation (15.5) for any numeric
# vector of values supplied as w. Try to avoid using a loop in favor of
# vector-oriented operations.

##(i) Bimodal, symmetric

# ii. Write an R function to return F(w) as per Equation (15.6) for any numeric
# vector of values supplied as w. Again, try to avoid using a loop, either
# explicit or implicit.

Fw <- function(w){
  w.upper <- w>65 & w<=90
  w.lower <- w>=40 & w<=65
  
  result <- rep(0,length(w))
  result[w.upper] <- (180*w[w.upper]-w[w.upper]^2-6850)/1250
  result[w.lower] <- (w[w.lower]^2-80*w[w.lower]+1600)/1250
  result[w>90] <- 1
  
  return(result)
}

##(ii) Trimodal, asymmetric -- right skew

# iii. Use your functions from (i) and (ii) to confirm the results from the
# text, in other words, that f (55.2) = 0.02432 and that F(55.2) = 0.184832.
fw(55.2)
Fw(55.2)

##(iii) Unimodal, symmetric

# iv. Make use of your function for F(w) to compute Pr(W > 60). Hint: Note that
# because the total area underneath f (w) is one,Pr(W >60)=1−Pr(W ≤60).
##(iv) Unimodal, asymmetric -- right skew

1-Fw(60)

# v. Find Pr(60.3 < W < 76.89).
Fw(76.89)-Fw(60.3)



#(c)
##(i)
##(ii)
##(iii)
##(iv)
##(v)
