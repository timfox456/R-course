# Chapter 2: Numeric, Arithmetic, Assignment, and Vectors

---


## Arithmetic

 * We can do basic arithmetic operations
 * `+`, `-`, `*`, `/`

```r
# Basic arithmetic operations sum <- 5 + 3
difference <- 5 - 3
product <- 5 * 3
quotient <- 5 / 3
```

---

## Logarithms and Exponentials

 * The `log` function can do logarithms
 * the `exp` function can do exponents

```r
log_value <- log(10)  # Natural logarithm
exp_value <- exp(2)   # Exponential
```


---

## E-notation for large numbers

 * `e` notation can help us represent large numbers

```r
large_number <- 2.5e6
small_number <- 2.5e-6
```


---

## Variable Assignment
 
 * can use either `<-` or `=`
 * R convention *slightly* prefers `<-`

```r
# Assigning values to variables
x <- 10
y <- 20
z <- x + y
```


---

## Vector Creation

* use the `c` function
* returns a vector

```r
# Creating a vector
vector <- c(1, 2, 3, 4, 5)
```


---

## Sequences

 * Use the `:` notation
 * or, use the `seq` function


```r
# Creating sequences
sequence <- 1:10
sequence2 <- seq(1,10,1)
```


---

## Repeating Elements

 * Use the `rep` function

```r
# Repeating elements
repeated_vector <- rep(1, times = 5)
```



---

## Sorting

 * Use the `sort` function

```r
# Sorting a vector
sorted_vector <- sort(c(5, 3, 8, 1))
```


---

## Vector Length

 * Use the `length` function

```r
# Sorting a vector
sorted_vector <- sort(c(5, 3, 8, 1))
```

---

## Subsetting

 * Use the `[]`

```r
# Subsetting a vector
subset_vector <- c(1, 2, 3, 4, 5)[1:3]
```

---

## Element Extraction

 * Again use `[]`

```r
# Extracting elements from a vector
element <- c(1, 2, 3, 4, 5)[2]
```


---

## Vector Oriented Operations

```r
vector_sum = <- c(1,2,3) + c(4,5,6)
```

---

## Vector Recycling
 * R will *recycle* elements of the smaller vector when combined with a larger one.

```r
# Vector recycling
recycled_vector <- c(1, 2) + c(3, 4, 5, 6)

```

--- 

## Vector Arithmetic

 * Arithmetic is performed element-wise

```r
# Vector arithmetic
vector_product <- c(1, 2, 3) * c(4, 5, 6)
```

---

## Logical Vectors
 
 * Vectors can contain `logical` (`TRUE`/`FALSE`) values

```r
# Logical vectors
logical_vector <- c(TRUE, FALSE, TRUE)
```

--- 

## Combining Vectors

 * We can combined vectors with the `c` function

```r
# Combining vectors
combined_vector <- c(c(1, 2, 3), c(4, 5, 6))
```

--- 

## Applying a function to a vector

 * Many built-in functions in R can be applied to a vector.

```r
# Applying functions to vectors
mean_value <- mean(c(1, 2, 3, 4, 5))
```

--- 

## Indexing A Vector
 * We can index a vector with another vector

```r
# Indexing vectors
indexed_vector <- c(1, 2, 3, 4, 5)[c(1, 3, 5)]
```

## Comparison

 * Operations such as `==` (equality) or `<` (less than) are applied element-wise
 * Output is a logical vector

```r
# Comparing vectors
comparison <- c(1, 2, 3) > c(2, 1, 3)
```

## Vector Aggregation

```r
# Aggregating vector values
sum_vector <- sum(c(1, 2, 3, 4, 5))
```

