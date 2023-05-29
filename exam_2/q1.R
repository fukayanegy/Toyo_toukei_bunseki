# Q1
data = read.csv("ex1.csv")

# (1)
# 黒人の中で質の高い履歴書を書いた人のテーブル
black_high = subset(data, subset = (race == "black")&(qua == "high"))
# 黒人の中で質の低い履歴書を書いた人のテーブル
black_low = subset(data, subset = (race == "black")&(qua == "low"))
# callの値の平均値はcall=1/callとなるため、そのまま通過の割合となる
mean(black_high$call) - mean(black_low$call)
# (1) 審査通過率の差は0.5パーセントポイントである

# (2)
# 白人の中で質の高い履歴書を書いた人のテーブル
white_high = subset(data, subset = (race == "white")&(qua == "high"))
# 白人の中で質の低い履歴書を書いた人のテーブル
white_low = subset(data, subset = (race == "white")&(qua == "low"))
# callの値の平均値はcall=1/callとなるため、そのまま通過の割合となる
mean(white_high$call) - mean(white_low$call)
# (2) 審査通過率の差は2.2パーセントポイント