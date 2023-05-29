# データの読み込み
star = read.csv("STAR.csv")
# new_raceの作成
star$new_race = ifelse(star$race == 1, "白人", ifelse(star$race == 2, "黒人", ifelse(star$race == 4, "ヒスパニック", "その他")))

# 白人かつ普通classの人と、黒人もしくはヒスパニックでありかつ普通classの人、その他の人に分けた
star$which_white = ifelse(star$race == 1 & star$classtype == 2, "white", ifelse((star$race == 2 | star$race == 4) & star$classtype == 2, "minority", "others"))
# このテーブルのwhite, とminorityを比較する
tapply(star$g4reading, star$which_white, mean,na.rm = TRUE)
tapply(star$g4math, star$which_white, mean,na.rm = TRUE)

# 白人かつ少人数classの人と、黒人もしくはヒスパニックでありかつ少人数classの人、その他の人に分けた
star$which_white_small = ifelse(star$race == 1 & star$classtype == 1, "white", ifelse((star$race == 2 | star$race == 4) & star$classtype == 1, "minority", "others"))
tapply(star$g4math, star$which_white_small, mean, na.rm = TRUE)
# 上記と同じで、比較対象を変えた
tapply(star$hsgrad, star$which_white, mean, na.rm = TRUE)
tapply(star$hsgrad, star$which_white_small, mean, na.rm = TRUE)
