#第4回

#データの読み込み
#エクセル上でデータの範囲を選択してコピペ
univdata <- read.table("clipboard", header = TRUE)
View(univdata)

#データの保存
save.image("univdata.RData")

#読み込み
load("univdata.RData")

#記述統計(データの要約)
summary(univdata)#記述統計
nrow(univdata)#データの大きさ
mean(univdata$age)#平均値
median(univdata$age)#中央値
var(univdata$age)#variance
sd(univdata$age)#standard deviation

#ヒストグラムに関数を入れる
#BMI(Body Mass Index)=weight[kg]/(height[m]^2)
bmi <- (univdata$weight)/((univdata$height*0.01)^2)
summary(bmi)

#bmiのヒストグラム(縦軸:相対度数)
hist(bmi, freq = FALSE, xlab = "BMI", ylab = "密度")

#X軸とY軸の最小値と最大値を設定
hist(bmi, freq = FALSE, xlab = "BMI", ylab = "密度",
     xlim = c(10,30), ylim = c(0, 0.2))

#ヒストグラムに中央値を示す線を入れる
hist(bmi, freq = FALSE, xlab = "BMI", ylab = "密度",
     xlim = c(10,30), ylim = c(0, 0.2))

#xが20、yが0.18のところに中央値を表示する
text(x=23, y=0.18, "中央値")

#bmiのヒストグラムに縦(vertical)
abline(v=median(bmi))

#平均値を示す線を入れる
#ヒストグラムに中央値を示す線を入れる
#hist(bmi, freq = FALSE, xlab = "BMI", ylab = "密度",xlim = c(10,30), ylim = c(0, 0.2))

#xが20、yが0.18のところに中央値を表示する
text(x=23, y=0.17, "平均値", col = "red")

#bmiのヒストグラムに縦(vertical)
#lty=6  は線の種類、lwdは線の太さ
abline(v=mean(bmi), lty = 70, col = "red", lwd = 1)

#箱ひげ図(box plot)
#bmiを箱ひげ図で示す
boxplot(bmi)
#男女別の箱ひげ図を作る
boxplot(bmi~univdata$male)

#X軸のラベルを追加
boxplot(bmi~univdata$male, xlab = "性別")

#性別を文字で表示する
boxplot(bmi~univdata$male, xlab = "性別",
        names=c("女性", "男性"))

#タイトルと色を付ける
boxplot(bmi~univdata$male, xlab = "性別",
        names=c("女性", "男性"),
        main="BMIの箱ひげ図(男女別)",
        col="white",
        border="black")

#tapply(多分、type applyだと思う)
#男女別のBMIの標準偏差
tapply(bmi, univdata$male, sd)
tapply(bmi, univdata$male, summary)
