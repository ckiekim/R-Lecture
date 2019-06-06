var1<-c(1:5)
plot(var1)
x <- 1:3
y <- 3:1
plot(x,y)
plot(x,y,xlim=c(1,10),ylim=c(1,5))
plot(x,y,xlim=c(1,10),ylim=c(1,5), xlab="X축 값" , ylab="Y축 값",
     main="Plot Test")

v1 <- c(100,130,120,160,150)
plot(v1,type='o',col='red',ylim=c(0,200), axes=FALSE,ann=FALSE)
axis(1,at=1:5, lab=c("MON","TUE","WED","THU","FRI"))
axis(2,ylim=c(0,200))

title(main="FRUIT" , col.main="red",font.main=4)
title(xlab="DAY", col.lab="black")
title(ylab="PRICE",col.lab="blue")

par(mfrow=c(1,3))
plot(v1, type="o")
plot(v1, type="s")
plot(v1, type="l")

par(mfrow=c(1,3))
pie(v1)
plot(v1,type="o")
barplot(v1)

par(mfrow=c(1,1))
a <- c(1,2,3)
plot(a,xlab="aaa")

par(mgp=c(0,1,0)) #  mgp=c(제목위치,지표값위치,지표선위치)) 
plot(a,xlab="aaa")
par(mgp=c(3,1,0))
plot(a,xlab="aaa")
par(mgp=c(3,2,0))
plot(a,xlab="aaa")
par(mgp=c(3,2,1))
par(oma=c(0,2,0,0))
plot(a,xlab="aaa")

v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)
v3 <- c(3,4,5,6,7)
plot(v1,type="s",col="red",ylim=c(1,5))
par(new=T)  # 이 부분이 중복 허용 부분입니다
plot(v2,type="o",col="blue",ylim=c(1,5))
par(new=T)  # 이 부분이 중복 허용 부분입니다
plot(v3,type="l",col="green")

plot(v1,type="s",col="red",ylim=c(1,10))
lines(v2,type="o",col="blue",ylim=c(1,5))
lines(v3,type="l",col="green",ylim=c(1,15))
legend(4,9,c("v1","v2","v3"),cex=0.9,col=c("red","blue","green"),lty=1)

x<-1:5
barplot(x)
barplot(x,horiz=T)

x <- matrix(c(5,4,3,2),2,2)
barplot(x,beside=T,names=c(5,3), col=c("green","yellow"))
barplot(x,names=c(5,3),col=c("green","yellow"),ylim=c(0,12))
par(oma=c(1,0.5,1,0.5))
barplot(x,names=c(5,3),beside=T,col=c("green","yellow"),horiz=T)
barplot(x,horiz=T,names=c(5,3),col=c("green","yellow"),xlim=c(0,12))

v1 <- c(100,120,140,160,180)
v2 <- c(120,130,150,140,170)
v3 <- c(140,170,120,110,160)
qty <- data.frame(BANANA=v1,CHERRY=v2,ORANGE=v3)
qty
barplot(as.matrix(qty),main="Fruit's Sales QTY" ,
        beside=T,col=rainbow(nrow(qty)),ylim=c(0,400))
legend(14,400,c("MON","TUE","WED","THU","FRI"),cex=0.8,
       fill=rainbow(nrow(qty)))
barplot(t(qty),main="Fruits Sales QTY",ylim=c(0,900),
        col=rainbow(length(qty)),space=0.1,cex.axis=0.8,las=1,
        names.arg=c("MON","TUE","WED","THU","FRI"),cex=0.8)
legend(0.2,800,names(qty),cex=0.7,fill=rainbow(length(qty)) )
t(qty)

peach <- c(180,200,250,198,170)
colors <- c( )
for (i in 1:length(peach)) { 
  if (peach[i] >= 200 )
    colors <- c(colors,"red")
  else if ( peach[i] >= 180 )
    colors <- c(colors,"yellow")
  else 
    colors <- c(colors,"green")
}
barplot(peach,main="Peach Sales QTY" , 
        names.arg=c("MON","TUE","WED","THU","FRI"),col=colors)

height <- c(182,175,167,172,163,178,181,166,159,155)
hist(height,main="histogram of height")
par(mfrow=c(1,2),oma=c(2,2,0.1,0.1))
hist <- c(1,1,2,3,3,3)
hist(hist)
plot(hist,main="Plot")

par(mfrow=c(1,1),oma=c(0.5,0.5,0.1,0.1))
p1 <- c(10,20,30,40)
pie(p1,radius=1)
pie(p1,radius=1,init.angle=90)
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),
    label=c("Week 1" ,"Week 2" , "Week 3" ,"Week 4"))

pct <- round(p1/sum(p1) * 100,1)
lab <- paste(pct," %")
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),label=lab)
legend(1,1.1,c("Week 1","Week 2","Week 3","Week 4"),
       cex=0.5,fill=rainbow(length(p1)))
