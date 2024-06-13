
##########
## 10.1 ##
##########
#(a)
vec1 <- c(2,1,1,3,2,1,0)
vec2 <- c(3,8,2,2,0,0,0)
##(i)
if((vec1[1]+vec2[2])==10){ cat("Print me!") }  # condition SATISFIED
##(ii)
if(vec1[1]>=2&&vec2[1]>=2){	cat("Print me!") }  # condition SATISFIED
##(iii)
if(all((vec2-vec1)[c(2,6)]<7)){	cat("Print me!") }  # condition NOT SATISFIED
##(iv)
if(!is.na(vec2[3])){ cat("Print me!") }  # condition SATISFIED
#(b)
ifelse(vec1+vec2>3,vec1*vec2,vec1+vec2)
#(c)
if(any(substr(diag(mymat),1,1)=="g")||any(substr(diag(mymat),1,1)=="G")){
  indexes <- which(substr(diag(mymat),1,1)=="g"|substr(diag(mymat),1,1)=="G")
  diag(mymat)[indexes] <- "HERE"
} else {
  mymat <- diag(nrow(mymat))
}
mymat
##(i)
mymat <- matrix(as.character(1:16),4,4)
##(ii)
mymat <- matrix(c("DANDELION","Hyacinthus","Gerbera","MARIGOLD","geranium","ligularia","Pachysandra","SNAPDRAGON","GLADIOLUS"),3,3)
##(iii)
mymat <- matrix(c("GREAT","exercises","right","here"),2,2,byrow=T)

