#1
JPpop <- read.csv("JPpop_rev.csv")

#2
length(JPpop$japan.pop) #個数
min(JPpop$japan.pop)    #最小値
max(JPpop$japan.pop)    #最大値
range(JPpop$japan.pop)  #範囲
mean(JPpop$japan.pop)   #平均値

#3
names(JPpop)            #変数名
nrow(JPpop)             #行数
ncol(JPpop)             #列数
summary(JPpop)          #記述統計

#4
save.image("JPpop.RData")   #データを保存する

#5
load("JPpop.RData")         #データを読み込む
