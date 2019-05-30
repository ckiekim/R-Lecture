# apply() 계열 연습문제
data1<-read.csv("data1.csv")
data1
apply(data1[,c(2:15)],2,sum)
apply(data1[,c(2:15)],1,sum)

data2<-read.csv("1-4호선승하차승객수.csv")
data2
sapply(data2[c(1:20,)], sum)
attach(data2)
tapply(승차, 노선번호, sum)
sapply(data2[,c(3,4)], sum)
tapply(승차+하차, 노선번호, sum)
aggregate(승차+하차~노선번호, data2, sum)
aggregate(승차~노선번호, data2, sum)
aggregate(하차~노선번호, data2, sum)
