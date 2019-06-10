# iris 데이터로 그래프 그리기
#1. 산점도
library(dplyr)
View(iris)
iris_setosa <- filter(iris, Species == 'setosa')
iris_versicolor <- filter(iris, Species == 'versicolor')
iris_virginica <- filter(iris, Species == 'virginica')

par(mfrow=c(3,2))
plot(iris_setosa$Sepal.Length, iris_setosa$Sepal.Width,
     xlab='Length', ylab='Width',
     xlim=c(4, 8.1), ylim=c(1.9, 4.5), main='Setosa 품종의 Sepal')
plot(iris_setosa$Petal.Length, iris_setosa$Petal.Width,
     xlab='Length', ylab='Width',
     xlim=c(0.8, 7), ylim=c(0, 2.6), main='Setosa 품종의 Petal')
plot(iris_versicolor$Sepal.Length, iris_versicolor$Sepal.Width,
     xlab='Length', ylab='Width',
     xlim=c(4, 8.1), ylim=c(1.9, 4.5), main='Versicolor 품종의 Sepal')
plot(iris_versicolor$Petal.Length, iris_versicolor$Petal.Width,
     xlab='Length', ylab='Width',
     xlim=c(0.8, 7), ylim=c(0, 2.6), main='Versicolor 품종의 Petal')
plot(iris_virginica$Sepal.Length, iris_virginica$Sepal.Width,
     xlab='Length', ylab='Width',
     xlim=c(4, 8.1), ylim=c(1.9, 4.5), main='Virginica 품종의 Sepal')
plot(iris_virginica$Petal.Length, iris_virginica$Petal.Width,
     xlab='Length', ylab='Width',
     xlim=c(0.8, 7), ylim=c(0, 2.6), main='Virginica 품종의 Petal')

#2. 평균 비교
par(mfrow=c(1,2))
mean_of_iris_setosa <- iris_setosa %>%
  summarise_each(list(mean), Sepal.Length, Sepal.Width,
                 Petal.Length, Petal.Width)
mean_of_iris_versicolor <- iris_versicolor %>%
  summarise_each(list(mean), Sepal.Length, Sepal.Width,
                 Petal.Length, Petal.Width)
mean_of_iris_virginica <- iris_virginica %>%
  summarise_each(list(mean), Sepal.Length, Sepal.Width,
                 Petal.Length, Petal.Width)
# barplot(as.matrix(mean_of_iris_setosa))
mean_of_iris <- t(rbind(mean_of_iris_setosa,
                      mean_of_iris_versicolor,
                      mean_of_iris_virginica))
colnames(mean_of_iris) <- c('Setosa', 'Versicolor', 'Virginica')
barplot(as.matrix(mean_of_iris), beside=T, main='품종별 평균',
        ylim=c(0,10),
        col=c('red','yellow','green','blue'))
legend(1, 10, 
       c("Sepal.length","Sepal.width","Petal.length","Petal.width"), cex=0.8,
       fill=c('red','yellow','green','blue'))

barplot(as.matrix(mean_of_iris), main='품종별 평균',
        ylim=c(0,25),
        col=c('red','yellow','green','blue'))
legend(0.2, 25, 
       c("Sepal.length","Sepal.width","Petal.length","Petal.width"), cex=0.8,
       fill=c('red','yellow','green','blue'))

#3. Boxplot
par(mfrow=c(3,1))
boxplot(iris_setosa$Sepal.Length, iris_setosa$Sepal.Width,
        iris_setosa$Petal.Length, iris_setosa$Petal.Width,
        col=c('red','yellow','green','blue'),
        names=c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width'),
        main='Setosa')
boxplot(iris_versicolor$Sepal.Length, iris_versicolor$Sepal.Width,
        iris_versicolor$Petal.Length, iris_versicolor$Petal.Width,
        col=c('red','yellow','green','blue'),
        names=c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width'),
        main='Versicolor')
boxplot(iris_virginica$Sepal.Length, iris_virginica$Sepal.Width,
        iris_virginica$Petal.Length, iris_virginica$Petal.Width,
        col=c('red','yellow','green','blue'),
        names=c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width'),
        main='Virginica')
par(mfrow=c(1,1))
