# ex_15
# read data
cosme = read.csv("cosme.csv")
# 1
plot(cosme$x1, cosme$y, xlab = "価格", ylab = "月間売上")
# 2
plot(cosme$x2, cosme$y, xlab = "販促活動費用", ylab = "月間売上")
# 3
x1_result = lm(y~x1, data = cosme)
summary(x1_result)
# x1の優位性は5%以下であり優位である
x2_result = lm(y~x2, data = cosme)
summary(x2_result)
# x2の優位性は5%以下であり優位である

# 4
print(x1_result)
# 価格が1000円高くなると56.71個減る
print(x2_result)
# 販促活動費用が10000円高くなると4.128個増える