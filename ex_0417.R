#第3回課題
#1
univdata <- read.csv("univdata.csv")
univdata
#2
hist(univdata$weight,
     main = "体重のヒストグラム")
#3
x <- table(univdata$male)
barplot(x, names=c("男性", "女性"))

#4
pie(x, labels = c("男性", "女性"))
