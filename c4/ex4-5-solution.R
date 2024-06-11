#########
## 4.5 ##
#########
#(a)
party <- rep("National",20)
party[c(1,4,12,15,16,19)] <- "Labour"
party[c(6,9,11)] <- "Greens"
party[c(10,20)] <- "Other"
party
sex <- rep("M",20)
sex[c(1,5:7,12,14:16)] <- "F"
sex
#(b)
sex.fac <- factor(x=sex)
sex.fac
party.fac <- factor(x=party,levels=c("National","Labour","Greens","Maori","Other"))
party.fac # Should not use ordered=TRUE, there is no 'natural' or 'low-to-high' ordering here. Factor levels are arranged in the order specified in the 'levels' argument.
#(c)
##(i)
party.fac[sex.fac=="M"]
##(ii)
sex.fac[party.fac=="National"]
#(d)
sex.newvals <- factor(x=c("M","M","F","F","F","M"))
sex.fac <- factor(x=levels(sex.fac)[c(sex.fac,sex.newvals)])
sex.fac
party.newvals <- factor(x=c("National","Maori","Maori","Labour","Greens","Labour"),levels=levels(party.fac))
party.fac <- factor(x=levels(party.fac)[c(party.fac,party.newvals)])
party.fac
#(e)
conf <- c(93,55,29,100,52,84,56,0,33,52,35,53,55,46,40,40,56,45,64,31,10,29,40,95,18,61)
conf.fac <- cut(x=conf,breaks=c(0,30,70,100),include.lowest=TRUE,labels=c("Low","Moderate","High"))
#(f)
conf.fac[party.fac=="Labour"]
conf.fac[party.fac=="National"] # Theres an indication that those who identify as "Labour" have greater confidence than those who identify as "National" when it comes to guessing how well Labour will do in the next election.

