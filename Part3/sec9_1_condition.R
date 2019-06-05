# 조건식
myAbs <- function(x) {
  if (x >= 0) {
    return(x)
  } else {
    return(-x)
  }
}
myAbs(-3.2)
myAbs(4.5)

myAbs2 <- function(x) {
  if (x >= 0) {
    return(x)
  } 
  return(-x)
}
myAbs2(-3.2)
myAbs2(4.5)

myF1 <- function(x) {
  if (x > 0) {
    return(x*x)
  } else {
    return(0)
  }
}
myF1(4.6)
myF1(-2.4)

myF2 <- function(x) {
  if (x > 0) {
    return(2 * x)
  } else if (x == 0) {
    return(0)
  } else {
    return(-2 * x)
  }
}
myF2(4.6)
myF2(0)
myF2(-2.4)

number <- scan()
result <- ifelse(number%%2 == 0, '짝수', '홀수')
result

# 연습문제
ex1 <- function(x) {
  return(ifelse(x > 5, 1, 0))
  # if (x > 5) {
  #   return(1)
  # } else {
  #   return(0)
  # }
}

ex2 <- function(x) {
  # return(ifelse(x > 0, 1, 0))
  if (x > 0) {
    return(1)
  } else {
    return(0)
  }
}

ex3 <- function(x, y) {
  # return(ifelse(x > y, x - , y - x))
  if (x > y) {
    return(x - y)
  } else {
    return(y - x)
  }
}

ex4 <- function(x) {
  if (x < 0) {
    return(0)
  } else if (x >= 1 && x <= 5) {
    return(1)
  } else if (x > 5) {
    return(10)
  } else {
    return(-1)
  }
}
xx <- c(T, T, F)
yy <- c(F, T, F)
xx & yy
xx && yy

ex5 <- function(input) {
  if (input == 'Y' || input == 'y') {
    return('Yes')
  } else {
    return('Not Yes')
  }
}
ans <- scan(what="")
ex5(ans)

myIntD <- function(a, b, c) {
  D = b*b - 4*a*c
  if (D > 0) {
    return(2)
  } else if (D == 0) {
    return(1)
  } else {
    return(0)
  }
}

myRealD <- function(a, b, c) {
  D = b*b - 4*a*c
  print(D)
  if (abs(D) < 1e-5) {
    return(1)
  } else if (D > 0) {
    return(2)
  } else {
    return(0)
  }
} 

a <- 40.0/39.9999999999
b <- -2.00000000001
c <- 1.0000000002
myRealD(a, b, c)

