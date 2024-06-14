# Ex 13-3

# Using the chickwts data frame, compute the 10th, 30th, and 90th percentiles
# of all the chick weights and then use tapply to determine which feed type is
# associated with the highest sample variance of weights.


# Turn to the seismic event data in quakes and complete the follow- ing tasks:

# i. Find the IQR of the recorded depths.

# ii. Find the five-number summary of all magnitudes of seismic events that
# occur at a depth of 400 km or deeper. Compare this to the summary values
# found in Section 13.2.3 of those events occurring at less than 400 km and
# briefly comment on what you notice.

# iii. Use your knowledge of cut (Section 4.3.3) to create a new factor vector
# called depthcat that identifies four evenly spaced categories of quakes$depth
# so that when you use levels(depthcat), it gives the following:

levels(depthcat)
#    [1] "[40,200)"  "[200,360)" "[360,520)" "[520,680]"

# iv. Find the sample mean and standard deviation of the mag- nitudes of the
# events associated with each category of depth according to depthcat.

# Use tapply to compute the 0.8th quantile of the magnitudes of the seismic
events in quakes, split by depthcat.

