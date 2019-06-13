# 미션 3-3. 취직하기가 정말 어렵네요

setwd('D:/Workspace/R_Data_Analysis/Part2/Stage3_StructuredData/M33_Job')
library(ggplot2)
library(dplyr)
library(reshape2)
library(extrafont)
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))

unemployment <- read.csv('2000-2013년 연령별실업율_연령별평균_세로.csv')
unemployment
unemployment_melt <- melt(unemployment, id=c('연도'),
                          variable.name='연령', value.name='실업률')
unemployment_melt$연령 <- gsub("X", "", unemployment_melt$연령)
ggplot(unemployment_melt, aes(x=연도, y=실업률, fill=연령,
                              color=연령, group=연령)) +
  geom_line(linetype=1, size=1) +
  geom_point(shape=19, size=3) +
  geom_hline(yintercept=seq(0,10,0.5), lty='dashed', size=0.1) +
  theme_bw(base_family='malgun',base_size = 10) +
  #theme(axis.title.x = element_blank()) +
  #theme(axis.title.y = element_blank()) +
  theme(axis.text.x  = element_text(angle=45, hjust=1)) +
  labs(x = '년도', y = '실업률') +
  ggtitle('연령대별 실업률 현황(단위:%) 출처:통계청') +
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "darkblue")) 