lab1 <- c("Week 1","Week 2","Week 3","Week 4")
lab2 <- paste(lab1,"\n",pct," %")
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),label=lab2)


install.packages("plotrix")
library(plotrix)
p1<-seq(10,50,10)
f_day <- round(p1/sum(p1)*100,1)
f_label <- paste(f_day,"%")
pie3D(p1,main="3D Pie Chart",col=rainbow(length(p1)),
      cex=0.3,labels=f_label,explode=0.05)
legend(0.8,1.0,c("MON","TUE","WED","THU","FRI"),cex=0.5,
       fill=rainbow(length(p1)))

v1 <- c(10,12,15,11,20)
v2 <- c(5,7,15,8,9)
v3 <- c(11,20,15,18,13)
boxplot(v1,v2,v3)
boxplot(v1,v2,v3,col=c("blue","yellow","pink"),
        names=c("Blue","Yellow","Pink"), horizontal=T)

install.packages("igraph")
library(igraph)
g1 <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))
plot(g1)
str(g1)

name <- c('서진수 대표이사','일지매 부장','김유신 과장','손흥민 대리','노정호 대리',
          '이순신 부장','유관순 과장','신사임당 대리','강감찬 부장','광개토 과장','정몽주 대리')
pemp <- c('서진수 대표이사','서진수 대표이사','일지매 부장','김유신 과장','김유신 과장',
           '서진수 대표이사','이순신 부장', '유관순 과장','서진수 대표이사',
           '강감찬 부장','광개토 과장')
emp <- data.frame(이름=name,상사이름=pemp)
emp
g <- graph.data.frame(emp,directed=T)
plot(g,layout=layout.fruchterman.reingold,vertex.size=8,edge.arrow.size=0.5)
str(g)
g3 <- graph.data.frame(emp,directed=F)
plot(g3,layout=layout.fruchterman.reingold,vertex.size=8,
     edge.arrow.size=0.5 , vertex.label=NA)

install.packages("devtools")
install.packages('backports')
library(devtools)
install_github("christophergandrud/d3Network")
library(RCurl)
library(d3Network)
install.packages("d3Network")

name <- c('Angela Bassett','Jessica Lange','Winona Ryder','Michelle Pfeiffer',
          'Whoopi Goldberg','Emma Thompson','Julia Roberts','Sharon Stone','Meryl Streep',
          'Susan Sarandon','Nicole Kidman')
pemp <- c('Angela Bassett','Angela Bassett','Jessica Lange','Winona Ryder','Winona Ryder',
          'Angela Bassett','Emma Thompson', 'Julia Roberts','Angela Bassettlibrary(RCurl)',
          'Meryl Streep','Susan Sarandon')
emp <- data.frame(이름=name,상사이름=pemp)
d3SimpleNetwork(emp,width=600,height=600,file="c:\\temp\\d3.html")

g <- read.csv("d:/workspace/r_data_analysis/part4/data/군집분석.csv",head=T)
str(g)
graph <- data.frame(학생=g$학생,교수=g$교수)
g<-graph.data.frame(graph,directed=T)
plot(g,layout=layout.fruchterman.reingold,vertex.size=2,edge.arrow.size=0.5,
    vertex.color="green",vertex.label=NA)
plot(g,layout=layout.kamada.kawai,vertex.size=2,edge.arrow.size=0.5,
     vertex.label=NA)
V(g)$name
gubun1 <- V(g)$name
gubun1
library(stringr)
gubun <- str_sub(gubun1,start=1,end=1)
gubun
colors <- c()
sizes <- c()
for ( i in 1:length(gubun)) {
  if (gubun[i] == 'S' ) {
    colors <- c(colors,"red")
    sizes <- c(sizes,2) 
  } else { 
    colors <- c(colors,"green") 
    sizes <- c(sizes,6) 
  }
}
plot(g,layout=layout.fruchterman.reingold,vertex.size=sizes,edge.arrow.size=0.5,
     vertex.color=colors)
plot(g,layout=layout.fruchterman.reingold,vertex.size=sizes,edge.arrow.size=0.5,
     vertex.color=colors,vertex.label=NA)
plot(g,layout=layout.fruchterman.reingold,vertex.size=sizes,edge.arrow.size=0,
     vertex.color=colors,vertex.label=NA)
plot(g,layout=layout.kamada.kawai,vertex.size=sizes,edge.arrow.size=0,
     vertex.color=colors,vertex.label=NA)

shapes <- c()
for ( i in 1:length(gubun)) {
  if (gubun[i] == 'S' ) {
    shapes <- c(shapes,"circle") }
  else { 
    shapes <- c(shapes,"square") }
}

plot(g,layout=layout.kamada.kawai,vertex.size=sizes,edge.arrow.size=0,
     vertex.color=colors,vertex.label=NA,vertex.shape=shapes)

savePlot("colorcontrol_5.png",type="png")

