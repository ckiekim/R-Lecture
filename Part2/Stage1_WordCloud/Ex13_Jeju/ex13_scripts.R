# 예제 1-3. 제주도 추천 여행코스 찾기

setwd('D:/Workspace/R_Data_Analysis/Part2/Stage1_WordCloud/Ex03_Jeju')
library(KoNLP)  # 필수 패키지 로딩
library(wordcloud) # 필수 패키지 로딩
useSejongDic( ) 
library(stringr)

mergeUserDic(data.frame(readLines("제주도여행지.txt"), "ncn"))

txt <- readLines("jeju.txt") 
txt
place <- sapply(txt, extractNoun, USE.NAMES=F)
place
head(unlist(place), 30)
cdata <- unlist(place) 
place <- str_replace_all(cdata, "[^[:alpha:]]", "")  # 한글, 영어외는 삭제

place

place <- gsub(" ", "", place)
txt <- readLines("제주도여행코스gsub.txt")   # 삭제할 데이터
txt
for(i in 1:length(txt)) {
  place <-gsub((txt[i]), "", place)     
}
place <- Filter(function(x) {nchar(x) >= 2}, place)   # 2글자 이상

write(unlist(place),"jeju_2.txt") 
rev <- read.table("jeju_2.txt")
nrow(rev)   
wordcount <- table(rev) 
head(sort(wordcount, decreasing=T),30)

palete <- brewer.pal(9, "Set2") 
wordcloud(names(wordcount), freq=wordcount, scale=c(5,0.3),
          rot.per=0.1, min.freq=2,
          random.order=F, random.color=T, colors=palete)
legend(0.3, 1, "제주도 추천 여행 코스 분석", cex=0.8,
       fill=NA, border=NA, bg="white",
       text.col="red", text.font=2, box.col="red")

