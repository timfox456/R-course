## Ex 15-2

# a. For each of the following definitions, identify whether it’s best
# described as a random variable or as a realization of a random variable.
# Furthermore, identify whether each statement describes a continuous or a
# discrete quantity.

# i. The number of coffees x made by your local shop on June 3, 2016

# ii. The number of coffees X made by your local shop on any given day

# iii. Y,whetherornotitrainstomorrow

# iv. Z, the amount of rain that falls tomorrow

# v. How many crumbs k on your desk right now

# vi. Total collective weight W of the crumbs on your desk at any specified time

# b. Suppose you construct the following table providing probabilities
# associated with the random variable S, the total stars given to any movie in
# a particular genre by a certain critic:

# s12345 Pr(S = s) 0.10 0.13 0.21 ??? 0.15

# i. Assuming this table describes the complete set of outcomes, evaluate the
# missing probability Pr(S = 4).

# ii. Obtain the cumulative probabilities.

# iii. What is the mean of S, the expected number of stars this critic will
# award any given movie in this genre?

# iv. What is the standard deviation of S?

# v. What is the probability that any given movie in this genre will be given at least three stars?

# vi. Visualize, and briefly comment on the appearance of, the probability mass function.

# c. Return to the picnic temperature example based on the random variable W
# defined in Section 15.2.3.

# i. Write an R function to return f (w) as per Equation (15.5) for any numeric
# vector of values supplied as w. Try to avoid using a loop in favor of
# vector-oriented operations.

# ii. Write an R function to return F(w) as per Equation (15.6) for any numeric
# vector of values supplied as w. Again, try to avoid using a loop, either
# explicit or implicit.

# iii. Use your functions from (i) and (ii) to confirm the results from the
# text, in other words, that f (55.2) = 0.02432 and that F(55.2) = 0.184832.

# iv. Make use of your function for F(w) to compute Pr(W > 60). Hint: Note that
# because the total area underneath f (w) is one,Pr(W >60)=1−Pr(W ≤60).

# v. Find Pr(60.3 < W < 76.89).
