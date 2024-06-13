
##########
## 10.2 ##
##########
mynum <- 3
mynum <- 0
#(a)
if(mynum==1){
  foo <- 12
} else if(mynum==2){
  foo <- 34
} else if(mynum==3){
  foo <- 56
} else if(mynum==4){
  foo <- 78
} else if(mynum==5){
  foo <- NA
} else {
  foo <- NULL
}
foo
#(b)
if(any(doselevel=="High")){
  if(lowdose>=10){
    lowdose <- 10
  } else {
    lowdose <- lowdose/2
  }
  if(meddose>=26){
    meddose <- 26
  }
  if(highdose<60){
    highdose <- 60
  } else {
    highdose <- highdose*1.5
  }
  dosage <- rep(lowdose,length(doselevel))
  dosage[doselevel=="Med"] <- meddose
  dosage[doselevel=="High"] <- highdose
} else {
  doselevel <- factor(doselevel,levels=c("Low","Med"),labels=c("Small","Large"))
  if(lowdose<15 && meddose<35){
    lowdose <- lowdose*2
    meddose <- meddose+highdose
  }
  dosage <- rep(lowdose,length(doselevel))
  dosage[doselevel=="Large"] <- meddose
}
##(i)
lowdose <- 12.5
meddose <- 25.3
highdose <- 58.1
doselevel <- factor(c("Low","High","High","High","Low","Med","Med"),levels=c("Low","Med","High"))
##(ii)
lowdose <- 12.5
meddose <- 25.3
highdose <- 58.1
doselevel <- factor(c("Low","Low","Low","Med","Low","Med","Med"),levels=c("Low","Med","High"))
##(iii)
lowdose <- 9
meddose <- 49
highdose <- 61
doselevel <- factor(c("Low","Med","Med"),levels=c("Low","Med","High"))
##(iv)
lowdose <- 9
meddose <- 49
highdose <- 61
doselevel <- factor(c("Low","High","High","High","Low","Med","Med"),levels=c("Low","Med","High"))
#(c)
mynum <- 3
ifelse(mynum>0,switch(mynum,"one","two","three","four","five","six","seven","eight","nine"),"zero")
mynum <- 0
ifelse(mynum>0,switch(mynum,"one","two","three","four","five","six","seven","eight","nine"),"zero")

