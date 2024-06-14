##########
## 13.2 ##
##########
#(a)
round(mean(quakes$depth>=300),2)
#(b)
mean(quakes$mag[quakes$depth>=300])
median(quakes$mag[quakes$depth>=300])
#(c)
for(i in levels(chickwts$feed)){
  cat(i,": ",round(mean(chickwts$weight[chickwts$feed==i]),1)," grams\n",sep="")
}
#(d) count: numeric-discrete; spray: categorical-nominal
#(e)
Ctab <- table(InsectSprays$count)
Ctab[Ctab==max(Ctab)]
#(f)
tapply(InsectSprays$count,INDEX=InsectSprays$spray,FUN=sum)
#(g)
for(i in levels(InsectSprays$spray)){
  cat("Spray ",i,"; at least 5 bugs: ",round(mean(InsectSprays$count[InsectSprays$spray==i]>=5)*100,0),"% \n",sep="")
}
#(h)
tapply(InsectSprays$count,INDEX=InsectSprays$spray,FUN=function(x) round(mean(x>=5)*100,0))

