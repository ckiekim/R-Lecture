# 미션 3-4. 정규직은 정녕 꿈인가요?

setwd('D:/Workspace/R_Data_Analysis/Part2/Stage3_StructuredData/M34_RegularJob')
library(ggplot2)
library(dplyr)
library(reshape2)
library(extrafont)
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))

# 고용형태별 근무일수
regular <- read.csv('고용형태별_취업자현황_2007_2013년.csv')
regular <- select(regular, 고용형태, X2007, X2008, X2009, X2010, X2011, X2012, X2013) 
regular <- regular[c(-1,-3,-6,-7,-8,-13),]

regular_melt <- melt(regular, id=c('고용형태'),
                     variable.name='연도', value.name='근무일수')
regular_melt$연도 <- gsub("X", "", regular_melt$연도)
ggplot(regular_melt, aes(x=연도,y=as.numeric(근무일수), fill=고용형태,
                         color=고용형태, group=고용형태)) +
  geom_line(linetype=1, size=1) +
  geom_point(shape=19, size=3) +
  geom_hline(yintercept=seq(10,25,1), lty='dashed', size=0.1) +
  #  lims(y=c(0,25)) +
  #  scale_y_continuous(limits = c(10, 25)) +
  #  ylim(0,25)+
  theme_bw(base_family='malgun',base_size = 15) +
  theme(axis.title.x = element_blank()) +
  theme(axis.title.y = element_blank()) +
  theme(axis.text.x  = element_text(angle=45, hjust=1)) +
  ggtitle('고용형태별 근무일수(단위:일) 출처:통계청') +
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "darkblue"))

# 고용형태별 급여현황
regular_m <- read.csv('고용형태별_취업자현황_2007_2013년.csv',header=T)
regular_m <- select(regular_m,고용형태,X2007.4,X2008.4,X2009.4,X2010.4,X2011.4,X2012.4,X2013.4) 
regular_m <- regular_m[c(-1,-3,-6,-7,-8,-13),]

colnames(regular_m) <- c('고용형태','2007','2008','2009','2010','2011','2012','2013')
regular_m_melt <- melt(regular_m,id=c('고용형태'),variable.name='연도',value.name='월급여')
regular_m_melt$월급여 <- gsub(",","",regular_m_melt$월급여)

ggplot(regular_m_melt, aes(x=연도, y=as.numeric(월급여), fill=고용형태,
                           color=고용형태, group=고용형태)) +
  geom_line(linetype=1, size=1) +
  geom_point(shape=19, size=3) +
  geom_hline(yintercept=seq(500,3000,100), lty='dashed', size=0.1) +
  theme_bw(base_family='malgun', base_size = 10) +
  theme(axis.title.x = element_blank()) +
  theme(axis.title.y = element_blank()) +
  theme(axis.text.x  = element_text(angle=45, hjust=1)) +
  ggtitle('고용형태별 급여현황(단위:천원) 출처:통계청') +
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "darkblue"))
