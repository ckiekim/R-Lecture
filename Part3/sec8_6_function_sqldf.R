# sqldf() 패키지 활용
install.packages("sqldf")
library(sqldf)
library(googleVis)
Fruits

sqldf('SELECT * FROM Fruits')
sqldf("SELECT * FROM Fruits WHERE Fruit='Apples'")
sqldf('SELECT * FROM Fruits WHERE Fruit=\'Apples\'')
sqldf('SELECT * FROM Fruits LIMIT 3')     # LIMIT 0, 3
sqldf('SELECT * FROM Fruits LIMIT 3, 5')

sqldf('SELECT * FROM Fruits ORDER BY Year')
sqldf('SELECT * FROM Fruits ORDER BY Year DESC')

sqldf('select Fruit, sum(Sales) from Fruits group by Fruit')
sqldf('select Fruit, sum(Sales), sum(Expenses), sum(Profit)
       from Fruits group by Fruit')
sqldf('select Year, avg(Sales), avg(Expenses), avg(Profit)
       from Fruits group by Year')
sqldf('select Year, avg(Sales), avg(Expenses), avg(Profit)
       from Fruits group by Year order by avg(Profit) desc')
sqldf('SELECT min(Sales), max(Sales) FROM Fruits')

sqldf('SELECT * FROM Fruits where Sales=81')
sqldf('SELECT * FROM Fruits where Sales=
      (select min(Sales) from Fruits)')
sqldf('SELECT * FROM Fruits where Expenses=
      (select max(Expenses) from Fruits)')

song <- read.csv("song.csv", header = F, fileEncoding = 'utf8')
names(song) <- c('_id', 'title', 'lyrics', 'girl_group_id')
song
girl_group <- read.csv("girl_group.csv", header = F, fileEncoding = 'utf8')
names(girl_group) <- c('_id', 'name', 'debut')
girl_group

sqldf("SELECT gg._id, gg.name, gg.debut, s.title
       FROM girl_group AS gg
       INNER JOIN song AS s 
       ON gg._id = s.girl_group_id")
sqldf("SELECT gg._id, gg.name, gg.debut, s.title
       FROM girl_group gg
       JOIN song s 
       ON gg._id = s.girl_group_id")

sqldf('UPDATE Fruits SET Profit=40 WHERE Fruit=\'Apples\' AND Year=2008')
sqldf('SELECT * FROM Fruits')
# 화면에 보이는 내용만 변경
sqldf(c('UPDATE Fruits SET Profit=50 WHERE Fruit=\'Apples\' AND Year=2008',
        'SELECT * FROM Fruits'))
sqldf(c('DELETE FROM Fruits WHERE Fruit="Apples" AND Year=2008',
        'SELECT * FROM Fruits'))
