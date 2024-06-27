##########
## 22.1 ##
##########


# Ex 22-1

# In Sections 22.2.2 and 22.2.3, you used forward and backward selec- tion
# approaches to find a model for predicting the cost of the con- struction of
# nuclear power plants (based on the nuclear data frame in the boot package).

# a. Using the same fullest model (in other words, main effects of all present
# predictors only), use stepwise AIC selection to find a suitable model for the
# data.
#(a)
library("boot")
nuc.null <- lm(cost~1,data=nuclear)
nuc.step <- step(nuc.null,scope=.~.+date+t1+t2+cap+pr+ne+ct+bw+cum.n+pt,direction="both")
summary(nuc.step)



# b. Does the final model found in (a) match either of the models resulting
# from the earlier use of forward and backward selection? How does it differ?


#(b) The model in (a) is again different to that selected by either forward or backward elimination. It's most similar to the model chosen via backward selection, differing only by an additional, non-significant, effect for 'ct'.


# Exercise 21.2 on page 512 detailed Galileo’s ball data. Enter these as a data
# frame in your current R workspace if you haven’t already.

# c. Fit five linear models to these data with distance as the response—an
# intercept-only model and four separate poly- nomial models of increasing
# order 1 to 4 in height.

gal <- data.frame(d=c(573,534,495,451,395,337,253),h=c(1,0.8,0.6,0.45,0.3,0.2,0.1))
gal.mod0 <- lm(d~1,data=gal)
gal.mod1 <- lm(d~h,data=gal)
gal.mod2 <- lm(d~h+I(h^2),data=gal)
gal.mod3 <- lm(d~h+I(h^2)+I(h^3),data=gal)
gal.mod4 <- lm(d~h+I(h^2)+I(h^3)+I(h^4),data=gal)



#(d)
# d. Construct a table of partial F-tests to identify your favored model for
# distance traveled. Is your selection consistent with Exercise 21.2 (b) and
# (c)?

anova(gal.mod0,gal.mod1,gal.mod2,gal.mod3,gal.mod4)

# Yes, the model chosen via nested partial F-tests matches the cubic model you would have likely identified in Exercise 21.2. The improvement to goodness-of-fit is minimal (and not statistically significant) if moving from the order 3 to the order 4 model.

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
# terms) among waist, height, and hip; and a main effect for location.

#(e)
diabetes = read.csv("diabetes.csv")
diab <- na.omit(diabetes[,c("chol","age","gender","height","weight","frame","waist","hip","location")])


# f. Use your data frame from (e) to fit two linear models with chol as the
# response. The null model object, named dia.null, should be an intercept-only
# model. The full model object, named dia.full, should be the overly complex
# model with a four-way interaction (and all lower-order terms) among age,
# gender, weight, and frame; a three-way interaction (and all lower-order

#(f)
dia.null <- lm(chol~1,data=diab)
dia.full <- lm(chol~age*gender*weight*frame+waist*height*hip+location,data=diab)




# g. Starting from dia.null and using the same terms as in dia.full for scope,
# implement stepwise selection by AIC to choose a model for mean total
# cholesterol and then summarize.

#(g)
dia.step <- step(dia.null,scope=.~.+age*gender*weight*frame+waist*height*hip+location)
summary(dia.step)



# h. Use forward selection based on partial F-tests with a conventional
# significance level of α = 0.05 to choose a model, again starting from
# dia.null. Is the result here the same as the model arrived at in (g)?

#(h)
add1(dia.null,scope=.~.+age*gender*weight*frame+waist*height*hip+location,test="F")
dia.1 <- update(dia.null,.~.+age)
add1(dia.1,scope=.~.+age*gender*weight*frame+waist*height*hip+location,test="F")
dia.2 <- update(dia.1,.~.+frame)
add1(dia.2,scope=.~.+age*gender*weight*frame+waist*height*hip+location,test="F")
summary(dia.2)
# The two models in (g) and (h) are quite different. Step-wise AIC has chosen a model that includes the two-way interaction between 'age' and 'frame', as well as a main effect for 'waist'. Performing forward selection halts after main effects for 'age' and 'frame' are added only, with no further additions offering a statistically significant improvement to goodness-of-fit.

# i. Stepwise selection doesn’t have to start from the simplest model. Repeat
# (g), but this time, set dia.full to be the starting model (you don’t need to
# supply anything to scope if you’re starting from the most complex model).
# What is the final model selected via AIC if you start from dia.full? Is it
# different than the final model from (g)? Why is this or is this not the case,
# do you think
#(i)
dia.step2 <- step(dia.full)
summary(dia.step2)

# The model chosen via step-wise AIC when starting from 'dia.full' is far, far more complex than the AIC-selected model in (g). The model contains a three-way interaction between 'age', 'gender' and 'weight', and all lower-order effects, as well as main effects and a two-way interaction between 'waist' and 'hip'. By starting from the very complex model, it seems we've accessed potential candidate models which have AIC values that are lower than those accessible by starting the selection algorithm at the null (intercept-only) model. For this reason, the final model reached in this way refuses to move to the simpler model selected in (g) since it's already found a model with a lower value for that criterion. Whether or not we'd be willing to settle on this rather complex model for predictive purposes is a more difficult question to answer...


# Revisit the ubiquitous mtcars data frame from the MASS package.

# In Section 22.2.4, you used stepwise AIC selection to model mean MPG. The
# selected model included a main effect for qsec. Rerun the same AIC selection
# process, but this time, do it in terms of GPM=1/MPG. Does this change the
# complexity of the final model?

#(j)
car.null <- lm(I(1/mpg)~1,data=mtcars)
car.step <- step(car.null,scope=.~.+wt*hp*factor(cyl)*disp+am+factor(gear)+drat+vs+qsec+carb)
summary(car.step)
# Modeling the response as GPM instead of MPG, step-wise AIC selection offers up a far simpler model, with main effects for 'wt' and 'hp' only. It would seem that this transformation of the response greatly simplifies the relationships in the data.




