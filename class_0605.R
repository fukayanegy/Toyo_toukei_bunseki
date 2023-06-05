# 第15回授業
# read data
data = read.csv("Males.csv")
View(data)

# summary
summary(data)

# sd(標準偏差)
# どれくらいの分布なのかを表すために標準偏差は報告することが通例である
# 東大社会科学研究所が個人レベルのデータを使える(データの使い方は別途)
sd(data$school)
sd(data$wage)

# 回帰分析
res = lm(wage ~ school, data = data)
print(res)
summary(res)

# 結果の解釈
# 教育年数が1年延びると、賃金が5.8%上昇することが示された
# 決定係数(R-squared)
0.032

# 仮説検定
# signif.codes に*がいくつだとどれくらい優位なのかを書いてくれている
# (p-value)帰無仮説が正しいという前提の下で、そのデータがどれくらい珍しいのかを表す値。
# きほんてきにp-valueが閾値に入っているのかどうかで棄却されるのかどうかを考える。

# t-valueを求めてみる
0.05779 / 0.01346
# t-value:4.293462

# 絶対値で見たt-valueが4.293462で1.96以上の値である
# schoolはwageに対して優位水準5%で優位な影響を与えていると言える


