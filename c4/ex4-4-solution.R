
#########
## 4.4 ##
#########
#(a)
cat("\"The quick brown fox\n\tjumped over\n\t\tthe lazy dogs\"")
#(b)
num1 <- 4
num2 <- 0.75
paste("The result of multiplying",num1,"by",num2,"is",num1*num2)
#(c)
sub(pattern="tdavies",replacement="aschwarzenegger",x="/Users/tdavies/Documents/RBook")
#(d)
bar <- "How much wood could a woodchuck chuck"
##(i)
baz <- paste(bar,"if a woodchuck could chuck wood")
##(ii)
gsub(pattern="wood",replacement="metal",x=baz)
#(e)
foo <- "Two 6-packs for $12.99"
#(i)
substr(x=foo,start=5,stop=10)=="6-pack"
#(ii)
substr(x=foo,start=19,stop=19) <- "0"
foo

