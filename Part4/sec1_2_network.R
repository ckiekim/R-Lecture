# 관계도
install.packages("igraph")
library(igraph)
g1 <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))
plot(g1)
str(g1)

name <- c('서진수 대표이사','일지매 부장','김유신 과장','손흥민 대리','노정호 대리',
          '이순신 부장','유관순 과장','신사임당 대리','강감찬 부장','광개토 과장','정몽주 대리')
pemp <- c('서진수 대표이사','서진수 대표이사','일지매 부장','김유신 과장','김유신 과장',
          '서진수 대표이사','이순신 부장', '유관순 과장','서진수 대표이사',
          '강감찬 부장','광개토 과장')
emp <- data.frame(이름=name, 상사이름=pemp)
emp
str(emp)
g <- graph.data.frame(emp, directed=T)
plot(g, layout=layout.fruchterman.reingold,
     vertex.size=8, edge.arrow.size=0.5)
png("graph/network_2.png", width=600, height=600)
plot(g, layout=layout.fruchterman.reingold,
     vertex.size=8, edge.arrow.size=0.5)
dev.off()

g3 <- graph.data.frame(emp, directed=F)
plot(g3, layout=layout.fruchterman.reingold, vertex.size=8,
     edge.arrow.size=0.5, vertex.label=NA)
plot(g3, layout=layout.kamada.kawai, vertex.size=8,
     edge.arrow.size=0.5, vertex.label=NA)

install.packages("devtools")
install.packages('d3Network')
install.packages("RCurl")
library(d3Network)
library(RCurl)
name <- c('Angela Bassett','Jessica Lange','Winona Ryder','Michelle Pfeiffer',
          'Whoopi Goldberg','Emma Thompson','Julia Roberts','Sharon Stone','Meryl Streep',
          'Susan Sarandon','Nicole Kidman')
pemp <- c('Angela Bassett','Angela Bassett','Jessica Lange','Winona Ryder','Winona Ryder',
          'Angela Bassett','Emma Thompson', 'Julia Roberts','Angela Bassett',
          'Meryl Streep','Susan Sarandon')
emp <- data.frame(이름=name,상사이름=pemp)
d3SimpleNetwork(emp, width=600, height=600, file="c:/temp/d3.html")

