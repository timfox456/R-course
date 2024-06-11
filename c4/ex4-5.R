

# The New Zealand government consists of the political parties National, Labour, Greens, and Ma ̄ori, with several smaller parties labeled as Other. Suppose you asked 20 New Zealanders which of these they identified most with and obtained the following data:
# *  There were 12 males and 8 females; the individuals numbered 1, 5–7, 12, and 14–16 were females.
# *  The individuals numbered 1, 4, 12, 15, 16, and 19 identified with Labour; no one identified with Ma ̄ori; the individuals numbered 6, 9, and 11 identified with Greens; 10 and 20 identified with Other; and the rest identified with National.

# a. Use your knowledge of vectors (for example, subsetting and overwriting) to
# create two character vectors: sex with entries "M" (male) and "F" (female) and
# party with entries "National", "Labour", "Greens", "Maori", and "Other". Make
# sure the entries are placed in the correct positions as outlined earlier.

# b. Create two different factor vectors based on sex and party. Does it make any
# sense to use ordered=TRUE in either case? How has R appeared to arrange the
# levels?

# c. Use factor subsetting to do the following:

# i. Return the factor vector of chosen parties for only the male participants.

# ii. Return the factor vector of genders for those who chose National.

# d. Another six people joined the survey, with the results
# c("National","Maori","Maori","Labour","Greens","Labour") for the preferred
# party and c("M","M","F","F","F","M") as their gender. Combine these results
# with the original factors from (b). Suppose you also asked all individuals to
# state how confident they were that Labour will win more seats in Parliament
# than National in the next election and to attach a subjective percentage to
# that confidence. The following 26 results were obtained: 93, 55, 29, 100, 52,
# 84, 56, 0, 33, 52, 35, 53, 55, 46, 40, 40, 56, 45, 64, 31, 10, 29, 40, 95, 18,
# 61.

# e. Create a factor with levels of confidence as follows: Low for percentages
# [0,30]; Moderate for percentages (30,70]; and High for percentages (70,100].

# f. From (e), extract the levels corresponding to those individuals who
# originally said they identified with Labour. Do this also for National. What do
# you notice?
