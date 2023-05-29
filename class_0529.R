# class_13
# ex1
data = read.csv("wage.csv")

# wageを対数値に変換する
data$logwage = log(data$wage)
View(data)

# 回帰分析
lm(logwage~educ, data = data)
summary(lm(logwage~educ, data = data))
# 推定値はEstimateで見る

# 結果の解釈
100 * 0.08274
# 教育年数が一年延びると、賃金が8.3%増加するという結果を得た

# ex2
data = read.csv("ceosal1.csv")

# 記述統計
summary(data)
sd(data$salary)# salaryの標準偏差
sd(data$sales)# salesの標準偏差

# 被説明変数salaryを対数に変換する
data$log_salary = log(data$salary)

# 説明変数salesを対数に変換する
data$log_sales = log(data$sales)

# 回帰分析を実行する
lm(log_salary~log_sales, data = data)

result = lm(log_salary~log_sales, data = data)
print(result)

summary(result)
View(summary(result))

# 結果の解釈
# 企業の売り上げが1%増えると、CEOの年収が0.257%増加するという結果が得られた
# あまりにも数値が小さい場合は何倍かにして数値を見やすくすることもある
# 企業の売り上げが10%増えると、CEOの年収が2.57%増加するという結果が得られた