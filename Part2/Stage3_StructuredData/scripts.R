setwd('d:/workspace/r_data_analysis/part2/stage3_StructuredData')
data1 <- read.csv("2013년_서울_주요구별_병원현황.csv" , header=T)
data1
barplot(as.matrix(data1[1:9,2:11]),
        main=paste("서울시 주요 구별 과목별 병원현황-2013년","\n",
                   "출처[국민건강보험공단]") , ylab="병원수", beside=T ,
        col=rainbow(8),ylim=c(0,350))
abline(h=seq(0,350,10),lty=3,lwd=0.2)
name <- data1$표시과목
name
legend(75,350,name,cex=0.8,fill=rainbow(8),bg="white")

v1 <- data1[1:9,2]*0.1 # 강남구 값 
v2 <- data1[1:9,3]*0.1 # 강동구 값
v3 <- data1[1:9,4]*0.1 # 강서구 값
v4 <- data1[1:9,5]*0.1 # 관악구 값
v5 <- data1[1:9,6]*0.1 # 구로구 값
v6 <- data1[1:9,7]*0.1 # 도봉구 값
v7 <- data1[1:9,8]*0.1 # 동대문구 값
v8 <- data1[1:9,9]*0.1 # 동작구 값
v9 <- data1[1:9,10]*0.1 # 마포구 값
v10 <- data1[1:9,11]*0.1 # 서대문구 값
par(mfrow=c(2,5))
par(mfrow=c(1,1))
gangnam <- barplot(as.matrix(v1),main="강남구 병원현황",
                   beside=T,axes=F,ylab="병원수(단위:10개)",xlab="", cex.names=0.85,
                   las=2, ylim=c(0,40), col=rainbow(8), border="white",names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)
gangnam

install.packages("googleVis")
library(googleVis)
data <- read.csv("2013년_서울_구별_주요과목별병원현황_구글용.csv")
data

hos <- gvisColumnChart(data,options=list(title="지역별 병원현황",
                                         height=400,weight=500))
# HTML Header 수정 (utf-8 --> euc-kr)
header <- hos$html$header 
header
header <- gsub("charset=utf-8", "charset=euc-kr", header) 
hos$html$header <- header
plot(hos)

count <- read.csv("연도별요양기관별보험청구건수_2001_2013_세로.csv",
                  stringsAsFactors = FALSE)
count
count <- read.csv("연도별요양기관별보험청구건수_2001_2013_세로_의원제외.csv",
                  stringsAsFactors = FALSE)

colname <- count$년도
colname
v1 <- count[,2]/100000
v2 <- count[,3]/100000
v3 <- count[,4]/100000
v4 <- count[,5]/100000
v5 <- count[,6]/100000
v6 <- count[,7]/100000
v7 <- count[,8]/100000
v8 <- count[,9]/100000
v9 <- count[,10]/100000
v10 <- count[,11]/100000

plot(v1,xlab="",ylab="",ylim=c(0,6000),axes=FALSE,col="violet",type="o",lwd=2,
     main=paste("연도별 요양 기관별 보험 청구 건수(단위:십만건)","\n", 
                "출처:건강보험심사평가원"))
axis(1,at=1:10,label=colname,las=2)
axis(2,las=1)
lines(v2 ,col="blue",type="o",lwd=2)
lines(v3 ,col="red",type="o",lwd=2)
lines(v4 ,col="black",type="o",lwd=2)
lines(v5 ,col="orange",type="o",lwd=2)
lines(v6 ,col="green",type="o",lwd=2)
lines(v7 ,col="cyan",type="o",lwd=2)
lines(v8 ,col="yellow",type="o",lwd=2)
lines(v9 ,col="brown",type="o",lwd=2)
lines(v10 ,col="pink",type="o",lwd=2)

abline(h=seq(0,6000,500),v=seq(1,100,1),lty=3,lwd=0.2)
col <- names(count[1,2:10])
colors <- c("violet","blue","red","black","orange","green","cyan","yellow","brown","pink")
legend(1,6000,col,cex=0.8,col=colors,lty=1,lwd=2,bg="white")

count <- read.csv("연도별요양기관별보험청구금액_2004_2013_세로.csv",
                  stringsAsFactors = FALSE)
colname <- count$년도

v1 <- count[,2]/1000000
v2 <- count[,3]/1000000
v3 <- count[,4]/1000000
v4 <- count[,5]/1000000
v5 <- count[,6]/1000000
v6 <- count[,7]/1000000
v7 <- count[,8]/1000000
v8 <- count[,9]/1000000
v9 <- count[,10]/1000000
v10 <- count[,11]/1000000

plot(v1,xlab="",ylab="",ylim=c(0,10000),axes=FALSE,col="violet",type="o",lwd=2,
     main=paste("연도별 요양 기관별 보험 청구 금액 현황(단위:백만원)","\n", 
                "출처:건강보험심사평가원"))
axis(1,at=1:10,label=colname,las=2)
axis(2,las=1)
lines(v2 ,col="blue",type="o",lwd=2)
lines(v3 ,col="red",type="o",lwd=2)
lines(v4 ,col="black",type="o",lwd=2)
lines(v5 ,col="orange",type="o",lwd=2)
lines(v6 ,col="green",type="o",lwd=2)
lines(v7 ,col="cyan",type="o",lwd=2)
lines(v8 ,col="yellow",type="o",lwd=2)
lines(v9 ,col="brown",type="o",lwd=2)
lines(v10 ,col="navy",type="o",lwd=2)
abline(h=seq(0,15000,1000),v=seq(1,100,1),lty=3,lwd=0.2)
col <- names(count[1,2:11])
colors <- c("violet","blue","red","black","orange","green","cyan","yellow","brown","navy")
legend(1,10000,col,cex=0.8,col=colors,lty=1,lwd=2,bg="white")

bb <- read.csv('야구성적.csv')
str(bb)
ggplot(bb, aes(x=선수명, y=연봉대비출루율, fill=선수명)) +
  geom_bar(stat='identity') 
  
palete = c(brewer.pal(12, 'Paired'), brewer.pal(12, 'Paired'), '#56B4E9')
mean_obp = mean(bb$연봉대비출루율)
ggplot(bb, aes(x=선수명, y=연봉대비출루율)) +
  geom_bar(stat='identity', color=palete, fill=palete) +
  geom_text(aes(y=연봉대비출루율+0.8, label=연봉대비출루율), 
            color="black", size=3) +
  theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
                                 colour="black", size=8)) +
  ggtitle('프로야구선수 밥값은 하고 있나?') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue")) +
  geom_hline(yintercept=mean_obp, color='purple', linetype = 'dashed') 
  

