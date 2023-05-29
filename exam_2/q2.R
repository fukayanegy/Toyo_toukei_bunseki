# read data
data = read.csv("alcohol.csv")

# (1)
# status = 1
nrow(subset(data, subset = (status == 1)))
# status = 2
nrow(subset(data, subset = (status == 2)))
# status = 3
nrow(subset(data, subset = (status == 3)))

# 非労働力は684人
# 失業中は316人
# 就業中は8822人

# (2)
# status = 1
nrow(subset(data, subset = (status == 1) & (abuse == 1))) / nrow(subset(data, subset = (status == 1)))
# status = 2
nrow(subset(data, subset = (status == 2) & (abuse == 1))) / nrow(subset(data, subset = (status == 2)))
# status = 3
nrow(subset(data, subset = (status == 3) & (abuse == 1))) / nrow(subset(data, subset = (status == 3)))

# 非労働力  12.1345%
# 失業中    12.97468%
# 就業中    9.635003%

# (3)
# 非常に優れている
nrow(subset(data, subset = (exhealth == 1) & (abuse == 1))) / nrow(subset(data, subset = (exhealth == 1)))
# 非常に良好
nrow(subset(data, subset = (vghealth == 1) & (abuse == 1))) / nrow(subset(data, subset = (vghealth == 1)))
# 良好
nrow(subset(data, subset = (goodhealth == 1) & (abuse == 1))) / nrow(subset(data, subset = (goodhealth == 1)))
# まずまずの健康
nrow(subset(data, subset = (fairhealth == 1) & (abuse == 1))) / nrow(subset(data, subset = (fairhealth == 1)))

# 非常に優れている  8.421053%
# 非常に良好        10.45531%
# 良好              11.30952%
# まずまずの健康    12.19048%