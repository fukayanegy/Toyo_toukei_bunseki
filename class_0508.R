# class_7
## read data
univdata = read.csv("univdata.csv")
View(univdata)

## scatter plot (散布図)(plot(row, col))
### option pch, cex.lab, cex, ann
# x:height, y=weight
plot(x = univdata$height, y = univdata$weight)

## 軸ラベルをつける
plot(x = univdata$height, y = univdata$weight,
     xlab = "身長", ylab = "体重" ,#軸ラベル
     main = "身長と体重の散布図"　)#タイトル

## x軸とy軸の最大値と最小値を設定
plot(x = univdata$height, y = univdata$weight,
     xlab = "身長", ylab = "体重" ,#軸ラベル
     main = "身長と体重の散布図"　,#タイトル
     xlim = c(145, 190), ylim = c(40, 90))#x軸とy軸の最大値最小値の設定

## データ点の編集
plot(x = univdata$height, y = univdata$weight,
     xlab = "身長", ylab = "体重" ,#軸ラベル
     main = "身長と体重の散布図"　,#タイトル
     xlim = c(145, 190), ylim = c(40, 90),#x軸とy軸の最大値最小値の設定
     pch = 90)#pch = 0はデータ点を白抜きの資格にする(□)

## データ点に色を付ける
plot(x = univdata$height, y = univdata$weight,
     xlab = "身長", ylab = "体重" ,#軸ラベル
     main = "身長と体重の散布図"　,#タイトル
     xlim = c(145, 190), ylim = c(40, 90),#x軸とy軸の最大値最小値の設定
     pch = 15,#pch = 15はデータ点を黒抜きの資格にする(■)
    col = "blue")#データ点に色を付ける

## 散布図×関数
# 散布図に平均値の線を入れる
plot(x = univdata$height, y = univdata$weight,
     xlab = "身長", ylab = "体重" ,#軸ラベル
     main = "身長と体重の散布図"　,#タイトル
     xlim = c(145, 190), ylim = c(40, 90),#x軸とy軸の最大値最小値の設定
     pch = 15,#pch = 15はデータ点を黒抜きの資格にする(■)
    col = "blue")#データ点に色を付ける

## 縦軸方向(vertical)に平均値の線を入れる
abline(v = mean(univdata$height))
## xが168，yが90のところに「身長の平均値」を表示
text(x = 168, y = 90, "身長の平均値")

# 横軸方向(horizontal)にyの平均値を入れる
abline(h = mean(univdata$weight),
       col = "red",#線の色
       lty = 2,#線の種類
       lwd = 2)#線の太さ
## xが187，yが60のところに「身長の平均値」を表示
text(x = 187, y = 60, "体重の平均値", col = "red")

### 共分散(covariance)を計算
cov(x = univdata$height, y = univdata$weight)

### 相関係数を計算する
cor(univdata$height, univdata$weight)




