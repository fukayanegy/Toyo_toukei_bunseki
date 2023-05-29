# read data
data = read.csv("wage.csv")

# (1)
# educ
## データの個数
nrow(data)
## 最小値
min(data$educ)
## 最大値
max(data$educ)
## 平均値
mean(data$educ)
## 標準偏差
sd(data$educ)

# wage
## データの個数
nrow(data)
## 最小値
min(data$wage)
## 最大値
max(data$wage)
## 平均値
mean(data$wage)
## 標準偏差
sd(data$wage)

# (2)
freq <- table(data$educ)# 度数
percent <- prop.table(freq)# 相対度数
cum.pcnt <- cumsum(percent)# 累積度数
freq
percent
cum.pcnt
# 教育年数が16年以上の者の割合
nrow(subset(data, subset = (educ >= 16)))/nrow(data)
# 全体の18.82129%を占める

# (3)
plot(x = data$educ, y = data$wage,
     xlab = "educ", ylab = "wage" ,#軸ラベル
     main = "Q3_(3)" ,#タイトル
     pch = 15,#pch = 15はデータ点を黒抜きの資格にする(■)
     col = "black")#データ点に色を付ける

# OLSの線を入れる
result = lm(data$wage~data$educ)
abline(result)

# (4)
## 相関係数
cor(data$educ, data$wage)
## 最小二乗法
lm(data$wage~data$educ)

# 教育年数が一年追加されると、期待される賃金の変化分は1時間当たり0.5414ドル増える

# (5)
-0.9049 + 0.5414 * 17
# 8.2989ドル