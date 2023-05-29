# class_10
# read data
data = read.csv("caschool.csv")

# 記述統計
summary(data)
nrow(data)
sd(data$class) # 標準偏差
sd(data$test) # 標準偏差

## hist
### class のヒストグラム（縦軸：相対度数）
hist(data$class, freq = FALSE,
     xlab = "クラス生徒数", ylab = "密度",
     main = "クラス生徒数のヒストグラム",
     col = "white",
     border = "black")
hist(data$test, freq = FALSE,
     xlab = "テスト点数", ylab = "密度",
     main = "テスト点数のヒストグラム",
     col = "white",
     border = "black")
## 散布図の作成
plot(data$class, data$test,
     xlab = "クラス生徒数", ylab = "テストの点数",
     main = "クラスの生徒数とテスト点数に関する散布図",
     pch = 10,
     col = "black")
## 相関係数
cor(data$class, data$test)
## 最小二乗法
lm(data$test~data$class)

# resultにOLSを入れる
result = lm(data$test~data$class)
abline(result)

# 1クラス当たりの平均生徒数が1人増えた場合、成績はどのように変化する？
#->係数の値より2.28点下がる

# クラスの生徒数が20名の場合のテストの点数の予測値は?
698.93 - 2.28 * 20
# ->653.33点

# クラスの生徒数が19(中央値)->17名に減る。クラスの生徒数の変化率は?
(19 - 17)/19 * 100
# ->10.53%減少する

#クラスの生徒数が10（中央値）->17(2名)の場合のテスト点数の変化率は?
-2.28 * -2
# 4.56点増える

#クラスの生徒数が19人の時のテスト点数の中央値655点から、4.56店増えるので
655 + 4.56
(659.56 - 655)/655 * 100
#  テストの点数の変化率は
0.6961832

