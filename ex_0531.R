# ex_14
# read data
data = read.csv("elec.csv")
# 1
data$morning = (data$time >= 6)&(data$time <= 12)
data$afternoon = (data$time >= 13)&(data$time <= 18)

# 2
data$Saturday = with(data, (date == "2014/8/2")|(date == "2014/8/9")|(date == "2014/8/16")|(date == "2014/8/23")|(date == "2014/8/30"))

#3
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
model = lm(elec~temp + prec + sunday + recess + morning + afternoon + Saturday, data = data)
# 回帰分析の結果の出力
model
# 決定係数の出力
summary(model)
