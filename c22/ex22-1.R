
# Ex 22-1

# In Sections 22.2.2 and 22.2.3, you used forward and backward selec- tion
# approaches to find a model for predicting the cost of the con- struction of
# nuclear power plants (based on the nuclear data frame in the boot package).

# a. Using the same fullest model (in other words, main effects of all present
# predictors only), use stepwise AIC selection to find a suitable model for the
# data.

# b. Does the final model found in (a) match either of the models resulting
# from the earlier use of forward and backward selection? How does it differ?

# Exercise 21.2 on page 512 detailed Galileo’s ball data. Enter these as a data
# frame in your current R workspace if you haven’t already.

# c. Fit five linear models to these data with distance as the response—an
# intercept-only model and four separate poly- nomial models of increasing
# order 1 to 4 in height.

# d. Construct a table of partial F-tests to identify your favored model for
# distance traveled. Is your selection consistent with Exercise 21.2 (b) and
# (c)?

# You first encountered the diabetes data frame in the contributed faraway
# package in Section 21.5.2, where you modeled the mean total cholesterol. Load
# the package and inspect the documentation in ?diabetes to refresh your memory
# of the data set.

# e. There are some missing values in diabetes that might interfere with model
# selection algorithms. Define a new version of the diabetes data frame that
# deletes all rows with a missing value in any of the following variables:
# chol, age, gender, height, weight, frame, waist, hip, location. Hint: Use
# na.omit or your knowledge of record extraction or deletion for a data frame.
# You can create the required vector of row numbers to be extracted or deleted
# using which and is.na, or you can try using the complete.cases function to
# obtain a logical flag vector—inspect its help file for details.

# f. Use your data frame from (e) to fit two linear models with chol as the
# response. The null model object, named dia.null, should be an intercept-only
# model. The full model object, named dia.full, should be the overly complex
# model with a four-way interaction (and all lower-order terms) among age,
# gender, weight, and frame; a three-way interaction (and all lower-order
# terms) among waist, height, and hip; and a main effect for location.

# g. Starting from dia.null and using the same terms as in dia.full for scope,
# implement stepwise selection by AIC to choose a model for mean total
# cholesterol and then summarize.

# h. Use forward selection based on partial F-tests with a conventional
# significance level of α = 0.05 to choose a model, again starting from
# dia.null. Is the result here the same as the model arrived at in (g)?

# i. Stepwise selection doesn’t have to start from the simplest model. Repeat
# (g), but this time, set dia.full to be the starting model (you don’t need to
# supply anything to scope if you’re starting from the most complex model).
# What is the final model selected via AIC if you start from dia.full? Is it
# different than the final model from (g)? Why is this or is this not the case,
# do you think

# Revisit the ubiquitous mtcars data frame from the MASS package.

# In Section 22.2.4, you used stepwise AIC selection to model mean MPG. The
# selected model included a main effect for qsec. Rerun the same AIC selection
# process, but this time, do it in terms of GPM=1/MPG. Does this change the
# complexity of the final model?
