#第3回

#データの読み込み
univdata <- read.csv("univdata.csv")
View(univdata)

#データの確認
names(univdata)#変数名を出力
dim(univdata)#行数と列数を出力
summary(univdata)#記述統計
head(univdata)#6行目まで出力


#例題1 身長のヒストグラムを出す(縦軸:度数)
#量的変数を見て特徴を出す
#ヒストグラム・度数分布表(階級値{区切りの中央の値}・度数{区切りの中央の値}・相対度数)の作成
#度数分布表を画像化したものがヒストグラム

hist(x = univdata$height)
#縦軸が相対度数(密度)
hist(x = univdata$height, freq = FALSE)

#軸ラベルを付ける
hist(x = univdata$height, freq = FALSE, xlab = "身長", ylab = "密度")

#X軸とy軸の最大値、最小値を設定する
hist(x = univdata$height, freq = FALSE, xlab = "身長", ylab = "密度", xlim = c(140,200), ylim=c(0, 0.05))

#ヒストグラムの幅の区切り点を指定する(柱の数)
hist(x = univdata$height, freq = FALSE, xlab = "身長", ylab = "密度", xlim = c(140,200), ylim=c(0, 0.05), breaks = 100)

#色の一覧
colors()

#タイトルと色を付ける(色は色コードで出力している)
hist(x = univdata$height, freq = FALSE,
     xlab = "身長", ylab = "密度", xlim = c(140,200),
     ylim=c(0, 0.05), breaks = 100,
     main = "身長のヒストグラム",
     col="#FFFFFF",
     border="#000000")

###通学手段の棒グラフ
x <- table(univdata$commute)#commuteの度数分布表をxというオブジェクトに入れる
print(x)

barplot(x)#縦棒グラフの出力
barplot(x, horiz = "TRUE")#横にして出力
#othersを端っこに移す()
barplot(x[c(1,2,3,5,4)])

#タイトルと色を付ける
barplot(x[c(1,2,3,5,4)],
        main = "通学手段のヒストグラム",
        col = "#FFFFFF",
        border = "#000000",
        names = c("バイク", "バス", "徒歩", "電車", "その他"))

#通学手段の円グラフ
pie(x)
#clockwiseをtrueにすると12時方向始まりになる
pie(x, clockwise = TRUE)
#その他の場所を移動する
pie(x[c(1,2,3,5,4)], clockwise = TRUE)
#タイトル・色を付けていく
pie(x[c(1,2,3,5,4)], clockwise = TRUE,
    main = "通学手段の円グラフ",
    col = c("black", "white", "red", "blue", "pink"))
#タイトルを日本語に変換
pie(x[c(1,2,3,5,4)], clockwise = TRUE,
    main = "通学手段の円グラフ",
    col = c("black", "white", "red", "blue", "pink"),
    labels = c("バイク", "バス", "徒歩", "電車", "その他"))
