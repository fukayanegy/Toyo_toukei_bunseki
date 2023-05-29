#question_1
#(1)
tokyo_pop=read.csv("TOKYOpop.csv")
#(2)
#データの個数(不正解)
# 空白のため不正解
length(tokyo_pop)# 正答例
#最小値
min(tokyo_pop$tokyo.pop)
#最大値
max(tokyo_pop$tokyo.pop)
#範囲
range(tokyo_pop$tokyo.pop)
#平均値
mean(tokyo_pop$tokyo.pop)
#(3)
#変数名
names(tokyo_pop)
#行数/列数
dim(tokyo_pop)
#記述統計
summary(tokyo_pop)
#(4)
save.image("TOKYOpop.RData")
