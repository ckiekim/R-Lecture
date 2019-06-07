# Treemap
install.packages('treemap')
library(treemap)
total <- read.csv("data/학생시험결과_전체점수.csv")
total
treemap(total, vSize="점수", index=c("점수","이름"))
treemap(total, vSize="점수", index=c("조","이름"))
treemap(total, vSize="점수", index=c("점수","조","이름"))

# Stars
total <- read.table("data/학생별전체성적_new.txt", header=T, sep=',')
total
row.names(total)<- total$이름
total <- total[, 2:7]
stars(total, flip.labels=FALSE, draw.segment=FALSE,
      frame.plot=TRUE, full=TRUE,
      main="학생별 과목별 성적분석-STAR Chart" )
lab <- names(total)
value <- table(lab)
value
pie(value, labels=lab, radius=0.1, cex=0.6, col=NA)

# 나이팅게일 차트
stars(total, flip.labels=FALSE, draw.segment=TRUE, frame.plot=TRUE,
      full=TRUE, main="학생별 과목별 성적분석-나이팅게일 챠트")
label <- names(total)
value <- table(label)
color <- c("black","red","green","blue","cyan","violet")
pie(value,labels=label,col=color,radius=0.1,cex=0.6)

stars(total, flip.labels=FALSE, draw.segment=TRUE, frame.plot=TRUE,
      full=FALSE, main="학생별 과목별 분석 다이어그램-반원챠트")

# 레이더 차트
install.packages("fmsb")
library(fmsb)
layout <- data.frame(
  분석력=c(5,1),
  창의력=c(15,3),
  판단력=c(3,0),
  리더쉽=c(5,1),
  사교성=c(5,1))
set.seed(123)
data1 <- data.frame(
  분석력=runif(3,1,5),
  창의력=rnorm(3,10,2),
  판단력=c(0.5,NA,3),
  리더쉽=runif(3,1,5),
  사교성=c(5,2.5,4))

runif(10, 2, 5)
rnorm(10, 5, 2)

data2 <- rbind(layout, data1)
par(mar=c(1, 0.5, 3, 1), mfrow=c(2,2))
radarchart(data2, axistype=1, seg=5, plty=1, title="첫번째 타입")
radarchart(data2, axistype=2, pcol=topo.colors(3), plty=1, 
           title="두번째 타입")
radarchart(data2, axistype=3, pty=32, plty=1, axislabcol="grey",
           na.itp=FALSE, title="세번째 타입)")
radarchart(data2, axistype=0, plwd=1:5, pcol=1, title="네번째 타입")

par(mar=c(1,1,1,1), mfrow=c(1, 1))
