# 미션 3-6. 콩나물 마을 버스 찾아 달래요

setwd('D:/Workspace/R_Data_Analysis/Part2/Stage3_StructuredData/M36_SeoulBus')
library(ggplot2)
library(dplyr)
library(reshape2)
library(extrafont)
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))

bus <- read.csv('버스노선별이용현황합계.csv')
bus_melt <- melt(bus, id=c('버스노선번호'))
bus_melt$value<- bus_melt$value/1000

ggplot(bus_melt, aes(x=버스노선번호, y=value, fill=variable)) +
  geom_bar(stat="identity", position="dodge", color="black") +
  geom_text(aes(y=value, label=value), color='black', size=3) +
  labs(x='노선명',y='이용승객수(단위:천명)') +
  theme_bw(base_family='malgun', base_size = 10) +
  theme(axis.text.x  = element_text(angle=45, hjust=1)) +
  ggtitle('서울 주요 마을버스 이용승객 현황(2014년 1월)') +
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "darkblue"))
