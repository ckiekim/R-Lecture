setwd('d:/workspace/r_data_analysis/part2/stage2_graph/ex01_jeju')
top10 <- head(sort(wordcount, decreasing=T),10)
top10
library(ggplot2)
pie(top10,col=rainbow(10),radius=1,main="제주도 추천 여행 코스 TOP 10")
pct <- round(top10/sum(top10) * 100 ,1)
names(top10)
lab <- paste(names(top10),"\n",pct,"%")
pie(top10,main="제주도 추천 여행 코스 TOP 10",col=rainbow(10), 
    cex=0.8,labels = lab)

library(dplyr)
options(digits = 2)
df_top10 <- as.data.frame(top10) %>%
  mutate(prop=Freq/sum(Freq)*100) %>%
  mutate(propLabel=paste(sprintf("%4.1f",prop), '%', sep='')) %>%
  arrange(desc(rev)) %>%
  mutate(ypos = cumsum(prop) - 0.5*prop)
df_top10

ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  coord_polar("y", start = 0) +
  geom_text(aes(y=ypos, label=propLabel), color='black')

### 해결해야 함
ggplot(df_top10, aes(x=rev, y=Freq, fill=rev)) +
  geom_bar(stat='identity') +
  geom_text(aes(y=ypos, label=propLabel), color='black')


bchart <- head(sort(wordcount, decreasing=T),10)
bchart
bp <- barplot(bchart,  main = "제주도 추천 여행 코스 TOP 10 ", col = rainbow(10), 
              cex.names=0.7, las = 2,ylim=c(0,25))
pct <- round(bchart/sum(bchart) * 100, 1)
pct
text(x = bp, y = bchart*1.05, labels = paste("(",pct,"%",")"), col = "black", cex = 0.7)
text(x = bp, y = bchart*0.95, labels = paste(bchart,"건"), col = "black", cex = 0.7)
barplot(bchart,main="제주도 추천 여행 코스 Top 10",col=rainbow(10),
        xlim=c(0,25),cex.name=0.7,las=1,horiz=T)
text(y = bp, x = bchart*0.9, labels = paste(bchart,"건"), col = "black", cex = 0.7)
text(y = bp, x = bchart*1.15, labels = paste("(",pct,"%",")"), col = "black", cex = 0.7)

library(plotrix)
th_pct <- round(bchart/sum(bchart) * 100,1)
th_names <- names(bchart)
th_labels <- paste(th_names,"\n","(",th_pct,")")

pie3D(bchart,main="제주도 추천 여행 코스 Top 10",col=rainbow(10),
      cex=0.3,labels=th_labels,explode=0.05)
