# class_8
## read data
resume = read.csv("resume.csv")
## 観測値の数(データの大きさ)・変数の数
dim(resume)
## データセットの最初のいくつかの観測値を表示
head(resume)
## 記述統計
summary(resume)
## クロス集計表
## 人種・企業から連絡がきたのかどうかのクロス表(度数)
#クロス表(割合)
table(resume$race, resume$call)
## 連絡の有無を日本語に
call_label = c("なし", "あり")
call_dummy = factor(resume$call, labels = call_label)
table(resume$race, call_dummy)
## 合計値を入れる
addmargins(table(resume$race, call_dummy))
## 審査通過率を計算する
### tableの行と列について
rece.call.tab <- table(resume$race, call_dummy)
rece.call.tab[1,]# 1行目
rece.call.tab[2,]# 2行目
rece.call.tab[,1]# 1列目
rece.call.tab[,2]# 2列目
# 全体の審査通過数(ありと表示されている数の合計)
pass_sum = sum(rece.call.tab[,2])
# 審査通過率
# データの個数
nrow(resume)
length(resume$call)
data_len = length(resume$call)
pass_sum / data_len
# 人種ごとの審査通過率
# 黒人  
## 黒人の通過数
pass_black_sum = rece.call.tab[1,2]
## 黒人のデータの個数
black_sum = sum(rece.call.tab[1,])
## 黒人の審査通過率
pass_black_sum / black_sum

### subset関数
## 人種格差があるのかを性別ごとに見ていく(女性)
## 黒人女性のデータを抽出
## 人種が"black"、性別が"female"のデータをデータフレーム名"resumeBf"に入れた
resumeBf = subset(resume, subset = (race == "black")&(sex == "female"))
head(resumeBf)

## 白人女性のデータを抽出する
resumeWf = subset(resume, subset = (race == "white")&(sex == "female"))
head(resumeWf)

## 白人女性の審査通過率
## 白人女性の審査通過数
white_female_pass_sum = sum(resumeWf$call)
## 白人女性のデータの数
white_female_sum = nrow(resumeWf)
## 白人女性の審査通過率
white_female_pass_sum/white_female_sum
mean(resumeWf$call)
## 黒人女性の審査通過率
mean(resumeBf$call)

mean(resumeWf$call) - mean(resumeBf$call)
## 白人女性は黒人女性と比べて審査通過率が3パーセントポイント高くなっている

shell("cls")
