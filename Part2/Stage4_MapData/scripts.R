setwd('D:/Workspace/R_Data_Analysis/Part2/Stage4_MapData')

install.packages("ggmap")
library(ggmap)
library(stringr)

loc <- read.csv("서울_강동구_공영주차장_위경도.csv",header=T)
loc
kd <- get_map("Amsa-dong",zoom=13, maptype = "roadmap")
kor.map <- ggmap(kd) +
  geom_point(data=loc, aes(x=LON, y=LAT), size=3,alpha=0.7,color="red")
kor.map + geom_text(data=loc, aes(x = LON, y = LAT+0.001, label=주차장명),size=3)
ggsave("kd.png",dpi=500)
