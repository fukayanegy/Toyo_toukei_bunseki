# class 17
## impact of experience on wage
# read data
data = read.csv("wage1.csv")

# make experience sqrt
exper_sqrt = (data$exper)^2

# make regression analysis
result_1 = lm(wage~exper_sqrt, data = data)
summary(result_1)

# another how to
result_2 = lm(wage~exper+I(exper^2), data = data)
summary(result_2)

# interpretation of results
# exper と expersq(2条項)の有意性:5%水準で有意
# significant at the level of 5%
# exper と expersq(2条項)の符号:exper がプラス、expersq がマイナス
# 上に凸の放物線
# f(exper) = -0.0061299 * exper^2 + 0.2981001 * exper + 3.7254058
# f'(exper) = -0.0061299*2 * exper + 0.2981001
# 頂点を求める
x = 0.2981001 / (2 * 0.0061299)
print(x)

## impact of rooms on price($, middle)
# read data
data = read.csv("hprice2.csv")

# descriptive statistics
summary(data)
sd(data$price)
sd(data$rooms)

# make plot
# x:rooms y:price
plot(data$rooms, data$price,
     xlab = "rooms", ylab = "price",
     main = "rooms and price",
     col = "blue")

# make regression analysis
result_3 = lm(price~rooms + I(rooms^2), data = data)
summary(result_3)

# interpretation of the result
# rooms と rooms_sq の有意性:5%水準で有意
# significant at the level of 5%
# rooms rooms_sq の符号:rooms -22713.2 rooms^2 2477.1
# 上に凸の放物線
# f(rooms) = 2477.1 * rooms^2 - 22713.2 * rooms + 66203.2
# f'(rooms) = 2477.1 * 2 * rooms + 22713.2
x = 22713.2 / (2477.1 * 2)
print(x)

result_4 = lm(log(price) ~ rooms + I(rooms^2) + log(nox)+ stratio, data = data)
summary(result_4)

# interpretation of the result
# log(nox)
# 他の説明変数を一定としたとき
# nox(窒素酸化物濃度)が1%上昇すると、住宅価格は0.7%有意に低下することが示された。
# t-value p-value も問題ない数値である

# stratio(student-teacher ratio)
-0.046170*100
# 他の説明変数を一定としたとき
# 地域の教員1人当たり生徒数の平均値が1人増えると、住宅価格は4.6%有意に低下することが示された
