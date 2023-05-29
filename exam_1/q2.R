#question_2
###(1)
data_bmi=read.csv("data_bmi.csv")
###(2)
#BMIの算出(weight/(height^2))
bmi=data_bmi$weight/((data_bmi$height/100)^2)
# データの大きさ(不正解)

nrow(bmi)# 正答例
#最小値
min(bmi)
#最大値
max(bmi)
#平均値
mean(bmi)
#標準偏差
sd(bmi)
# 分散(不正解)
###(3)
hist(data_bmi$age, xlab = "age", ylab = "相対密度", main = "Q2_3", xlim =c(20, 70) , ylim =c(0, 800), col = "white")
###(4)
sex=table(data_bmi$female)
pie(sex, clockwise = TRUE, main = "Q2_4", col = c("red", "blue"), labels = c("女性", "男性"))
###(5)
save.image("data_bmi.RData")
