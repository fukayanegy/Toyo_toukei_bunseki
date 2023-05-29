#算術演算
2+3
10-5
2/0
15*5
sqrt(4)

#オブジェクト
result <- 5+3
result

#オブジェクト文字
name  <- "Takahama"
name

UNpop <- read.csv("UNpop.csv")
View(UNpop)

#関数の一覧
length(UNpop$world.pop) #データの個数をカウントする
min(UNpop$world.pop)    #最小値
max(UNpop$world.pop)    #最大値
range(UNpop$world.pop)  #範囲
mean(UNpop$world.pop)   #平均値
sum(UNpop$world.pop)/length(UNpop$world.pop)#平均値を自分で出したもの

#データファイル
names(UNpop)    #変数名を出力する
nrow(UNpop)     #"number of row"の略で行数を出力する
ncol(UNpop)     #"number of col"の略で列数を出力する
dim(UNpop)      #"dimension"の意味で行数・列数を出力する
summary(UNpop)  #記述統計を出力する(四分位数のこと)

#データの保存
save.image("Chapter1.RData")

#データの読み込み
load("Chapter1.RData")
