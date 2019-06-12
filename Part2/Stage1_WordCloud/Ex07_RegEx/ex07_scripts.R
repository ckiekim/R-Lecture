# 예제 1-7. 특정 키워드만 골라내서 분석하기 – 정규식 활용하기

setwd('D:/Workspace/R_Data_Analysis/Part2/Stage1_WordCloud/Ex07_RegEx')
library(wordcloud)

alert <- readLines("oracle_alert_testdb.log") 
head(alert, 10)
error_1 <- gsub(" ", "_", alert) 
head(unlist(error_1), 20)
error_2 <- unlist(error_1) 
error_2 <- Filter(function(x) {nchar(x) >= 5}, error_2) 
head(error_2, 10)

error_3 <- grep("^ORA-+", error_2, value=T)
head(unlist(error_3), 20)

write(unlist(error_3), "alert_testdb2.log") 
rev <- read.table("alert_testdb2.log")
nrow(rev)
errorcount <- table(rev)
head(sort(errorcount, decreasing=T),20)

palete <- brewer.pal(9,"Set1") 
wordcloud(names(errorcount),freq=errorcount,
          scale=c(5,0.5), rot.per=0.15, min.freq=3,
          random.order=F, random.color=T, colors=palete)
legend(0.3, 1, "Oracle Alert Log File 분석 결과",
       cex=0.8, fill=NA , border=NA , 
       bg="white",  text.col="red", text.font=2, box.col="red")

display.brewer.all(n=10, exact.n = F)
brewer.pal.info
