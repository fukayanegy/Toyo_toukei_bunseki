#univdata.csv read
univdata = read.csv("univdata.csv")

## 身長と体重の変数からBMIを作成する。
univdata$bmi <- data$weight/((data$height/100)^2)
## X：体重，Y：BMIに関する散布図を作成する
###軸ラベルとタイトルをつける
###データ点に色を付ける
plot(x = univdata$weight, y = univdata$bmi,
     xlab = "体重", ylab = "BMI" ,#軸ラベル
     main = "体重とBMIの散布図"　,#タイトル
     col = "blue")#データ点に色を付ける

### 体重，Y：BMIに関する散布図を作成する
## 平均値に青色（塗りつぶし）の色を付ける(飛ばす)
plot(x = univdata$weight, y = univdata$bmi,
     xlab = "体重", ylab = "BMI" ,#軸ラベル
     main = "体重とBMIの散布図"　,#タイトル
     col = "blue")

### 体重，Y：BMIに関する散布図を作成する
## 体重とBMIの平均値の線をそれぞれ入れる
plot(x = univdata$weight, y = univdata$bmi)
## 各平均値の線に「体重の平均値」，「BMIの平均値」という文字を表示させる
abline(v = mean(univdata$weight))
text(x = 45, y = 23, "体重の平均値")

abline(h = mean(univdata$bmi), col = "red")
text(x = 70, y = 20, "BMIの平均値", col = "red")

#体重とBMIの共分散を計算
cov(x = univdata$bmi, y = univdata$weight)
#体重とBMIの相関係数を計算
cor(univdata$height, univdata$bmi)
