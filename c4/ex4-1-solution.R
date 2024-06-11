

#########
## 4.1 ##
#########
#(a)
foo <- c(6,9,7,3,6,7,9,6,3,6,6,7,1,9,1)
foo
foo==6
foo>=6
foo<(6+2)
foo!=6
#(b)
bar <- foo[-(1:3)]
bar <- array(data=bar,dim=c(2,2,3))
bar
bar<=(6/2+4)
(bar+2)<=(6/2+4)
#(c)
diag(10)==0
#(d)
any(bar<=(6/2+4))
all(bar<=(6/2+4))
any((bar+2)<=(6/2+4))
all((bar+2)<=(6/2+4))
#(e)
any(diag(diag(10)==0))

