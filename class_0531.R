# class 14
# data read
data = read.csv("elec.csv")
View(data)

# 記述統計
summary(data)

# 散布図
## x:time, y:elec
plot(data$time, data$elec,
     xlab = "time", ylab = "elec(10000kw)",
     main = "time and elec plot")
# 単回帰分析
# 気温:被説明,time:説明
plot(data$temp, data$elec,
     xlab = "temp", ylab = "elec(10000kw)",
     main = "temp and elec plot")
## 単回帰分析
result = lm(elec~temp, data = data)
print(result)
# 結果の解釈
# 気温が1度上昇すると、電力使用量は145万kw増加することが示された
# 散布図に回帰線を入れる
abline(result)

# daytime変数を作成する(9~18)
# A&B AかつB
daytime = (data$time >= 9)&(data$time <= 18)

model_1 = lm(elec~temp + daytime, data = data)
print(model_1)

# 結果の解釈(daytime)
# 日中は、夜間と比較して555.44万kw電力使用量が増加することが示された

# sunday変数を作成する
# A|B AもしくはB
# with関数は第一引数にdataを入れる
data$sunday = with(data, (date == "2014/8/3")|
                         (date == "2014/8/10")|
                         (date == "2014/8/17")|
                         (date == "2014/8/24")|
                         (date == "2014/8/31"))
# recess変数(お盆休み)変数を作成する
data$recess = with(data, (date == "2014/8/11")|
                         (date == "2014/8/12")|
                         (date == "2014/8/13")|
                         (date == "2014/8/14")|
                         (date == "2014/8/15")|
                         (date == "2014/8/16"))

# 回帰分析の実行
# 説明変数一覧(temp, daytime, prec, sunday, recess)
model_2 = lm(elec~temp + daytime + prec + sunday + recess, data = data)
View(model_2)
# 結果の解釈
# 温度が上昇して日中の時間帯で降水量が増加した場合は電力使用量が増加し、
# 日曜日やお盆の時は電力使用量が減少することが示された

# よそく
# 8月の平日(sunday=0, recess=0), 晴天(prec=0)
# 気温が28度(temp=28)、正午(daytime=1)の場合に予想される電力使用量は？
179.07 + 28 * 113.48 + 563.53
# 3920.04万kw
table_test = subset(data, subset = (temp == 28.1) &(daytime == 1) & (sunday == 0)& (recess == 0)& (prec == 0))
View(table_test)

# 決定係数
summary(model_2)
