# 미션 3-1. 프로 야구 선수들이 밥값 하나요? 

setwd('D:/Workspace/R_Data_Analysis/Part2/Stage3_StructuredData/M31_BaseballPlayer')
library(ggplot2)
library(RColorBrewer)
library(dplyr)
library(reshape2)
library(extrafont)
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))

bb <- read.csv('야구성적.csv')
str(bb)
bb <- bb %>%
  mutate(OPS=출루율+장타율, 연봉대비OPS=OPS/연봉*100)
head(bb)
ggplot(bb, aes(x=선수명, y=연봉대비OPS, fill=선수명)) +
  geom_bar(stat='identity') 
  
palete = c(brewer.pal(12, 'Paired'), 
           brewer.pal(12, 'Paired'), '#56B4E9')
mean_ops_per_income = mean(bb$연봉대비OPS)
ggplot(bb, aes(x=선수명, y=연봉대비출루율)) +
  geom_bar(stat='identity', color=palete, fill=palete) +
  geom_text(aes(y=연봉대비출루율+0.8, label=연봉대비출루율), 
            color="black", size=3) +
  theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
                                 colour="black", size=8)) +
  ggtitle('프로야구선수 밥값은 하고 있나?') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue")) +
  geom_hline(yintercept=mean_ops_per_income, 
             color='red', linetype = 'dashed', size=0.5) 
  
# 2013년 프로야구 선수별 주요 성적

bb %>%
  select(선수명,안타,득점,출루율,타율,도루,볼넷,타점,홈런) %>% 
  melt(id=c("선수명"), variable.name = "능력지표", value.name = "능력치") %>%
  ggplot(aes(x=능력지표,y=능력치,fill=능력지표)) + 
  geom_bar(width=1,stat="identity", color="black") +
  coord_polar() +
  facet_wrap(~선수명) +
  theme_bw(base_family = "malgun", base_size = 10) +
  labs(title = "2013년 프로야구 선수별 주요 성적 ") + 
  theme(plot.title = element_text(family = "malgun", face="bold", 
                                  hjust=0.5, size=15, color="grey20")) +
  theme(axis.text.y = element_blank()) +
  theme(axis.title = element_blank()) 

# 연봉대비 출루율과 연봉대비 타점의 비교 
bb3 <- bb %>%
  mutate(연봉대비출루율 = 출루율/연봉*100) %>%
  mutate(연봉대비타점율 = (타점/안타)/연봉*100) %>%
  select(선수명,연봉대비출루율,연봉대비타점율)
bb3_melt <- melt(bb3, id=c('선수명'))
ggplot(bb3_melt,aes(x=선수명,y=value,fill=variable,color=variable,group=variable)) +
  geom_line(linetype=5,size=1)+
  geom_point(shape=1,size=3)+
  geom_hline(yintercept=seq(0,50,5), lty='dashed', size=0.1)+
  theme_bw(base_family='baedal',base_size = 10) +
  theme(axis.title.x = element_blank()) +
  theme(axis.title.y = element_blank()) +
  theme(axis.text.x  = element_text(angle=45, hjust=1)) +
  ggtitle('한국프로야구선수별 기록분석 2013') +
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 20, color = "darkblue")) 
