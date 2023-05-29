#submit0419
#1
afghan <- read.csv("afghan.csv")
#2
save.image("afghan.RData")
#3
nrow(afghan$age)#データの大きさ
mean(afghan$age)#平均値
median(afghan$age)#中央値
sd(afghan$age)#standard deviation
#4
hist(afghan$age, main="sub_4")
abline(v=median(afghan$age))
text(x=40, y=400, "中央値")
#5
hist(afghan$educ.years, main="sub_5")
abline(v=median(afghan$educ.years), col="red")
text(x=2.5, y=1000,"中央値",col="red")
abline(v=mean(afghan$educ.years), lty = 6,col="blue")
text(x=5.7, y=800,"平均値",col="blue")
