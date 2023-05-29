# ex_13
# read data
data = read.csv("score.csv")

# 説明変数scoreを対数に変換する
data$log_score = log(data$score)
# 被説明変数wageを対数に変換する
data$log_wage = log(data$wage)

# IQスコアが1点増えると一時間当たりの賃金は0.01151ドル増える
lm(score~wage, data = data)
# IQスコアが1標準偏差増えると一時間当たりの賃金は0.0001177ドル増える
lm(log_score~wage, data = data)
# IQスコアが1点増えると一時間当たりの賃金は11.25%増える
lm(score~log_wage, data = data)
# IQスコアが1標準偏差増えると一時間当たりの賃金は0.1161%増える
lm(log_score~log_wage, data = data)
