
#########
## 2.3 ##
#########
#(a)
foo <- seq(from=5,to=-11,by=-0.3)
foo
#(b)
foo <- sort(x=foo,decreasing=FALSE)
foo
#(c)    
bar <- rep(x=c(-1,3,-5,7,-9),times=2,each=10)
sort(x=bar,decreasing=TRUE)
#(d)
baz <- c(6:12,rep(5.3,times=3),-3,seq(from=102,to=length(bar),length.out=9))
baz
#(e)
length(baz)

