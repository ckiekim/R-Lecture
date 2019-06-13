# 미션 3-5. 전염병을 미리 막아 보자구요!

setwd('D:/Workspace/R_Data_Analysis/Part2/Stage3_StructuredData/M35_Disease')
library(ggplot2)
library(RColorBrewer)
library(dplyr)
library(reshape2)
library(extrafont)
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))

# 년도별 발병 현황
data <- read.csv("1군전염병발병현황_년도별.csv")
data
data <- data %>%
  melt(id=c("년도별"), variable.name = "전염병", value.name = "발병현황")
ggplot(data, aes(x=년도별, y=발병현황, group=전염병, color=전염병)) +
  geom_line(linetype=2) +
  geom_point(size=3) +
  geom_hline(yintercept = seq(0,6000,2000), color="grey20", linetype=4) +
  theme_bw(base_family = "malgun", base_size = 14) +
  labs(title = "1군 전염병 발병현황 + 년도별(단위:건수) 출처:통계청") + 
  theme(plot.title = element_text(family = "malgun", face="bold", hjust=0.5, 
                                  size=15, color="darkblue"),
        axis.title = element_blank(),
        axis.text.x = element_text(angle = 45, vjust=0.5))

# 월별 발병 현황 
data2 <- read.csv("1군전염병발병현황_월별.csv")
data2$월별 <- factor(data2$월별, levels=unique(data2$월별)) # 월별 순서 지정
data2 <- melt(data2, id=c("월별"), variable.name = "전염병", value.name = "발병현황")
ggplot(data2, aes(x=월별, y=발병현황, group=전염병, color=전염병)) +
  geom_line(linetype=2) +
  geom_point(size=3) + 
  geom_hline(yintercept = seq(200,800,200), color="grey20", linetype=3) +
  theme_bw(base_family = "malgun", base_size = 14) +
  labs(title = "1군 전염병 발병현황 + 월별(단위:건수) 출처:통계청") + 
  theme(plot.title = element_text(family = "malgun", face="bold", hjust=0.5, 
                                  size=15, color="grey20"),
        axis.title = element_blank())

# 월별 발병 현황 (A형 간엽 제외)
data2 <- read.csv("1군전염병발병현황_월별.csv")
data3 <- select(data2, -A형간염)
data3$월별 <- factor(data3$월별, levels=unique(data3$월별)) # 월별 순서 지정
data3 %>% 
  melt(id=c("월별"), variable.name = "전염병", value.name = "발병현황") %>%
  ggplot(aes(x=월별, y=발병현황, group=전염병, color=전염병)) +
  geom_line(linetype=2) +
  geom_point(size=3) + 
  geom_hline(yintercept = seq(200,800,200), color="grey20", linetype=3) +
  theme_bw(base_family = "malgun", base_size = 14) +
  labs(title = paste0("1군 전염병 발병현황(A형간염 제외)","\n","월별(단위:건수)  출처:통계청")) + 
  theme(plot.title = element_text(family = "malgun", face="bold", hjust=0.5, 
                                  size=15, color="darkblue"),
        axis.title = element_blank())
