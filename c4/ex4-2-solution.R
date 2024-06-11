
#########
## 4.2 ##
#########
#(a)
foo <- c(7,1,7,10,5,9,10,3,10,8)
(foo>5)|(foo==2)
#(b)
bar <- c(8,8,4,4,5,1,5,6,6,8)
(bar<=6)&(bar!=4)
#(c)
((foo>5)|(foo==2))&((bar<=6)&(bar!=4))
#(d)
baz <- foo+bar
baz
##(i)
(baz>=14)&(baz!=15)
##(ii)
(baz/foo>4)|(baz/foo<=2)
#(e)
(foo>5)||(foo==2)
(bar<=6)&&(bar!=4)
((foo>5)||(foo==2))&&((bar<=6)&&(bar!=4))
(baz>=14)&&(baz!=15)
(baz/foo>4)||(baz/foo<=2)

