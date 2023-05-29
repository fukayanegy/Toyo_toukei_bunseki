## read data
resume = read.csv("resume.csv")

## クロス集計表
table(resume$race, resume$call)
## 連絡の有無を日本語に
call_label = c("なし", "あり")
call_dummy = factor(resume$call, labels = call_label)
table(resume$race, call_dummy)
## 審査通過率を計算する
### tableの行と列について
rece.call.tab <- table(resume$race, call_dummy)

#課題1
## 白人の通過数
pass_white_sum = rece.call.tab[2,2]
## 白人のデータの個数
white_sum = sum(rece.call.tab[2,])
## 白人の審査通過率
pass_white_sum / white_sum

#課題2
sex_call_tab = table(resume$sex, resume$call)
sex_call_tab
#男性の通過数
pass_male = sex_call_tab[2,2]
#男性のデータ数
male = sum(sex_call_tab[2,])
male
#男性の通過率
pass_male/male

#課題3
#女性の通過数
pass_female = sex_call_tab[1,2]
#女性のデータ数
female = sum(sex_call_tab[1,])
female
#女性の通過率
pass_female/female

#課題4
addmargins(table(resume$race, call_dummy), margin = 2)

#課題5
addmargins(table(resume$race, call_dummy), margin = 1)

#課題6
## 人種が"black"、性別が"male"のデータをデータフレーム名"resume_black_male"に入れた
resume_black_male = subset(resume, subset = (race == "black")&(sex == "male"))
## 人種が"white"、性別が"male"のデータをデータフレーム名"resume_white_male"に入れた
resume_white_male = subset(resume, subset = (race == "white")&(sex == "male"))
mean(resume_black_male$call)
mean(resume_white_male$call)
## 男性の場合、人種間で3パーセントポイントの差がある


