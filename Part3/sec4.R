print(5/2)
print(5%/%2)    # 나눗셈의 몫
print(5%%2)     # 나눗셈의 나머지
print(5^2)
print(5*5)

100000 + 100000
10000 + 10000
1 / 1000000
1 / 10000
1 / 1000

'1' + '2'
as.numeric('1') + as.numeric('2')

'first'
"second"
first
first <- 1
first

class(1)
class('1')

3 & 0
3 & 1
3 | 0
!0
!3
class(!0)

cat(1, NA, 2)
cat(1, NULL, 2)
sum(1, na, 2)
sum(1, NA, 2)
sum(1, NULL, 2)
sum(1, NA, 2, na.rm = T)
class(NA)
class(NULL)

setwd("d:/Workspace/R_Data_Analysis/Part3/data")
txt1 <- read.csv("factor_test.csv")
txt1

factor1 <- factor(txt1$blood)
factor1
gender1 <- factor(txt1$sex)
gender1
summary(factor1)
summary(gender1)
View(txt1)
