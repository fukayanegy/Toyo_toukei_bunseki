#class_5
#read data
univdata = read.csv("univdata.csv")
View(univdata)
#1変数の質的変数の要約
#質的変数とはその数値そのものに意味のない変数(男女を表すために1と0を使うなど)
###度数分布表(度数)
tab_commute <- table(univdata$commute)
print(tab_commute)
#addmargins()関数は合計値を一番後ろに追加する
addmargins(tab_commute)

#全体を1とした割合を出す
##度数分布表(割合)
#prop.table()この際の引数は度数分布表の結果の代入されたオブジェクトで、変数では無理
tab_prop_commute <- prop.table(tab_commute)
print(tab_prop_commute)
addmargins(tab_prop_commute)

###2変数の質的変数の要約(クロス集計)
#性別と通学手段のクロス表(度数)
table(univdata$male, univdata$commute)
#add sum
addmargins(table(univdata$male, univdata$commute))

#性別を文字で表示させる
#性別のラベルを表示させる
#Rは数値を認識するとき、数値の小さいじゅんばんで出す
male_label <- c("女性","男性")
#性別の結果が文字で表現される(male_dammy)を作成する
male_dummy <- factor(univdata$male, labels = male_label)

#性別と通学手段のクロス表
table(male_dummy, univdata$commute)
addmargins(table(male_dummy, univdata$commute))

#クロス表(割合)
crosstab <- table(male_dummy, univdata$commute)#クロス表の結果をオブジェクトcrosstabに入れる
prop.table(crosstab)#クロス表(割合)
addmargins(prop.table(crosstab))#合計値を追加する

#クロス表(割合・列方向に足すと1)⇒女性だけ、男性だけでの割合
crosstab <- table(male_dummy, univdata$commute)
prop.table(crosstab, margin = 1)
prop_cross_tab1 <- prop.table(crosstab, margin = 1)#prop_cross_tab1 にテーブルを入れる
addmargins(prop.table(prop_cross_tab1, margin = 2), margin = 1)

#クロス表(割合・行方向に足すと1)⇒通学手段だけでの割合
crosstab <- table(male_dummy, univdata$commute)
prop.table(crosstab, margin = 2)
prop_cross_tab2 <- prop.table(crosstab, margin = 2)#prop_cross_tab1 にテーブルを入れる
addmargins(prop.table(prop_cross_tab1, margin = 1), margin = 2)

###モザイクプロット(面積で全体に占める割合を表す)
#table関数を使ってクロス表を作成
crosstab <- table(male_dummy, univdata$commute)
print(crosstab)

#make mosaicplot
mosaicplot(crosstab)

#タイトルと軸ラベルを付ける
mosaicplot(crosstab, xlab="性別", ylab="通学手段", main = "通学手段(性別)")
#add color
mosaicplot(crosstab, xlab="性別", ylab="通学手段", main = "通学手段(性別)", color = TRUE)
#color pallet(cm.colors is 'cyan' to 'magenta')
mosaicplot(crosstab, xlab="性別", ylab="通学手段", main = "通学手段(性別)", color = cm.colors(5))
mosaicplot(crosstab, xlab="性別", ylab="通学手段", main = "通学手段(性別)", color = rainbow(5))
mosaicplot(crosstab, xlab="性別", ylab="通学手段", main = "通学手段(性別)", color = gray.colors(5))

#様々なcolor palletに関する関数
pie(rep(1, 12), col=cm.colors(12))#'cyan' to 'magenta'
pie(rep(1, 12), col=rainbow(12))#rainbow
pie(rep(1, 12), col=gray.colors(12))#black and white
pie(rep(1, 12), col=heat.colors(12))#red strain
pie(rep(1, 12), col=topo.colors(12))
pie(rep(1, 12), col=terrain.colors(12))

#tapply(x, 質的変数, 関数) この際に関数の()と引数はいらない
#これは2変数の質的変数と量的変数の要約を行っている
#量的変数×質的関数()
tapply(univdata$height, univdata$male, median)

#性別を文字で表示
tapply(univdata$height, male_dummy, median)


male_label <- c("女性","男性")
univdata$male_dummy2 <- factor(univdata$male, labels = male_label)
View(univdata)

#性別を文字で表示
tapply(univdata$height,univdata$male_dummy2, median)