virus1 <- read.csv("d:/workspace/r_data_analysis/part4/data/메르스전염현황.csv",header=T)
d3SimpleNetwork(virus1,width=600,height=600,file="c:\\temp\\mers.html")

install.packages('treemap')
library(treemap)
setwd("d:/workspace/r_data_analysis/part4")
total <- read.csv("data/학생시험결과_전체점수.csv",header=T,sep=",")
total
treemap(total,vSize="점수",index=c("점수","이름"))
treemap(total,vSize="점수",index=c("조","이름"))
treemap(total,vSize="점수",index=c("점수","조","이름"))

total <- read.table("data/학생별전체성적_new.txt",header=T,sep=",")
total
row.names(total)<- total$이름
total <- total[,2:7]
stars(total,flip.labels=FALSE,draw.segment=FALSE,frame.plot=TRUE,full=TRUE,
      main="학생별 과목별 성적분석-STAR Chart" )
lab <- names(total)
value <- table(lab)
value
names(total)
pie(value,labels=lab,radius=0.1,cex=0.6,col=NA)
savePlot("star_2.png",type="png")

stars(total,flip.labels=FALSE,draw.segment=TRUE,frame.plot=TRUE,full=TRUE,
       main="학생별 과목별 성적분석-나이팅게일 챠트" )
label <- names(total)
value <- table(label)
pie(value,labels=label,radius=0.1,cex=0.6)
color <- c("black","red","green","blue","cyan","violet")
pie(value,labels=label,col=color,radius=0.1,cex=0.6)
stars(total,flip.labels=FALSE,draw.segment=TRUE,frame.plot=TRUE,full=FALSE,
      main="학생별 과목별 분석 다이어그램-반원챠트" )

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
data2 <- rbind(layout,data1)
op <- par(mar=c(1,0.5,3,1),mfrow=c(2,2)) 
radarchart(data2,axistype=1,seg=5,plty=1,title="첫번째 타입")
radarchart(data2,axistype=2,pcol=topo.colors(3),plty=1,title="두번째 타입")
radarchart(data2,axistype=3,pty=32,plty=1,axislabcol="grey",na.itp=FALSE,
           title="세번째 타입)")
radarchart(data2,axistype=0,plwd=1:5,pcol=1,title="네번째 타입")

par(mfrow=c(1,1))
plot(1:15)
abline(h=8)  # 선 긋기
rect(1,6,3,8)  # 사각형 그리기
arrows(1,1,5,5) # 화살표 그리기
text(8,9,"TEXT")  # 글자 쓰기
title("THIS IS TEST","SUB") 

library(ggplot2)
korean <- read.table("data/학생별국어성적_new.txt",header=T,sep=",")
korean
ggplot(korean,aes(x=이름,y=점수)) + geom_point()
ggplot(korean,aes(x=이름,y=점수)) + 
  geom_bar(stat="identity",fill="green", colour="red") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1, color="blue",size=8))

score_kem <- read.csv("data/학생별과목별성적_국영수_new.csv",header=T)
score_kem
library(plyr)
sort_kem <- arrange(score_kem,이름,과목)
sort_kem3
sort_kem2 <- ddply(sort_kem,"이름",transform,누적합계=cumsum(점수))
sort_kem3 <- ddply(sort_kem2,"이름",transform,누적합계=cumsum(점수),
                  label=cumsum(점수)-0.5*점수)
ggplot(sort_kem3,aes(x=이름,y=점수,fill=과목)) + 
  geom_bar(stat="identity") +
  geom_text(aes(y=label,label=paste(점수,'점')),colour="black",size=4) +
  guides(fill=guide_legend(reverse=T)) +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1,
        colour="black", size=8))

score <- read.table("data/학생별전체성적_new.txt",header=T,sep=",")
ggplot(score,aes(x=영어,y=reorder(이름,영어))) + 
  geom_point(size=6) +
  theme_bw( ) +
  theme(panel.grid.major.x=element_blank( ) ,
        panel.grid.minor.x=element_blank( ) ,
        panel.grid.major.y=element_line(color="red",linetype="dashed"))
ggplot(score,aes(x=영어,y=reorder(이름,영어))) + 
  geom_segment(aes(yend=이름),xend=0,color="blue") +
  geom_point(size=6,color="green") +
  theme_bw() +
  theme(panel.grid.major.y=element_blank())

install.packages("gridExtra")
library(gridExtra)
v_mt <- mtcars
graph1 <- ggplot(v_mt,aes(x=hp , y=mpg))
graph1 + geom_point()

png(filename = "graph/graph1.png", width = 480, height = 480)
graph1 + geom_point()
dev.off()
graph2 <- graph1 + geom_point(colour="blue") 
png(filename = "graph/graph2.png", width = 480, height = 480)
graph2
graph3 <- graph2 + geom_point(aes(color=factor(am))) 
png(filename = "graph/graph3.png", width = 480, height = 480)
graph3
