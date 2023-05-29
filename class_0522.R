# class_11
# read data
data <- read.csv("caschool.csv")
View(data)

# 記述統計
summary(data)

# testヒストグラム(相対度数)
hist(data$test, freq = FALSE, xlab = "テスト点数", ylab = "密度",
     xlim = c(600, 700),
     main = "テスト点数のヒストグラム",
     col = "lightblue",
     border = "black")

#　度数分布表/累積度数(累積確立)(度数・相対度数)
freq <- table(data$test)# 度数をfreqというオブジェクトに入れる
percent <- prop.table(freq)# 相対度数をprecentというオブジェクトに入れる
cum.pcnt <- cumsum(percent)# 累積度数をcum.pcntというオブジェクトに入れる

freq
percent
cum.pcnt
cbind(freq, percent, cum.pcnt)
options(max.print = 1000000000)#表示が研ぎ入れないように

freq.table <- cdind("度数" = freq, "相対度数" = percent, "累積度数" = cum.pcnt)
freq.table

# 670点以上は上位何％に当たるのか？
1 - 0.809523810
# -> 0.1904762
# -> 670点以上は上位約20%に当たる
# 700点以上は上位何%に当たるのか
1-0.995238095
#-> 0.004761905
# -> 700点以上は上位約0.5%に当たる


# 回帰分析
lm(data$test~data$class)
res <- lm(data$test~data$class)

#回帰分析の予測値を入れたpredictを作る
data$predict <- predict(res)

#回帰分析の残差を入れた変数residの作成
data$resid <- resid(res)

ceosal1 <- read.csv("ceosal1.csv")

# 記述統計
summary(ceosal1)
nrow(ceosal1)#観測値数
#salaryとroeの標準偏差を出力
sd(ceosal1$salary)#salaryの標準偏差
sd(ceosal1$roe)#roeの標準偏差

#ceoの給与の平均値
1281*1000
#この人たちの平均給与は128000ドル
# 1ドル100円で考える
1281*1000*100
#平均給与は128100000円

#業種別のceoの平均給与
#質的変数typeの作成
ceosal1$type <- NA #欠損値をとりあえず入れておく
ceosal1$type[ceosal1$indus==1] <- "indus"
ceosal1$type[ceosal1$finance==1] <- "finance"
ceosal1$type[ceosal1$consprod==1] <- "consprod"
ceosal1$type[ceosal1$utility==1] <- "utility"
# typeの度数分布表(度数)
tab <- table(ceosal1$type)
tab
addmargins(tab)

#typeの度数分布表(割合)
proptab <- prop.table(tab)
addmargins(proptab)

#業種別の給与
tapply(ceosal1$salary,ceosal1$type, mean)

## ヒストグラムの作成
# salary(相対度数)
hist(ceosal1$salary, freq = FALSE,
     xlab = "CEO給与", ylab = "密度",
     main = "CEO給与のヒストグラム",
     border = "black")
# salary(相対度数)
hist(ceosal1$roe, freq = FALSE,
     xlab = "company roe", ylab = "密度",
     main = "company roe hist",
     border = "black")

freq <- table(ceosal1$salary)# 度数をfreqというオブジェクトに入れる
percent <- prop.table(freq)# 相対度数をprecentというオブジェクトに入れる
cum.pcnt <- cumsum(percent)# 累積度数をcum.pcntというオブジェクトに入れる

freq.table <- cbind("度数" = freq, "相対度数" = percent, "累積度数" = cum.pcnt)
freq.table

# 散布図の作成
plot(ceosal1$roe, ceosal1$salary,
     xlab = "roe", ylab = "ceo salary",
     main = "roe and ceo salary",
     pch = 15, col = "lightblue")

# 相関関係
cor(ceosal1$roe, ceosal1$salary)

#回帰分析
#最小二乗法(ols)
lm(ceosal1$salary~ceosal1$roe)
lm(salary~roe, data = ceosal1)

#回帰分析の詳細を表示
summary(lm(salary~roe, data = ceosal1))
#roeが15%の時に期待されるceoの給与はいくらか
963.2 + 18.5 * 15
1240.7 * 1000
# 1240700ドルと推定される
