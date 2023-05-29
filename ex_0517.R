# read data
ice = read.csv("ice.csv")

# 観測値数　平均　標準偏差　最小値　最大値
summary(ice)
nrow(ice)
sd(ice$icecream)
sd(ice$income)
sd(ice$u15)
# 散布図の作成
plot(ice$income, ice$icecream)
# 回帰直線をもとめる
result = lm(ice$icecream~ice$income)
print(result)
# 散布図上に直線を引く
abline(result)

