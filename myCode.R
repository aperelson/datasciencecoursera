myfunction <- function() {
  x <- rnorm(100)
  mean(x)
}

second <- function(x) {
  x + rnorm(length(x))
}

make.power <- function(n){
  pow <- function(x){
    x ^ n
  }
  pow
}

y <- 10

f <- function(x){
  y <- 2
  y ^ 2 + g(x)
}

g <- function(x) {
  x * y
}
