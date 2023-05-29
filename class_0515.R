star = read.csv("STAR.csv")
# きじゅつとうけい
summary(star)
# クラスタイプ別の度数分布表
table(star$classtype)
# クラスタイプを文字で表示させる変数を作成
star$kinder = ifelse(star$classtype == 1, "small",
                     ifelse(star$classtype == 2, "regular", "reg+aide"))
table(star$kinder)

# kinderのクラスの確認
class(star$kinder)
# kinderを文字型から因子型に変換する
star$kinder = as.factor(star$kinder)
class(star$kinder)

# クラスタイプ別の四年生時点の読解の成績
# 欠損値があるのでできない場合
tapply(star$g4reading, star$kinder, mean)
# 欠損値を除いた場合
tapply(star$g4reading, star$kinder, mean, na.rm = TRUE)
# 少人数クラス(small)と標準規模クラス(regular)の点差：3.5点

# クラスタイプ別の四年生時点の算数の成績
# 欠損値を除いた場合
tapply(star$g4math, star$kinder, mean, na.rm = TRUE)
# 少人数クラス(small)と標準規模クラス(regular)の点差：-0.3点

# 少人数クラスの在籍期間別の成績
# 少人数クラスの在籍期間の度数分布表
table(star$yearssmall)
# 少人数クラスに在籍していた期間別の度数分布表(割合)
tab = table(star$yearssmall)
prop.table(tab)
addmargins(prop.table(tab))

# 幼稚園クラスと少人数クラスの在籍期間のクロス表(度数)
table(star$kinder, star$yearssmall)
addmargins(table(star$kinder, star$yearssmall))

# 幼稚園クラスと少人数クラスの在籍期間のクロス表(割合)
prop_table = prop.table(table(star$kinder, star$yearssmall), margin = 1)
prop_table
addmargins(prop_table, margin = 2)

# 少人数クラスの在籍期間別の4年生の読解の成績
tapply(star$g4reading, star$yearssmall, mean, na.rm = TRUE)
# 0年と4年間の点差：4.8点

# 少人数クラスの在籍期間別の4年生の算数の成績
tapply(star$g4math, star$yearssmall, mean, na.rm = TRUE)
# 0年と4年間の点差：2.1点

# 長期的な影響の分析
# 高校卒業率の比較
# 幼稚園のタイプ別
tapply(star$hsgrad, star$kinder, mean, na.rm = TRUE)
0.8359202 - 0.8251619
# smallとregularの差：0.01パーセントポイント

# 少人数クラスの在籍期間
tapply(star$hsgrad, star$yearssmall, mean, na.rm = TRUE)
# 0と4の差：0.05パーセントポイント

