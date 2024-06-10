
#########
## 2.4 ##
#########
#(a)
foo <- c(seq(from=3,to=6,length.out=5),rep(c(2,-5.1,-33),times=2),7/42+2)
foo
#(b)
bar <- foo[c(1,length(x=foo))]
bar
#(c)
baz <- foo[-c(1,length(x=foo))]
baz
#(d)
c(bar[1],baz,bar[2])
#(e)
foo <- sort(x=foo,decreasing=FALSE)
foo
#(f)
foo[length(x=foo):1]
sort(x=foo,decreasing=TRUE)
#(g)
baz[c(rep(x=3,times=3),rep(x=6,times=4),length(x=baz))]
#(h)
qux <- foo
qux[c(1,5:7,12)] <- 99:95
qux


